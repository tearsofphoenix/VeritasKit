//
//  LuaBridgeFunctor.h
//  LuaIOS
//
//  Created by tearsofphoenix tearsofphoenix on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

struct lua_State;

typedef struct LuaBridgeFuncotr *LuaBridgeFuncotrRef;

extern const char * LuaBridgeFuncotrMetaName;

extern LuaBridgeFuncotrRef LuaBridgeFunctorCreate(struct lua_State *L,
                                                  NSString * name, 
                                                  NSArray *argumentTypes, 
                                                  const char *returnEncoding);

extern void LuaBridgeFunctorInitialize(LuaBridgeFuncotrRef ref,
                                       NSArray *argumentTypes,
                                       const char *returnEncoding);

extern int LuaInternalOpenBridgeFunctorSupport(struct lua_State *L);

#pragma mark - for message sending

extern LuaBridgeFuncotrRef LuaObjCInvocationCreate(void *functionPointer);

extern void LuaObjCInvoke(struct lua_State *L,
                                 LuaBridgeFuncotrRef functor);

extern void LuaObjCFunctorFinalize(LuaBridgeFuncotrRef functor);

extern void LuaObjCInvocationSetArgumentAtInex(LuaBridgeFuncotrRef ref,
                                               int index,
                                                void *value);

extern void LuaObjCInvocationSetArgumentFromLuaStateAtInex(LuaBridgeFuncotrRef ref,
                                               struct lua_State *L,
                                               int index,
                                               const char *encoding,
                                               NSUInteger argumentIndex);
