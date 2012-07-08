#import <Foundation/Foundation.h>

#import "ESObjectSystem.h"

@protocol BoCPressFeedback<NSIdentifiedObject>

#pragma mark - Feedback parameters

@required

- (id)target;

- (int)rate;

@end
