#import "BoCPressQuoteListPage.h"

#import "BoCPressSecurityFamily.h"

#import "UIView+LoadingIndicatorView.h"

#import "BoCPressQuoteListPagePrivateHandler.h"

#import "BoCPressQuoteListDataSource.h"

#import "BoCPressQuoteConstants.h"

#import "BoCPressViewConstants.h"

#import "BoCPressNotificationDefines.h"

#import "BoCPressConstant.h"

@implementation BoCPressQuoteListPage

- (id)initWithLastPage: (id<BoCPressPage>)lastPage
     forSecurityFamily: (id<BoCPressSecurityFamily>)family
            securities: (NSArray *)securities
        fromDataSource: (id<BoCPressQuoteListDataSource>)dataSource
{
    
    self = [super init];
    if (self)
    {
        [self setLastPage:  lastPage];
        _family = family;
        _dataSource = [dataSource retain];
        
        _securities = [[NSMutableArray alloc] initWithArray: securities];
        
        _handler = [[BoCPressQuoteListPagePrivateHandler alloc] initWithListPage: self
                                                                    ofSecurities: _securities];
        
        _contentView = [[UITableView alloc] init];
        [_contentView setBackgroundColor: [UIColor clearColor]];
        [_contentView setSeparatorStyle: UITableViewCellSeparatorStyleNone];
        [_contentView setDelegate: (BoCPressQuoteListPagePrivateHandler*)_handler];
        [_contentView setDataSource: (BoCPressQuoteListPagePrivateHandler*)_handler];
        //        
        //        
        UIView* _headerView = [[[UIView alloc] init] autorelease];
        
        UIView *headerBackground = [[[UIView alloc] initWithFrame: CGRectMake(0, -480, 320, 480)] autorelease];
        [headerBackground setBackgroundColor: [UIColor whiteColor]];
        [_headerView addSubview: headerBackground];
        
        [_contentView setTableHeaderView: _headerView];
        
        UIView *footerView = [[[UIView alloc] init] autorelease];
        [footerView addSubview: [[[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressContentShadow"]] autorelease]];
        
        [_contentView setTableFooterView: footerView];
        
        [self addSubview: _contentView];
        
        _columnBackgroundView = [[UIView alloc] init];
        [_columnBackgroundView setBackgroundColor:[UIColor colorWithRed:102.0 / 255 
                                                                  green:102.0 / 255
                                                                   blue:102.0 / 255
                                                                  alpha:1.0]];
        [_columnBackgroundView addSubview:[[[UIImageView alloc] initWithImage: [UIImage imageNamed:@"BoCPressContentShadow"]] autorelease]];
        
        
        [self addSubview: _columnBackgroundView];
        
        
        _columnNameLabel = [[UILabel alloc] init] ;
        [_columnNameLabel setBackgroundColor: [UIColor clearColor]];
        [_columnNameLabel setTextColor: [UIColor whiteColor]];
        [_columnNameLabel setText: @"品种"];
        [_columnNameLabel setTextAlignment: UITextAlignmentCenter];
        [_columnNameLabel setFont: [UIFont fontWithName: @"Helvetica" size: 15]];
        [_columnNameLabel setFrame: CGRectMake(8, 6, 93, 22)];
        
        [self addSubview: _columnNameLabel];
        
        _latestValueLabel = [[UILabel alloc] init] ;
        [_latestValueLabel setBackgroundColor: [UIColor clearColor]];
        [_latestValueLabel setTextColor: [UIColor whiteColor]];
        if ([[_family identity] isEqualToString:kString_Global_ExchangeRateViewIdentity])
        {
            [_latestValueLabel setText: @"现汇买入价"];
        }else{
            [_latestValueLabel setText: @"最新"];
        }
        [_latestValueLabel setTextAlignment: UITextAlignmentCenter];
        [_latestValueLabel setFont: [UIFont fontWithName: @"Helvetica" size: 15]];
        [_latestValueLabel setFrame: CGRectMake(114, 6, 93, 22)];
        
        [self addSubview: _latestValueLabel];
        
        CGRect frame = [_latestValueLabel frame];
        
        _changedRateLabel = [[UILabel alloc] init] ;
        [_changedRateLabel setBackgroundColor: [UIColor clearColor]];
        [_changedRateLabel setTextColor: [UIColor whiteColor]];
        
        if ([[_family identity] isEqualToString:kString_Global_ExchangeRateViewIdentity])
            
        {
            [_changedRateLabel setText: @"卖出价"];
        }else
        {
            [_changedRateLabel setText: @"涨跌幅"];
        }
        [_changedRateLabel setTextAlignment: UITextAlignmentCenter];
        [_changedRateLabel setFont: [UIFont fontWithName: @"Helvetica" size: 15]];
        [_changedRateLabel setFrame: CGRectMake(frame.origin.x + frame.size.width, 6, 93, 22)];
        
        [self addSubview: _changedRateLabel];
        
        _timeLabel = [[UILabel alloc] init];
        [_timeLabel setBackgroundColor: [UIColor colorWithRed: 51.0 / 255
                                                        green: 51.0 / 255
                                                         blue: 51.0 / 255
                                                        alpha: 1]];
        [_timeLabel setFont: [UIFont fontWithName: @"Helvetica" size: 12]];
        [_timeLabel setTextAlignment: UITextAlignmentCenter];
        [_timeLabel setTextColor: [UIColor whiteColor]];

        [_timeLabel setText:[NSString stringWithFormat:@"最后更新：%@", [_dataSource lastUpdateSecuritiesTime]]];

        [self addSubview: _timeLabel];
        
        _timer = [[NSTimer scheduledTimerWithTimeInterval: kConstant_QuoteListPage_UpdateTimeInterval 
                                                   target: _handler 
                                                 selector: @selector(wantToUpdateDataRaisedByTimer:) 
                                                 userInfo: nil
                                                  repeats: YES] retain];
        _animationInfo = nil;
    }
    
    return self;
}

- (void)dealloc
{
    
    [_dataSource release];
    
    [_securities release];
    [_handler release];
    [_contentView release];
    
    [_columnBackgroundView release];
    
    [_columnNameLabel release];
    [_latestValueLabel release];
    [_changedRateLabel release];
    [_timeLabel release];
    
    [_timer invalidate];
    [_timer release];
        
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
    NSDictionary *callbackObject = [info objectForKey: kNetwork_CallbackObject];
    NSString *triggerFlag = [callbackObject objectForKey: kString_QuoteContentPage_TriggerFlag];
    if ([triggerFlag isEqualToString: kString_Global_UpdateTriggerFlagByUser])
    {
        return YES;
    }
    return NO;
}

- (void)willBrowseBackward
{    
    [_timer invalidate];
    [_timer release];
    _timer = nil;
    
    [super willBrowseBackward];
}

- (void)wantToForceRefreshCurrentContentWithInfo:(id)animationInfo
{
    [self setUserInteractionEnabled: YES];

    [_animationInfo release];
    _animationInfo = [animationInfo retain];
    
    [self didUpdateData];
    
    [self showContentView];
    
    [self wantToUpdateDataWithInfo: nil];
}



#pragma mark - Data updating

- (void)hideContentView
{
    CGRect frame = [_contentView frame];
    if (_hasSetOriginFrame)
    {
        ;
    }else
    {
        _originFrameOfContentView = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
        _hasSetOriginFrame = YES;
    }
    frame.origin.y = - frame.size.height;
    [_contentView setFrame:frame];
}

- (void)showContentView
{
    [UIView animateWithDuration: 0.5
                     animations: (^{
                                    [_contentView setFrame:_originFrameOfContentView];
                                })
    ];
}

- (void)wantToUpdateDataWithInfoByTimer
{
    if ([_securities count] == 0)
    {        
        [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                        onsuperView: NO];
    }

    if ([[_animationInfo objectForKey:kBoCPress_Global_AnimationType] isEqual:kBoCPress_View_AnimationTypeTopToBottom])
    {
        [self hideContentView];
    }
    
    [_dataSource listOrderedSecurityInFamilyByTimer: _family 
                                       withCallback: _handler];
}

- (void)didBeenSlideToWithInfo:(NSDictionary *)info
{
    
}

- (void)wantToUpdateDataWithInfo:(id)info
{
    NSLog(@"in func:%s line:%d", __func__, __LINE__);
    
    if (_animationInfo != info)
    {
        [_animationInfo release];
        _animationInfo = [info retain];
    }
    
    if ([_securities count] == 0)
    {
        
        [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                onsuperView: NO];
    }

    if ([[_animationInfo objectForKey:kBoCPress_Global_AnimationType] isEqual:kBoCPress_View_AnimationTypeTopToBottom])
    {
        [self hideContentView];
    }
    
    [_dataSource listOrderedSecurityInFamily: _family 
                                withCallback: _handler];
}

- (void)updateData: (NSArray *)securities
{
    if (securities)
    {
        
        [(BoCPressQuoteListPagePrivateHandler*)_handler storePreviousQuoteData:_securities];
        
        [_securities removeAllObjects];
        
        [_securities addObjectsFromArray: securities];
        
        [_contentView reloadData];
        
        
        
        [_timeLabel setText:[NSString stringWithFormat:@"最后更新：%@", [_dataSource lastUpdateSecuritiesTime]]];
    }
    
    [self wantToFinishDataUpdate];
    
    if ([_contentView frame].origin.y < 0)
    {
        [self showContentView];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didQuoteListPageFinishedUpdateData
                                                        object: self
                                                      userInfo: nil];
}

- (void)layoutSubviews
{
    
    CGRect bounds = [self bounds];
    
    [_columnBackgroundView setFrame: CGRectMake(bounds.origin.x, 
                                                bounds.origin.y,
                                                bounds.size.width, 
                                                35)];
    
    [_timeLabel setFrame: CGRectMake(bounds.origin.x, bounds.origin.y + bounds.size.height - 20, 
                                     bounds.size.width, 20)];
    
    [_contentView setFrame: CGRectMake(bounds.origin.x, 
                                     bounds.origin.y + 35, 
                                     bounds.size.width, 
                                     bounds.size.height - 55)];
    
}

- (id)familyIdentity
{
    return    [_family identity];
}

- (void)didBeenBackwardToWithInfo: (NSDictionary *)info
{
    [self setUserInteractionEnabled: YES];

    [_handler activeAllCallback];
    [[_contentView cellForRowAtIndexPath: [_contentView indexPathForSelectedRow]] setSelected: NO];
    [_contentView reloadData];

    [_timer invalidate];
    [_timer release];
    
    _timer = [[NSTimer scheduledTimerWithTimeInterval: kConstant_QuoteListPage_UpdateTimeInterval 
                                               target: _handler 
                                             selector: @selector(wantToUpdateDataRaisedByTimer:) 
                                             userInfo: nil
                                              repeats: YES] retain];
}

- (void)willSwitchToOtherTab
{
    [self setUserInteractionEnabled: YES];

    [_timer invalidate];
    [_timer release];
    _timer = nil;
    
    [_handler cancelAllCallback];
}

- (void)didBeenSwitchToFromOtherTabCompletion: (void (^)(void))block
{
    [self setUserInteractionEnabled: YES];

    [_timer invalidate];
    [_timer release];
    _timer = [[NSTimer scheduledTimerWithTimeInterval: kConstant_QuoteListPage_UpdateTimeInterval 
                                               target: _handler 
                                             selector: @selector(wantToUpdateDataRaisedByTimer:) 
                                             userInfo: nil
                                              repeats: YES] retain];
    
    [_handler activeAllCallback];
}

- (void)beforeRefetchConfiguration
{
    [_timer invalidate];
    [_timer release];
    _timer = nil;
}

- (void)clearCurrentPageAfterNetworkTimeOutWithInfo:(NSDictionary *)info
{
    [self setUserInteractionEnabled: YES];
    [_timer invalidate];
    [_timer release];
    _timer = nil;
    
    [self didUpdateData];
}

- (void)wantToShowQuoteContentOfSecurityAtIndex:(NSUInteger)index
{
    [_timer invalidate];
    [_timer release];
    _timer = nil;
    
    [self setUserInteractionEnabled: NO];
    [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault
                                    onsuperView: NO];
    
    id<BoCPressSecurity> security = [_securities objectAtIndex:index];
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                              security, kType_GLobal_SecurityObject,
                              _securities, kType_Global_NSArray,
                              [self familyIdentity], kString_Global_ExchangeRateViewIdentity,
                              nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_View_wantToShowQuoteContentPage 
                                                        object:self 
                                                      userInfo:userInfo];
    
    [userInfo release];
}

- (void)didCancelledHandleErrorOfServerWithData:(NSDictionary *)info
{
    [[_contentView cellForRowAtIndexPath: [_contentView indexPathForSelectedRow]] setSelected: NO];
    [_contentView reloadData];
    
    [_handler activeAllCallback];
    [_timer release];
    [_timer invalidate];    
    _timer = [[NSTimer scheduledTimerWithTimeInterval: kConstant_QuoteListPage_UpdateTimeInterval 
                                               target: _handler 
                                             selector: @selector(wantToUpdateDataRaisedByTimer:) 
                                             userInfo: nil
                                              repeats: YES] retain];
}

@end
