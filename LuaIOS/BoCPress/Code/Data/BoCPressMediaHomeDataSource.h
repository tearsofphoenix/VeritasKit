#import <Foundation/Foundation.h>

@protocol BoCPressDataSource;
@protocol BoCPressMediaType;

@protocol BoCPressCallback;

@protocol BoCPressMediaHomeDataSource<NSObject>

- (void)listOrderedMediaTypesWithCallback: (id<BoCPressCallback>)callback;

- (void)listOrderedMediaOfType: (id<BoCPressMediaType>)type 
                       withCallback: (id<BoCPressCallback>)callback;

- (void)listOrderedMediaOfType:(id<BoCPressMediaType>)type
                       inTypes: (NSArray *)types
                  withCallback:(id<BoCPressCallback>)callback;

- (NSUInteger)countOfMediaPerTypeInHomeView;

@end

@interface BoCPressMediaHomeDataSource: NSObject<BoCPressMediaHomeDataSource> 
{
    id<BoCPressDataSource> _rootDataSource;
}

- (id)initWithService: (id<BoCPressDataSource>)rootDataSource;

@end
