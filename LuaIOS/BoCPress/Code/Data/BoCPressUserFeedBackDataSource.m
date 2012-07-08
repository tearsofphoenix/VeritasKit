//
//  BoCPressUserFeedBackDataSource.m
//  BoCPress
//
//  Created by E-Reach Administrator on 7/4/11.
/*************************************************************************

*

* EREACH CONFIDENTIAL

* ____________________

*

* [2011] eReach Mobile Software Technology Co., Ltd.

* All Rights Reserved.

*

* NOTICE: All information contained herein is, and remains the

* property of eReach Mobile Software Technology and its suppliers,

* if any. The intellectual and technical concepts contained herein

* are proprietary to eReach Mobile Software Technology and its

* suppliers and may be covered by U.S. and Foreign Patents, patents

* in process, and are protected by trade secret or copyright law.

* Dissemination of this information or reproduction of this material

* is strictly forbidden unless prior written permission is obtained

* from eReach Mobile Software Technology Co., Ltd.

*/

#import "BoCPressUserFeedBackDataSource.h"

#import "BoCPressDataSource.h"

#import "BoCPressConstant.h"

@implementation BoCPressUserFeedBackDataSource

- (id)initWithService: (id<BoCPressDataSource>)rootDataSource
{
    
    self = [super init];
    if (self)
    {
        _rootDataSource = rootDataSource;
    }
    
    return self;
    
}

- (NSString *)getUserFeedbackRequestStringWithFeedback: (id)feedback
{
    NSString *getUserFeedbackString = [NSString stringWithFormat:kNetwork_SetFeedBackFormatterString, feedback];
    
    return [_rootDataSource getBaseStringWithRequireType: kNetwork_SetFeedBack 
                                       andArgumentString: getUserFeedbackString];    
}

- (void)submitUserFeedback: (id)feedback 
         withCallbackBlock: (void (^)(id data))callbackBlock
{
    
    NSString *stringToSetFeedback = [self getUserFeedbackRequestStringWithFeedback:feedback];
    
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  Block_copy(callbackBlock), kNetwork_CallbackObject,
                                  kCallbackAction_submitUserFeedback, kNetwork_CallbackAction,
                                  kNetwork_SetFeedBackResponse, kNetwork_SoapResponseType,
                                  nil];
    Block_release(callbackBlock);
    
    [_rootDataSource postRequestString: stringToSetFeedback
                       andCallbackInfo: callbackInfo];
    
    [callbackInfo release];
}

@end
