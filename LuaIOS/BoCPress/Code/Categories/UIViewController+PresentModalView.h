//
//  UIViewController+PresentModalView.h
//  BoCPress
//
//  Created by E-Reach Administrator on 4/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



@interface UIViewController (PresentModalView)

- (void)presentModalView: (UIView *)modalView 
                animated: (BOOL)animated;

- (void)presentView: (UIView *)viewToPresent
           animated: (BOOL)flag
         completion: (void (^)(void))completion;

- (void)dismissModalView: (UIView *)modalView 
                animated: (BOOL)animated;

- (void)dismissView: (UIView *)modalView
           animated: (BOOL)flag
         completion: (void (^)(void))completion;

@end
