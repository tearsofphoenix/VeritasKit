#import <Foundation/Foundation.h>

@class UIGalleryView;

@protocol UIGalleryViewDelegate<UIScrollViewDelegate>

@optional

- (CGSize)          galleryView: (UIGalleryView *)galleryView
    sizeForThumbnailAtIndexPath: (NSIndexPath *)indexPath;

- (void)               galleryView: (UIGalleryView *)galleryView
    willSelectThumbnailAtIndexPath: (NSIndexPath *)indexPath;

- (void)              galleryView: (UIGalleryView *)galleryView
    didSelectThumbnailAtIndexPath: (NSIndexPath *)indexPath;

//- (void)                 scrollView: (UIScrollView *)scrollView 
//doLinkageAnimationWithContentOffset:(CGPoint)contentOffset;
- (void) galleryView: (UIGalleryView *)galleryView
 didSetContentOffset: (CGPoint)contentOffset;
@end
