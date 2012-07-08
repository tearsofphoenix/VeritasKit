#import <UIKit/UIKit.h>

@protocol UIGalleryViewDataSource;
@class UIGalleryViewPrivateHandler;

#import "UIGalleryViewDelegate.h"

typedef enum
{
    UIGalleryViewStyleHorizontal,
    UIGalleryViewStyleVertical
}
UIGalleryViewStyle;

typedef enum
{
    UIGalleryViewContentOffsetLinkageX,
    UIGalleryViewContentOffsetLinkageY,
    UIGalleryViewContentOffsetLinkageXY,
}
UIGalleryViewContentOffsetLinkageDirection;

@interface UIGalleryView: UIScrollView
{
    
@package
    
    id<UIGalleryViewDataSource> _dataSource;
    NSMutableDictionary *_thumbnails;
    
    UIGalleryViewStyle _galleryViewStyle;
    
    UIGalleryViewPrivateHandler *_handler;
    
    NSMutableSet *_selection;
    
    UIGalleryView *_targetView;
    
    UIGalleryViewContentOffsetLinkageDirection _contentOffsetLinkageDirection;
}

@property (nonatomic, assign) id<UIGalleryViewDelegate> delegate;
@property (nonatomic, assign) id<UIGalleryViewDataSource> dataSource;

@property (nonatomic) UIGalleryViewStyle galleryViewStyle;

@property (nonatomic, readonly) NSSet *selection;

- (void)reloadData;

- (CGRect)rectForThumbnailAtIndexPath: (NSIndexPath *)indexPath;

- (NSInteger)numberOfSections;

- (NSInteger)numberOfThumbnailsInSectionAtIndex: (NSInteger)sectionIndex;

- (void)selectThumbnailAtIndexPath: (NSIndexPath *)indexPath;

- (void)setGalleryViewContentOffsetLinkageDirection: (UIGalleryViewContentOffsetLinkageDirection)contentOffsetLinkageDirection;

- (void)setTargetView: (UIGalleryView *)targetView;

- (void)changeContentOffset:(CGPoint)contentOffset direction: (UIGalleryViewContentOffsetLinkageDirection)direction ;

- (void)bringIndicatorToFront;

@end
