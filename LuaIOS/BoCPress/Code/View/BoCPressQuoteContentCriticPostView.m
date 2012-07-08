//
//  BoCPressQuoteContentCriticPostView.m
//  BoCPress
//
//  Created by Leix Snake on 11/5/11.
//  Copyright 2011 SJTU. All rights reserved.
//

#import "BoCPressQuoteContentCriticPostView.h"

#import "BoCPressQuoteContentCriticPostViewPrivateHandler.h"

#import "BoCPressSecurity.h"

#import "BoCPressNews.h"

#import "BoCPressQuoteContentDatasource.h"

#import "BoCPressQuoteContentChartLoadingindicator.h"

#import "BoCPressConstant.h"

#import "BoCPressNewsTag.h"

#import "BoCPressMetaPage.h"

static void BoCPressQuoteContentCriticPostView_ShowLoadingIndicator(BoCPressQuoteContentCriticPostView *self, 
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

@implementation BoCPressQuoteContentCriticPostView

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
        _criticPosts = [[NSMutableArray alloc] init];
        _quoteContentDataSource = dataSource;
        _handler = [[BoCPressQuoteContentCriticPostViewPrivateHandler alloc] initWithCriticPostView:self 
                                                                                        criticPosts:_criticPosts];
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
    [_criticPosts release];
    [_title release];
    [_contentView release];
    
    [super dealloc];
}
- (void)didUpdateData
{    
    _dataLoading = NO;
    
    if (_loadingIndicator)
    {
        [self setUserInteractionEnabled: YES];     

        [_loadingIndicator removeFromSuperview];
        
        [_loadingIndicator release];
        
        _loadingIndicator = nil;
        
    }
}

- (void)wantToUpdateData
{
    if(!_dataLoading)
    {
        [self setUserInteractionEnabled: YES];     

        if ([_criticPosts count] == 0)
        {
            BoCPressQuoteContentCriticPostView_ShowLoadingIndicator(self, &_dataLoading,  &_loadingIndicator);
        }
        
        [_quoteContentDataSource listOrderedRelatedCriticPostsWithCallback: _handler];
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
    [_criticPosts setArray:data];    
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

- (void)wantToReadContentOfCriticPostAtIndex: (NSUInteger)index
{
    [self setUserInteractionEnabled: NO];     
    [_superPage wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault
                                          onsuperView: NO];
    _currentIndex = index;

    id<BoCPressNews> criticPost = [_criticPosts objectAtIndex: _currentIndex];
    
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    [userInfo setObject: criticPost forKey: @"criticPost"];
    [userInfo setObject: _criticPosts forKey: @"postList"];
    [userInfo setObject: kCriticPost_NoDeeper forKey:kCriticPost_CriticPostPageFlag];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_wantToReadCriticPost_inPostList_pageFlag_ 
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
    
    [_criticPosts removeAllObjects];
    [_contentView reloadData];
    
    [self wantToUpdateData];
}

- (void)clearSelectedCell
{
    [[_contentView cellForRowAtIndexPath: [_contentView indexPathForSelectedRow]] setSelected: NO];
    [_contentView reloadData];
}

@end
