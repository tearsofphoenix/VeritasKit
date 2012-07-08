//
//  BoCPressMoreCell.m
//  BoCPress
//
//  Created by LeixSnake on 7/22/11.
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

#import "BoCPressMoreCell.h"

@implementation BoCPressMoreCell

- (id)init
{
    if ((self = [super init]))
    {
        UIImageView *backgroudView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BoCPressMoreCell"]];
        [self setBackgroundView:backgroudView];
        [backgroudView release];

        [[self textLabel] setText:@"更多..."];
        [[self textLabel] setTextAlignment:UITextAlignmentCenter];

    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted
{
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
}

@end
