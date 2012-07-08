//
//  BoCPressCallbackInfo.h
//  BoCPress
//
//  Created by E-Reach Administrator on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BoCPressCallback;

@protocol BoCPressCallbackInfo<NSObject>

@required

@property (nonatomic, assign) id<BoCPressCallback> callback;
@property (nonatomic, retain) NSString *callbackAction;
@property (nonatomic, retain) NSDictionary *callbackArguments;


@end;

@interface BoCPressCallbackInfo : NSObject<BoCPressCallbackInfo>

@end
