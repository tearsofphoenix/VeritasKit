#import <UIKit/UIKit.h>

#import "BoCPressPage.h"
//#import "UIGalleryView.h"

@class BoCPressMediaArraySlice;
@class BoCPressMediaHomePagePrivateHandler;
@class BoCPressMediaHomePage;
@class BoCPressMediaHomePageCell;
@protocol BoCPressMediaHomeDataSource;

@interface BoCPressMediaHomePage: UIScrollView<BoCPressPage>
{
    
    NSMutableArray *_types;
    
    NSMutableDictionary *_media;
    
    NSMutableDictionary *_dictionary;
    
    BoCPressMediaHomePagePrivateHandler *_handler;
    
    UIView *_shadowView;
    UIImageView *_footerView;

    id<BoCPressMediaHomeDataSource> _mediaHomeDataSource;
    
    UIView *_loadingIndicator;
    
    UIView *_emptySectionBackgroundView;
    
    BOOL _dataLoading;
    BOOL _couldHideLoadingIndicator;
    
    UIView *_placer;

    id _animationInfo;
    
    NSTimer *_timerForLoadingIndicator;

    NSUInteger _dataUpdateCounter;

    BOOL _hasSetOriginFrame;
    CGRect _originFrame;
    
    id _userInfo;
    
    NSIndexPath *_selectedIndexPath;
}

- (id)initWithDataSource: (id<BoCPressMediaHomeDataSource>)dataSource;

- (void)didUpdateData;

- (void)updateTypes: (NSArray *)types;

- (void)updateMediaArraySlice: (BoCPressMediaArraySlice *)slice;

- (void)reloadData;

- (BoCPressMediaHomePageCell*) cellForRowAtIndexPath: (NSIndexPath*) indexPath;

- (NSIndexPath*)indexOfCell: (UIView*) cell;

- (id<BoCPressMediaHomeDataSource>)dataSource;

- (void)wantToShowContentOfMediaInCell: (UIView *)cell;

- (void)willShowContentOfMediaInCellWithData: (NSDictionary *)data;

@end
