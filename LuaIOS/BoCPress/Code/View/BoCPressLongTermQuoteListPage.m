//
//  BoCPressLongTermQuoteListPage.m
//  BoCPress
//
//  Created by LeixSnake on 8/2/11.
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

#import "BoCPressLongTermQuoteListPage.h"

#import "BoCPressPage.h"

#import "BoCPressConstant.h"

#import "BoCPressQuoteListDataSource.h"

#import "BoCPressSecurityFamily.h"

#import "BoCPressLongTermQuoteListPagePrivateHandler.h"

#import "UIGalleryView.h"

#import "BoCPressLongTermSecurity.h"

@implementation BoCPressLongTermQuoteListPage

- (id)initWithLastPage: (id<BoCPressPage>)lastPage
     forSecurityFamily: (id<BoCPressSecurityFamily>)family
        fromDataSource: (id<BoCPressQuoteListDataSource>)dataSource
{
    if ((self = [super init]))
    {
        [self setLastPage: lastPage];
        _family = family;
        _dataSource = [dataSource retain];
        
        _securities = [[NSMutableArray alloc] init];
        
        static const float headerHeight = 34;

        static const float cellWidth = 106;

        _shadowViewOfHeader = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressContentShadow"]];
        [_shadowViewOfHeader setFrame: CGRectMake(0, 0, 320, 35)];

        [self addSubview: _shadowViewOfHeader];
        
        _securityNameLabel = [[UILabel alloc] init] ;        
        [_securityNameLabel setBackgroundColor:[UIColor colorWithRed:102.0 / 255 
                                                      green:102.0 / 255
                                                       blue:102.0 / 255
                                                      alpha:1.0]];        
        [_securityNameLabel setFrame:CGRectMake(0, 0, 90, headerHeight)];
        [_securityNameLabel setText:@"品种"];
        [_securityNameLabel setFont: [UIFont fontWithName: @"Helvetica" size: 15]];
        
        [_securityNameLabel setTextColor:[UIColor whiteColor]];
        [_securityNameLabel setTextAlignment:UITextAlignmentCenter];
        
        [self addSubview:_securityNameLabel];
        
        CGRect frame = [_securityNameLabel frame];
        
        _backgroundHeaderView = [[UIView alloc] init];
        [_backgroundHeaderView setFrame:CGRectMake(frame.origin.x + frame.size.width, frame.origin.y, 320, frame.size.height)];
        
        [_backgroundHeaderView setBackgroundColor:[UIColor colorWithRed:102.0 / 255 
                                                                  green:102.0 / 255
                                                                   blue:102.0 / 255
                                                                  alpha:1.0]];
        [self addSubview:_backgroundHeaderView];

        _backgroundView = [[UIImageView alloc] init];
        [_backgroundView setImage: [UIImage imageNamed: @"BoCPressLongTermQuoteListPageBackground"]];
        [_backgroundView setBackgroundColor: [UIColor colorWithRed: 240.0 / 255
                                                             green: 240.0 / 255
                                                              blue: 240.0 / 255
                                                             alpha: 1.0]];        
        [_backgroundView setAlpha: 0];
        [self addSubview:_backgroundView];
        
        
        _familiesView = [[UIImageView alloc] init];
        [_familiesView setImage:  [UIImage imageNamed: @"BoCPressLongQuoteSecurityBackground"]];
        [_familiesView setHidden: YES];
        [_familiesView setClipsToBounds: YES];
        [self addSubview:_familiesView];
        
                
        _timeHeaderView = [[UIGalleryView alloc] init];
        [_timeHeaderView setGalleryViewStyle:UIGalleryViewStyleHorizontal];
        [_timeHeaderView setFrame:CGRectMake(frame.origin.x + frame.size.width,  frame.origin.y, 320 - frame.size.width, frame.size.height)];

        NSArray *timeStringArray = [NSArray arrayWithObjects:@"一周", @"一月", @"三月", @"六月",@"九月", @"一年", nil];
        
        for (int iLooper = 0; iLooper < [timeStringArray count]; ++iLooper)
        {
            NSString *timeStringLooper = [timeStringArray objectAtIndex:iLooper];
            
            UILabel *timeLabel = [[UILabel alloc] init];
            
            [timeLabel setBackgroundColor:[UIColor colorWithRed:102.0 / 255 
                                                          green:102.0 / 255
                                                           blue:102.0 / 255
                                                          alpha:1.0]];
            [timeLabel setTextColor:[UIColor whiteColor]];
            [timeLabel setFont: [UIFont fontWithName: @"Helvetica" size: 15]];
            
            [timeLabel setTextAlignment:UITextAlignmentCenter];
            
            [timeLabel setText:timeStringLooper];
            
            [timeLabel setFrame:CGRectMake(iLooper * cellWidth, 0, cellWidth, headerHeight)];
            
            [_timeHeaderView addSubview:timeLabel];
            [timeLabel release];
            
        }
        
        [_timeHeaderView setShowsHorizontalScrollIndicator:NO];
        [_timeHeaderView setShowsVerticalScrollIndicator:NO];
        [self addSubview:_timeHeaderView];
        
        _galleryView = [[UIGalleryView alloc] init];
         frame = [_securityNameLabel frame];
        [_galleryView setFrame:CGRectMake(frame.origin.x + frame.size.width, frame.origin.y + headerHeight, 320 - frame.size.width, 400)];
        [_galleryView setGalleryViewStyle:UIGalleryViewStyleHorizontal];
        [_galleryView setShowsVerticalScrollIndicator:NO];
        [_galleryView setShowsHorizontalScrollIndicator:YES];
        [_galleryView bringIndicatorToFront];
        [_galleryView setClipsToBounds: YES];
        
        
        [self addSubview: _galleryView];
        
        _handler = [[BoCPressLongTermQuoteListPagePrivateHandler alloc] initWithListPage: self
                                                                                 rowView: nil 
                                                                              columnView: _timeHeaderView 
                                                                             galleryView: _galleryView 
                                                                            ofSecurities: _securities];
        
        [_galleryView setDelegate: (BoCPressLongTermQuoteListPagePrivateHandler *)_handler];
        [_galleryView setDataSource: (BoCPressLongTermQuoteListPagePrivateHandler *)_handler];
        
        [_timeHeaderView setTargetView:_galleryView];
        [_timeHeaderView setGalleryViewContentOffsetLinkageDirection:UIGalleryViewContentOffsetLinkageX];
        
        [_timeHeaderView setContentSize:CGSizeMake(90 * 7, 34)];
        
        [_galleryView setTargetView:_timeHeaderView];
        [_galleryView setGalleryViewContentOffsetLinkageDirection:UIGalleryViewContentOffsetLinkageX];
        
        _updateTimeLabel = [[UILabel alloc] init];
        [_updateTimeLabel setBackgroundColor: [UIColor colorWithRed: 51.0 / 255
                                                              green: 51.0 / 255
                                                               blue: 51.0 / 255
                                                              alpha: 1]];
        [_updateTimeLabel setFont: [UIFont fontWithName: @"Helvetica" size: 12]];
        [_updateTimeLabel setTextAlignment: UITextAlignmentCenter];
        [_updateTimeLabel setTextColor: [UIColor whiteColor]];
        [_updateTimeLabel setText:[NSString stringWithFormat:@"最后更新：%@", [_dataSource lastUpdateSecuritiesTime]]];
        
        [self addSubview: _updateTimeLabel];
        
        _footerShadowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BoCPressContentShadow"]];
        
        [self addSubview:_footerShadowView];
        
    }
    
    return self;
}

- (void)dealloc
{
    [_galleryView setTargetView:nil];

    [_galleryView setDelegate:nil];

    [_shadowViewOfHeader release];
    
    [_timeHeaderView setTargetView:nil];
    [_backgroundView release];
    
    [_handler release];
    
    [_securityNameLabel release];
    
    [_galleryView release];
    [_familiesView release];
    [_timeHeaderView release];
    
    
    [_updateTimeLabel release];
    
    [_securities release];
    [_dataSource release];
    [_footerShadowView release];
    
    [super dealloc];
}

#pragma mark - page parameters

- (NSString *)pageTitle
{
    return [_family name];
}

- (BOOL)needNavigationBar
{
    return YES;
}

- (BOOL)couldShowTimeOutAlertWithInfo:(NSDictionary *)info
{
    return YES;
}

- (void)wantToForceRefreshCurrentContentWithInfo:(id)animationInfo
{
    [_handler activeAllCallback];
    [self didUpdateData];
    [self wantToUpdateDataWithInfo:animationInfo];
}

#pragma mark - Data updating


- (void)wantToUpdateDataWithInfo:(id)info
{
    [_familiesView setHidden:YES];
    [_galleryView setHidden:YES];
    [_backgroundView setHidden: YES];
    [_dataSource listOrderedLongTermSecurityInFamily: _family 
                                        withCallback: _handler];
    
}

- (void)updateData: (NSArray *)securities
{
    if ([securities count] > 0)
    {
        static const float cellHeight = 34;
        static const float securityNameWidth = 90;
        [_galleryView setHidden:NO];
        [_familiesView setHidden:NO];
        [_backgroundView setHidden: NO];

        [_backgroundView setAlpha: 1];
        
        [_securities removeAllObjects];
        
        [_securities addObjectsFromArray: securities];
        
        for (UIView *subViewLooper in [_familiesView subviews])
        {
            [subViewLooper removeFromSuperview];
        }
        
        for ( int  securityIndexLooper=0; securityIndexLooper < [securities count]; ++securityIndexLooper)
        {
            BoCPressLongTermSecurity *securityLooper = [securities objectAtIndex:securityIndexLooper];
            
            UILabel *securityLabel = [[UILabel alloc] init];
            [securityLabel setFrame: CGRectMake(0, cellHeight * securityIndexLooper , securityNameWidth, cellHeight)];
            [securityLabel setText:[securityLooper name]];
            [securityLabel setBackgroundColor: [UIColor clearColor]];
            [securityLabel setFont: [UIFont fontWithName: @"Helvetica" size: 15]];
            [securityLabel setTextAlignment:UITextAlignmentCenter];
            
            [_familiesView addSubview: securityLabel];
            [securityLabel release];

        }
        
        CGRect galleryViewFrame = [_galleryView frame];
        galleryViewFrame.size.height = cellHeight * [_securities count] + 5;
        [_galleryView setFrame:galleryViewFrame];
        
        [_galleryView reloadData];
        
    }else
    {
        [_galleryView setHidden:YES];
        [_familiesView setHidden:YES];
        [_backgroundView setHidden: YES];

    }
    
    [_updateTimeLabel setText: [NSString stringWithFormat:@"最后更新：%@", [_dataSource lastUpdateSecuritiesTime]]];
    
    [self didUpdateData];
    
}


- (void)didUpdateData
{
    if ([_securities count] > 0)
    {
        [_galleryView setHidden: NO];
        [_familiesView setHidden: NO];
        [_backgroundView setHidden: NO];

    }else
    {
        [_galleryView setHidden:YES];
        [_familiesView setHidden:YES];
        [_backgroundView setHidden: YES];

    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kBoCPress_View_didUpdateDataOfCurrentPage
                                                        object: self
                                                      userInfo: nil];
    
}

- (void)linkageOfContentOffset:(CGPoint)contentOffset
{    
    CGRect footerShadowFrame = [_footerShadowView frame];
    
    if (contentOffset.y > 0)
    {
        footerShadowFrame.origin.y -= contentOffset.y;
        
    }else
    {
        footerShadowFrame.origin.y -=  contentOffset.y;
        
    }
    
    [_footerShadowView setFrame:footerShadowFrame];
}

- (void)layoutSubviews
{
    
    CGRect bounds = [self bounds];
        
    [_updateTimeLabel setFrame: CGRectMake(bounds.origin.x, bounds.origin.y + bounds.size.height - 20, 
                                           bounds.size.width, 20)];
            
    CGRect frame = [_backgroundHeaderView frame];
    
    [_backgroundView setFrame: CGRectMake(frame.origin.x, frame.origin.y + frame.size.height, 320, 306)];
    
    frame = [_backgroundView frame];
     frame.size.width = 91;
     frame.origin.x = bounds.origin.x;
    frame.size.height = 307.3;
    [_familiesView setFrame: frame];
    [_footerShadowView setFrame:CGRectMake(0, [_familiesView frame].origin.y + [_familiesView frame].size.height, 320, 15)];

}

- (id)familyIdentity
{
    return    [_family identity];
}

- (void)didBeenBackwardToWithInfo: (NSDictionary *)info
{
    [_handler activeAllCallback];
}

- (void)willSwitchToOtherTab
{
    [_handler cancelAllCallback];
}

- (void)didBeenSwitchToFromOtherTabCompletion: (void (^)(void))block
{    
    [_handler activeAllCallback];
}


- (void)willUpdateCurrentContent
{
    ;
}

- (void)clearCurrentPageAfterNetworkTimeOutWithInfo:(NSDictionary *)info
{

    [_familiesView setHidden:YES];
    [_galleryView setHidden:YES];
    [_backgroundView setHidden: YES];

    [super clearCurrentPageAfterNetworkTimeOutWithInfo: info];
}

- (void)attachCallbackInfo: (NSDictionary *)callbackInfo
                   forType: (NSString *)type
{
    
}
@end
