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

VK_EXPORT Class LuaObjCNSBlockClass;

VK_EXPORT void luaObjC_addClosureIDForBlock(LuaClosureType clouserID, id block);

VK_EXPORT LuaClosureType luaObjC_getClosureIDOfBlock(id block);

__END_DECLS