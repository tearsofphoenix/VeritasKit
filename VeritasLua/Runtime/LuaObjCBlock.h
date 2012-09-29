//
//  LuaObjCBlock.h
//  LuaIOS
//
//  Created by tearsofphoenix on 8/1/12.
//
//

#ifdef __cplusplus
extern "C" {
#endif

struct lua_State;

enum
{
    LuaObjCInvalidClouserID = -1,
};

typedef int LuaClosureType;

extern Class LuaObjCNSBlockClass;

extern void LuaObjCBlockSupportInitialize(void);

extern void LuaObjCBlockSetClosureID(LuaClosureType clouserID, id block);

extern LuaClosureType LuaObjCBlockGetClosureID(id block);

#ifdef __cplusplus
}
#endif
