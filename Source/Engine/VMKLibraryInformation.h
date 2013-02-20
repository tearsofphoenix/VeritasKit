//
//  VMKLibraryInformation.h
//  AZenecaExhibit
//
//  Created by tearsofphoenix on 6/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include "VMKBase.h"

@interface VMKLibraryInformation : NSObject

@property (nonatomic, retain) NSString *libName;
@property (nonatomic) lua_CFunction loadFunction;
@property (nonatomic) int numberOfUpvalues;
@property (nonatomic, retain) NSArray *dependentLibNames;
@property (nonatomic, retain) NSString *featureID;

- (void)registerIntoLuaState: (lua_State *)luaState
                   libraries: (NSDictionary *)dict;

@end

VMK_EXTERN_C_BEGIN

VMK_EXPORT VMKLibraryInformation * VMKLibraryInformationMake(NSString *fetureID,
                                                            NSString *libName,
                                                            lua_CFunction loadFunction,
                                                            int numberOfUpvalues,
                                                            NSArray *dependentLibNames);

VMK_EXPORT void VMKLibraryInformationRegisterToState(NSDictionary *_luaEngineLibs,
                                                    NSString * libraryID,
                                                    lua_State *luaState);

VMK_EXTERN_C_END