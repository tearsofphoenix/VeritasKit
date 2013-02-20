//
//  VMKBridgeFunctor.h
//  LuaIOS
//
//  Created by tearsofphoenix tearsofphoenix on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VMKBase.h"

typedef struct VMKBridgeFuncotr *VMKBridgeFuncotrRef;

extern const char * VMKBridgeFuncotrMetaName;

extern VMKBridgeFuncotrRef VMKBridgeFunctorCreate(VMKLuaStateRef state,
                                                  NSString * name, 
                                                  NSArray *argumentTypes, 
                                                  const char *returnEncoding);

extern void VMKBridgeFunctorInitialize(VMKBridgeFuncotrRef ref,
                                       NSArray *argumentTypes,
                                       const char *returnEncoding);

extern int LuaInternalOpenBridgeFunctorSupport(struct lua_State *L);

#pragma mark - for message sending

extern VMKBridgeFuncotrRef VMKInvocationCreate(void *functionPointer);

extern void VMKInvoke(VMKLuaStateRef state, VMKBridgeFuncotrRef functor);

extern void VMKFunctorFinalize(VMKBridgeFuncotrRef functor);

extern void VMKInvocationSetArgumentAtInex(VMKBridgeFuncotrRef ref,
                                               int index,
                                                void *value);

extern void VMKInvocationSetArgumentFromLuaStateAtInex(VMKBridgeFuncotrRef ref,
                                               VMKLuaStateRef state,
                                               int index,
                                               const char *encoding,
                                               NSUInteger argumentIndex);
