#import "BoCPressNewsHomeDataSource.h"

#import "BoCPressConfigurationService.h"
#import "BoCPressDataSource.h"

#import "BoCPressConstant.h"

@implementation BoCPressNewsHomeDataSource

- (id)initWithService: (id<BoCPressDataSource>)rootDataSource
{
    
    self = [super init];
    if (self)
    {
        _rootDataSource = rootDataSource;
    }
    
    return self;
}

- ( void)listOrderedNewsTagsWithCallback: (id<BoCPressCallback>) callback
{
    [_rootDataSource listOrderedNewsTagsWithCallback: callback];
}

- (void)listOrderedNewsWithTag: (id<BoCPressNewsTag>)tag 
                     rangeFrom: (NSUInteger)rangeFrom
                       rangeTo: (NSUInteger)rangeTo
                      callback: (id<BoCPressCallback>)callback
{
    
    [_rootDataSource listOrderedNewsWithTag: tag
                                  rangeFrom: rangeFrom
                                    rangeTo: rangeTo
                                   callback: callback];
    
}

- (NSTimeInterval) lastUpdateTimeIntervalWithColumnID: (id) columnID
{
    return [_rootDataSource lastUpdateTimeIntervalWithColumnID:columnID  ];
}

- (void)reloadColumnsWithCallback: (id<BoCPressCallback>) callback
{
    [_rootDataSource reloadColumnsWithTag:kBoCPressConfiguration_NewsSuperColumns andCallback:callback];
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
