//
//  LuaNSObjectSupport.h
//  LuaIOS
//
//  Created by LeixSnake on 8/2/12.
//
//

#ifdef __cplusplus
extern "C" {
#endif

struct lua_State;

extern int luaObjC_openNSObjectSupport(struct lua_State *L);

#ifdef __cplusplus
}
#endif
