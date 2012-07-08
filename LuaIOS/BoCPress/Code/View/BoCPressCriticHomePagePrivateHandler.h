#import <Foundation/Foundation.h>

#import "BoCPressColumnDelegate.h"

#import "BoCPressCallback.h"

#import "NSSuperHandler.h"

@protocol BoCPressAuthor;
@protocol BoCPressPost;
//@protocol NSSuperHandler;

@class BoCPressCriticHomePage;
@class BoCPressColumnBarView;
@class NSArraySlice;

@interface BoCPressCriticHomePagePrivateHandler: BoCPressCallback<BoCPressColumnDelegate, UITableViewDelegate, UITableViewDataSource, NSSuperHandler>
{
    BoCPressCriticHomePage *_page;
    NSArray *_columns;
    NSDictionary *_data;
    BoCPressColumnBarView *_columnBar;    
    NSMutableDictionary *_hasMoreContentDictionary;
    
}

- (id)initWithHomePage: (BoCPressCriticHomePage *)page
             inColumns: (NSArray *)columns
         fromColumnBar: (BoCPressColumnBarView *)columnBar
                ofData: (NSDictionary *)data;

- (void)initMoreCellFlagForColumns: (NSArray *)columns;

- (void)updateMoreCellFlagWithData: (NSArraySlice*)slice 
                         forColumn: (id)columnID;

- (void)wantToReadListOfCritic: (id<BoCPressAuthor>) critic;


@end
