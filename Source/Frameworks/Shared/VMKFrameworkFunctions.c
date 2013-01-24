//
//  VMKFrameworkFunctions.m
//  LuaIOS
//
//  Created by tearsofphoenix on 7/13/12.
//
//

#include "VMKFrameworkFunctions.h"
#include <stdlib.h>

int LuaInternalStructGarbageCollection(struct lua_State *L)
{
    void *structObj = lua_touserdata(L, 1);
    if (structObj)
    {
        free(structObj);
    }
    return 0;
}
