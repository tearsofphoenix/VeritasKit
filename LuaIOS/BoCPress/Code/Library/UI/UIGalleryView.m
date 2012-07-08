#import "UIGalleryView.h"

#import "UIGalleryViewDataSource.h"
#import "UIGalleryViewDelegate.h"
#import "UIGalleryViewThumbnail.h"
#import "UIGalleryViewPrivateHandler.h"

#import "NSIndexPath+UIGalleryView.h"

@implementation UIGalleryView

#pragma mark - Private function pre-declaration

static void UIGalleryView_Initialize(UIGalleryView *self, 
                                     UIGalleryViewPrivateHandler **_handler, 
                                     UIGalleryView **_targetView,
                                     NSMutableDictionary **_thumbnails,
                                     NSMutableSet **_selection);

static CGSize UIGalleryView_LoopForEveryThumbnail(UIGalleryView *self, 
                                                  id<UIGalleryViewDataSource> _dataSource,
                                                  NSMutableDictionary *_thumbnails,
                                                  UIGalleryViewPrivateHandler *_handler,
                                                  SEL selector);

@synthesize dataSource = _dataSource;
@synthesize galleryViewStyle = _galleryViewStyle;

- (void)setGalleryViewStyle: (UIGalleryViewStyle)galleryViewStyle
{
    
    _galleryViewStyle = galleryViewStyle;
    
    [self reloadData];
    
}

- (id<UIGalleryViewDelegate>)delegate
{
    return (id<UIGalleryViewDelegate>)[super delegate];
}

- (void)setDelegate: (id<UIGalleryViewDelegate>)delegate
{
    
    [super setDelegate: delegate];
    
    if (delegate)
    {
        [self reloadData];
    }
    
}

- (void)setDataSource: (id<UIGalleryViewDataSource>)dataSource
{
    
    _dataSource = dataSource;
    
    [self reloadData];
    
}

- (void)bringIndicatorToFront
{
    id indicator = [[self subviews] lastObject];
    
    [self bringSubviewToFront:indicator];    
}

- (void)changeContentOffset:(CGPoint)contentOffset direction: (UIGalleryViewContentOffsetLinkageDirection)direction 
{
    CGPoint selfContentOffset = [self contentOffset];
    
    {
        switch (direction)
        {
            case UIGalleryViewContentOffsetLinkageX:
            {
                CGPoint offset =CGPointMake(contentOffset.x, selfContentOffset.y);
                [super setContentOffset:offset];
                break;
            }   
                case UIGalleryViewContentOffsetLinkageY:
            {
                CGPoint offset =CGPointMake(selfContentOffset.x, contentOffset.y);
                [super setContentOffset:offset];
                break;
            }
            case UIGalleryViewContentOffsetLinkageXY:
            {
                [super setContentOffset:contentOffset];
                break;
            }
                
            default:
                break;
        }
    }
}
- (void)setTargetView:(UIGalleryView *)targetView
{
    
    _targetView = targetView;
    
}

- (void)setGalleryViewContentOffsetLinkageDirection:(UIGalleryViewContentOffsetLinkageDirection)contentOffsetLinkageDirection
{
    _contentOffsetLinkageDirection = contentOffsetLinkageDirection;
}
//- (void)setContentSize:(CGSize)contentSize
- (void)setContentOffset:(CGPoint)contentOffset
{
    [super setContentOffset:contentOffset];

//    CGPoint selfContentOffset = [self contentOffset];
//    
//    if (fabs(contentOffset.x - selfContentOffset.x) > 0.000001 
//        || fabs(contentOffset.y - selfContentOffset.y) > 0.000001)
//    {
//        if (_targetView)
//        {
            
    [_targetView changeContentOffset:contentOffset direction:_contentOffsetLinkageDirection];
    if ([[self delegate] respondsToSelector:@selector(galleryView:didSetContentOffset:)])
    {
        
        [[self delegate] galleryView:self didSetContentOffset:contentOffset];
    }
//        }
    
//    if ([[self delegate] respondsToSelector:@selector(scrollView:doLinkageAnimationWithContentOffset:)])
//    {
//        
//        [[self delegate] scrollView:self doLinkageAnimationWithContentOffset:contentOffset];
//    }
//    }
}

- (void)changeContentSize:(CGSize)contentSize direction:(UIGalleryViewContentOffsetLinkageDirection)direction
{
    CGSize selfContentSize = [self contentSize];
    
    if (fabs(selfContentSize.width - contentSize.width) > 0.000001
        || fabs(selfContentSize.height - contentSize.height) > 0.000001)
    {
        switch (direction)
        {
            case UIGalleryViewContentOffsetLinkageX:
            {
                CGSize newcontentSize = CGSizeMake(contentSize.width, selfContentSize.height);
                [super setContentSize:newcontentSize];
                break;
            }
                case UIGalleryViewContentOffsetLinkageY:
            {
                CGSize newcontentSize = CGSizeMake(selfContentSize.width, contentSize.height);
                [super setContentSize:newcontentSize];
                break;
            }
                case UIGalleryViewContentOffsetLinkageXY:
            {
                [super setContentSize:contentSize];
                break;
            }
            default:
                break;
        }
    }
}

- (void)setContentSize:(CGSize)contentSize
{
    [super setContentSize:contentSize];
    
    CGSize selfContentSize = [self contentSize];
    
    if (fabs(selfContentSize.width - contentSize.width) > 0.000001
        || fabs(selfContentSize.height - contentSize.height) > 0.000001)
    {
        [_targetView changeContentSize:contentSize direction: _contentOffsetLinkageDirection];
    }
}

- (void)reloadData
{
    
    [_thumbnails removeAllObjects];

    CGSize size = UIGalleryView_LoopForEveryThumbnail(self, 
                                                      _dataSource, 
                                                      _thumbnails, 
                                                      _handler, 
                                                      @selector(updateContentSizeForThumbnailAtIndexPath:withLayoutRect:));
    
    [self setContentSize: size];
    
    [self setNeedsLayout];
    
}

static void UIGalleryView_Initialize(UIGalleryView *self, 
                                     UIGalleryViewPrivateHandler **_handler, 
                                     UIGalleryView **_targetView,
                                     NSMutableDictionary **_thumbnails,
                                     NSMutableSet **_selection)
{
    *_thumbnails = [[NSMutableDictionary alloc] init];
    *_targetView = nil;
    *_handler = [[UIGalleryViewPrivateHandler alloc] initWithGalleryView: self
                                                              thumbnails: *_thumbnails];
    *_selection = [[NSMutableSet alloc] init];
}

- (id)init
{
    
    self = [super init];
    if (self)
    {
        UIGalleryView_Initialize(self, &_handler, &_targetView, &_thumbnails, &_selection);
        
    }
    
    return self;
}

- (id)initWithCoder: (NSCoder *)decoder
{
    
    self = [super initWithCoder: decoder];
    if (self)
    {
        UIGalleryView_Initialize(self, &_handler, &_targetView, &_thumbnails, &_selection);
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) 
    {
        UIGalleryView_Initialize(self, &_handler, &_targetView, &_thumbnails, &_selection);
    }
    
    return self;
}

- (void)dealloc
{
    [_handler release];
    [_thumbnails release];
    [_selection release];
    
    [super dealloc];
}

static CGSize UIGalleryView_LoopForEveryThumbnail(UIGalleryView *self, 
                                                  id<UIGalleryViewDataSource> _dataSource,
                                                  NSMutableDictionary *_thumbnails,
                                                  UIGalleryViewPrivateHandler *_handler,
                                                  SEL selector)
{
    
    CGRect layoutSituation = CGRectMake(0, 0, 0, 0);
    CGRect bounds = [self bounds];
    
    NSInteger sectionCount = [self numberOfSections];
    
    NSUInteger sectionLooper = 0;
    while (sectionLooper < sectionCount)
    {
        
        NSInteger thumbnailCount = [self numberOfThumbnailsInSectionAtIndex: sectionLooper];
        
        NSUInteger thumbnailLooper = 0;
        while (thumbnailLooper < thumbnailCount)
        {
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForThumbnail: thumbnailLooper
                                                              inSection: sectionLooper];
            CGSize size = CGSizeMake(50, 50);
            if ([[self delegate] respondsToSelector: @selector(galleryView:sizeForThumbnailAtIndexPath:)])
            {
                size = [[self delegate] galleryView: self
                        sizeForThumbnailAtIndexPath: indexPath];
            }
            
            switch ([self galleryViewStyle])
            {
                    
                case UIGalleryViewStyleHorizontal:
                {
                    
                    if (layoutSituation.origin.y + size.height >= bounds.origin.y + bounds.size.height)
                    {
                        
                        CGRect frame = CGRectMake(layoutSituation.origin.x + layoutSituation.size.width, 
                                                  0, 
                                                  size.width, 
                                                  size.height);
                        
                        ((void (*)(id, SEL, NSIndexPath *, CGRect))[_handler methodForSelector: selector])(_handler, selector, indexPath, frame);
                        
                        layoutSituation.origin.y = bounds.origin.y + size.height;
                        layoutSituation.origin.x += layoutSituation.size.width;
                        layoutSituation.size.width = size.width;
                    }
                    else
                    {
                        
                        CGRect frame = CGRectMake(layoutSituation.origin.x, 
                                                  layoutSituation.origin.y, 
                                                  size.width, 
                                                  size.height);
                        
                        ((void (*)(id, SEL, NSIndexPath *, CGRect))[_handler methodForSelector: selector])(_handler, selector, indexPath, frame);
                        
                        layoutSituation.origin.y += size.height;
                        if (layoutSituation.size.width < size.width)
                        {
                            layoutSituation.size.width = size.width;
                        }
                        
                    }
                    
                    break;
                }
                    
                case UIGalleryViewStyleVertical:
                {
                    
                    if (layoutSituation.origin.x + size.width >= bounds.origin.x + bounds.size.width)
                    {
                        
                        CGRect frame = CGRectMake(0,
                                                  layoutSituation.origin.y + layoutSituation.size.height, 
                                                  size.width, 
                                                  size.height);
                        
                        ((void (*)(id, SEL, NSIndexPath *, CGRect))[_handler methodForSelector: selector])(_handler, selector, indexPath, frame);
                        
                        layoutSituation.origin.x = bounds.origin.x + size.width;
                        layoutSituation.origin.y += layoutSituation.size.height;
                        layoutSituation.size.height = size.height;
                    }
                    else
                    {
                        
                        CGRect frame = CGRectMake(layoutSituation.origin.x, 
                                                  layoutSituation.origin.y, 
                                                  size.width, 
                                                  size.height);
                        
                        ((void (*)(id, SEL, NSIndexPath *, CGRect))[_handler methodForSelector: selector])(_handler, selector, indexPath, frame);
                        
                        layoutSituation.origin.x += size.width;
                        if (layoutSituation.size.height < size.height)
                        {
                            layoutSituation.size.height = size.height;
                        }
                    }
                    
                    break;
                }
                    
                default:
                {
                    break;
                }
            }
            
            ++thumbnailLooper;
        }
        
        ++sectionLooper;
    }
    
    return CGSizeMake(layoutSituation.origin.x + layoutSituation.size.width, layoutSituation.origin.y + layoutSituation.size.height);
}

- (void)layoutSubviews
{
    
    [super layoutSubviews];
    
    UIGalleryView_LoopForEveryThumbnail(self, 
                                        _dataSource, 
                                        _thumbnails, 
                                        _handler, 
                                        @selector(updateLayoutForThumbnailAtIndexPath:withLayoutRect:));
    
}

- (CGRect)rectForThumbnailAtIndexPath: (NSIndexPath *)indexPath
{
    return CGRectMake(0, 0, 0, 0);
}

- (NSInteger)numberOfSections
{
    
    NSInteger sectionCount = 1;
    if ([_dataSource respondsToSelector: @selector(numberOfSectionsInGalleryView:)])
    {
        sectionCount = [_dataSource numberOfSectionsInGalleryView: self];
        if (sectionCount <= 0)
        {
            sectionCount = 1;
        }
    }

    return sectionCount;
    
}

- (NSInteger)numberOfThumbnailsInSectionAtIndex: (NSInteger)sectionIndex
{
    
    return [_dataSource galleryView: self
 numberOfThumbnailsInSectionAtIndex: sectionIndex];

}

- (void)selectThumbnailAtIndexPath: (NSIndexPath *)indexPath
{
    
    [_selection removeAllObjects];
    
    [_selection addObject: indexPath];
    
    [_handler setTargetThumbnailIndexPath: indexPath];
    
    UIGalleryView_LoopForEveryThumbnail(self, 
                                        _dataSource, 
                                        _thumbnails, 
                                        _handler, 
                                        @selector(scrollToShowThumbnailAtIndexPath:withLayoutRect:));
    
}

@synthesize selection = _selection;

- (NSSet *)selection
{
    return [NSSet setWithSet: _selection];
}

@end
