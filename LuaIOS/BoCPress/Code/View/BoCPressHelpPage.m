//
//  BoCPressHelpPage.m
//  BoCPress
//
//  Created by Leix Snake on 6/18/11.
//  Copyright 2011 SJTU. All rights reserved.
//

#import "BoCPressHelpPage.h"

#import "UIWebView+RemoveBackgroundShadow.h"

#import "UIView+LoadingIndicatorView.h"

#import "NSIdentifiedObject.h"

#import "BoCPressHelpDataSource.h"

#import "BoCPressHelpPagePrivateHandler.h"

#import "BoCPressConstant.h"

@implementation BoCPressHelpPage

- (id)initWithLastPage: (id<BoCPressPage>)lastPage 
             pageTitle: (NSString*) pageTitle
              identity: (id)identity
            dataSource: (id<BoCPressHelpDataSource>) dataSource
{
    self = [super init];
    if (self) 
    {
        _identity = [identity retain];
        [self setLastPage: lastPage];
        [self setPageTitle: pageTitle];
        _dataSource = [dataSource retain];
        _handler = [[BoCPressHelpPagePrivateHandler alloc] initWithPage:self];
        _contentView = [[UIWebView alloc] init];
        
        [self addSubview:_contentView];
        
        [_contentView removeBackgroundShadow];
        
        [self setFrame:CGRectMake(0, 44, 320, 364.5)];
        CGRect bounds = [self bounds];
        
        [_contentView setFrame: bounds];
        
        _content = nil;
        
        [self wantToUpdateDataWithInfo:nil];
        
    }
    
    return self;
    
}

- (void)dealloc
{
    [_identity  release];
    
    [_dataSource release];
    [_content release];
    [_contentView release];
    [_handler release];
    
    [super dealloc];
}



#pragma mark - page parameter

- (BOOL)needNavigationBar
{
    return YES;
}

- (void)wantToUpdateDataWithInfo:(id)info
{
    if (!_dataLoading)
    {
        [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                        onsuperView: NO];
        
        [_dataSource getHelpInfoOfColumn: _identity 
                            withCallback: _handler];
    }
}


- (void)wantToForceRefreshCurrentContentWithInfo:(id)animationInfo
{
    if(!_dataLoading)
    {
        [self didUpdateData];
        [self wantToUpdateDataWithInfo:animationInfo];
    }
}

- (void)updateContentWithData: (id)data
{
    if (data)
    {
        
        if ([[data objectForKey:kBoCPress_Global_ColumnID] isEqual:_identity])
        {
            [_content release];
            
            if ([data objectForKey:kGetHelpInfoContent ])
            {
                
                _content = [[NSString stringWithFormat: @"<html><meta name=\"viewport\" content=\"width=320, height=460\"/><body>%@</body></html>", [data objectForKey:kGetHelpInfoContent ]] retain];
            }else
            {
                _content = @"<html><body></body></html>";
            }
            
            [_contentView loadHTMLString:_content 
                                 baseURL:[NSURL URLWithString: [NSString stringWithFormat: @"http://bocpress.project.eintsoft.com/%@", _identity]]];
        }
        
        [self wantToFinishDataUpdate];
    }else
    {
        [self didUpdateData];
    }
    
}

- (id)identity
{
    return _identity;
}

@end

