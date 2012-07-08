#import <UIKit/UIKit.h>

#import "WEPopoverController.h"

@class BoCPressNavigationBarViewPrivateHandler;
@protocol BoCPressNavigationDelegate;
@class BoCPressSecurity;


@interface BoCPressNavigationBarView: UIView<WEPopoverControllerDelegate> 
{

    UIImageView *_backgroundView;
    
    UIButton *_backwardButton;
    
    UILabel *_pageTitleLabel;
    
    UIButton *_nextPageButton;
    UIButton *_previousPageButton;
    
    BOOL _couldBackward;
    BOOL _couldNavigate;
    BOOL _couldReadNextPage;
    BOOL _couldReadPreviousPage;
    
    BoCPressNavigationBarViewPrivateHandler *_handler;
    
    id<BoCPressNavigationDelegate> _navigationDelegate;
    
#pragma mark - for demo
    UIButton *_quoteContentTitleButton;
    UIImageView *_quoteBuyBackgroundView;
    UIImageView *_quoteSellBackgroundView;
    
    UILabel *_quoteContentBuyLabel;
    UILabel *_quoteContentSellLabel;
    UILabel *_quoteContentLatestLabel;
    
    UIButton *_quoteContentConfigurationButton;
        
    WEPopoverController *_popoverControllerForTitle;
    WEPopoverController *_popoverControllerForConfiguration;
    BoCPressSecurity *_cachedSecurity;
    UIImageView *_bidPriceIndicator;
    UIImageView *_sellPriceIndicator;
    UIImageView *_singleCurrencyIndicator;
    id _userInfo;
#pragma mark - for remote notification
    UIButton *_editNotificationButton;
}

@property (nonatomic) BOOL couldBackward;
@property (nonatomic) BOOL couldNavigate;
@property (nonatomic) BOOL couldReadNextPage;
@property (nonatomic) BOOL couldReadPreviousPage;
@property (nonatomic, retain) NSString *pageTitle;

@property (nonatomic, retain) id<BoCPressNavigationDelegate> navigationDelegate;

- (void)storeUseInfoForQuoteContentPage: (id)userInfo;

- (void)autoFitForPageSupportedInterfaceOrientation: (UIInterfaceOrientation)interfaceOrientation;

- (void)recoveryForQuoteContentPage;

- (void)updateWithQuoteData: (id)userInfo;

- (void)showConfigurationView: (UIViewController *)configurationViewController;

- (void)showSecurityChooseView: (UIViewController *)securityChooseViewController;

- (void)setRemoteNotificationEditButtonHidden: (NSDictionary *)userInfo;

@end
