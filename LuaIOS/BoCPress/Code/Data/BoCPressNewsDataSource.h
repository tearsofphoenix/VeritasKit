#import <Foundation/Foundation.h>

@protocol BoCPressDataSource;
@protocol BoCPressNews;

@protocol BoCPressCallback;
@protocol BoCPressFeedback;


@protocol BoCPressNewsDataSource<NSObject>

- (void)contentOfNews: (id<BoCPressNews>)news 
                 info: (NSDictionary *)info
         withCallback: (id<BoCPressCallback>)callback;

- (void)submitFeedback: (id<BoCPressFeedback>)feedback 
                toNews:(id<BoCPressNews>)news
          withCallback:(id<BoCPressCallback>)callback;

- (void) getCommentSummaryContentOfNews: (id<BoCPressNews>)news
                    withCallback:(id<BoCPressCallback>)callback;
@end

@interface BoCPressNewsDataSource: NSObject<BoCPressNewsDataSource> 
{
    id<BoCPressDataSource> _rootDataSource;
}

- (id)initWithService: (id<BoCPressDataSource>)rootDataSource;

@end
