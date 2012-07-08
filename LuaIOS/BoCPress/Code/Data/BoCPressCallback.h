#import <Foundation/Foundation.h>

@protocol BoCPressCallback<NSObject>

@required

- (void)callbackForAction: (id)action
                 withData: (id)data;

- (void)cancelAllCallback;

- (void)activeAllCallback;

@end

@interface BoCPressCallback : NSObject<BoCPressCallback>
{
@protected
    BOOL _callbackFlag;
}
@end