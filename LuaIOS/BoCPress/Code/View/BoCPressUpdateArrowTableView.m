//
//  UIUpdateArrowTableView.m
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

#import "BoCPressUpdateArrowTableView.h"

#import "BoCPressDataSource.h"

#import "BoCPressConstant.h"

#import "BoCPressUpdateArrowTableView.h"

@implementation BoCPressUpdateArrowTableView

- (id)initWithSuperPage: (id<BoCPressShowUpdateTimePage>) superPage
{
    self = [super init];

    if (self)
    {
        _superPage = superPage;
        
        _headerView = [[UIView alloc] init];
        
        UIView *headerBackground = [[[UIView alloc] initWithFrame: CGRectMake(0, -480, 320, 480)] autorelease];
        [headerBackground setBackgroundColor: [UIColor whiteColor]];
        [_headerView addSubview: headerBackground];
        
        
        _headerImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressTableRefresh"]];
        [_headerImageView setFrame: CGRectMake(0, -41, 320, 41)];
        
        _refreshArrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BoCPressRefreshArrow"]];
        [_refreshArrowImageView setFrame:CGRectMake(86, 5, 29, 30)];
        [_headerImageView addSubview:_refreshArrowImageView];
        
        [_headerView addSubview: _headerImageView];
        
        _headerLabel = [[UILabel alloc] initWithFrame: CGRectMake(115, -35, 150, 33)];
        [_headerLabel setNumberOfLines: 2];
        
        
        
        [_headerLabel setText:[NSString stringWithFormat:kBoCPress_View_HeaderUpdateTimeLabelFormatterString,
                               0]];
        
        
        [_headerLabel setFont: [UIFont fontWithName: @"Helvetica" size:12]];
        [_headerView addSubview: _headerLabel];
        
        [self setTableHeaderView: _headerView];
        
        UIView *footerView = [[[UIView alloc] init] autorelease];
        [footerView addSubview: [[[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressContentShadow"]] autorelease]];
        
        [self setTableFooterView: footerView];
        
        _hasAnimatedRefreshArrow = NO;
    }
    
    return self;
}

- (void)dealloc
{
    [_headerView release];
    [_headerLabel release];
    [_headerImageView release];
    
    [super dealloc];
}

- (void)recoverRefreshView
{
        
    [_refreshArrowImageView setTransform:CGAffineTransformMakeRotation(M_PI - 0.01)];
    
    [UIView animateWithDuration: kBoCPress_View_RefreshArrowAnimationTimeInterval
                     animations: (^{
                                    [_refreshArrowImageView setTransform:CGAffineTransformMakeRotation(0)];
                                })
    ];
    
}
- (void) changeRefreshViewWithAngle: (CGFloat) angle
{
    [_refreshArrowImageView setTransform:CGAffineTransformMakeRotation(0.01)];
    
    [UIView animateWithDuration: kBoCPress_View_RefreshArrowAnimationTimeInterval
                     animations: (^{
                                    [_refreshArrowImageView setTransform:CGAffineTransformMakeRotation(angle)];
                                })
     ];    
}
- (void)updateRefreshTimeLabel
{
    NSTimeInterval lastUpdateMinutesTimeInterval = [_superPage lastUpdateTimeInterval];
    
    NSUInteger updateTimeWithMinutes = lastUpdateMinutesTimeInterval / 60;
    
    if (updateTimeWithMinutes > kBoCPress_Global_MinutesPerHour)
    {
        [_headerLabel setText: kBoCPress_View_HeaderUpdateTimeLabelUpdateTimeMoreThanAnHourString]; 
    }else
    {
        
        [_headerLabel setText: [NSString stringWithFormat:kBoCPress_View_HeaderUpdateTimeLabelFormatterString,
                                updateTimeWithMinutes]];
    }
}
- (void)setContentOffset: (CGPoint) contentOffset
{
    [super setContentOffset: contentOffset];
    
    CGFloat contentViewOffsetY = [self contentOffset].y;
    
    if (- contentViewOffsetY > [_headerImageView frame].size.height - [_refreshArrowImageView frame].origin.y)
    {
        if (_hasAnimatedRefreshArrow)
        {
            ;
        }else
        {
            [self changeRefreshViewWithAngle:-M_PI];
            _hasAnimatedRefreshArrow = YES;
        }
        
    }
    
    if (contentViewOffsetY < 0 && -contentViewOffsetY < [_headerImageView frame].size.height - [_refreshArrowImageView frame].origin.y)
    {
        if (_hasAnimatedRefreshArrow) 
        {
            [self recoverRefreshView];
            _hasAnimatedRefreshArrow = NO;
            
        }else
        {
            ;
        }
    }
    
    if (fabs([self contentOffset].y) > 5)
    {
        [self updateRefreshTimeLabel];
    }
}

- (void)setSuperPage:(id<BoCPressShowUpdateTimePage>)superPage
{
    _superPage = superPage;
}


@end
