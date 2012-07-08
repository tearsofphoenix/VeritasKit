#import "BoCPressQuoteListDataSource.h"

#import "BoCPressDataSource.h"

#import "BoCPressConstant.h"

#import "BoCPressSharedFunctions.h"

@implementation BoCPressQuoteListDataSource

- (id)initWithService: (id<BoCPressDataSource>)rootDataSource
{
    
    self = [super init];
    if (self)
    {
        
        _rootDataSource = rootDataSource;
        
    }
    
    return self;
    
}

- (NSDate *)lastUpdateSecuritiesTime
{
    return [_rootDataSource lastUpdateSecuritiesTime];
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

- (id)currentVersionInfo
{
    return [_rootDataSource currentVersionInfo];
}

- (void)listOrderedLongTermSecurityInFamily: (id<BoCPressSecurityFamily>)family 
                               withCallback: (id<BoCPressCallback>)callback
{
    [_rootDataSource listOrderedLongTermSecurityInFamily: family
                                            withCallback: callback];
}

- (void)listOrderedSecurityInFamily: (id<BoCPressSecurityFamily>)family 
                       withCallback: (id<BoCPressCallback>)callback
                        triggerFlag: (NSString *)flag
{
    
    [_rootDataSource listOrderedSecurityInFamily: family
                                    withCallback: callback
                                     triggerFlag: flag];
}


- (void)listOrderedSecurityInFamily: (id<BoCPressSecurityFamily>)family 
                       withCallback: (id<BoCPressCallback>)callback
{
    [self listOrderedSecurityInFamily: family
                         withCallback: callback
                          triggerFlag: kString_Global_UpdateTriggerFlagByUser];
}

- (void)listOrderedSecurityInFamilyByTimer: (id<BoCPressSecurityFamily>)family 
                              withCallback: (id<BoCPressCallback>)callback
{

    [self listOrderedSecurityInFamily: family
                         withCallback: callback
                          triggerFlag: kString_Global_UpdateTriggerFlagByTimer];
}
@end
