//
//  VMKLibraryInformation.m
//  AZenecaExhibit
//
//  Created by tearsofphoenix on 6/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VMKLibraryInformation.h"

@implementation VMKLibraryInformation

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
        VMKLibraryInformation *libLooper = [dict objectForKey: iLooper];
        [libLooper registerIntoLuaState: luaState
                              libraries: dict];
    }
    
    luaL_requiref(luaState, [_libName UTF8String],
                  _loadFunction, _numberOfUpvalues);
    lua_pop(luaState, 1);
}

@end



VMKLibraryInformation * VMKLibraryInformationMake(NSString *fetureID,
                                                  NSString *libName,
                                                  lua_CFunction loadFunction,
                                                  int numberOfUpvalues,
                                                  NSArray *dependentLibNames)
{
    VMKLibraryInformation *ret = [[VMKLibraryInformation alloc] init];
    [ret setFeatureID: fetureID];
    [ret setLibName: libName];
    [ret setLoadFunction: loadFunction];
    [ret setNumberOfUpvalues: numberOfUpvalues];
    [ret setDependentLibNames: dependentLibNames];
    
    return [ret autorelease];
}

void VMKLibraryInformationRegisterToState(NSDictionary *_luaEngineLibs, NSString * libraryID, lua_State *luaState)
{
    [[_luaEngineLibs objectForKey: libraryID] registerIntoLuaState: luaState
                                                         libraries: _luaEngineLibs];
}
