//
//  BoCPressMediaHomePageCellPrivateHandler.m
//  BoCPress
//
//  Created by E-Reach Administrator on 7/7/11.
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

#import "BoCPressMediaHomePageCellPrivateHandler.h"

#import "BoCPressMediaHomePageCell.h"

#import "BoCPressCallback.h"

#import "BoCPressConstant.h"


@implementation BoCPressMediaHomePageCellPrivateHandler

- (id)initWithCell:(BoCPressMediaHomePageCell *)cell
{
    self = [super init];
    if (self) 
    {
        _cell = cell;
    }
    return self;
}

#pragma mark - BoCPressCallback

- (void)callbackForAction:(id)action withData:(id)data
{
    if (_callbackFlag)
    {
        if ([kBoCPress_View_updateThumbnailImage isEqual: action])
        {
            [_cell updateThumbnailImage:data];
        }
    }
}

@end
