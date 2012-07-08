#import <Foundation/Foundation.h>

#import "BoCPressCallback.h"

@class BoCPressQuoteHomePage;

@interface BoCPressQuoteHomePagePrivateHandler: BoCPressCallback<UITableViewDelegate, UITableViewDataSource>
{
    
    BoCPressQuoteHomePage *_page;
    NSArray *_securityFamilies;
}

- (id)initWithHomePage: (BoCPressQuoteHomePage *)page 
    ofSecurityFamilies: (NSArray *)securityFamilies;

@end

