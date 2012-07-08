#import <Foundation/Foundation.h>

@protocol BoCPressDataSource;
@protocol BoCPressMediaType;

@protocol BoCPressCallback;
@class BoCPressMediaTagColumn;

@protocol BoCPressMedia;


@protocol BoCPressMediaListDataSource<NSObject>

- (void)listOrderedMediaTagsWithCallback: (id<BoCPressCallback>)callback;

- (void)listOrderedMediaWithTag: (BoCPressMediaTagColumn* )tag
                      rangeFrom: (NSUInteger)rangeFrom
                        rangeTo: (NSUInteger)rangeTo
                       callback: (id<BoCPressCallback>)callback;

- (id<BoCPressMediaType>)mediaType;

- (NSTimeInterval)lastUpdateTimeIntervalWithColumnID: (id) columnID;

- (UIImage*)getAvatarWithImageInfo:(id)imageInfo 
                      withCallback:(id<BoCPressCallback>)callback;

#pragma mark - Broad Cast 

- (void)listOrderedBroadCastForcastWithCallback: (id<BoCPressCallback>)callback;

- (void)contentOfBroadCast: (id<BoCPressMedia>) media
              withCallback: (id<BoCPressCallback>)callback;

- (void)currentBroadCastWithCallback: (id<BoCPressCallback>) callback;

- (void)reloadColumnsWithCallback: (id<BoCPressCallback>) callback;


@end

@interface BoCPressMediaListDataSource: NSObject<BoCPressMediaListDataSource> 
{
    id<BoCPressDataSource> _rootDataSource;
    id<BoCPressMediaType> _mediaType;
}

- (id)initWithService: (id<BoCPressDataSource>)rootDataSource
                forMediaType: (id<BoCPressMediaType>)mediaType;

@end
