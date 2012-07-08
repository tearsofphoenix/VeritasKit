#import "BoCPressQuoteHomeDataSource.h"

#import "BoCPressDataSource.h"

@implementation BoCPressQuoteHomeDataSource

- (id)initWithService: (id<BoCPressDataSource>)rootDataSource
{
    
    self = [super init];
    if (self)
    {
        _rootDataSource = rootDataSource;
    }
    
    return self;
    
}

- (void)listOrderedSecurityFamiliesWithCallback: (id<BoCPressCallback>)callback
{
    [_rootDataSource listOrderedSecurityFamiliesWithCallback: callback];
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
//
//    [_rootDataSource authorizeColumnWithColumnID: columnID
//                                    callbackInfo: callbackInfo];
//}

@end
