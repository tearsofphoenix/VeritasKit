//
//  LuaLibraryInformation.m
//  AZenecaExhibit
//
//  Created by tearsofphoenix on 6/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaLibraryInformation.h"

@implementation LuaLibraryInformation

@synthesize libaName = _libName;
@synthesize loadFunction = _loadFunction;
@synthesize numberOfUpvalues = _numberOfUpvalues;
@synthesize dependentLibNames = _dependentLibNames;
@synthesize featureID = _featureID;

- (void)dealloc
{
    [_libName release];
    [_dependentLibNames release];
    [_featureID release];
    
    [super dealloc];
}

- (void)registerIntoLuaState: (lua_State *)luaState
                   libraries: (NSDictionary *)dict
{
    for (NSString *iLooper in _dependentLibNames)
    {        
        LuaLibraryInformation *libLooper = [dict objectForKey: iLooper];
        [libLooper registerIntoLuaState: luaState
                              libraries: dict];
    }
    
    luaL_requiref(luaState, [_libName cStringUsingEncoding: NSUTF8StringEncoding],
                  _loadFunction, _numberOfUpvalues);
    lua_pop(luaState, 1);
}

@end



LuaLibraryInformation * LuaLibraryInformationMake(NSString *fetureID,
                                                  NSString *libName,
                                                  lua_CFunction loadFunction,
                                                  int numberOfUpvalues,
                                                  NSArray *dependentLibNames)
{
    LuaLibraryInformation *ret = [[LuaLibraryInformation alloc] init];
    [ret setFeatureID: fetureID];
    [ret setLibaName: libName];
    [ret setLoadFunction: loadFunction];
    [ret setNumberOfUpvalues: numberOfUpvalues];
    [ret setDependentLibNames: dependentLibNames];
    
    return [ret autorelease];
}

void LuaLibraryInformationRegisterToState(NSDictionary *_luaEngineLibs, NSString * libraryID, lua_State *luaState)
{
    [[_luaEngineLibs objectForKey: libraryID] registerIntoLuaState: luaState
                                                         libraries: _luaEngineLibs];
}
