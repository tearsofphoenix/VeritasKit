#import <UIKit/UIKit.h>

#import "BoCPressMetaPage.h"

@protocol BoCPressCriticDataSource;
@protocol BoCPressNews;
@protocol BoCPressAuthor;

@class BoCPressCriticPostPagePrivateHandler;
@class BoCPressCriticView;
@class BoCPressNewsView;
//@class BoCPressNewsInfoView;

@interface BoCPressCriticPostPage : BoCPressMetaPage
{
    id<BoCPressCriticDataSource> _dataSource;
    
    id<BoCPressNews> _criticPost;
    
    NSArray *_postList;
    
    BoCPressCriticView *_criticView;
    
    BoCPressNewsView *_newsView;
        
    id _pageFlag;
    
    id _animationInfo;
}


- (id)initWithLastPage: (id<BoCPressPage>)lastPage
            criticPost: (id<BoCPressNews>)criticPost
            inPostList: (NSArray *)postList
            dataSource: (id<BoCPressCriticDataSource>)dataSource
              pageFlag: (id)pageFlag;

- (void)updateData: (id<BoCPressNews>)criticPost 
     withDirection: (id)direction;

- (void)stepToShowFeedBackViewWithData: (id)data;

- (void)removeFeedBackViewWithData: (id)data;

@end
