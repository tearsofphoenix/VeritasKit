/* Buffer library for mutable string (for lua-lab) */

#define LUA_LIB

#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"

#define INIT_BUFFER_SIZE 16

typedef struct
{
	unsigned char* data;
	lua_Integer len;
	lua_Integer cap;
}lua_Buffer;

/* L != 0, buffer != 0, len >= 0 */
static void change_len(lua_Buffer* buffer, lua_Integer len)
{
	if(len > buffer->cap)
	{
		lua_Integer cap = buffer->cap;
		do cap *= 2; while(cap < len);
		buffer->data = realloc(buffer->data, cap);
		buffer->cap = cap;
	}
	buffer->len = len;
}

/* n >= 0, pi != 0, pj != 0 */
static void convert_pos(lua_Integer n, lua_Integer* pi, lua_Integer* pj)
{
	lua_Integer i = *pi, j = *pj;
	if(i < 0) i += n + 1; if(--i < 0) i = 0;
	if(j < 0) j += n + 1; else if(j > n) j = n;
	if((j -= i) < 0) j = 0;
	*pi = i;
	*pj = j;
}

/* buffer = buffer.new([dummy_table,] [reserve_size,] [string|buffer [, i = 1 [, j = -1]]]) */
static int buf_new(lua_State* L)
{
	lua_Buffer* buffer;
	const unsigned char* src;
	lua_Integer i, j, n, cap = INIT_BUFFER_SIZE;
	if(lua_istable(L, 1))
		lua_remove(L, 1);
	if(lua_gettop(L) > 0 && lua_isnumber(L, 1))
	{
		cap = lua_tointeger(L, 1);
		if(cap <= 0) cap = INIT_BUFFER_SIZE;
		lua_remove(L, 1);
	}

	if(lua_gettop(L) <= 0)
	{
		buffer = (lua_Buffer*)lua_newuserdata(L, sizeof(lua_Buffer));
		buffer->data = malloc(cap);
		buffer->len = 0;
		buffer->cap = cap;
		luaL_getmetatable(L, LUA_BUFFERSTRUCT);
		lua_setmetatable(L, -2);
		return 1;
	}
	buffer = luaL_testudata(L, 1, LUA_BUFFERSTRUCT);
	if(buffer)
	{
		src = buffer->data;
		n = buffer->len;
	}
	else
	{
		size_t srclen;
		src = (unsigned char*)luaL_checklstring(L, 1, &srclen);
		n = (lua_Integer)srclen;
	}
	i = luaL_optinteger(L, 2, 1);
	j = luaL_optinteger(L, 3, -1);
	convert_pos(n, &i, &j);
	while(cap < j) cap *= 2;
	buffer = (lua_Buffer*)lua_newuserdata(L, sizeof(lua_Buffer));
	buffer->data = malloc(cap);
	buffer->len = j;
	buffer->cap = cap;
	memcpy(buffer->data, src + i, j);
	luaL_getmetatable(L, LUA_BUFFERSTRUCT);
	lua_setmetatable(L, -2);
	return 1;
}

/* buffer = buffer:lower() */
static int buf_lower(lua_State* L)
{
	lua_Buffer* buffer = luaL_checkudata(L, 1, LUA_BUFFERSTRUCT);
	lua_Integer i;
	for(i = 0; i < buffer->len; ++i)
		buffer->data[i] = (unsigned char)tolower(buffer->data[i]);
	lua_pushvalue(L, 1);
	return 1;
}

/* buffer = buffer:upper() */
static int buf_upper(lua_State* L)
{
	lua_Buffer* buffer = luaL_checkudata(L, 1, LUA_BUFFERSTRUCT);
	lua_Integer i;
	for(i = 0; i < buffer->len; ++i)
		buffer->data[i] = (unsigned char)toupper(buffer->data[i]);
	lua_pushvalue(L, 1);
	return 1;
}

/* buffer|n = buffer:reserve(n|nil) */
static int buf_reserve(lua_State* L)
{
	lua_Buffer* buffer = luaL_checkudata(L, 1, LUA_BUFFERSTRUCT);
	lua_Integer cap;
	if(lua_gettop(L) <= 1)
	{
		lua_pushinteger(L, buffer->cap);
		return 1;
	}
	cap = luaL_checkinteger(L, 2);
	if(cap < buffer->len) cap = buffer->len;
	if(cap != buffer->cap)
	{
		buffer->data = realloc(buffer->data, cap);
		buffer->cap = cap;
	}
	lua_pushvalue(L, 1);
	return 1;
}

/* buffer = buffer:resize(n) */
static int buf_resize(lua_State* L)
{
	lua_Buffer* buffer = luaL_checkudata(L, 1, LUA_BUFFERSTRUCT);
	lua_Integer len = luaL_checkinteger(L, 2);
	if(len < 0) len = 0;
	change_len(buffer, len);
	lua_pushvalue(L, 1);
	return 1;
}

/* n = buffer:len() */
static int buf_len(lua_State* L)
{
	lua_pushinteger(L, ((lua_Buffer*)luaL_checkudata(L, 1, LUA_BUFFERSTRUCT))->len);
	return 1;
}

/* string = buffer:tostring() */
static int buf_tostring(lua_State* L)
{
	lua_Buffer* buffer = luaL_checkudata(L, 1, LUA_BUFFERSTRUCT);
	lua_pushlstring(L, (const char*)buffer->data, buffer->len);
	return 1;
}

/* buffer = buffer:append(buffer|string) */
static int buf_append(lua_State* L)
{
	lua_Buffer* buffer = luaL_checkudata(L, 1, LUA_BUFFERSTRUCT);
	lua_Buffer* srcbuf = luaL_testudata(L, 2, LUA_BUFFERSTRUCT);
	const void* src;
	lua_Integer srclen;
	if(srcbuf)
	{
		src = srcbuf->data;
		srclen = srcbuf->len;
	}
	else
	{
		size_t len;
		src = luaL_checklstring(L, 2, &len);
		srclen = (lua_Integer)len;
	}
	change_len(buffer, buffer->len + srclen);
	memcpy(buffer->data + buffer->len - srclen, src, srclen);
	lua_pushvalue(L, 1);
	return 1;
}

/* string = buffer:sub(i [, j = -1]) */
static int buf_sub(lua_State* L)
{
	lua_Buffer* buffer = luaL_checkudata(L, 1, LUA_BUFFERSTRUCT);
	lua_Integer i = luaL_checkinteger(L, 2);
	lua_Integer j = luaL_optinteger(L, 3, -1);
	convert_pos(buffer->len, &i, &j);
	lua_pushlstring(L, (const char*)buffer->data + i, j);
	return 1;
}

/* buffer:fill([i_dst = 1 [, j_dst = -1],] buffer|string) */
static int buf_fill(lua_State* L)
{
	lua_Buffer* buffer = luaL_checkudata(L, 1, LUA_BUFFERSTRUCT);
	lua_Integer dsti, dstj;
	int i;
	lua_Buffer* srcbuf;
	const unsigned char* src;
	lua_Integer srclen;
	if(lua_gettop(L) >= 3 && lua_isnumber(L, 2))
	{
		dsti = lua_tointeger(L, 2);
		if(lua_gettop(L) >= 4 && lua_isnumber(L, 3)) { dstj = lua_tointeger(L, 3); i = 4; }
		else										 { dstj = -1;				   i = 3; }
	}	else							{ dsti = 1;    dstj = -1;				   i = 2; }
	convert_pos(buffer->len, &dsti, &dstj);
	srcbuf = luaL_testudata(L, i, LUA_BUFFERSTRUCT);
	if(srcbuf)
	{
		src = srcbuf->data;
		srclen = srcbuf->len;
	}
	else
	{
		size_t len;
		src = (unsigned char*)luaL_checklstring(L, i, &len);
		srclen = (lua_Integer)len;
	}
	if(srclen == 1)
		memset(buffer->data + dsti, *src, dstj);
	else if(srclen > 1)
	{
		while(dstj > srclen)
		{
			memcpy(buffer->data + dsti, src, srclen);
			dsti += srclen;
			dstj -= srclen;
		}
		memcpy(buffer->data + dsti, src, dstj);
	}
	return 0;
}

/* buffer:copy([i_src = 1,] buffer|string [, i_src = 1 [, j_src = -1]]) */
static int buf_copy(lua_State* L)
{
	lua_Buffer* buffer = luaL_checkudata(L, 1, LUA_BUFFERSTRUCT);
	lua_Integer dsti;
	int i;
	lua_Buffer* srcbuf;
	const unsigned char* src;
	lua_Integer srclen, srci, srcj;
	if(lua_gettop(L) >= 3 && lua_isnumber(L, 2))
	{
		dsti = lua_tointeger(L, 2) - 1;
		if(dsti < 0) dsti = 0;
		i = 3;
	}
	else
	{
		dsti = 0;
		i = 2;
	}
	srcbuf = luaL_testudata(L, i, LUA_BUFFERSTRUCT);
	if(srcbuf)
	{
		src = srcbuf->data;
		srclen = srcbuf->len;
	}
	else
	{
		size_t len;
		src = (unsigned char*)luaL_checklstring(L, i, &len);
		srclen = (lua_Integer)len;
	}
	srci = luaL_optinteger(L, i + 1, 1);
	srcj = luaL_optinteger(L, i + 2, -1);
	convert_pos(srclen, &srci, &srcj);
	if(srcj > buffer->len - dsti) srcj = buffer->len - dsti;
	if(srcj > 0)
		memcpy(buffer->data + dsti, src + srci, srcj);
	return 0;
}

/* v|func = buffer.__index(buffer, i|funcname) */
static int buf_index(lua_State* L)
{
	lua_Buffer* buffer = luaL_checkudata(L, 1, LUA_BUFFERSTRUCT);
	if(lua_gettop(L) != 2)
		luaL_error(L, "invalid param");
	if(lua_isnumber(L, 2))
	{
		lua_Integer i = luaL_checkinteger(L, 2);
		if(i <= 0 || i > buffer->len)
			luaL_error(L, "invalid index(%d) (buffer len: %d)", (int)i, (int)buffer->len);
		lua_pushinteger(L, buffer->data[i - 1]);
		return 1;
	}
	luaL_getmetatable(L, LUA_BUFFERSTRUCT);
	lua_pushvalue(L, 2);
	lua_gettable(L, -2);
	return 1;
}

/* buffer.__newindex(buffer, i, v) */
static int buf_newindex(lua_State* L)
{
	lua_Buffer* buffer = luaL_checkudata(L, 1, LUA_BUFFERSTRUCT);
	lua_Integer i = luaL_checkinteger(L, 2);
	lua_Integer v = luaL_checkinteger(L, 3);
	if(lua_gettop(L) != 3)
		luaL_error(L, "invalid param");
	if(i <= 0 || i > buffer->len)
		luaL_error(L, "invalid index(%d) (buffer len: %d)", (int)i, (int)buffer->len);
	buffer->data[i - 1] = (unsigned char)v;
	return 0;
}

/* buffer = buffer.__concat(buffer|string, buffer|string) */
static int buf_concat(lua_State* L)
{
	lua_Buffer* buffer;
	lua_Buffer* buf0 = luaL_testudata(L, 1, LUA_BUFFERSTRUCT);
	lua_Buffer* buf1 = luaL_testudata(L, 2, LUA_BUFFERSTRUCT);
	const void* src0, *src1;
	lua_Integer len0, len1;
	size_t len;
	if(buf0) { src0 = buf0->data; len0 = buf0->len; }
	else	 { src0 = luaL_checklstring(L, 1, &len); len0 = (lua_Integer)len; }
	if(buf1) { src1 = buf1->data; len1 = buf1->len; }
	else	 { src1 = luaL_checklstring(L, 2, &len); len1 = (lua_Integer)len; }
	buffer = (lua_Buffer*)lua_newuserdata(L, sizeof(lua_Buffer));
	buffer->data = malloc(buffer->len = buffer->cap = len0 + len1);
	memcpy(buffer->data, src0, len0);
	memcpy(buffer->data + len0, src1, len1);
	luaL_getmetatable(L, LUA_BUFFERSTRUCT);
	lua_setmetatable(L, -2);
	return 1;
}

/* b = buffer.__eq(buffer, buffer) */
static int buf_eq(lua_State* L)
{
	lua_Buffer* buf0 = luaL_checkudata(L, 1, LUA_BUFFERSTRUCT);
	lua_Buffer* buf1 = luaL_checkudata(L, 2, LUA_BUFFERSTRUCT);
	lua_pushboolean(L, buf0->len == buf1->len && !memcmp(buf0->data, buf1->data, buf0->len));
	return 1;
}

/* b = buffer.__lt(buffer, buffer) */
static int buf_lt(lua_State* L)
{
	lua_Buffer* buf0 = luaL_checkudata(L, 1, LUA_BUFFERSTRUCT);
	lua_Buffer* buf1 = luaL_checkudata(L, 2, LUA_BUFFERSTRUCT);
	lua_pushboolean(L, memcmp(buf0->data, buf1->data, (buf0->len < buf1->len ? buf0->len : buf1->len)) - (buf0->len < buf1->len) < 0);
	return 1;
}

/* b = buffer.__le(buffer, buffer) */
static int buf_le(lua_State* L)
{
	lua_Buffer* buf0 = luaL_checkudata(L, 1, LUA_BUFFERSTRUCT);
	lua_Buffer* buf1 = luaL_checkudata(L, 2, LUA_BUFFERSTRUCT);
	lua_pushboolean(L, memcmp(buf0->data, buf1->data, (buf0->len < buf1->len ? buf0->len : buf1->len)) - (buf0->len <= buf1->len) < 0);
	return 1;
}

/* buffer.__gc(buffer) */
static int buf_gc(lua_State* L)
{
	free(((lua_Buffer*)luaL_checkudata(L, 1, LUA_BUFFERSTRUCT))->data);
	return 0;
}

static const luaL_Reg buflib[] =
{
	{"new", buf_new},
	{"lower", buf_lower},
	{"upper", buf_upper},
	{"reserve", buf_reserve},
	{"resize", buf_resize},
	{"len", buf_len},
	{"tostring", buf_tostring},
	{"append", buf_append},
	{"sub", buf_sub},
	{"fill", buf_fill},
	{"copy", buf_copy},
	{NULL, NULL}
};

static const luaL_Reg bufmeta[] =
{
	{"lower", buf_lower},
	{"upper", buf_upper},
	{"reserve", buf_reserve},
	{"resize", buf_resize},
	{"len", buf_len},
	{"tostring", buf_tostring},
	{"append", buf_append},
	{"sub", buf_sub},
	{"fill", buf_fill},
	{"copy", buf_copy},
	{"__call", buf_new},
	{"__index", buf_index},
	{"__newindex", buf_newindex},
	{"__len", buf_len},
	{"__tostring", buf_tostring},
	{"__concat", buf_concat},
	{"__eq", buf_eq},
	{"__lt", buf_lt},
	{"__le", buf_le},
	{"__gc", buf_gc},
	{NULL, NULL}
};

LUAMOD_API int luaopen_buffer(lua_State* L)
{
	luaL_newlib(L, buflib);
	luaL_newmetatable(L, LUA_BUFFERSTRUCT);
	luaL_setfuncs(L, bufmeta, 0);
	lua_pop(L, 1);
	return 1;
}
