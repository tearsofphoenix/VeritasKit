#import "BoCPressMoreHomePage.h"

#import "BoCPressMoreHomePagePrivateHandler.h"

#import "BoCPressConstant.h"

#import "BoCPressMoreHomeDataSource.h"

#import "BoCPressNotificationDefines.h"

#import "BoCPressServerPushNotification.h"

@implementation BoCPressMoreHomePage

- (id)initWithDataSource:(id<BoCPressMoreHomeDataSource>)dataSource
{
    
    self = [super init];
    if (self) 
    {
        [self setPageTitle: @"更多"];
        
        _handler = [[BoCPressMoreHomePagePrivateHandler alloc] initWithPage:self];
        _contentView = [[UITableView alloc] init];
        
        UIView* headerView = [[[UIView alloc] init] autorelease];
        
        UIView *headerBackground = [[[UIView alloc] initWithFrame: CGRectMake(0, -480, 320, 480)] autorelease];
        [headerBackground setBackgroundColor: [UIColor whiteColor]];
        [headerView addSubview: headerBackground];
        [_contentView setTableHeaderView: headerView];
        
        UIView *footerView = [[[UIView alloc] init] autorelease];
        [footerView addSubview: [[[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressContentShadow"]] autorelease]];
        
        [_contentView setTableFooterView: footerView];
        
        [_contentView setBackgroundColor: [UIColor clearColor]];
        [_contentView setSeparatorStyle: UITableViewCellSeparatorStyleNone];
        
        [_contentView setDataSource: (BoCPressMoreHomePagePrivateHandler*)_handler];
        [_contentView setDelegate: (BoCPressMoreHomePagePrivateHandler*)_handler];
        
        [self addSubview:_contentView];
        
        _animationInfo = nil;
        
        _moreHomeDataSource = [dataSource retain];
    }
    
    return self;
    
}

- (void)dealloc
{
    [_handler release];
    [_animationInfo release];
    [_moreHomeDataSource release];
    [_contentView release];
    
    [super dealloc];
}

#pragma mark - page paramters

- (BOOL)needNavigationBar
{
    return YES;
}

- (void)wantToUpdateDataWithInfo:(id)animationInfo
{
    CGRect frame = [self bounds];
    frame.origin.y -= frame.size.height;
    [_contentView setFrame: frame];
    
    [UIView animateWithDuration: 0.3
                     animations: (^{
        [_contentView setFrame: [self bounds]];
    })
     ];    
}

- (void)wantToUpdateDataWithInfo: (id)animationInfo
                      completion: (void (^)(void) )block
{
    CGRect frame = [self bounds];
    frame.origin.y -= frame.size.height;
    [_contentView setFrame: frame];
    
    [UIView animateWithDuration: 0.3
                     animations: (^
                                  {
                                      [_contentView setFrame: [self bounds]];
                                  })
                     completion: (^(BOOL finished) 
                                  {
                                      if (block)
                                      {
                                          block();
                                      }
                                  })
     ];    
}

- (void)didBeenSwitchToFromOtherTabCompletion: (void (^)(void))block
{
    [self wantToFinishDataUpdate];
    
    [_handler activeAllCallback];
    
    [_contentView reloadData];
    
    CGRect frame = [_contentView frame];    
    CGFloat origin_Y = frame.origin.y;
    
    frame.origin.y = -frame.size.height;
    
    //hide the tableView first
    //
    [_contentView setFrame:frame];
    
    
    //show the tabView
    //
    frame.origin.y = origin_Y;
    
    [UIView animateWithDuration: 0.3
                     animations: (^
                                  {
                                      [_contentView setFrame:frame];
                                  })
                     completion: (^(BOOL finished) 
                                  {
                                      if (block)
                                      {
                                          block();
                                      }
                                  })
     ];    
}

- (void)didBeenBackwardToWithInfo: (NSDictionary *)info
{
    
    [_handler activeAllCallback];
    
    [_contentView reloadData];
    
    CGRect frame = [self bounds];
    
    
    [UIView animateWithDuration: 0.3
                     animations:(^
                                 {
                                     [_contentView setFrame:frame];
                                 })
     ];
    
}

- (BOOL)loginStatus
{
    if ([[_moreHomeDataSource userPrivateInfo] count] > 0)
    {
        return YES;
    }else
    {
        return NO;
    }
    
}

- (void)wantToGetRemoteNotificationConfiguration
{   
    [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                    onsuperView: NO];
    
    [_moreHomeDataSource getRemoteNotificationConfigurationWithCallback: _handler];
}

- (void)updateDataWithInfo:(id)data
{
    [self wantToFinishDataUpdate];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kNotification_ViewController_wantToShowRemoteNotificationConfiguration
                                                        object: self
                                                      userInfo: data];
}

- (NSUInteger)numberOfNewRemoteNotification
{
    return [_moreHomeDataSource numberOfNewRemoteNotification];
}

- (void)didRemoteNotificationChanged
{
    [_contentView reloadData];
}

- (void)wantToShowRemoteNotificationListPage
{    
    [[NSNotificationCenter defaultCenter] postNotificationName: kNotification_ViewController_wantToShowRemoteNotificationContent
                                                        object: self
                                                      userInfo: nil];
}
@end
