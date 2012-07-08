#import "BoCPressQuoteHomePage.h"

#import "BoCPressQuoteHomeDataSource.h"

#import "BoCPressQuoteHomePagePrivateHandler.h"

#import "UIView+LoadingIndicatorView.h"

#import "BoCPressConstant.h"

#import "BoCPressSecurityFamily.h"

#import "BoCPressNotificationDefines.h"

#import "BoCPressViewConstants.h"

@implementation BoCPressQuoteHomePage

#pragma mark - Instance initialization

- (id)initWithDataSource: (id<BoCPressQuoteHomeDataSource>)quoteHomeDataSource
{
    
    self = [super init];
    if (self)
    {
        [self setPageTitle: @"报价"];
        
        _quoteHomeDataSource = [quoteHomeDataSource retain];
        
        _securityFamilies = [[NSMutableArray alloc] init];
        
        _handler = [[BoCPressQuoteHomePagePrivateHandler alloc] initWithHomePage: self
                                                              ofSecurityFamilies: _securityFamilies];
        
        _contentView = [[UITableView alloc] init];
        
        UIView *headerView = [[[UIView alloc] init] autorelease];
        
        UIView *headerBackground = [[[UIView alloc] initWithFrame: CGRectMake(0, -480, 320, 480)] autorelease];
        [headerBackground setBackgroundColor: [UIColor whiteColor]];
        [headerView addSubview: headerBackground];
        
        
        [_contentView setTableHeaderView: headerView];
        
        UIView *footerView = [[[UIView alloc] init] autorelease];
        [footerView addSubview: [[[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressContentShadow"]] autorelease]];
        
        [_contentView setTableFooterView: footerView];
        
        [_contentView setSeparatorStyle: UITableViewCellSeparatorStyleNone];
        [_contentView setBackgroundColor: [UIColor clearColor]];
        [_contentView setDelegate: (BoCPressQuoteHomePagePrivateHandler *)_handler];
        [_contentView setDataSource: (BoCPressQuoteHomePagePrivateHandler *)_handler];
        [self addSubview: _contentView];
        
        _animationInfo = nil;

        _userInfo = nil;
    }
    
    return self;
}

#pragma mark - Memory management

- (void)dealloc
{

    [_handler release];
    [_securityFamilies release];
    [_quoteHomeDataSource release];
    [_animationInfo release];
    [_contentView release];
    
    [super dealloc];
}

#pragma mark - Page parameters

- (BOOL)needNavigationBar
{
    return YES;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [_contentView setFrame: [self bounds]];
}

#pragma mark - Data updating


- (void)wantToUpdateDataWithInfo:(id)animationInfo
{
    [_animationInfo release];
    _animationInfo = [animationInfo retain];
    
    [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault
                                    onsuperView: NO];

    [_quoteHomeDataSource listOrderedSecurityFamiliesWithCallback: _handler];
    
}
- (void)playInitializationAnimation
{
    
    CGRect frame = [self frame];
    
    CGFloat origin_Y = frame.origin.y;
    
    frame.origin.y = -frame.size.height;
    
    //hide the tableView first
    //
    [self setFrame:frame];
    
    
    //show the tabView
    //
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    frame.origin.y = origin_Y;
    [self setFrame:frame];
    [UIView commitAnimations];
}
- (void)updateSecurityFamilies: (NSArray *)securityFamilies
{
    if (securityFamilies)
    {
        
        [_securityFamilies removeAllObjects];
        
        for (id<BoCPressSecurityFamily> securityFamily in securityFamilies)
        {
            [_securityFamilies addObject: securityFamily];
        }
        
        [_contentView reloadData];
        [self wantToFinishDataUpdate];
        
        if ([[_animationInfo objectForKey:kBoCPress_Global_AnimationType] isEqual:kBoCPress_View_AnimationTypeTopToBottom])
        {
            [self playInitializationAnimation];
        }
        
        [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didQuoteHomeFinishedUpdateData
                                                            object: self
                                                          userInfo: nil];
    }else
    {
        [self didUpdateData];
    }
}


- (void)didBeenBackwardToWithInfo: (NSDictionary *)info
{
    [self setUserInteractionEnabled: YES];
    [_handler activeAllCallback];
    
    [[_contentView cellForRowAtIndexPath:[_contentView indexPathForSelectedRow]] setSelected:NO];
    
    [_contentView reloadData];
}

- (void)wantToForceRefreshCurrentContentWithInfo:(id)animationInfo
{
    [self setUserInteractionEnabled: YES];

    [_handler activeAllCallback];
    [self didUpdateData];
    [self wantToUpdateDataWithInfo:animationInfo];
}

- (void)wantToShowContentOfQuoteAtIndex: (NSUInteger)index
{
    [self setUserInteractionEnabled: NO];

    [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault
                                    onsuperView: NO];
    
    _indexOfSelectedCell = index;
    
    id<BoCPressSecurityFamily> family = [_securityFamilies objectAtIndex: _indexOfSelectedCell];
    
    NSString *notificationName = kViewController_wantToReadListOfSecurityInFamily;
    
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  family, kType_Global_SecurityFamily,
                                  notificationName, @"notificationName",
                                  _handler, kNetwork_CallbackObject,
                                  [NSNumber numberWithInteger: _indexOfSelectedCell], kBoCPress_Global_Index,
                                  @"wantToShowContentOfQuoteAtIndex", kNetwork_CallbackAction,
                                  nil];
    [[NSNotificationCenter defaultCenter] postNotificationName: notificationName 
                                                        object: self
                                                      userInfo: callbackInfo];

    [callbackInfo release];
}

- (void)wantToShowContentOfLongTermQuoteAtIndex: (NSUInteger)index
{
    [self setUserInteractionEnabled: NO];

    [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault
                                    onsuperView: NO];

    _indexOfSelectedCell = index;
    id<BoCPressSecurityFamily> family = [_securityFamilies objectAtIndex: _indexOfSelectedCell];
    
    NSString *notificationName = kViewController_wantToReadLongTermListOfSecurityInFamily;
    
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  family, kType_Global_SecurityFamily, 
                                  notificationName, @"notificationName",
                                  _handler, kNetwork_CallbackObject,
                                  @"wantToShowContentOfQuoteAtIndex", kNetwork_CallbackAction,
                                  nil];
    [[NSNotificationCenter defaultCenter] postNotificationName: notificationName 
                                                        object: self
                                                      userInfo: callbackInfo];
    [callbackInfo release];
}

- (void)didCancelledHandleErrorOfServerWithData:(NSDictionary *)info
{
    [self setUserInteractionEnabled: YES];

    [[_contentView cellForRowAtIndexPath: [_contentView indexPathForSelectedRow]] setSelected: NO];
    [_contentView reloadData];

}

- (void)attachCallbackInfo: (NSDictionary *)callbackInfo
                   forType: (NSString *)type
{
    
}

@end
