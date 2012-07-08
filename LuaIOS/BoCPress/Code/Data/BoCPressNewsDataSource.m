#import "BoCPressNewsDataSource.h"

#import "BoCPressDataSource.h"

@implementation BoCPressNewsDataSource

- (id)initWithService: (id<BoCPressDataSource>)rootDataSource
{
    
    self = [super init];
    if (self)
    {
        _rootDataSource = rootDataSource;
    }
    
    return self;
    
}

- (void)contentOfNews: (id<BoCPressNews>)news 
                 info: (NSDictionary *)info 
         withCallback: (id<BoCPressCallback>)callback
{
    [_rootDataSource contentOfNews: news
                              info: info
                      withCallback: callback];
}

- (void)submitFeedback: (id<BoCPressFeedback>)feedback 
                toNews: (id<BoCPressNews>)news
          withCallback: (id<BoCPressCallback>)callback

{
    [_rootDataSource submitFeedback: feedback 
                             toNews: news
                       withCallback: callback];
     
}


- (void) getCommentSummaryContentOfNews: (id<BoCPressNews>)news
                           withCallback:(id<BoCPressCallback>)callback
{
    [_rootDataSource getCommentSummaryContentOfNews: news withCallback: callback];
}
@end
