//
//  BoCPressMediaPlayerViewControllerPrivateHandler.m
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

#import "BoCPressMediaPlayerViewControllerPrivateHandler.h"

#import "Reachability.h"

#import "BoCPressConstant.h"

#import "BoCPressMediaPlayerViewController.h"

@implementation BoCPressMediaPlayerViewControllerPrivateHandler

- (id)initWithMediaPlayerViewController: (BoCPressMediaPlayerViewController *)mediaPlayerViewController
{
    if ((self = [super init])) 
    {
        _mediaPlayerViewController = mediaPlayerViewController;
    }
    return self;
}

- (void)callbackForAction: (id)action
                 withData: (id)data
{
    if (_callbackFlag)
    {
        //        NSLog(@"callback action is:%@", action);
        if ([kCallbackAction_contentOfMedia isEqualToString:action])
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
                    //                    [_alertFor3GNetwork show];
                    [_mediaPlayerViewController updateMediaWithData:data];
                    
                    break;
                }
                case ReachableViaWiFi:
                {
                    NSLog(@"WiFi connection");
                    [_mediaPlayerViewController updateMediaWithData:data];
                    //                    [_alertFor3GNetwork show];
                    break;
                }
                default:
                {
                    NSLog(@"error in swith-case connection type");
                    break;
                }
            }
            
        }
    }
    
}

- (void)handleReturnButtonPressedEvent: (id)sender
{
    [_mediaPlayerViewController willCancelMediaLoading];
    
}

@end
