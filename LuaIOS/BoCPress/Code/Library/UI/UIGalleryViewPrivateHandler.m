#import "UIGalleryViewPrivateHandler.h"

#import "UIGalleryView.h"
#import "UIGalleryViewDelegate.h"
#import "UIGalleryViewDataSource.h"
#import "UIGalleryViewThumbnail.h"
#import <objc/runtime.h>

@implementation UIGalleryViewPrivateHandler

static char UIGalleryViewPrivateHandler_KeyForIndexPath;

- (id)init
{
    
    self = [super init];
    if (self) 
    {
        // Initialization code here.
    }
    
    return self;
}

- (id)initWithGalleryView: (UIGalleryView *)galleryView
               thumbnails: (NSMutableDictionary *)thumbnails
{
    self = [super init];
    if (self)
    {
        _galleryView = galleryView;
        _thumbnails = thumbnails;
    }
    
    return self;
}

- (void)updateLayoutForThumbnailAtIndexPath: (NSIndexPath *)indexPath 
                             withLayoutRect: (CGRect)rect
{
    
    if (CGRectIntersectsRect(rect, [_galleryView bounds]))
    {
        
        UIGalleryViewThumbnail *thumbnail = [_thumbnails objectForKey: indexPath];
        if (!thumbnail)
        {
            
            thumbnail = [[_galleryView dataSource] galleryView: _galleryView
                                          thumbnailAtIndexPath: indexPath];
            
            UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget: self
                                                                                         action: @selector(handleThumbnailTapGesture:)];
            [thumbnail addGestureRecognizer: recognizer];
            [recognizer release];
            
//            objc_setAssociatedObject(thumbnail, &UIGalleryViewPrivateHandler_KeyForIndexPath, indexPath, OBJC_ASSOCIATION_RETAIN);
            objc_setAssociatedObject(thumbnail, &UIGalleryViewPrivateHandler_KeyForIndexPath, indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

            
            [_thumbnails setObject: thumbnail forKey: indexPath];
            
            [_galleryView addSubview: thumbnail];
            
        }
        
        [thumbnail setFrame: rect];

        if ([[_galleryView selection] containsObject: indexPath])
        {
            [thumbnail setSelected: YES];
        }
        
    }
    else
    {
        
        UIGalleryViewThumbnail *thumbnail = [_thumbnails objectForKey: indexPath];
        if (thumbnail)
        {
            [thumbnail removeFromSuperview];
            [_thumbnails removeObjectForKey: indexPath];
        }
        
    }

}

- (void)updateContentSizeForThumbnailAtIndexPath: (NSIndexPath *)indexPath 
                                  withLayoutRect: (CGRect)rect
{
    ;
}

- (void)setTargetThumbnailIndexPath: (NSIndexPath *)indexPath
{
    _targetThumbnailIndexPath = indexPath;
}

- (void)scrollToShowThumbnailAtIndexPath: (NSIndexPath *)indexPath 
                          withLayoutRect: (CGRect)rect
{
    
    if ([indexPath isEqual: _targetThumbnailIndexPath])
    {
        [_galleryView scrollRectToVisible: rect 
                                 animated: YES];
    }
    
}

- (void)handleThumbnailTapGesture: (UIGestureRecognizer *)recognizer
{
    
    NSIndexPath *indexPath = objc_getAssociatedObject([recognizer view], 
                                                      &UIGalleryViewPrivateHandler_KeyForIndexPath);
    
    [[_galleryView delegate] galleryView: _galleryView
          willSelectThumbnailAtIndexPath: indexPath];
    
    [_galleryView selectThumbnailAtIndexPath: indexPath];
    
    [[_galleryView delegate] galleryView: _galleryView
           didSelectThumbnailAtIndexPath: indexPath];
    
}

@end
