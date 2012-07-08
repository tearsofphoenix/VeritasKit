#import <Foundation/Foundation.h>

@protocol BoCPressDataSource;
@protocol BoCPressNewsTag;

@protocol BoCPressCallback;

@protocol BoCPressNewsListDataSource<NSObject>

- (void)listOrderedNewsRangeFrom: (NSUInteger)rangeFrom
                         rangeTo: (NSUInteger)rangeTo
                        callback: (id<BoCPressCallback>)callback;

- (id<BoCPressNewsTag>)newsTag;

- (NSTimeInterval) lastUpdateTimeIntervalWithColumnID: (id) columnID;

- (id)currentVersionInfo;

- (id)privateUserInfo;

- (void)getUserInfoFromServerWithInfo: (NSDictionary *)info 
                             callback: (id<BoCPressCallback>)callback;

//- (void)authorizeColumnWithColumnID: (id)columnID
//                       callbackInfo: (NSDictionary *)callbackInfo;
@end

@interface BoCPressNewsListDataSource: NSObject<BoCPressNewsListDataSource> 
{
    id<BoCPressDataSource> _rootDataSource;
    id<BoCPressNewsTag> _newsTag;
}

- (id)initWithService: (id<BoCPressDataSource>)rootDataSource
                  forNewsTag: (id<BoCPressNewsTag>)newsTag;

@end
