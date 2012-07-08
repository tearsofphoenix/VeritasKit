#import "NSIndexPath+UIGalleryView.h"

@implementation NSIndexPath(UIGalleryView)

+ (NSIndexPath *)indexPathForThumbnail: (NSUInteger)thumbnailIndex
                             inSection: (NSUInteger)sectionIndex
{
    
    NSUInteger indexes[2] = {sectionIndex, thumbnailIndex};
    
    return [NSIndexPath indexPathWithIndexes: indexes
                                      length: 2];
    
}

@end
