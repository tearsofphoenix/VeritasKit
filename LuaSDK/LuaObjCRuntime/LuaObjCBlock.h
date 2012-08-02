//
//  LuaObjCBlock.h
//  LuaIOS
//
//  Created by tearsofphoenix on 8/1/12.
//
//

struct lua_State;

extern int LuaObjCInvalidClouserID;

extern void LuaObjCBlockSupportInitialize(void);

extern void LuaObjCBlockSetClosureID(int clouserID, void *block);

extern int LuaObjCBlockGetClosureID(void *block);

