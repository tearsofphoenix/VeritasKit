#import <Foundation/Foundation.h>

#import "BoCPressCallback.h"
@protocol BoCPressSecurity;

@class BoCPressQuoteListPage;

@interface BoCPressQuoteListPagePrivateHandler: BoCPressCallback<UITableViewDelegate, UITableViewDataSource>
{
    BoCPressQuoteListPage *_page;
    NSArray *_securities;
    
    NSMutableArray* _previousQuoteData;
    
    NSUInteger _dataUpdateCount;
}

- (id)initWithListPage: (BoCPressQuoteListPage *)page 
          ofSecurities: (NSArray *)securities;

- (void)wantToUpdateDataRaisedByTimer: (NSTimer*)theTimer;

- (void)storePreviousQuoteData: (NSArray*) previousSecurities;

- (id)findPreviousDataOfSecurity: (id<BoCPressSecurity>) security;

@end
