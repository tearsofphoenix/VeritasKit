#import <Foundation/Foundation.h>

@protocol BoCPressDataSource;
@protocol BoCPressNewsTag;

@protocol BoCPressCallback;

@protocol BoCPressNewsHomeDataSource<NSObject>

- ( void)listOrderedNewsTagsWithCallback: (id<BoCPressCallback>) callback;

- (void)listOrderedNewsWithTag: (id<BoCPressNewsTag>)tag 
                     rangeFrom: (NSUInteger)rangeFrom
                       rangeTo: (NSUInteger)rangeTo
                      callback: (id<BoCPressCallback>)callback;

- (NSTimeInterval) lastUpdateTimeIntervalWithColumnID: (id) columnID;

- (void)reloadColumnsWithCallback: (id<BoCPressCallback>) callback;

- (id)currentVersionInfo;

- (id)privateUserInfo;

- (void)getUserInfoFromServerWithInfo: (NSDictionary *)info 
                             callback: (id<BoCPressCallback>)callback;

//- (void)authorizeColumnWithColumnID: (id)columnID
//                       callbackInfo: (NSDictionary *)callbackInfo;

@end

@interface BoCPressNewsHomeDataSource: NSObject<BoCPressNewsHomeDataSource> 
{
    id<BoCPressDataSource> _rootDataSource;
}

- (id)initWithService: (id<BoCPressDataSource>)rootDataSource;

@end
