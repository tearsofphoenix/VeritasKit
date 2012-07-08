//
//  BoCPressBuyProductTabCell.m
//  BoCPress
//
//  Created by E-Reach Administrator on 11/11/11.
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

#import "BoCPressBuyProductTabCell.h"

@implementation BoCPressBuyProductTabCell

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    
    if (selected)
    {        
        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BoCPressBuyProductPageTabCellSelectedBackground"]]];
    }else
    {
        [self setBackgroundColor:[UIColor clearColor]];
    }

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    if (selected)
    {        
        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BoCPressBuyProductPageTabCellSelectedBackground"]]];
    }else
    {
        [self setBackgroundColor:[UIColor clearColor]];
    }

}

@end
