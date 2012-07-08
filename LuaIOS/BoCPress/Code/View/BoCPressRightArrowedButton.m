//
//  BoCPressRightArrowedButton.m
//  BoCPress
//
//  Created by LeixSnake on 10/26/11.
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

#import "BoCPressRightArrowedButton.h"

@implementation BoCPressRightArrowedButton
static void BoCPressRightArrowedButton_initRightArrow(UIImageView **_rightArrowView, 
                                                            BoCPressRightArrowedButton *self)
{
    *_rightArrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BoCPressVIPPageRightArrow"]];
    
    [*_rightArrowView setFrame:CGRectMake(300 - 30, 2, 20, 28)];
    [self addSubview:*_rightArrowView];
}


- (id)init
{
    if ((self = [super init]))
    {
        BoCPressRightArrowedButton_initRightArrow(&_rightArrowedImageView, self);
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        BoCPressRightArrowedButton_initRightArrow(&_rightArrowedImageView, self);
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        BoCPressRightArrowedButton_initRightArrow(&_rightArrowedImageView, self);
    }
    return self;
}

- (void)dealloc
{
    [_rightArrowedImageView release];
    
    [super dealloc];
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
     
    [_rightArrowedImageView setAlpha:1.0];
}
@end
