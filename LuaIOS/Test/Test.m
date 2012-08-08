//
//  Test.m
//  LuaIOS
//
//  Created by tearsofphoenix on 7/24/12.
//
//

#import "Test.h"

@implementation Test

- (void)dealloc
{
    printf("in function: %s line: %d\n", __PRETTY_FUNCTION__, __LINE__);
    
    [super dealloc];
}

- (BOOL)respondsToSelector: (SEL)aSelector
{
    printf("in func: %s\n", __PRETTY_FUNCTION__);
    return YES;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    printf("in func: %s\n", __PRETTY_FUNCTION__);
    return [NSMethodSignature signatureWithObjCTypes: "@@:"];
}

- (void)forwardInvocation: (NSInvocation *)anInvocation
{
    printf("in func: %s\n", __PRETTY_FUNCTION__);
    
    [anInvocation invokeWithTarget: self];
}

@end
