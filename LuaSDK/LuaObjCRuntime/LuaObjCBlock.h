//
//  LuaObjCBlock.h
//  LuaIOS
//
//  Created by tearsofphoenix on 8/1/12.
//
//

struct lua_State;

extern int LuaObjCInvalidClouserID;

extern void _luaObjC_insertClouserIDOfBlock(int clouserID, void *block);

extern int _luaObjC_getClouserIDOfBlock(void *block);

extern void _luaObjC_initializeBlockSupport(void);