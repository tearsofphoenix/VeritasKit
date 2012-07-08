//
//  BoCPressQuoteContentLandscapePage.m
//  BoCPress
//
//  Created by E-Reach Administrator on 11/21/11.
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

#import "BoCPressQuoteContentLandscapePage.h"

#import "BoCPressQuoteContentChartView.h"

#import "BoCPressQuoteContentDatasource.h"

#import "BoCPressViewController.h"

#import "BoCPressSecurity.h"

#import "BoCPressConstant.h"

#import "BoCPressChartImageConfiguration.h"

#import "BoCPressQuoteContentLandscapePagePrivateHandler.h"

#import "BoCPressEntry.h"

#import "BoCPressQuoteContentPageSecurityChooseViewController.h"

#import "BoCPressQuoteContentPageConfigurationViewController.h"

@implementation BoCPressQuoteContentLandscapePage

- (id)initWithLastPage:(id<BoCPressPage>)lastPage 
          inSecurities:(NSArray *)securities 
 currentTimeEntryIndex: (NSUInteger)currentTimeEntryIndex
         currentImages:(NSMutableArray *)currentImages 
            dataSource:(id<BoCPressQuoteContentDatasource>)dataSource
{
    if ((self = [super init]))
    {
        [self setLastPage: lastPage];
        _handler = [[BoCPressQuoteContentLandscapePagePrivateHandler alloc] initWithPage:self];
        _quoteContentDatasource = [dataSource retain];
        _securities = [securities retain];
        
        UIImageView *shadowView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"BoCPressContentShadow"]];
        CGRect frame = CGRectMake(0, 0, 480, 15);
        [shadowView setFrame: frame];
        
        [self addSubview: shadowView];
        [shadowView release];
        
        _chartView = [[BoCPressQuoteContentChartLandscapeView alloc] initWithImages: currentImages
                                                                         dataSource: dataSource];
        
        [self addSubview:_chartView];
        
        _currentTimeEntryIndex = currentTimeEntryIndex;
        _isChangingConfiguration = NO;
        _timerToUpdateData = [[NSTimer scheduledTimerWithTimeInterval:10 
                                                               target:_handler
                                                             selector: @selector(wantToUpdateDataRaisedByTimer:) 
                                                             userInfo: nil
                                                              repeats: YES] retain];
        
    }
    return self;
}

- (void)dealloc
{
    [_securities release];
    [_quoteContentDatasource release];
    [_handler release];
    
    //ChartView and CriticPost, News Views
    //
    [_chartView release];
    [_timerToUpdateData invalidate];
    [_timerToUpdateData release];
    _timerToUpdateData = nil;
    
    [super dealloc];
}

#pragma mark - BoCPressPage protocol

- (BOOL)couldReadNextPage
{
    return NO;
}
- (BOOL)couldReadPreviousPage
{
    return NO;
}

- (void)willSwitchToOtherTab
{
    [_chartView stopUpdatingData];
    [self didUpdateData];
    
    [_handler cancelAllCallback];
}

- (void)willBrowseBackward
{
    [_chartView stopUpdatingData];
    BoCPressViewController *rootViewController = (BoCPressViewController *)[[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [rootViewController recoveryNavigationBarForQuoteContentPage];
    
    [self didUpdateData];
    
    [_handler cancelAllCallback];
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kViewController_couldBrowseBackward 
                                                        object:self 
                                                      userInfo:nil];
}

- (NSString *)pageTitle
{
    return [[_quoteContentDatasource security] name];
}

- (BOOL)needNavigationBar
{
    return YES;
}
- (BOOL)needTabBar
{
    return NO;
}


- (void)wantToUpdateDataWithInfo: (id)info
{    
    if (!_isChangingConfiguration)
    {
        [_quoteContentDatasource contentOfQuoteWithCallback:_handler];
    }
}

- (void)didBeenBackwardToWithInfo: (NSDictionary *)info
{
    [_chartView startToUpdateData];
    [_handler activeAllCallback];
    
    _timerToUpdateData =  [[NSTimer scheduledTimerWithTimeInterval:10 
                                                            target:_handler
                                                          selector:@selector(wantToUpdateDataRaisedByTimer:) 
                                                          userInfo:nil
                                                           repeats:YES] retain];
    
}

- (BOOL)couldShowTimeOutAlertWithInfo:(NSDictionary *)info
{
    return NO;
}

- (void)updateContentWithData:(id)data
{    
    BoCPressViewController *rootViewController = (BoCPressViewController *)[[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [rootViewController updateNavigationBarWithQuoteData: data];
    
}


- (void)wantToForceRefreshCurrentContentWithInfo: (id)animationInfo
{
    [self wantToUpdateDataWithInfo: nil];
    [_chartView startToUpdateData];
}

- (void)didBeenSwitchToFromOtherTabCompletion: (void (^)(void))blockCompletion: (void (^)(void))block
{
    [_chartView startToUpdateData];
    [_handler activeAllCallback];
    
    _timerToUpdateData = [[NSTimer scheduledTimerWithTimeInterval:10 
                                                           target:_handler
                                                         selector:@selector(wantToUpdateDataRaisedByTimer:) 
                                                         userInfo:nil
                                                          repeats:YES] retain];
    [_timerToUpdateData fire];
    
}

- (void)didUpdateData
{
    ;
}

- (id)identity
{
    return @"BoCPressQuoteContentLandscapePage";
}


#pragma mark - LandScape view

- (void)changeTimeIntervalTypeOfChartImageConfigurationTo: (id<BoCPressEntry>)entry
{
    [_quoteContentDatasource setChartImageConfigurationValue:[entry internalName] forKey:@"interval"];
    
    [_chartView startToUpdateData];
}

- (void)reloadConfiguration
{
    _isChangingConfiguration = NO;
    [_chartView setCouldGetChartImage: !_isChangingConfiguration];
    
    [_quoteContentDatasource storeChartImageConfiguration];
    
    [_chartView foreceUpdateData];
    [_timerToUpdateData invalidate];
    [_timerToUpdateData release];
    
    _timerToUpdateData = [[NSTimer scheduledTimerWithTimeInterval:10 
                                                           target:_handler
                                                         selector:@selector(wantToUpdateDataRaisedByTimer:) 
                                                         userInfo:nil
                                                          repeats:YES] retain];
    [_timerToUpdateData fire];
}

- (void)showSecurityChooseView
{
    _isChangingConfiguration = YES;
    [_chartView setCouldGetChartImage: !_isChangingConfiguration];
    
    BoCPressQuoteContentPageSecurityChooseViewController *securityChooseViewController = [[BoCPressQuoteContentPageSecurityChooseViewController alloc] initWithEntries:_securities selected: [_quoteContentDatasource security]];
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                              securityChooseViewController, @"contentViewController",
                              nil];
    [securityChooseViewController release];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kNavigationBarView_showSecurityChooseView
                                                        object:self 
                                                      userInfo:userInfo];
    
    [userInfo release];
}


- (void)showConfigurationView
{
    _isChangingConfiguration = YES;
    [_chartView setCouldGetChartImage: !_isChangingConfiguration]; 
    
    NSArray *sections = [_quoteContentDatasource configurationSections];
    NSDictionary *groups = [_quoteContentDatasource configurationGroups];
    BoCPressChartImageConfiguration *chartImageConfiguration = [_quoteContentDatasource chartImageConfiguration];
    
    BoCPressQuoteContentPageConfigurationViewController *configurationViewController = [[BoCPressQuoteContentPageConfigurationViewController alloc] initWithSections:sections
                                                                                                                                                              groups:groups
                                                                                                                                             chartImageConfiguration:chartImageConfiguration];
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                              configurationViewController, @"contentViewController",
                              nil];
    [configurationViewController release];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kNavigationBarView_showConfigurationView
                                                        object:self 
                                                      userInfo:userInfo];
    
    [userInfo release];
}


- (void)didSelectedSecurityAtRow:(NSInteger)index
{   
    [_quoteContentDatasource setSecurity: [_securities objectAtIndex: index]];
    
    NSDictionary *info = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [[_quoteContentDatasource security] name], @"title", 
                          nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kNavigationBarView_updatePageTitle
                                                        object: self 
                                                      userInfo: info];
    
    [info release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}


- (void)layoutSubviews
{
    CGRect frame = CGRectMake(0, 44, 480, 320 - 20 - 44);
    [self setFrame:CGRectMake(frame.origin.x, frame.origin.y, 480, 320 - 20 - 44)];
    
    frame = [self frame];
    frame.origin.y = 0;
    [_chartView setFrame:frame];
    
}
- (NSArray *)supportedInterfaceOrientations
{
    return [NSArray arrayWithObjects: 
            [NSNumber numberWithInt: UIInterfaceOrientationLandscapeLeft],
            [NSNumber numberWithInt: UIInterfaceOrientationLandscapeRight],nil
            ];
}

- (void)attachCallbackInfo: (NSDictionary *)callbackInfo
                   forType: (NSString *)type
{
    
}

- (void)wantToUpdateDataByTimer
{
    if (!_isChangingConfiguration)
    {
        [_quoteContentDatasource contentOfQuoteWithCallbackByTimer:_handler];
    }
}

@end
