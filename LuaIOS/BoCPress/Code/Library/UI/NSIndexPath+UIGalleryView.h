#import <Foundation/Foundation.h>

@interface NSIndexPath (UIGalleryView)

+ (NSIndexPath *)indexPathForThumbnail: (NSUInteger)thumbnailIndex
                             inSection: (NSUInteger)sectionIndex;

@end
