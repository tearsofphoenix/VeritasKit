#import <Foundation/Foundation.h>

#import "NSArraySlice.h"
#import "BoCPressMediaTagColumn.h"

@protocol BoCPressMediaType;

@interface BoCPressMediaArraySlice: NSArraySlice 
{
    id<BoCPressMediaType> _mediaType;
    BoCPressMediaTagColumn*  _mediaTag;
    
    id _userInfo;
}

+ (id)mediaArraySliceWithArray: (NSArray *)array 
                        offset: (NSUInteger)offset 
                         count: (NSUInteger)count
                  forMediaType: (id<BoCPressMediaType>)mediaType;

- (id)initWithArray: (NSArray *)array 
             offset: (NSUInteger)offset 
              count: (NSUInteger)count
       forMediaType: (id<BoCPressMediaType>)mediaType;

- (id<BoCPressMediaType>)mediaType;

+ (id)mediaArraySliceWithArray: (NSArray *)array 
                        offset: (NSUInteger)offset 
                         count: (NSUInteger)count
                   forMediaTag: (BoCPressMediaTagColumn* )mediaTag;

- (id)initWithArray: (NSArray *)array 
             offset: (NSUInteger)offset 
              count: (NSUInteger)count
        forMediaTag: (BoCPressMediaTagColumn* )mediaTag;

- (BoCPressMediaTagColumn* )mediaTag;

- (void)setUserInfo: (id)userInfo;

- (id)userInfo;


@end
