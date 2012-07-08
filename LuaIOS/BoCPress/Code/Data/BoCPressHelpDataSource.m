//
//  BoCPressHelpDataSource.m
//  BoCPress
//
//  Created by E-Reach Administrator on 7/5/11.
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

#import "BoCPressHelpDataSource.h"

#import "BoCPressDataSource.h"

#import "BoCPressConstant.h"

@implementation BoCPressHelpDataSource

- (id)initWithService: (id<BoCPressDataSource>)rootDataSource
{
    self = [super init];
    if (self) 
    {
        _rootDataSource = rootDataSource;
    }
    
    return self;
}

- (NSString *)getHelpInfoRequestStringWithColumnID: (id)columnID
{
    NSString * getHelpInfoString = [NSString stringWithFormat:kNetwork_GetHelpInfoFormatterString, columnID];
    
    return [_rootDataSource getBaseStringWithRequireType: kNetwork_GetHelpInfo
                                       andArgumentString: getHelpInfoString];
}

- (void)getHelpInfoOfColumn:(id)columnID 
               withCallback:(id<BoCPressCallback>)callback
{
    NSString *helpInfoString = [self getHelpInfoRequestStringWithColumnID:columnID];
    
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  callback, kNetwork_CallbackObject, 
                                  columnID, kBoCPress_Global_ColumnID,
                                  kCallbackAction_getHelpInfoOfColumn, kNetwork_CallbackAction,
                                  kNetwork_GetHelpInfoResponse, kNetwork_SoapResponseType,
                                  nil];
    
    [_rootDataSource postRequestString: helpInfoString
                       andCallbackInfo: callbackInfo];
    [callbackInfo release];
}

@end
