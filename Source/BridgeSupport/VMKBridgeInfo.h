//
//  VMKBridgeInfo.h
//  LuaIOS
//
//  Created by tearsofphoenix on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

struct lua_State;
                                        
enum 
{
    VMKBridgeInvalidType = -1,
    VMKBridgeConstantType = 0,
    VMKBridgeEnumType,
    VMKBridgeFunctionType,
    VMKBridgeClassType,
};

typedef NSInteger VMKBridgeType;

extern VMKBridgeType VMKBridgeTypeFromString(NSString *aString);

@interface VMKBridgeInfo : NSObject

@property (nonatomic) VMKBridgeType type;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) id info;

- (BOOL)resolveIntoLuaState: (struct lua_State *)state;

@end

@interface VMKBridgeArgumentInfo : NSObject

@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSString *type64;

@end
