//
//  BoCPressViewStatePrivateHandler.m
//  BoCPress
//
//  Created by E-Reach Administrator on 4/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressViewStatePrivateHandler.h"

#import "BoCPressViewState.h"

#import "BoCPressConstant.h"

#import "Reachability.h"

@implementation BoCPressViewStatePrivateHandler

- (id)initWithViewState: (BoCPressViewState *)viewState
{
    if ((self = [super init]))
    {
        _viewState = viewState;
    }
    return self;
}

- (void)callbackForAction:(id)action withData:(id)data
{
    if (_callbackFlag)
    {
        
        if ([kCallbackAction_uploadRemoteNotificationConfiguration isEqualToString: action])
        {
            NSLog(@"Register device Token OK!%@", data);
                        
        }else if ([kCallbackAction_contentOfNews isEqualToString: action])
        {
            // finished receive news of remote notification from server
            
            [_viewState readNewsInNewsListWithInfo: data]; 
                        
        }else if ([kCallbackAction_ViewState_navigateToCertainCriticPostWithInfo isEqualToString: action])
        {
            //        [self navigateToCertainCriticPostWithInfo: data];
            
        }else if ([kCallbackAction_ViewState_navigateToCertainMediaWithInfo isEqualToString: action]) 
        {
            //        [self navigateToCertainMediaWithInfo: data];
            
        }else if ([kCallbackAction_ViewState_navigateToCertainCriticListWithInfo isEqualToString: action])
        {
            //        [self navigateToCertainCriticListWithInfo: data];
            
        }else if ([kCallbackAction_ViewState_navigateToCertainQuotePageWithInfo isEqualToString: action])
        {
            //        [self navigateToCertainQuotePageWithInfo: data];
            
        }else if([kCallbackAction_ViewState_navigateToCertainNewsWithInfo isEqualToString: action])
        {
            //        [self navigateToCertainNewsWithInfo: data];
            
        }else if ([kCallbackAction_getPushNotification isEqualToString: action]) 
        {
            
            [_viewState navigateToRemoteNotificationPageWithInfo: data];
            
        }else  if([kCallbackAction_didCancelledHandleErrorOfServer isEqualToString: action])
        {
            [_viewState currentPageDidCancelledHandleErrorOfServerWithData: data];
            
        }else if([kCallbackAction_contentOfCriticPost isEqualToString: action])
        {            
            [_viewState readCriticPostInPostListWithInfo: data];
        }else if ([kCallbackAction_getRemoteNotificationConfigurationWithCallback isEqualToString: action])
        {
            [_viewState showRemoteNotificationContentPage];
            
        }else if ([kCallbackAction_listOrderedLongTermSecurityInFamily isEqualToString: action])
        {
            [_viewState readLongTermListOfSecurityInFamilyWithInfo: data];
        }else if([kCallbackAction_listOrderedSecurityInFamily isEqualToString: action])
        {
            [_viewState readListOfSecurityInFamilyWithInfo: data];
            
        }else if ([kCallbackAction_contentOfQuoteDetail isEqualToString: action])
        {
            [_viewState showQuoteContentPageWithInfo: data];
        }else if ([kCallbackAction_contentOfMedia isEqualToString: action])
        {
            
            Reachability *curReach = [Reachability reachabilityForInternetConnection];
            
            NetworkStatus netStatus = [curReach currentReachabilityStatus];
            
            switch (netStatus)
            {
                case NotReachable:
                {
                    NSLog(@"no connection");
                    break;
                }
                    
                case ReachableViaWWAN:
                {
                    NSLog(@"3G connection!");

                    [_viewState playMediaWithInfo: data];
                    
                    break;
                }
                case ReachableViaWiFi:
                {
                    NSLog(@"WiFi connection");
                    [_viewState playMediaWithInfo: data];
                    break;
                }
                default:
                {
                    NSLog(@"error in swith-case connection type");
                    break;
                }
            }

        }else if([kCallbackAction_willHandleErrorOfServer isEqualToString: action])
        {
            [_viewState willHandleErrorOfServerWithInfo: data];
        }
    }
}


@end
