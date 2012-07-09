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

extern LuaBridgeFuncotrRef LuaBridgeFuncotrCreate(struct lua_State *L,
                                                  NSString * name, 
                                                  NSArray *argumentTypes, 
                                                  NSString *returnEncoding);

extern int luaObjCInternal_openBridgeFunctor(struct lua_State *L);
