#import <Foundation/Foundation.h>

@protocol BoCPressDataSource;
@protocol BoCPressSecurityFamily;

@protocol BoCPressCallback;

@protocol BoCPressQuoteHomeDataSource<NSObject>

- (void)listOrderedSecurityFamiliesWithCallback: (id<BoCPressCallback>)callback;

- (id)currentVersionInfo;

- (id)privateUserInfo;

- (void)getUserInfoFromServerWithInfo: (NSDictionary *)info 
                             callback: (id<BoCPressCallback>)callback;

//- (void)authorizeColumnWithColumnID: (id)columnID
//                       callbackInfo: (NSDictionary *)callbackInfo;

@end

@interface BoCPressQuoteHomeDataSource: NSObject<BoCPressQuoteHomeDataSource>
{
    id<BoCPressDataSource> _rootDataSource;
}

- (id)initWithService: (id<BoCPressDataSource>)rootDataSource;

@end
