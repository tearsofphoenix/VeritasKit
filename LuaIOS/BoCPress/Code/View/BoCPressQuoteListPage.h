#import <UIKit/UIKit.h>

#import "BoCPressMetaPage.h"

@protocol BoCPressSecurityFamily;
@protocol BoCPressQuoteListDataSource;

@interface BoCPressQuoteListPage : BoCPressMetaPage<UIAlertViewDelegate>
{
    id<BoCPressSecurityFamily> _family;
    NSMutableArray *_securities;
    id<BoCPressQuoteListDataSource> _dataSource;
            
    UITableView *_contentView;
    
    UIView *_columnBackgroundView;
    UILabel *_columnNameLabel;
    UILabel *_latestValueLabel;
    UILabel *_changedRateLabel;
    
    UILabel *_timeLabel;
    
    NSTimer *_timer;
    
    BOOL _hasSetOriginFrame;
    CGRect _originFrameOfContentView;
    
    id _animationInfo;
    
}

- (id)initWithLastPage: (id<BoCPressPage>)lastPage
     forSecurityFamily: (id<BoCPressSecurityFamily>)family
            securities: (NSArray *)securities
        fromDataSource: (id<BoCPressQuoteListDataSource>)dataSource;

- (void)updateData: (NSArray *)securities;

- (id)familyIdentity;

- (void)wantToShowQuoteContentOfSecurityAtIndex: (NSUInteger)index;

- (void)wantToUpdateDataWithInfoByTimer;

@end
