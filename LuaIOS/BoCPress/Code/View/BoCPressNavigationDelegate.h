#import <Foundation/Foundation.h>

@protocol BoCPressNavigationDelegate<NSObject>

@required
//- (void)willBrowseBackward;
- (void)didBrowseBackward;
- (void)didReadPreviousPage;
- (void)didReadNextPage;

@end
