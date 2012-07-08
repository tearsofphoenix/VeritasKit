#import <Foundation/Foundation.h>

@class UIGalleryView;
@protocol UIGalleryViewDataSource;

@interface UIGalleryViewPrivateHandler: NSObject
{
    UIGalleryView *_galleryView;
    NSMutableDictionary *_thumbnails;
    NSIndexPath *_targetThumbnailIndexPath;
}

- (id)initWithGalleryView: (UIGalleryView *)galleryView
               thumbnails: (NSMutableDictionary *)thumbnails;

- (void)updateLayoutForThumbnailAtIndexPath: (NSIndexPath *)indexPath 
                             withLayoutRect: (CGRect)rect;

- (void)updateContentSizeForThumbnailAtIndexPath: (NSIndexPath *)indexPath 
                                  withLayoutRect: (CGRect)rect;

- (void)handleThumbnailTapGesture: (UIGestureRecognizer *)recognizer;

- (void)setTargetThumbnailIndexPath: (NSIndexPath *)indexPath;

- (void)scrollToShowThumbnailAtIndexPath: (NSIndexPath *)indexPath 
                          withLayoutRect: (CGRect)rect;

@end
