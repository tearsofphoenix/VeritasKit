//
//  VMKFrameworkFunctions.m
//  LuaIOS
//
//  Created by tearsofphoenix on 7/13/12.
//
//

#include "VMKFrameworkFunctions.h"
#include <stdlib.h>

int LuaInternalStructGarbageCollection(VMKLuaStateRef state)
{
    void *structObj = lua_touserdata(state, 1);
    if (structObj)
    {
        free(structObj);
    }
    return 0;
}
