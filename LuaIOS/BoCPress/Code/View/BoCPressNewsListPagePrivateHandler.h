#import <Foundation/Foundation.h>

#import "BoCPressCallback.h"

@protocol BoCPressNewsTag;

@class BoCPressNewsListPage;

@interface BoCPressNewsListPagePrivateHandler: BoCPressCallback<UITableViewDelegate, UITableViewDataSource>
{
    BoCPressNewsListPage *_page;
    NSArray *_news;
    BOOL _hasMoreCell;
    NSMutableDictionary *_cells;

}

- (id)initWithListPage: (BoCPressNewsListPage *)page
                ofNews: (NSArray *)news;

@end
