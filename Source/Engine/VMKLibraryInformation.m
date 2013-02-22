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

- (void)registerIntoLuaState: (VMKLuaStateRef)state
                   libraries: (NSDictionary *)dict
{
    for (NSString *iLooper in _dependentLibNames)
    {        
        VMKLibraryInformation *libLooper = [dict objectForKey: iLooper];
        [libLooper registerIntoLuaState: state
                              libraries: dict];
    }
    
    luaL_requiref(state, [_libName UTF8String], _loadFunction, _numberOfUpvalues);
    lua_pop(state, 1);
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
