//
//  BoCPressUpdateArrowTableView.h
//  BoCPress
//
//  Created by LeixSnake on 8/5/11.
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

@protocol BoCPressShowUpdateTimePage;

@interface BoCPressUpdateArrowTableView : UITableView
{
    id<BoCPressShowUpdateTimePage> _superPage;
    
    UIView *_headerView;
    UIImageView* _headerImageView;
    UIImageView* _refreshArrowImageView;
    
    UILabel *_headerLabel;
    
    BOOL _hasAnimatedRefreshArrow;
}

- (id)initWithSuperPage: (id<BoCPressShowUpdateTimePage>) superPage;

- (void)setSuperPage: (id<BoCPressShowUpdateTimePage>)superPage;

@end


@protocol BoCPressShowUpdateTimePage <NSObject>

@required 

- (NSTimeInterval) lastUpdateTimeInterval;

@end

