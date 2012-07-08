#import <Foundation/Foundation.h>

@protocol BoCPressDataSource;
@protocol BoCPressSecurityFamily;
@protocol BoCPressCallback;

@protocol BoCPressQuoteListDataSource<NSObject>

- (void)listOrderedSecurityInFamily: (id<BoCPressSecurityFamily>)family 
                       withCallback: (id<BoCPressCallback>)callback;

- (void)listOrderedSecurityInFamilyByTimer: (id<BoCPressSecurityFamily>)family 
                              withCallback: (id<BoCPressCallback>)callback;

- (NSDate *)lastUpdateSecuritiesTime;

- (void)listOrderedLongTermSecurityInFamily: (id<BoCPressSecurityFamily>)family 
                       withCallback: (id<BoCPressCallback>)callback;

- (id)privateUserInfo;

- (void)getUserInfoFromServerWithInfo: (NSDictionary *)info 
                             callback: (id<BoCPressCallback>)callback;

- (id)currentVersionInfo;

@end

@interface BoCPressQuoteListDataSource: NSObject<BoCPressQuoteListDataSource>
{
    id<BoCPressDataSource> _rootDataSource;
}

- (id)initWithService: (id<BoCPressDataSource>)rootDataSource;

@end
