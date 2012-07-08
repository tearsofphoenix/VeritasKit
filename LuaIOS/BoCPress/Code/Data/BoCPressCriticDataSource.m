#import "BoCPressCriticDataSource.h"

#import "BoCPressConfigurationService.h"

#import "BoCPressConstant.h"

#import "BoCPressCriticService.h"
#import "BoCPressConfigurationService.h"
#import "BoCPressMetaService.h"

@implementation BoCPressCriticDataSource

- (id)initWithService: (id<BoCPressCriticService>)criticService
 configurationService: (id<BoCPressConfigurationService>)configurationService
{    
    if ((self = [super init]))
    {
        _criticService = criticService;
        _configurationService = configurationService;
    }    
    return self;    
}

- (void)listOrderedCriticColumnsWithCallback: (id<BoCPressCallback>)callback
{
    
    [_criticService listOrderedCriticColumnsWithCallback: callback];
    
}

- (void)listOrderedCriticsRangeFrom: (NSUInteger)rangeFrom
                            rangeTo: (NSUInteger)rangeTo 
                       withCallback: (id<BoCPressCallback>)callback
{
    
    [_criticService listOrderedCriticsRangeFrom: rangeFrom
                                         rangeTo: rangeTo
                                    withCallback: callback];
    
}

- (void)listOrderedFavoriteCriticsRangeFrom: (NSUInteger)rangeFrom
                                    rangeTo: (NSUInteger)rangeTo
                               withCallback: (id<BoCPressCallback>)callback
{
    
    [_criticService listOrderedFavoriteCriticsRangeFrom: rangeFrom
                                                 rangeTo: rangeTo
                                            withCallback: callback];
    
}

- (void)listLatestCriticPostRangeFrom: (NSUInteger)rangeFrom
                              rangeTo: (NSUInteger)rangeTo
                         withCallback: (id<BoCPressCallback>)callback
{
    
    [_criticService listLatestCriticPostRangeFrom: rangeFrom
                                           rangeTo: rangeTo
                                      withCallback: callback];
    
}

- (NSTimeInterval) lastUpdateTimeIntervalWithColumnID: (id) columnID
{
    //TODO
//   return [_criticService lastUpdateTimeIntervalWithColumnID:columnID];
    return 0.0;
}

- (void)contentOfCritic:(id<BoCPressAuthor>)critic
               userInfo: (id)userInfo
            andCallback: (id<BoCPressCallback>)callback
{
    [_criticService contentOfCritic: critic 
                            userInfo: userInfo 
                        withCallback: callback];
}

- (void)listOrderedPostsFromCritic: (id<BoCPressAuthor>)critic 
                         rangeFrom: (NSUInteger)rangeFrom
                           rangeTo: (NSUInteger)rangeTo 
                      withCallback: (id<BoCPressCallback>)callback
{
    [_criticService listOrderedPostsFromCritic:critic 
                                      rangeFrom:rangeFrom 
                                        rangeTo:rangeTo 
                                   withCallback:callback];
}

- (void)reloadColumnsWithCallback: (id<BoCPressCallback>) callback
{
    [_configurationService reloadColumnsWithTag: kBoCPressConfiguration_CriticColumns
                                       callback: callback];
}



- (void)contentOfCriticPost: (id<BoCPressNews>)criticPost 
                       info: (id)logInfo
               withCallback: (id<BoCPressCallback>)callback
{
    
    [_criticService contentOfCriticPost: criticPost
                                   info: logInfo 
                           withCallback: callback];
    
}

- (void)listOrderedPostsOfCritic: (id<BoCPressAuthor>)critic
                       rangeFrom: (NSUInteger)rangeFrom
                         rangeTo: (NSUInteger)rangeTo 
                    withCallback: (id<BoCPressCallback>)callback
{
    
    [_criticService listOrderedPostsFromCritic: critic
                                      rangeFrom: rangeFrom
                                        rangeTo: rangeTo
                                   withCallback: callback];
    
}

- (NSUInteger)countOfCriticPostsOnRequestedAtTheFirstTime
{
    return 10;
}

- (NSUInteger)countOfCriticPostsOnRequestedForMore
{
    return 10;
}

- (void)contentOfCritic: (id<BoCPressAuthor>)critic
           withUserInfo: (id)userInfo
               callback: (id<BoCPressCallback>)callback
{
    [_criticService contentOfCritic: critic 
                            userInfo: userInfo
                        withCallback: callback];
}

- (void)getCommentSummaryContentOfNews: (id<BoCPressNews>)news
                          withCallback: (id<BoCPressCallback>)callback
{
    [(BoCPressMetaService*)_criticService getCommentSummaryContentOfNews: news
                                                            withCallback: callback];
}
- (void)submitFeedback: (id<BoCPressFeedback>)feedback 
                toNews: (id<BoCPressNews>)news 
          withCallback: (id<BoCPressCallback>)callback
{
    
}
@end
