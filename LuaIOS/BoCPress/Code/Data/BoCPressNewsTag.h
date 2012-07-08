#import <Foundation/Foundation.h>

#import "ESObjectSystem.h"

#import "BoCPressColumn.h"

@protocol BoCPressNewsTag<NSReadableTag, NSCoding>

@end

@interface BoCPressNewsTag: BoCPressColumn<BoCPressNewsTag, NSCopying>

- (id)initWithIdentity: (id)identity
                  name: (NSString *)name;

@end