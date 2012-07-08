//
//  BoCPressHelpPage.h
//  BoCPress
//
//  Created by Leix Snake on 6/18/11.
//  Copyright 2011 SJTU. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BoCPressMetaPage.h"

#import "NSIdentifiedObject.h"

@protocol BoCPressHelpDataSource;
@class BoCPressHelpPagePrivateHandler;

@interface BoCPressHelpPage : BoCPressMetaPage< NSIdentifiedObject>
{
    id<BoCPressHelpDataSource> _dataSource;
    
    NSString *_content;
    NSString *_pageTitle;
        
    id _identity;
        
    UIWebView *_contentView;
    
    CGRect _originFrameOfLoadingIndicator;
}

- (id)initWithLastPage:(id<BoCPressPage>)lastPage 
             pageTitle: (NSString*) pageTitle
              identity: (id)identity
            dataSource: (id<BoCPressHelpDataSource>) dataSource;

- (void)updateContentWithData: (id)data;

@end
