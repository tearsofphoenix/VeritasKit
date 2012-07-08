//
//  BoCPressQuoteContentNewsView.m
//  BoCPress
//
//  Created by E-Reach Administrator on 12/6/11.
/*************************************************************************

*

* EREACH CONFIDENTIAL

* ____________________

*

* [2011] eReach Mobile Software Technology Co., Ltd.

* All Rights Reserved.

*

* NOTICE: All information contained herein is, and remains the

* property of eReach Mobile Software Technology and its suppliers,

* if any. The intellectual and technical concepts contained herein

* are proprietary to eReach Mobile Software Technology and its

* suppliers and may be covered by U.S. and Foreign Patents, patents

* in process, and are protected by trade secret or copyright law.

* Dissemination of this information or reproduction of this material

* is strictly forbidden unless prior written permission is obtained

* from eReach Mobile Software Technology Co., Ltd.

*/

#import "BoCPressQuoteContentNewsView.h"

#import "BoCPressQuoteContentNewsViewPrivateHandler.h"

#import "BoCPressSecurity.h"

#import "BoCPressNews.h"

#import "BoCPressQuoteContentDatasource.h"

#import "BoCPressQuoteContentChartLoadingindicator.h"

#import "BoCPressConstant.h"

#import "BoCPressNewsTagColumn.h"

#import "BoCPressMetaPage.h"

static void BoCPressQuoteContentNewsView_ShowLoadingIndicator(BoCPressQuoteContentNewsView *self, 
                                                                    BOOL *_dataLoading, 
                                                                    UIView **_loadingIndicator)
{
    
    if (!*_dataLoading)
    {
        
        *_dataLoading = YES;
        
        *_loadingIndicator = [[BoCPressQuoteContentChartLoadingindicator alloc] init];
        
        [self addSubview: *_loadingIndicator];
        
        CGRect frame = [self bounds];
        
        CGPoint center = CGPointMake(frame.origin.x + frame.size.width / 2, frame.origin.y + frame.size.height / 2);
        [*_loadingIndicator setAlpha: 0.0];
        [*_loadingIndicator setCenter:center];
        
        
        [UIView beginAnimations: nil context: nil];
        [UIView setAnimationDuration: 0.5];
        
        [*_loadingIndicator setAlpha: 1.0];
        
        [UIView commitAnimations];
        
    }
    
}

@implementation BoCPressQuoteContentNewsView


@synthesize title = _title;
@synthesize pageTitle = _pageTitle;
@synthesize superPage = _superPage;

- (id)initWithSecurity: (id<BoCPressSecurity>)security
            dataSource: (id<BoCPressQuoteContentDatasource>)dataSource 
                 title: (NSString *)title
{
    if ((self = [super init])) 
    {
        _security = [security retain];
        _news = [[NSMutableArray alloc] init];
        _quoteContentDataSource = dataSource;
        _handler = [[BoCPressQuoteContentNewsViewPrivateHandler alloc] initWithNewsView: self
                                                                                   news: _news];
        [self setTitle:title];
        
        _contentView = [[UITableView alloc] init];
        
        [self addSubview:_contentView];
        
        [_contentView setBackgroundColor:[UIColor clearColor]];
        [_contentView setDelegate:_handler];
        [_contentView setDataSource:_handler];
        [_contentView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_contentView setShowsHorizontalScrollIndicator:NO];
        [_contentView setShowsVerticalScrollIndicator:NO];
        [_contentView setScrollEnabled: NO];
        
    }
    
    return self;
}

- (void)dealloc
{
    
    [_security release];
    _quoteContentDataSource = nil;
    
    [_handler cancelAllCallback];
    [_handler release];
    
    [_news release];
    [_title release];
    [_contentView release];
    
    [super dealloc];
}

- (void)didUpdateData
{    
    _dataLoading = NO;
    
    if (_loadingIndicator)
    {
        
        [_loadingIndicator removeFromSuperview];
        
        [_loadingIndicator release];
        
        _loadingIndicator = nil;
        
    }
}

- (void)wantToUpdateData
{
    if (!_dataLoading)
    {
        [self setUserInteractionEnabled: YES];     

        if ([_news count] == 0)
        {            
            BoCPressQuoteContentNewsView_ShowLoadingIndicator(self, &_dataLoading, &_loadingIndicator);
        }
        [_quoteContentDataSource listOrderedRelatedNewsWithCallback: _handler];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_contentView setFrame:[self bounds]];
    [_contentView setContentSize:CGSizeMake(10, 10)];
}

- (void)updateContentWithData: (NSArray *)data
{
    [self setUserInteractionEnabled: YES];     

    [self didUpdateData];
     
    [_news setArray:data];    
    [_contentView reloadData];
}

- (void)didBeenBackwardToWithInfo: (NSDictionary *)info
{
    [self setUserInteractionEnabled: YES];     

    [_handler activeAllCallback];
    UITableViewCell *selectedCell = [_contentView cellForRowAtIndexPath:[_contentView indexPathForSelectedRow]];
    [selectedCell setSelected:NO];
    [_contentView reloadData];
}

- (void)wantToReadContentOfNewsAtIndex: (NSUInteger)index
{
    [self setUserInteractionEnabled: NO];     
    [_superPage wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault
                                          onsuperView: NO];
    _currentIndex = index;
    
    [_handler cancelAllCallback];
    BoCPressNews* news = [_news objectAtIndex: _currentIndex];   
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    [userInfo setObject: news forKey: kBoCPress_Global_NewsType];
    [userInfo setObject: _news forKey: @"newsList"];        
    [userInfo setObject: _title forKey: @"pageTitle"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_wantToReadNews_inNewsList 
                                                        object: self 
                                                      userInfo: userInfo]; 
}

- (void)stopUpdatingData
{
    [self setUserInteractionEnabled: YES];     
    [self didUpdateData];
    [_handler cancelAllCallback];
}

- (void)startToUpdateData
{
    [self setUserInteractionEnabled: YES];     

    [_handler activeAllCallback];
    [_news removeAllObjects];
    [_contentView reloadData];
    
    [self wantToUpdateData];
}

- (void)clearSelectedCell
{
    [[_contentView cellForRowAtIndexPath: [_contentView indexPathForSelectedRow]] setSelected: NO];
    [_contentView reloadData];
}
@end
