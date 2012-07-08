#import <Foundation/Foundation.h>

#import "BoCPressCallback.h"

@class BoCPressMoreHomePage;

@interface BoCPressMoreHomePagePrivateHandler: BoCPressCallback<UITableViewDelegate, UITableViewDataSource>
{
    BoCPressMoreHomePage *_page;
}

- (id)initWithPage: (BoCPressMoreHomePage *)page;

@end

