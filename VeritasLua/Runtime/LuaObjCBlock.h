//
//  LuaObjCBlock.h
//  LuaIOS
//
//  Created by tearsofphoenix on 8/1/12.
//
//

struct lua_State;

typedef int LuaClosureType;

extern LuaClosureType LuaObjCInvalidClouserID;

extern Class LuaObjCNSBlockClass;

extern void LuaObjCBlockSupportInitialize(void);

extern void LuaObjCBlockSetClosureID(LuaClosureType clouserID, id block);

extern LuaClosureType LuaObjCBlockGetClosureID(id block);

