#import <Foundation/Foundation.h>

#import "BoCPressCallback.h"
#import "BoCPressColumnDelegate.h"

@class BoCPressColumnBarView;
@class BoCPressNewsHomePage;
@protocol BoCPressNewsTag;

@interface BoCPressNewsHomePagePrivateHandler : BoCPressCallback<BoCPressColumnDelegate, UITableViewDataSource, UITableViewDelegate>
{
    BoCPressNewsHomePage *_page;

    NSDictionary *_columns;
    NSDictionary *_news;
    BoCPressColumnBarView *_columnBar;
    BOOL _currentColumnIsMoreColumn;

    NSMutableDictionary *_hasMoreContentDictionary;

    NSUInteger _maxCount;
    BOOL _couldRefreshPage;
}

- (id)initWithHomePage: (BoCPressNewsHomePage *)page
             inColumns: (NSDictionary *)columns
         fromColumnBar: (BoCPressColumnBarView *)columnBar
                ofNews: (NSDictionary *)news;
@end
