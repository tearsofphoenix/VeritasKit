#import <Foundation/Foundation.h>

#import "BoCPressMetaPage.h"

@protocol BoCPressQuoteHomeDataSource;
@class BoCPressQuoteHomePagePrivateHandler;

@interface BoCPressQuoteHomePage: BoCPressMetaPage
{
    UITableView *_contentView;
    id<BoCPressQuoteHomeDataSource> _quoteHomeDataSource;
        
    NSMutableArray *_securityFamilies;
    
    
    id _animationInfo;
        
    id _userInfo;
    
    NSUInteger _indexOfSelectedCell;
}

- (id)initWithDataSource: (id<BoCPressQuoteHomeDataSource>)quoteHomeDataSource;

- (void)updateSecurityFamilies: (NSArray *)securityFamilies;

- (void)wantToShowContentOfQuoteAtIndex: (NSUInteger)index;

- (void)wantToShowContentOfLongTermQuoteAtIndex: (NSUInteger)index;

@end
