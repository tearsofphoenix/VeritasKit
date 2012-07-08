#import "BoCPressMediaHomeDataSource.h"

#import "BoCPressDataSource.h"
#import "BoCPressConfigurationService.h"

@implementation BoCPressMediaHomeDataSource

- (id)initWithService: (id<BoCPressDataSource>)rootDataSource
{
    
    self = [super init];
    if (self)
    {
        _rootDataSource = rootDataSource;
    }
    
    return self;
    
}

- (void)listOrderedMediaTypesWithCallback: (id<BoCPressCallback>)callback
{
    [_rootDataSource listOrderedMediaTypesWithCallback: callback];
}

- (void)listOrderedMediaOfType: (id<BoCPressMediaType>)type 
                       withCallback: (id<BoCPressCallback>)callback
{
    [_rootDataSource listOrderedMediaOfType: type 
                                  rangeFrom: 0 
                                    rangeTo: [self countOfMediaPerTypeInHomeView]
                               withCallback: callback];
}

- (NSUInteger)countOfMediaPerTypeInHomeView
{
    return [[_rootDataSource configuration] countOfMediaPerTypeInHomeView];
}

- (void)listOrderedMediaOfType:(id<BoCPressMediaType>)type
                       inTypes: (NSArray *)types
                  withCallback:(id<BoCPressCallback>)callback
{
    
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

@end
