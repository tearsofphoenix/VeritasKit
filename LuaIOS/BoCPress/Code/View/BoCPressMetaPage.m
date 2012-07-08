//
//  BoCPressMetaPage.m
//  BoCPress
//
//  Created by E-Reach Administrator on 11/29/11.
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

#import "BoCPressMetaPage.h"

#import "BoCPressConstant.h"

#import "BoCPressCallback.h"

#import "UIView+LoadingIndicatorView.h"

#import "BoCPressNotificationDefines.h"

#import "NSString+UUID.h"

@implementation BoCPressMetaPage

@synthesize lastPage = _lastPage;
@synthesize pageTitle = _pageTitle;

- (id)init
{
    if((self = [super init]))
    {
        _attachedCallbackInfos = [[NSMutableDictionary alloc] init];
        _metaSessionID =[[NSString alloc] initWithString: NSStringFromClass([self class])];
        _sessionID = [[NSString UUIDString] retain];
    }
    return self;
}

- (void)dealloc
{
    [_attachedCallbackInfos release];
    [_loadingIndicator release];
    [_metaSessionID release];
    [_sessionID release];
    
    [super dealloc];
}

- (BOOL)couldReadNextPage
{
    return NO;
}

- (BOOL)couldReadPreviousPage
{
    return NO;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                         duration:(NSTimeInterval)duration
{
    
}

- (void)willSwitchToOtherTab
{
    [self didUpdateData];
    [_handler cancelAllCallback];
}

- (void)willBeSlidedToOtherPage
{
    [self didUpdateData];
    [_handler cancelAllCallback];
}

- (void)willBrowseBackward
{
    [self didUpdateData];
    
    [_handler cancelAllCallback];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_couldBrowseBackward 
                                                        object: self 
                                                      userInfo: nil];
}

//@required
- (BOOL)shouldRefetchConfigurationAtCurrentContext
{
    return YES;
}

- (id<BoCPressPage>)lastPage
{
    return _lastPage;
}

- (BOOL)couldNavigate
{
    return NO;
}


- (BOOL)needNavigationBar
{
    return NO;
}

- (BOOL)needTabBar
{
    return YES;
}


- (void)wantToUpdateDataWithInfo: (id)info
{
    ;
}

- (void)didBeenBackwardToWithInfo: (NSDictionary *)info
{
    [self setUserInteractionEnabled: YES];
    [self didUpdateData];
    [_handler activeAllCallback];
    
    BOOL couldExecuteCallbackInfo = [[info objectForKey: kBoCPress_AttachedCallbackInfo_couldExecute] boolValue];
    
    NSDictionary *callbackInfo = [_attachedCallbackInfos objectForKey: kBoCPress_AttachedCallbackInfoTypeExecuteWhenDidBeenBackwardFromLastPage];
    if (callbackInfo && couldExecuteCallbackInfo)
    {
        id<BoCPressCallback> callback = [callbackInfo objectForKey: kNetwork_CallbackObject];
        id callbackAction = [callbackInfo objectForKey: kNetwork_CallbackAction];
        [callback callbackForAction: callbackAction
                           withData: callbackInfo];
    }
}

- (BOOL)couldShowTimeOutAlertWithInfo:(NSDictionary *)info
{
    return YES;
}

- (void)wantToForceRefreshCurrentContentWithInfo: (id)animationInfo
{
    [_handler activeAllCallback];
    [self didUpdateData];
    [self wantToUpdateDataWithInfo: animationInfo];
}

- (void)beforeRefetchConfiguration
{
    [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                    onsuperView: NO];
}

- (void)clearCurrentPageAfterNetworkTimeOutWithInfo:(NSDictionary *)info
{
    [self didUpdateData];
}

#pragma mark - handle server error
- (void)showServerErrorWithData: (id)data
{
    ;
}

- (void)didBeenSwitchToFromOtherTabCompletion: (void (^)(void))block
{
    [_handler activeAllCallback];
    if (block)
    {
        block();
    }
}

- (void)didUpdateData
{    
    [self setUserInteractionEnabled: YES];
    
    _dataLoading = NO;
    [_loadingIndicator setAlpha: 0];
    
    _couldHideLoadingIndicator = NO;
    [[NSNotificationCenter defaultCenter] postNotificationName: kBoCPress_View_didUpdateDataOfCurrentPage 
                                                        object: self 
                                                      userInfo: nil];
}

- (void)autoFitToInterfaceOrientation: (UIInterfaceOrientation)interfaceOrientation
{
    ;
}

- (void)finishedShowVIPAuthorizeView
{
    ;
}

- (NSArray *)supportedInterfaceOrientations
{
    return [NSArray arrayWithObject: [NSNumber numberWithInt: UIInterfaceOrientationPortrait]];
}

- (void)wantToShowLoadingIndicatorWithMessage: (NSString *)message 
                                  onsuperView: (BOOL)flag
{
    if (!_dataLoading)
    {
        _dataLoading = YES;
        
        _couldHideLoadingIndicator = NO;
        
        UIView *view = self;
        
        if (flag)
        {
            view = [self superview];
        }
        
        if (!_loadingIndicator) 
        {
            _loadingIndicator = [[view loadingIndicatorWithText: message] retain];
        }
        [view addSubview: _loadingIndicator];
        [_loadingIndicator setFrame:CGRectMake(0, 0, 320, 480-20)];
        [_loadingIndicator setAlpha: 1];
        
        _timerForLoadingIndicator = [NSTimer scheduledTimerWithTimeInterval: kBoCPress_Global_MinTimerIntervalForLoadingIndicator                                        
                                                                     target: self 
                                                                   selector: @selector(stopTimerOfLoadingIndicator:) 
                                                                   userInfo: nil 
                                                                    repeats: NO];
    }
    
}


- (void)stopTimerOfLoadingIndicator: (NSTimer*)timer
{
    [_timerForLoadingIndicator invalidate];
    _timerForLoadingIndicator = nil;
    
    if (_couldHideLoadingIndicator)
    {
        [self didUpdateData];
    }else
    {
        _couldHideLoadingIndicator = YES;
    }
}

- (void)wantToFinishDataUpdate
{
    if (_couldHideLoadingIndicator)
    {
        [self didUpdateData];
    }else
    {
        _couldHideLoadingIndicator = YES;
    }
}

- (void)attachCallbackInfo: (NSDictionary *)callbackInfo 
                   forType: (NSString *)type
{
    if (callbackInfo && type) 
    {
        [_attachedCallbackInfos setObject: callbackInfo
                                   forKey: type];
    }
}

- (BOOL)respondsToRemoteNotification: (NSDictionary *)info
{
    NSDictionary *aps = [info objectForKey: @"aps"];
    NSString *alertMessage = [aps objectForKey: @"alert"];
    
    UIAlertView *alertForRemoteNotification = [[UIAlertView alloc] initWithTitle: @"提示"
                                                                         message: alertMessage 
                                                                        delegate: self
                                                               cancelButtonTitle: @"查看"
                                                               otherButtonTitles: @"取消", nil];
    [alertForRemoteNotification show];
    [alertForRemoteNotification release];
    return YES;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName: kNotification_ViewController_wantToNavigateToServerPushNotificationCenter
                                                            object: self
                                                          userInfo: nil];
    }
}

- (id)identity
{
    return NSStringFromClass([self class]);
}

- (void)didReceivedErrorFromServerWithInfo: (NSDictionary *)info
{
    [self didUpdateData];
}

- (void)didCancelledHandleErrorOfServerWithData: (NSDictionary *)info
{
    
}

- (void)willHandleErrorOfServerWithData: (NSDictionary *)info
{
    
}

- (void)didBeenSlideToWithInfo:(NSDictionary *)info
{
    [self wantToUpdateDataWithInfo: info];
}

@end
