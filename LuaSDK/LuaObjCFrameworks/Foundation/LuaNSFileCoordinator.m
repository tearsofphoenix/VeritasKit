//
//  LuaNSFileCoordinator.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSFileCoordinator.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"


static const LuaSDKConst __luaNSFileCoordinatorConstants[] = 
{
    {"NSFileCoordinatorReadingWithoutChanges", NSFileCoordinatorReadingWithoutChanges},
    {"NSFileCoordinatorReadingResolvesSymbolicLink", NSFileCoordinatorReadingResolvesSymbolicLink},
    {"NSFileCoordinatorWritingForDeleting", NSFileCoordinatorWritingForDeleting},
    {"NSFileCoordinatorWritingForMoving", NSFileCoordinatorWritingForMoving},
    {"NSFileCoordinatorWritingForMerging", NSFileCoordinatorWritingForMerging},
    {"NSFileCoordinatorWritingForDeleting", NSFileCoordinatorWritingForDeleting},
    {"NSFileCoordinatorWritingForMoving", NSFileCoordinatorWritingForMoving},
    {"NSFileCoordinatorWritingForReplacing", NSFileCoordinatorWritingForReplacing},
    {NULL, 0},
};

int LuaOpenNSFileCoordinator(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaNSFileCoordinatorConstants);
    return 0;
}
