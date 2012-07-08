#import <Foundation/Foundation.h>

#import "BoCPressCallback.h"

@protocol BoCPressNews;
@class BoCPressCriticPostPage;

@interface BoCPressCriticPostPagePrivateHandler: BoCPressCallback
{
    BoCPressCriticPostPage *_page;
    id<BoCPressNews> _criticPost;
    
}

- (id)initWithCriticPostPage: (BoCPressCriticPostPage *)page
                  criticPost: (id<BoCPressNews>)criticPost;


@end
