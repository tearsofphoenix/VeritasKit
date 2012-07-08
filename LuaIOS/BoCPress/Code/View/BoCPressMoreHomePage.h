#import <UIKit/UIKit.h>

#import "BoCPressMetaPage.h"

@class BoCPressMoreHomePagePrivateHandler;
@protocol BoCPressMoreHomeDataSource;

@interface BoCPressMoreHomePage: BoCPressMetaPage
{    
    id _animationInfo;
    
    id<BoCPressMoreHomeDataSource> _moreHomeDataSource;
    CGRect _originFrame;
    UITableView *_contentView;
}

- (id)initWithDataSource: (id<BoCPressMoreHomeDataSource>) dataSource;

- (BOOL)loginStatus;

- (void)wantToGetRemoteNotificationConfiguration;

- (void)updateDataWithInfo: (id)data;

- (NSUInteger)numberOfNewRemoteNotification;

- (void)wantToUpdateDataWithInfo: (id)animationInfo
                      completion: (void (^)(void) )block;

- (void)didRemoteNotificationChanged;

- (void)wantToShowRemoteNotificationListPage;

@end
