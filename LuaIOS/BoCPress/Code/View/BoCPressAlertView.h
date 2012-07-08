//
//  BoCPressAlertView.h
//  BoCPress
//
//  Created by E-Reach Administrator on 12/5/11.
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
@protocol BoCPressAlertViewDelegate<UIAlertViewDelegate>

@end

@interface BoCPressAlertView : NSObject<UIAlertViewDelegate>
{
@private
    BOOL _isWaitingForTap;
    UIAlertView * _alertView;
    NSInteger _clickedButtonIndex;
    
}

- (id)initWithTitle: (NSString *)title 
            message: (NSString *)message 
           delegate: (id)delegate 
  cancelButtonTitle: (NSString *)cancelButtonTitle 
  otherButtonTitles: (NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

@property (nonatomic, assign) id delegate;
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *message;   


- (NSInteger)addButtonWithTitle:(NSString *)title;   

- (NSString *)buttonTitleAtIndex:(NSInteger)buttonIndex;

@property(nonatomic,readonly) NSInteger numberOfButtons;
@property(nonatomic) NSInteger cancelButtonIndex;      


@property(nonatomic,readonly) NSInteger firstOtherButtonIndex;	
@property(nonatomic,readonly,getter=isVisible) BOOL visible;


- (NSInteger)show;

@property(nonatomic,assign) UIAlertViewStyle alertViewStyle;

- (UITextField *)textFieldAtIndex:(NSInteger)textFieldIndex;

@end
