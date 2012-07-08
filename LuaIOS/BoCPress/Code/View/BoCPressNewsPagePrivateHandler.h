#import <Foundation/Foundation.h>

#import "BoCPressCallback.h"

@class BoCPressNewsPage;

@interface BoCPressNewsPagePrivateHandler: BoCPressCallback
{
    BoCPressNewsPage *_page;
}

- (id)initWithListPage: (BoCPressNewsPage *)page;

@end
