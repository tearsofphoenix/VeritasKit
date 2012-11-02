//
//  LuaBridgeInfo.h
//  LuaIOS
//
//  Created by tearsofphoenix on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

struct lua_State;
                                        
enum 
{
    LuaBridgeInvalidType = -1,
    LuaBridgeConstantType = 0,
    LuaBridgeEnumType,
    LuaBridgeFunctionType,
    LuaBridgeClassType,
};

typedef NSInteger LuaBridgeType;

extern LuaBridgeType LuaBridgeTypeFromString(NSString *aString);

@protocol LuaBridgeInfo <NSObject>

@property (nonatomic) LuaBridgeType type;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) id info;

- (BOOL)resolveIntoLuaState: (struct lua_State *)state;

@end

@interface LuaBridgeInfo : NSObject<LuaBridgeInfo>


@end

@interface LuaBridgeArgumentInfo : NSObject

@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSString *type64;

@end
