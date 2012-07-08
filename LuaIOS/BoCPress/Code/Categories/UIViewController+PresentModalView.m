//
//  UIViewController+PresentModalView.m
//  BoCPress
//
//  Created by E-Reach Administrator on 4/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIViewController+PresentModalView.h"

@implementation UIViewController (PresentModalView)

- (void)presentModalView: (UIView *)modalView 
                animated: (BOOL)animated
{
    [self presentView: modalView
             animated: animated
           completion: nil];
}

- (void)presentView: (UIView *)viewToPresent
           animated: (BOOL)flag
         completion: (void (^)(void))completion
{
    UIView *selfView = [self view];
    [viewToPresent retain];
    [viewToPresent setAlpha: 0];
    [viewToPresent setFrame: [selfView bounds]];

    CGFloat animationDuration = 0.3;
    if (!flag)
    {
        animationDuration = 0;
    }

    [selfView addSubview: viewToPresent];
    [selfView bringSubviewToFront: viewToPresent];
    
    [UIView animateWithDuration: animationDuration
                     animations: (^{
                                    [viewToPresent setAlpha: 1];
                                 })
                     completion: (^(BOOL finished) {
                                    if (completion)
                                    {
                                        completion();
                                    }
                                 })
     ];
        
}

- (void)dismissModalView: (UIView *)modalView 
                animated: (BOOL)animated
{
    [self dismissView: modalView
             animated: animated
           completion: nil];
}

- (void)dismissView: (UIView *)modalView
           animated: (BOOL)flag
         completion: (void (^)(void))completion
{
    if ([[[self view] subviews] indexOfObject: modalView] != NSNotFound)
    {
        CGFloat animationDuration = 0.3;
        if (!flag)
        {
            animationDuration = 0;
        }
        [UIView animateWithDuration: animationDuration
                         animations: (^{

                                        [modalView setAlpha: 0];
                                     })
                         completion: (^(BOOL finished) {
                                        [modalView removeFromSuperview];
                                        if (completion)
                                        {
                                            completion();
                                        }
                                     })
         ];
    }
}

@end
