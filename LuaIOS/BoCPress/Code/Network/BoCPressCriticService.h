//
//  BoCPressCriticService.h
//  BoCPress
//
//  Created by E-Reach Administrator on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressMetaService.h"

@protocol BoCPressCallback;
@protocol BoCPressNews;
@protocol BoCPressAuthor;

@protocol BoCPressCriticService <BoCPressMetaService>


- (void)listOrderedCriticColumnsWithCallback: (id<BoCPressCallback>)callback;

- (void)listOrderedCriticsRangeFrom: (NSUInteger)rangeFrom
                            rangeTo: (NSUInteger)rangeTo 
                       withCallback: (id<BoCPressCallback>)callback;

- (void)listOrderedFavoriteCriticsRangeFrom: (NSUInteger)rangeFrom
                                    rangeTo: (NSUInteger)rangeTo
                               withCallback: (id<BoCPressCallback>)callback;

- (void)listLatestCriticPostRangeFrom: (NSUInteger)rangeFrom
                              rangeTo: (NSUInteger)rangeTo
                         withCallback: (id<BoCPressCallback>)callback;

- (void)listOrderedPostsFromCritic: (id<BoCPressAuthor>)critic 
                         rangeFrom: (NSUInteger)rangeFrom
                           rangeTo: (NSUInteger)rangeTo 
                      withCallback: (id<BoCPressCallback>)callback;

- (void)contentOfCriticPost: (id<BoCPressNews>)criticPost 
                       info: (id)logInfo
               withCallback: (id<BoCPressCallback>)callback;

- (void)contentOfCritic: (id<BoCPressAuthor>)critic
               userInfo: (id)userInfo
           withCallback: (id<BoCPressCallback>)callback;
@end

@interface BoCPressCriticService : BoCPressMetaService<BoCPressCriticService>

@end

extern NSString * const BoCPressCriticServiceID;