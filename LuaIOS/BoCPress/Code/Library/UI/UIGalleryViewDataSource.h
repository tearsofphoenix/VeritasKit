#import <Foundation/Foundation.h>

@class UIGalleryView;
@class UIGalleryViewThumbnail;

@protocol UIGalleryViewDataSource<NSObject>

@required

- (NSInteger)              galleryView: (UIGalleryView *)galleryView
    numberOfThumbnailsInSectionAtIndex: (NSInteger)sectionIndex;

- (UIGalleryViewThumbnail *)galleryView: (UIGalleryView *)galleryView
                   thumbnailAtIndexPath: (NSIndexPath *)indexPath;

@optional

- (NSInteger)numberOfSectionsInGalleryView: (UIGalleryView *)galleryView;

@end
