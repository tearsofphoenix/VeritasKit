//
//  VMKBridgeFunctor.h
//  LuaIOS
//
//  Created by tearsofphoenix tearsofphoenix on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

struct lua_State;

typedef struct VMKBridgeFuncotr *VMKBridgeFuncotrRef;

extern const char * VMKBridgeFuncotrMetaName;

extern VMKBridgeFuncotrRef VMKBridgeFunctorCreate(struct lua_State *L,
                                                  NSString * name, 
                                                  NSArray *argumentTypes, 
                                                  const char *returnEncoding);

extern void VMKBridgeFunctorInitialize(VMKBridgeFuncotrRef ref,
                                       NSArray *argumentTypes,
                                       const char *returnEncoding);

extern int LuaInternalOpenBridgeFunctorSupport(struct lua_State *L);

#pragma mark - for message sending

extern VMKBridgeFuncotrRef VMKInvocationCreate(void *functionPointer);

extern void VMKInvoke(struct lua_State *L,
                                 VMKBridgeFuncotrRef functor);

extern void VMKFunctorFinalize(VMKBridgeFuncotrRef functor);

extern void VMKInvocationSetArgumentAtInex(VMKBridgeFuncotrRef ref,
                                               int index,
                                                void *value);

extern void VMKInvocationSetArgumentFromLuaStateAtInex(VMKBridgeFuncotrRef ref,
                                               struct lua_State *L,
                                               int index,
                                               const char *encoding,
                                               NSUInteger argumentIndex);
