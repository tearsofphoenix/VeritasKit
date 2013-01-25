//
//  VMKBridgeInfo.h
//  LuaIOS
//
//  Created by tearsofphoenix on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#ifndef __VMK_VMKBRIDGEINFO__
#define __VMK_VMKBRIDGEINFO__ 1

#include "VMKBase.h"

struct lua_State;
                                        
enum 
{
    VMKBridgeInvalidType = -1,
    VMKBridgeConstantType = 0,
    VMKBridgeEnumType,
    VMKBridgeFunctionType,
    VMKBridgeClassType,
};

typedef int VMKBridgeType;

typedef struct __VMKBridgeInfo *VMKBridgeInfoRef;

@interface VMKBridgeInfo : NSObject

@property (nonatomic) VMKBridgeType type;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) id info;

- (BOOL)resolveIntoLuaState: (struct lua_State *)state;

VMK_EXPORT VMKBridgeType VMKBridgeInfoGetType(VMKBridgeInfoRef info);

VMK_EXPORT void VMKBridgeInfoSetType(VMKBridgeInfoRef info, VMKBridgeType type);

VMK_EXPORT CFStringRef VMKBridgeInfoGetName(VMKBridgeInfoRef info);

VMK_EXPORT void VMKBridgeInfoSetName(VMKBridgeInfoRef info, CFStringRef name);

VMK_EXPORT id VMKBridgeInfoGetInfo(VMKBridgeInfoRef info);

VMK_EXPORT void VMKBridgeInfoSetInfo(VMKBridgeInfoRef info, id value);

VMK_EXPORT Boolean VMKBridgeInfoResolveIntoLuaState(VMKBridgeInfoRef info, struct lua_State *state);

@end

@interface VMKBridgeArgumentInfo : NSObject

@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSString *type64;

@end

#endif
