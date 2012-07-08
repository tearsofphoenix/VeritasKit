#import "BoCPressNewsListDataSource.h"

#import "BoCPressDataSource.h"
#import "BoCPressConfigurationService.h"

@implementation BoCPressNewsListDataSource

- (id)initWithService: (id<BoCPressDataSource>)rootDataSource
                  forNewsTag: (id<BoCPressNewsTag>)newsTag
{
    
    self = [super init];
    if (self)
    {
        _rootDataSource = rootDataSource;
        _newsTag = newsTag;
    }
    
    return self;
}

- (id<BoCPressNewsTag>)newsTag
{
    return _newsTag;
}

- (void)listOrderedNewsRangeFrom: (NSUInteger)rangeFrom
                       rangeTo: (NSUInteger)rangeTo
                      callback: (id<BoCPressCallback>)callback
{
    
    [_rootDataSource listOrderedNewsWithTag: _newsTag
                                  rangeFrom: rangeFrom
                                    rangeTo: rangeTo
                                   callback: callback];
    
}

- (NSTimeInterval) lastUpdateTimeIntervalWithColumnID: (id) columnID
{
    return [_rootDataSource lastUpdateTimeIntervalWithColumnID:columnID];
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
