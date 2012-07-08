#import <Foundation/Foundation.h>

#import "BoCPressCallback.h"
#import "BoCPressColumnDelegate.h"
@protocol BoCPressMedia;
@protocol BoCPressMediaType;

@class BoCPressColumnBarView;
@class BoCPressMediaListPage;
@class BoCPressMediaArraySlice;

@interface BoCPressMediaListPagePrivateHandler: BoCPressCallback<UITableViewDelegate, UITableViewDataSource, BoCPressColumnDelegate>
{
    BoCPressMediaListPage *_page;
    NSArray *_columns;
    NSDictionary *_media;
        
    id<BoCPressMedia> _currentBroadCast;
    
    NSMutableArray* _broadCastDates;
    NSMutableDictionary *_broadCastData;
        
    NSMutableDictionary *_hasMoreContentDictionary;
}

- (id)initWithListPage: (BoCPressMediaListPage *)page
             inColumns: (NSArray *)columns
               ofMedia: (NSDictionary *)media;

-(void)updateBroadCastSectionWithData: (id)data;

- (void)initMoreCellFlagForColumns: (NSArray *)columns;

- (void)updateMoreCellFlagForColumns: (BoCPressMediaArraySlice*)slice;

@end
