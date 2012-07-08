#import <Foundation/Foundation.h>

#import "BoCPressCallback.h"

#import "BoCPressConstant.h"

@class BoCPressMediaHomePage;
@class BoCPressMediaHomePageCell;

@interface BoCPressMediaHomePagePrivateHandler: BoCPressCallback<UIScrollViewDelegate>
{
    BoCPressMediaHomePage *_page;
    NSDictionary *_media;
    NSArray *_types;
    NSUInteger _count;
    
    NSIndexPath* _indexPathOfCurrentSelectedCell;
    BOOL _couldRefreshPage;
}

- (id)initWithHomePage: (BoCPressMediaHomePage *)page
         forMediaTypes: (NSArray *)types
    maximumToShowCount: (NSUInteger)count
               inMedia: (NSDictionary *)media;

- (void)handleSectionMoreButtonTapGesture: (UIGestureRecognizer *)recognizer;

- (NSInteger)numberOfSectionsInView: (UIView *)view;

- (CGFloat)view: (UIView *)view 
heightForHeaderInSection: (NSInteger)section;

- (NSInteger)view: (UIView *)view 
numberOfRowsInSection: (NSInteger)section;

- (CGFloat)view: (UIView *)view 
heightForRowAtIndexPath: (NSIndexPath *)indexPath;

- (BoCPressMediaHomePageCell *)view: (UIView *)view 
cellForRowAtIndexPath: (NSIndexPath *)indexPath;

- (UIView *)view: (UIView *)view 
viewForHeaderInSection: (NSInteger)section;

- (CGSize)view: (UIView*)view
sizeForCellAtIndexPath: (NSIndexPath*)indexPath;

- (void)updateContentSizeForThumbnailAtIndexPath: (NSIndexPath *)indexPath 
                                  withLayoutRect: (CGRect)rect;

- (NSIndexPath*)indexOfCurrentSelectedCell;

@end
