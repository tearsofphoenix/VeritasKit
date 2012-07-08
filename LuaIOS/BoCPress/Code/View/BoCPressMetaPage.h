//
//  BoCPressMetaPage.h
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

#import <UIKit/UIKit.h>

#import "BoCPressPage.h"

#import "NSIdentifiedObject.h"

@protocol BoCPressCallback;

@interface BoCPressMetaPage : UIView<BoCPressPage, UIAlertViewDelegate, NSIdentifiedObject>
{
    id<BoCPressCallback> _handler;
    
    //data loading
    //
    BOOL _dataLoading;
    UIView *_loadingIndicator;
    BOOL _couldHideLoadingIndicator;
    NSTimer *_timerForLoadingIndicator;

    //attached callback info
    //
    NSMutableDictionary *_attachedCallbackInfos;

    NSString *_metaSessionID;
    NSString *_sessionID;
}

@property (nonatomic, assign) id<BoCPressPage> lastPage;
@property (nonatomic, retain) NSString *pageTitle;

- (void)wantToShowLoadingIndicatorWithMessage: (NSString *)message 
                                  onsuperView: (BOOL)flag;

- (void)stopTimerOfLoadingIndicator: (NSTimer*)timer;

- (void)wantToFinishDataUpdate;

@end
