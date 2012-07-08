#import <Foundation/Foundation.h>

@protocol BoCPressCriticService;
@protocol BoCPressConfigurationService;

@protocol BoCPressSecurityFamily;
@protocol BoCPressCallback;
@protocol BoCPressAuthor;
@protocol BoCPressFeedback;
@protocol BoCPressNews;

@protocol BoCPressCriticDataSource<NSObject>

- (void)listOrderedCriticColumnsWithCallback: (id<BoCPressCallback>)callback;

- (void)contentOfCritic:(id<BoCPressAuthor>)critic
               userInfo: (id)userInfo
            andCallback: (id<BoCPressCallback>)callback;

- (void)listOrderedPostsFromCritic: (id<BoCPressAuthor>)critic 
                         rangeFrom: (NSUInteger)rangeFrom
                           rangeTo: (NSUInteger)rangeTo 
                      withCallback: (id<BoCPressCallback>)callback;

- (void)listOrderedCriticsRangeFrom: (NSUInteger)rangeFrom
                            rangeTo: (NSUInteger)rangeTo 
                       withCallback: (id<BoCPressCallback>)callback;

- (void)listOrderedFavoriteCriticsRangeFrom: (NSUInteger)rangeFrom
                                    rangeTo: (NSUInteger)rangeTo
                               withCallback: (id<BoCPressCallback>)callback;

- (void)listLatestCriticPostRangeFrom: (NSUInteger)rangeFrom
                              rangeTo: (NSUInteger)rangeTo
                         withCallback: (id<BoCPressCallback>)callback;


- (NSTimeInterval) lastUpdateTimeIntervalWithColumnID: (id) columnID;

- (void)reloadColumnsWithCallback: (id<BoCPressCallback>) callback;

- (void)listOrderedPostsOfCritic: (id<BoCPressAuthor>)critic
                       rangeFrom: (NSUInteger)rangeFrom
                         rangeTo: (NSUInteger)rangeTo 
                    withCallback: (id<BoCPressCallback>)callback;

- (NSUInteger)countOfCriticPostsOnRequestedAtTheFirstTime;

- (NSUInteger)countOfCriticPostsOnRequestedForMore;

- (void)contentOfCritic: (id<BoCPressAuthor>)critic
           withUserInfo: (id)userInfo
               callback: (id<BoCPressCallback>)callback;

- (void)getCommentSummaryContentOfNews: (id<BoCPressNews>)news
                          withCallback: (id<BoCPressCallback>)callback;

- (void)submitFeedback: (id<BoCPressFeedback>)feedback 
                toNews: (id<BoCPressNews>)news 
          withCallback: (id<BoCPressCallback>)callback;

@end

@interface BoCPressCriticDataSource: NSObject<BoCPressCriticDataSource>
{
    id<BoCPressCriticService> _criticService;
    id<BoCPressConfigurationService> _configurationService;
}

- (id)initWithService: (id<BoCPressCriticService>)criticService
 configurationService: (id<BoCPressConfigurationService>)configurationService;

@end
