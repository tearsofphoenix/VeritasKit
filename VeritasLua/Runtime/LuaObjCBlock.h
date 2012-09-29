//
//  LuaObjCBlock.h
//  LuaIOS
//
//  Created by tearsofphoenix on 8/1/12.
//
//

#include "LuaObjCBase.h"

__BEGIN_DECLS

enum
{
    LuaObjCInvalidClouserID = -1,
};

typedef int LuaClosureType;

extern Class LuaObjCNSBlockClass;

extern void LuaObjCBlockSupportInitialize(void);

extern void LuaObjCBlockSetClosureID(LuaClosureType clouserID, id block);

extern LuaClosureType LuaObjCBlockGetClosureID(id block);

__END_DECLS