//
//  BoCPressUserFeedBackPage.h
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

#import <UIKit/UIKit.h>

#import "BoCPressMetaPage.h"

@protocol BoCPressUserFeedBackDataSource;

@interface BoCPressUserFeedBackPage : BoCPressMetaPage<UITextViewDelegate, UIAlertViewDelegate>
{
    
    NSString *_userFeedBackContent;
    
    UITextView *_userInputTextView;
    
    
    id<BoCPressUserFeedBackDataSource> _dataSource;
    
    UIView* _backgroundView;
    
    UIAlertView * _alertForSaveUserFeedbackView;
    
    UIAlertView *_alertForNilSubmit;
    
    UIAlertView *_alertViewForSubmitResult;
    
    BOOL _submitSuccessfully;
    
    UIButton *_submitButton;
    
}

- (id)initWithLastPage:(id<BoCPressPage>)lastPage
         andDataSource: (id<BoCPressUserFeedBackDataSource>) dataSource;

- (void) submitUserFeedback: (id)sender;

- (void)updateFeedbackResultWithData: (id)data;

@end