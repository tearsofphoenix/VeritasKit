//
//  BoCPressNewsService.h
//  BoCPress
//
//  Created by E-Reach Administrator on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressMetaService.h"

@protocol BoCPressCallback;
@protocol BoCPressNewsTag;
@protocol BoCPressNews;
@protocol BoCPressFeedback;

@protocol BoCPressNewsService<BoCPressMetaService>

- (void)listOrderedNewsTagsWithCallback: (id<BoCPressCallback>) callback;

- (void)listOrderedNewsWithTag: (id<BoCPressNewsTag>)tag 
                     rangeFrom: (NSUInteger)rangeFrom
                       rangeTo: (NSUInteger)rangeTo
                      callback: (id<BoCPressCallback>)callback;

- (void)contentOfNews: (id<BoCPressNews>)news 
                 info: (NSDictionary *)info
         withCallback: (id<BoCPressCallback>)callback;

- (void)submitFeedback: (id<BoCPressFeedback>)feedback 
                toNews: (id<BoCPressNews>)news 
          withCallback: (id<BoCPressCallback>)callback;


@end

@interface BoCPressNewsService : BoCPressMetaService<BoCPressNewsService>

@end

extern NSString * const BoCPressNewsServiceID;