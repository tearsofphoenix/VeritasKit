#import "BoCPressMediaListDataSource.h"

#import "BoCPressConfigurationService.h"
#import "BoCPressDataSource.h"

#import "BoCPressConstant.h"

@implementation BoCPressMediaListDataSource

- (id)initWithService: (id<BoCPressDataSource>)rootDataSource
                forMediaType: (id<BoCPressMediaType>)mediaType
{
    
    self = [super init];
    if (self)
    {
        _rootDataSource = rootDataSource;
        _mediaType = [mediaType retain];
    }
    
    return self;
}

- (void)dealloc
{
    
    [_mediaType release];
    
    [super dealloc];
    
}

- (id<BoCPressMediaType>)mediaType
{
    return _mediaType;
}

- (void)listOrderedMediaTagsWithCallback: (id<BoCPressCallback>)callback
{
    [_rootDataSource listOrderedMediaTagsInType: _mediaType 
                                   withCallback: callback];
}

- (void)listOrderedMediaWithTag: (BoCPressMediaTagColumn* )tag
                      rangeFrom: (NSUInteger)rangeFrom
                        rangeTo: (NSUInteger)rangeTo
                       callback: (id<BoCPressCallback>)callback
{
    [_rootDataSource listOrderedMediaWithTag: tag
                                   rangeFrom: rangeFrom 
                                     rangeTo: rangeTo 
                                    callback: callback];
}

- (NSTimeInterval) lastUpdateTimeIntervalWithColumnID: (id) columnID
{
    return [_rootDataSource lastUpdateTimeIntervalWithColumnID:columnID];
}

#pragma mark - Broad Cast

- (void)listOrderedBroadCastForcastWithCallback: (id<BoCPressCallback>)callback
{
    [_rootDataSource listOrderedBroadCastForcastWithCallback:callback];
}
- (void)contentOfBroadCast: (id<BoCPressMedia>) media
              withCallback: (id<BoCPressCallback>)callback
{
    [_rootDataSource contentOfBroadCast:media withCallback:callback];
}

- (void)currentBroadCastWithCallback: (id<BoCPressCallback>) callback
{
    [_rootDataSource currentBroadCastWithCallback:callback];
}


- (UIImage*)getAvatarWithImageInfo:(id)imageInfo 
                      withCallback:(id<BoCPressCallback>)callback
{
    return [_rootDataSource getAvatarWithImageInfo:imageInfo withCallback:callback ];
}

- (void)reloadColumnsWithCallback: (id<BoCPressCallback>) callback
{
    [_rootDataSource reloadColumnsWithTag:[_mediaType identity] andCallback:callback];
}

- (id)currentVersionInfo
{
    return [_rootDataSource currentVersionInfo];
}

- (id)privateUserInfo
{
    return [_rootDataSource getUserInfo];
}

- (void)getUserInfoFromServerWithInfo: (NSDictionary *)info 
                             callback: (id<BoCPressCallback>)callback
{
    [_rootDataSource getUserInfoFromServerWithInfo: info
                                          callback: callback];
}

//- (void)authorizeColumnWithColumnID: (id)columnID
//                       callbackInfo: (NSDictionary *)callbackInfo
//{
//    [_rootDataSource authorizeColumnWithColumnID: columnID
//                                    callbackInfo: callbackInfo];
//}


@end
