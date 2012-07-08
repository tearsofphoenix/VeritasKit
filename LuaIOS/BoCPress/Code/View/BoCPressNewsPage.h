#import <UIKit/UIKit.h>

#import "BoCPressMetaPage.h"

@protocol BoCPressPage;
@protocol BoCPressNewsDataSource;
@protocol BoCPressNews;

@class BoCPressNewsView;

@interface BoCPressNewsPage: BoCPressMetaPage
{
    id<BoCPressNews> _news;
    NSArray *_newsList;
    BoCPressNewsView *_newsView;
    UIImageView *_newsTitleBackgroundView;
    
    id<BoCPressNewsDataSource> _dataSource;
    
    UILabel *_titleLabel;
    UILabel *_postTimeLabel;
    
    //record your commented news
    //
    NSMutableDictionary* _commentedNews;
    
    //
    id _animationDirection;
    
}

@property (nonatomic) BOOL couldNavigate;

@property (nonatomic) BOOL couldFeedBack;

- (id)initWithLastPage: (id<BoCPressPage>)lastPage
               forNews: (id<BoCPressNews>)news
            inNewsList: (NSArray *)newsList
        fromDataSource: (id<BoCPressNewsDataSource>)dataSource;
                         

- (void)updateContentOfNews: (id<BoCPressNews>)news 
              withDirection: (id)direction;

- (void) wantToShowFeedBackView: (NSNotification*) notification;

- (void)removeFeedBackViewWithData: (id)data;

- (void)stepToShowFeedBackViewWithData: (id)data;

@end
