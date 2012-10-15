//
//  LuaLibraryInformation.h
//  AZenecaExhibit
//
//  Created by tearsofphoenix on 6/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include "LuaObjCBase.h"

@interface LuaLibraryInformation : NSObject

@property (nonatomic, retain) NSString *libaName;
@property (nonatomic) lua_CFunction loadFunction;
@property (nonatomic) int numberOfUpvalues;
@property (nonatomic, retain) NSArray *dependentLibNames;
@property (nonatomic, retain) NSString *featureID;

- (void)registerIntoLuaState: (lua_State *)luaState
                   libraries: (NSDictionary *)dict;

@end

__BEGIN_DECLS

VK_EXPORT LuaLibraryInformation * LuaLibraryInformationMake(NSString *fetureID,
                                                            NSString *libName,
                                                            lua_CFunction loadFunction,
                                                            int numberOfUpvalues,
                                                            NSArray *dependentLibNames);

VK_EXPORT void LuaLibraryInformationRegisterToState(NSDictionary *_luaEngineLibs,
                                                    NSString * libraryID,
                                                    lua_State *luaState);

__END_DECLS