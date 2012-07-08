//
//  BoCPressQuoteContentChartLoadingindicator.m
//  BoCPress
//
//  Created by E-Reach Administrator on 11/30/11.
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

#import "BoCPressQuoteContentChartLoadingindicator.h"

@implementation BoCPressQuoteContentChartLoadingindicator

- (id)init
{
    if ((self = [super init]))
    {
        _count = 0;

        UIImage *backgroundImage = [UIImage imageNamed:@"BoCPressQuoteContentLoadingIndicator3Points"];
        _backgroundView = [[UIImageView alloc] initWithImage:backgroundImage];

        [self setAutoresizesSubviews:NO];
        
        [_backgroundView setAutoresizesSubviews:NO];
        [_backgroundView setAutoresizingMask:UIViewAutoresizingNone];
        
        [self addSubview:_backgroundView];

        
        CGSize size = [backgroundImage size];
        [self setFrame:CGRectMake(0, 0, size.width, size.height)];

        
        [NSTimer scheduledTimerWithTimeInterval:0.5
                                         target:self
                                       selector:@selector(showIndicatorByTimer:)
                                       userInfo:nil
                                        repeats:YES];
    }
    
    return self;
}

- (void)dealloc
{
    [_backgroundView release];
    [super dealloc];
}

- (void)showIndicatorByTimer:(NSTimer *)timer
{

    _count %= 3;
    
    [UIView animateWithDuration: 0.4
                     animations: (^{        
                            UIImage *backgroundImage = [UIImage imageNamed:[NSString stringWithFormat:@"BoCPressQuoteContentLoadingIndicator%dPoints", _count + 1]];
                            [_backgroundView setImage:backgroundImage];    
    })
     ];
    ++_count;
}

@end
