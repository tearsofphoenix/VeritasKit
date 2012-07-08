#import <Foundation/Foundation.h>

#import "NSArraySlice.h"

@protocol BoCPressNewsTag;

@interface BoCPressNewsArraySlice: NSArraySlice 
{
    id<BoCPressNewsTag> _newsTag;
    
    id _userInfo;
}

+ (id)newsArraySliceWithArray: (NSArray *)array 
                       offset: (NSUInteger)offset 
                        count: (NSUInteger)count
                   forNewsTag: (id<BoCPressNewsTag>)newsTag;

- (id)initWithArray: (NSArray *)array 
             offset: (NSUInteger)offset 
              count: (NSUInteger)count
         forNewsTag: (id<BoCPressNewsTag>)newsTag;

- (id<BoCPressNewsTag>)newsTag;

- (void)setUserInfo: (id)userInfo;

- (id)userInfo;

@end
