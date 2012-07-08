//
//  BoCPressQuoteContentLandscapePagePrivateHandler.m
//  BoCPress
//
//  Created by E-Reach Administrator on 11/21/11.
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

#import "BoCPressQuoteContentLandscapePagePrivateHandler.h"

#import "BoCPressViewController.h"

#import "BoCPressConstant.h"

#import "BoCPressQuoteContentLandscapePage.h"

@implementation BoCPressQuoteContentLandscapePagePrivateHandler

- (id)initWithPage:(BoCPressQuoteContentLandscapePage *)page
{
    if ((self = [super init]))
    {
        _page = page;
        
        NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
        [defaultCenter addObserver: self 
                          selector: @selector(backToQuoteContentPage:)
                              name: kNetwork_backwardSignleImageView
                            object:nil];
                
        [ defaultCenter addObserver:self
                           selector:@selector(notificationForShowConfigurationView:)
                               name:kQuoteContentPage_showConfigurationView
                             object:nil];
        
        [ defaultCenter addObserver:self
                           selector:@selector(notificationForShowSecurityChooseView:) 
                               name:kQuoteContentPage_showSecurityChooseView 
                             object:nil];
        [ defaultCenter addObserver:self
                           selector:@selector(notificationForReloadImageConfiguration:) 
                               name:kQuoteContentPage_didFinishedConfiguration 
                             object:nil];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForDidSelectedEntryAtIndex:) 
                              name: kSecurityChooseViewController_didSelectedEntryAtIndex
                            object: nil];
    }
    
    return self;
}
- (void)dealloc
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}

- (void)callbackForAction:(id)action withData:(id)data
{
    if (_callbackFlag)
    {
        if ([kCallbackAction_contentOfQuoteDetail isEqualToString:action])
        {
            [_page updateContentWithData:data];
            
        }
    }
}

- (void)wantToUpdateDataRaisedByTimer: (NSTimer*)theTimer
{
    if (_callbackFlag) 
    {
        [_page wantToUpdateDataByTimer];
    }else
    {
        [theTimer invalidate];
    }
}


- (void)backToQuoteContentPage: (NSNotification *)notification
{
    BoCPressViewController *rootViewController = (BoCPressViewController*)[[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [rootViewController dismissModalViewControllerAnimated:YES];
    if (_callbackFlag)
    {
        [_page wantToForceRefreshCurrentContentWithInfo: nil];
    }
}

- (void)notificationForShowConfigurationView: (NSNotification *)notification
{
    if (_callbackFlag)
    {
        [_page showConfigurationView];
    }
}

- (void)notificationForShowSecurityChooseView: (NSNotification *)notification
{
    if (_callbackFlag)
    {
        [_page showSecurityChooseView];
    }
}

- (void)notificationForReloadImageConfiguration: (NSNotification *)notification
{
    if (_callbackFlag)
    {
        [_page reloadConfiguration];
    }
}

- (void)notificationForDidSelectedEntryAtIndex: (NSNotification *)notification
{
    if (_callbackFlag)
    {
        NSUInteger rowIndex = [[[notification userInfo] objectForKey: kBoCPress_Global_Index] integerValue];
        [_page didSelectedSecurityAtRow: rowIndex];
    }
}
#pragma mark - chartView delegate
- (void)chartView: (BoCPressQuoteContentChartLandscapeView *)chartView didSwitchedToEntry: (id)entry
{
    if (_callbackFlag) 
    {        
        [_page changeTimeIntervalTypeOfChartImageConfigurationTo:entry];
    }
}

- (void)chartView:(BoCPressQuoteContentChartLandscapeView *)chartView didTapedImageWithEntry:(id)entry
{
    if (_callbackFlag)
    {
        ;
    }
}


@end
