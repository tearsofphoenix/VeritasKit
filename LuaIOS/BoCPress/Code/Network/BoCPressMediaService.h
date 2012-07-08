//
//  BoCPressMediaService.h
//  BoCPress
//
//  Created by E-Reach Administrator on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressMetaService.h"

@protocol BoCPressMediaType;
@protocol BoCPressCallback;
@protocol BoCPressMedia;
@class BoCPressMediaTagColumn;

@protocol BoCPressMediaService<BoCPressMetaService>

@required
#pragma mark - Media content

- (void)listOrderedMediaTypesWithCallback: (id<BoCPressCallback>)callback;

- (void)listOrderedMediaOfType: (id<BoCPressMediaType>)type 
                     rangeFrom: (NSUInteger)rangeFrom
                       rangeTo: (NSUInteger)rangeTo
                  withCallback: (id<BoCPressCallback>)callback;

- (void)listOrderedMediaTagsInType: (id<BoCPressMediaType>)type
                      withCallback: (id<BoCPressCallback>)callback;

- (void)listOrderedMediaWithTag: (BoCPressMediaTagColumn* )tag
                      rangeFrom: (NSUInteger)rangeFrom
                        rangeTo: (NSUInteger)rangeTo
                       callback: (id<BoCPressCallback>)callback;

- (void)contentOfMedia: (id<BoCPressMedia>)media
             mediaType: (id<BoCPressMediaType>)mediaType
          withCallback: (id<BoCPressCallback>)callback;


#pragma mark - Broad Cast

- (void)listOrderedBroadCastForcastWithCallback: (id<BoCPressCallback>)callback;

- (void)contentOfBroadCast: (id<BoCPressMedia>) media
              withCallback: (id<BoCPressCallback>)callback;

- (void)currentBroadCastWithCallback: (id<BoCPressCallback>) callback;

@end


@interface BoCPressMediaService : BoCPressMetaService<BoCPressMediaService>

@end

extern NSString * const BoCPressMediaServiceID;
