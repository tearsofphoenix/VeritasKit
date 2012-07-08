#import <Foundation/Foundation.h>

#import "BoCPressCallback.h"

@class BoCPressCriticPostListPage;

@interface BoCPressCriticPostListPagePrivateHandler : BoCPressCallback< UITableViewDelegate, UITableViewDataSource>
{
    BoCPressCriticPostListPage *_page;
    NSArray *_posts;
            
    BOOL _hasMoreCell;
}

- (id)initWithCriticPostListPage: (BoCPressCriticPostListPage *)page
                           posts: (NSArray *)posts;

@end
