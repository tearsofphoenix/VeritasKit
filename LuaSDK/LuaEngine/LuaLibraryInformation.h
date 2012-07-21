//
//  LuaLibraryInformation.h
//  AZenecaExhibit
//
//  Created by tearsofphoenix on 6/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "lauxlib.h"

#import "lualib.h"

@interface LuaLibraryInformation : NSObject

@property (nonatomic, retain) NSString *libaName;
@property (nonatomic) lua_CFunction loadFunction;
@property (nonatomic) NSInteger numberOfUpvalues;
@property (nonatomic, retain) NSArray *dependentLibNames;
@property (nonatomic, retain) NSString *featureID;

- (void)registerIntoLuaState: (lua_State *)luaState
                   libraries: (NSDictionary *)dict;

@end

extern LuaLibraryInformation * LuaLibraryInformationMake(NSString *fetureID,
                                                         NSString *libName,
                                                         lua_CFunction loadFunction,
                                                         NSInteger numberOfUpvalues,
                                                         NSArray *dependentLibNames);

extern LuaLibraryInformation * LuaLibraryInformationMakeC(NSString *fetureID,
                                                          const char *libName,
                                                          lua_CFunction loadFunction,
                                                          NSInteger numberOfUpvalues,
                                                          NSArray *dependentLibNames);

extern void LuaLibraryInformationRegisterToState(NSDictionary *_luaEngineLibs, 
                                                 NSString * libraryID, 
                                                 lua_State *luaState);