/*
** $Id: lapi.c,v 2.164 2012/06/08 15:14:04 roberto Exp $
** Lua API
** See Copyright Notice in lua.h
*/


#include <stdarg.h>
#include <string.h>

#define lapi_c
#define LUA_CORE

#include "lua.h"

#include "lapi.h"
#include "ldebug.h"
#include "ldo.h"
#include "lfunc.h"
#include "lgc.h"
#include "lmem.h"
#include "lobject.h"
#include "lstate.h"
#include "lstring.h"
#include "ltable.h"
#include "ltm.h"
#include "lundump.h"
#include "lvm.h"



const char lua_ident[] =
  "$LuaVersion: " LUA_COPYRIGHT " $"
  "$LuaAuthors: " LUA_AUTHORS " $";


/* value at a non-valid index */
#define NONVALIDVALUE		cast(TValue *, luaO_nilobject)

/* corresponding test */
#define isvalid(o)	((o) != luaO_nilobject)

#define api_checkvalidindex(L, i)  api_check(L, isvalid(i), "invalid index")


static TValue *index2addr (lua_State *L, int idx) {
  CallInfo *ci = L->ci;
  if (idx > 0) {
    TValue *o = ci->func + idx;
    api_check(L, idx <= ci->top - (ci->func + 1), "unacceptable index");
    if (o >= L->top) return NONVALIDVALUE;
    else return o;
  }
  else if (idx > LUA_REGISTRYINDEX) {
    api_check(L, idx != 0 && -idx <= L->top - (ci->func + 1), "invalid index");
    return L->top + idx;
  }
  else if (idx == LUA_REGISTRYINDEX)
    return &G(L)->l_registry;
  else {  /* upvalues */
    idx = LUA_REGISTRYINDEX - idx;
    api_check(L, idx <= MAXUPVAL + 1, "upvalue index too large");
    if (ttislcf(ci->func))  /* light C function? */
      return NONVALIDVALUE;  /* it has no upvalues */
    else {
      CClosure *func = clCvalue(ci->func);
      return (idx <= func->nupvalues) ? &func->upvalue[idx-1] : NONVALIDVALUE;
    }
  }
}

LUA_API lua_Integer lua_tointegerx (lua_State *L, int idx, int *isnum) {
    TValue n;
    const TValue *o = index2addr(L, idx);
    if (tonumber(o, &n)) {
        lua_Integer res;
        lua_Number num = nvalue(o);
        lua_number2integer(res, num);
        if (isnum) *isnum = 1;
        return res;
    }
    else {
        if (isnum) *isnum = 0;
        return 0;
    }
}

LUA_API int lua_absindex (lua_State *L, int idx) {
    return (idx > 0 || idx <= LUA_REGISTRYINDEX)
    ? idx
    : cast_int(L->top - L->ci->func + idx);
}

LUA_API const lua_Number *lua_version (lua_State *L) {
    static const lua_Number version = LUA_VERSION_NUM;
    if (L == NULL) return &version;
    else return G(L)->version;
}

LUA_API void lua_setuservalue (lua_State *L, int idx) {
    StkId o;
    lua_lock(L);
    api_checknelems(L, 1);
    o = index2addr(L, idx);
    api_checkvalidindex(L, o);
    api_check(L, ttisuserdata(o), "userdata expected");
    if (ttisnil(L->top - 1))
        uvalue(o)->env = NULL;
    else {
        api_check(L, ttistable(L->top - 1), "table expected");
        uvalue(o)->env = hvalue(L->top - 1);
        luaC_objbarrier(L, gcvalue(o), hvalue(L->top - 1));
    }
    L->top--;
    lua_unlock(L);
}
/*
 ** Execute a protected call.
 */
struct CallS {  /* data to `f_call' */
    StkId func;
    int nresults;
};

#define checkresults(L,na,nr) \
api_check(L, (nr) == LUA_MULTRET || (L->ci->top - L->top >= (nr) - (na)), \
"results from function overflow current stack size")

static void f_call (lua_State *L, void *ud) {
    struct CallS *c = cast(struct CallS *, ud);
    luaD_call(L, c->func, c->nresults, 0);
}

LUA_API int lua_pcallk (lua_State *L, int nargs, int nresults, int errfunc,
                        int ctx, lua_CFunction k) {
    struct CallS c;
    int status;
    ptrdiff_t func;
    lua_lock(L);
    api_check(L, k == NULL || !isLua(L->ci),
              "cannot use continuations inside hooks");
    api_checknelems(L, nargs+1);
    api_check(L, L->status == LUA_OK, "cannot do calls on non-normal thread");
    checkresults(L, nargs, nresults);
    if (errfunc == 0)
        func = 0;
    else {
        StkId o = index2addr(L, errfunc);
        api_checkvalidindex(L, o);
        func = savestack(L, o);
    }
    c.func = L->top - (nargs+1);  /* function to be called */
    if (k == NULL || L->nny > 0) {  /* no continuation or no yieldable? */
        c.nresults = nresults;  /* do a 'conventional' protected call */
        status = luaD_pcall(L, f_call, &c, savestack(L, c.func), func);
    }
    else {  /* prepare continuation (call is already protected by 'resume') */
        CallInfo *ci = L->ci;
        ci->u.c.k = k;  /* save continuation */
        ci->u.c.ctx = ctx;  /* save context */
        /* save information for error recovery */
        //Leix, TODO
        //ci->u.c.extra = savestack(L, c.func);
        ci->u.c.old_allowhook = L->allowhook;
        ci->u.c.old_errfunc = L->errfunc;
        L->errfunc = func;
        /* mark that function may do error recovery */
        ci->callstatus |= CIST_YPCALL;
        luaD_call(L, c.func, nresults, 1);  /* do the call */
        ci->callstatus &= ~CIST_YPCALL;
        L->errfunc = ci->u.c.old_errfunc;
        status = LUA_OK;  /* if it is here, there were no errors */
    }
    adjustresults(L, nresults);
    lua_unlock(L);
    return status;
}


LUA_API lua_Number lua_tonumberx (lua_State *L, int idx, int *isnum) {
    TValue n;
    const TValue *o = index2addr(L, idx);
    if (tonumber(o, &n)) {
        if (isnum) *isnum = 1;
        return nvalue(o);
    }
    else {
        if (isnum) *isnum = 0;
        return 0;
    }
}
void luaD_call (lua_State *L, StkId func, int nResults, int allowyield) {
    if (++L->nCcalls >= LUAI_MAXCCALLS) {
        if (L->nCcalls == LUAI_MAXCCALLS)
            luaG_runerror(L, "C stack overflow");
        else if (L->nCcalls >= (LUAI_MAXCCALLS + (LUAI_MAXCCALLS>>3)))
            luaD_throw(L, LUA_ERRERR);  /* error while handing stack error */
    }
    if (!allowyield) L->nny++;
    if (!luaD_precall(L, func, nResults))  /* is a Lua function? */
        luaV_execute(L);  /* call it */
    if (!allowyield) L->nny--;
    L->nCcalls--;
    luaC_checkGC(L);
}

LUA_API void lua_getuservalue (lua_State *L, int idx) {
    StkId o;
    lua_lock(L);
    o = index2addr(L, idx);
    api_checkvalidindex(L, o);
    api_check(L, ttisuserdata(o), "userdata expected");
    if (uvalue(o)->env) {
        sethvalue(L, L->top, uvalue(o)->env);
    } else
        setnilvalue(L->top);
    api_incr_top(L);
    lua_unlock(L);
}

LUA_API size_t lua_rawlen (lua_State *L, int idx) {
    StkId o = index2addr(L, idx);
    switch (ttypenv(o)) {
        case LUA_TSTRING: return tsvalue(o)->len;
        case LUA_TUSERDATA: return uvalue(o)->len;
        case LUA_TTABLE: return luaH_getn(hvalue(o));
        default: return 0;
    }
}

LUA_API int lua_compare (lua_State *L, int index1, int index2, int op) {
    StkId o1, o2;
    int i = 0;
    lua_lock(L);  /* may call tag method */
    o1 = index2addr(L, index1);
    o2 = index2addr(L, index2);
    if (isvalid(o1) && isvalid(o2)) {
        switch (op) {
            case LUA_OPEQ: i = equalobj(L, o1, o2); break;
            case LUA_OPLT: i = luaV_lessthan(L, o1, o2); break;
            case LUA_OPLE: i = luaV_lessequal(L, o1, o2); break;
            default: api_check(L, 0, "invalid option");
        }
    }
    lua_unlock(L);
    return i;
}

LUA_API void lua_callk (lua_State *L, int nargs, int nresults, int ctx,
                        lua_CFunction k) {
    StkId func;
    lua_lock(L);
    api_check(L, k == NULL || !isLua(L->ci),
              "cannot use continuations inside hooks");
    api_checknelems(L, nargs+1);
    api_check(L, L->status == LUA_OK, "cannot do calls on non-normal thread");
    checkresults(L, nargs, nresults);
    func = L->top - (nargs+1);
    if (k != NULL && L->nny == 0) {  /* need to prepare continuation? */
        L->ci->u.c.k = k;  /* save continuation */
        L->ci->u.c.ctx = ctx;  /* save context */
        luaD_call(L, func, nresults, 1);  /* do the call */
    }
    else  /* no continuation or no yieldable */
        luaD_call(L, func, nresults, 0);  /* just do the call */
    adjustresults(L, nresults);
    lua_unlock(L);
}

LUA_API void lua_setglobal (lua_State *L, const char *var) {
    Table *reg = hvalue(&G(L)->l_registry);
    const TValue *gt;  /* global table */
    lua_lock(L);
    api_checknelems(L, 1);
    gt = luaH_getint(reg, LUA_RIDX_GLOBALS);
    setsvalue2s(L, L->top++, luaS_new(L, var));
    luaV_settable(L, gt, L->top - 1, L->top - 2);
    L->top -= 2;  /* pop value and key */
    lua_unlock(L);
}

LUA_API void lua_getglobal (lua_State *L, const char *var) {
    Table *reg = hvalue(&G(L)->l_registry);
    const TValue *gt;  /* global table */
    lua_lock(L);
    gt = luaH_getint(reg, LUA_RIDX_GLOBALS);
    setsvalue2s(L, L->top++, luaS_new(L, var));
    luaV_gettable(L, gt, L->top - 1, L->top - 1);
    lua_unlock(L);
}

LUA_API lua_Unsigned lua_tounsignedx (lua_State *L, int idx, int *isnum) {
    TValue n;
    const TValue *o = index2addr(L, idx);
    if (tonumber(o, &n)) {
        lua_Unsigned res;
        lua_Number num = nvalue(o);
        lua_number2unsigned(res, num);
        if (isnum) *isnum = 1;
        return res;
    }
    else {
        if (isnum) *isnum = 0;
        return 0;
    }
}

LUA_API void lua_len (lua_State *L, int idx) {
    StkId t;
    lua_lock(L);
    t = index2addr(L, idx);
    luaV_objlen(L, L->top, t);
    api_incr_top(L);
    lua_unlock(L);
}

static void moveto (lua_State *L, TValue *fr, int idx) {
    TValue *to = index2addr(L, idx);
    api_checkvalidindex(L, to);
    setobj(L, to, fr);
    if (idx < LUA_REGISTRYINDEX)  /* function upvalue? */
        luaC_barrier(L, clCvalue(L->ci->func), fr);
    /* LUA_REGISTRYINDEX does not need gc barrier
     (collector revisits it before finishing collection) */
}

LUA_API void lua_copy (lua_State *L, int fromidx, int toidx) {
    TValue *fr;
    lua_lock(L);
    fr = index2addr(L, fromidx);
    api_checkvalidindex(L, fr);
    moveto(L, fr, toidx);
    lua_unlock(L);
}

