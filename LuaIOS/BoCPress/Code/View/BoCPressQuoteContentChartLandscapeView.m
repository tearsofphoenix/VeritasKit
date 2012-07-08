//
//  BoCPressQuoteContentChartLandscapeView.m
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

#import "BoCPressQuoteContentChartLandscapeView.h"

#import "NSNamedObject.h"

#import "UIView+LoadingIndicatorView.h"

#import "BoCPressQuoteContentChartLandscapeViewPrivateHandler.h"

#import "EGOPhotoViewController.h"

#import "BoCPressConstant.h"

#import "BoCPressQuoteContentChartLoadingindicator.h"

#import "BoCPressQuoteContentDatasource.h"

#import "BoCPressEntry.h"

#import "BoCPressChartImageConfiguration.h"

@implementation BoCPressQuoteContentChartLandscapeView

@synthesize title = _title;
@synthesize couldGetChartImage = _couldGetChartImage;

static void BoCPressQuoteContentChartLandscapeView_ShowLoadingIndicator(BoCPressQuoteContentChartLandscapeView *self, 
                                                                        UIImageView *_chartView,
                                                                        BOOL *_dataLoading, 
                                                                        UIView **_loadingIndicator)
{
    
    if (!*_dataLoading)
    {
        
        *_dataLoading = YES;
        
        *_loadingIndicator = [[BoCPressQuoteContentChartLoadingindicator alloc] init];
        
        [self addSubview: *_loadingIndicator];
        
        CGRect frame = [_chartView frame];
        
        CGPoint center = CGPointMake(frame.origin.x + frame.size.width / 2, frame.origin.y + frame.size.height / 2);
        [*_loadingIndicator setAlpha: 0.0];
        [*_loadingIndicator setCenter:center];
        
        [UIView animateWithDuration: 0.5
                         animations: (^{        
                                        [*_loadingIndicator setAlpha: 1.0];
                                    })
         ];
    }
    
}

- (id)initWithImages: (NSMutableArray *)images 
          dataSource: (id<BoCPressQuoteContentDatasource>)dataSource
{
    if ((self = [super init])) 
    {
        _dataSource = dataSource;
        _entries = [dataSource timeIntervalTypes];
        
        for (id<BoCPressEntry> iLooper in _entries)
        {
            if ([iLooper isChosen]) 
            {
                _currentEntryIndex = [_entries indexOfObject: iLooper];
                break;
            }
        }
        
        _entryButtons = [[NSMutableArray alloc] initWithCapacity:[_entries count]];
        _thumbnailImages = images;
        
        _handler = [[BoCPressQuoteContentChartLandscapeViewPrivateHandler alloc] initWithChartView:self entries:_entryButtons];
        
        
        [self setClipsToBounds:YES];
        [self setBackgroundColor:[UIColor whiteColor]];
        
        _entriesView = [[UIImageView alloc] init];
        [_entriesView setUserInteractionEnabled: YES];
        [_entriesView setFrame:CGRectMake(5, 0, 475, 32)];
        [_entriesView setImage:[UIImage imageNamed:@"BoCPressQuoteContentCharViewTitleBackground"]];
        
        [self addSubview:_entriesView];
        
        UIButton *iButtonLooper = nil;
        
        CGRect frame = CGRectMake(6, (32 - 21)/2.0, 58, 21);
        
        for (id<NSNamedObject> iLooper in _entries)
        {
            iButtonLooper = [[UIButton alloc] init];
            [[iButtonLooper titleLabel] setFont:[UIFont fontWithName:@"Helvetica" size:16]];
            [iButtonLooper setFrame:frame];
            frame.origin.x += frame.size.width + 24;
            
            [iButtonLooper setTitle:[iLooper name] forState:UIControlStateNormal];
            [[iButtonLooper titleLabel] setTextColor:[UIColor grayColor]];
            
            [iButtonLooper addTarget:_handler 
                              action:@selector(handleEntryButtonPressedEvent:) 
                    forControlEvents:UIControlEventTouchDown];            
            
            
            [_entryButtons addObject:iButtonLooper];
            [_entriesView addSubview:iButtonLooper];
            
            [iButtonLooper release];
        }
        
        UIButton *selectedButton = [_entryButtons objectAtIndex:_currentEntryIndex];
        [selectedButton setBackgroundImage: [UIImage imageNamed:@"BoCPressQuoteContentChartViewSelectedButtonBackground"]
                                  forState: UIControlStateNormal];
        
        [[selectedButton titleLabel] setTextColor:[UIColor whiteColor]];
        
        
        _chartView = [[UIImageView alloc] init];        
        [_chartView setUserInteractionEnabled:YES];
        [_chartView setBackgroundColor:[UIColor whiteColor]];
        [_chartView setImage: [_thumbnailImages objectAtIndex: _currentEntryIndex]];
        
        UITapGestureRecognizer *tapForDetailView = [[UITapGestureRecognizer alloc] initWithTarget:_handler 
                                                                                           action:@selector(handleChartViewTouchDownEvent:)];
        [_chartView addGestureRecognizer:tapForDetailView];
        [tapForDetailView release];
        
        [_entriesView setFrame:CGRectMake(5, 0, 475, 32)];
        
        frame = [_entriesView frame];
        
        frame.origin.y += frame.size.height + 3;
        frame.size.height = 220;
        frame.size.width = 480 - 2 * frame.origin.x;
        [_chartView setFrame:frame];
        
        [self addSubview:_chartView];
        
        _couldGetChartImage = YES;
        _timerForUpdateData = [[NSTimer scheduledTimerWithTimeInterval: kChartView_TimeIntervalToGetChartImage
                                                                target: self
                                                              selector: @selector(wantToUpdateDataByTimer:)
                                                              userInfo: nil
                                                               repeats: YES] retain];
    }
    
    return self;
}

- (void)dealloc
{
    
    [_handler cancelAllCallback];
    [_handler release];
    _dataSource = nil;
    [_entriesView release];
    [_entryButtons release];
    [_chartView release];
    [_title release];
    [_timerForUpdateData invalidate];
    [_timerForUpdateData release];
    _timerForUpdateData = nil;
    
    [super dealloc];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_entriesView setFrame:CGRectMake(5, 0, 475, 32)];
    
    CGRect frame = [_entriesView frame];
    
    frame.origin.y += frame.size.height + 3;
    frame.size.height = 220;
    frame.size.width = 480 - 2 * frame.origin.x;
    [_chartView setFrame:frame];
    
}

- (id)currentEntry
{
    return [_entries objectAtIndex:_currentEntryIndex];
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
    if (_couldGetChartImage)
    {        
        if (![_chartView image])
        {
            
            BoCPressQuoteContentChartLandscapeView_ShowLoadingIndicator(self, _chartView, &_dataLoading, &_loadingIndicator);
        }

        [_dataSource getChartImageWithCallback: _handler];
    }
}

- (void)wantToUpdateDataByTimer: (NSTimer *)timer
{        
    if (_couldGetChartImage)
    {        
        if (![_chartView image])
        {
            
            BoCPressQuoteContentChartLandscapeView_ShowLoadingIndicator(self, _chartView, &_dataLoading, &_loadingIndicator);
        }
        
        [_dataSource getChartImageWithCallbackByTimer: _handler];
    }
}


- (void)wantToSwitchToEntryAtIndex:(NSUInteger)index
{    
    if (_currentEntryIndex == index)
    {
        return;
    }
    
    
    _currentEntryIndex = index;
    if (_currentEntryIndex > [_entries count])
    {
        _currentEntryIndex = 0;
    }
    
    for (id<BoCPressEntry> iLooper in _entries) 
    {
        [iLooper setIsChosen: NO];
    }
    
    id<BoCPressEntry> selectedEntry = [_entries objectAtIndex: _currentEntryIndex];
    [selectedEntry setIsChosen: YES];
    
    for (UIButton *iLooper in _entryButtons) 
    {
        [iLooper setBackgroundColor:[UIColor clearColor]];
        [iLooper setBackgroundImage: nil
                           forState: UIControlStateNormal];
        [[iLooper titleLabel] setTextColor:[UIColor grayColor]];
    }
    
    
    UIButton *selectedButton = [_entryButtons objectAtIndex:_currentEntryIndex];
    [selectedButton setBackgroundImage: [UIImage imageNamed:@"BoCPressQuoteContentChartViewSelectedButtonBackground"]
                              forState: UIControlStateNormal];
    [[selectedButton titleLabel] setTextColor:[UIColor whiteColor]];
    
    [_chartView setImage: nil];
    
    if (![_timerForUpdateData isValid]) 
    {
        [_timerForUpdateData release];
        _timerForUpdateData = [[NSTimer scheduledTimerWithTimeInterval: kChartView_TimeIntervalToGetChartImage
                                                               target: self
                                                              selector: @selector(wantToUpdateDataByTimer:)
                                                             userInfo: nil
                                                              repeats: YES] retain];
    }
    
    [self wantToUpdateData];
}



- (void)wantToShowDetailImageOfCurrentEntry
{
    
    if (!_dataLoading)
    {
        [_timerForUpdateData invalidate];
        
        UIImage *detailImage = [_thumbnailImages objectAtIndex:_currentEntryIndex];
        
        
        UIViewController *rootViewController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
        
        EGOPhotoViewController *zoomableViewController = [[EGOPhotoViewController alloc] initWithImage:detailImage];
        
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:zoomableViewController];
        [navController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];        
        [navController setModalPresentationStyle: UIModalPresentationFullScreen];
        
        [rootViewController presentModalViewController:navController animated:YES];
        
        [navController release];
        
        [zoomableViewController release];  
    }
}



- (void)updateThumbnailImageWithData: (id)data
{
    if (data)
    {        
        NSDictionary *callbackObject = [data objectForKey: kNetwork_CallbackObject];
        NSURL *imageURL = [callbackObject objectForKey: kBoCPress_Global_NSURLObject];
        if ([[imageURL absoluteString] rangeOfString: [_dataSource queryChartImageConfigurationWithTag:@"interval"]].location != NSNotFound)
        {
            UIImage *image = [UIImage imageWithData: [data objectForKey: @"data"]];
            
            [self didUpdateData];    
            [_thumbnailImages replaceObjectAtIndex: _currentEntryIndex 
                                        withObject: image];
            
            [_chartView setImage: image];
        }
    }
}


- (void)updateImageConfigurationWithData:(id)data
{
    BoCPressChartImageConfiguration *chartImageConfiguration = [data objectForKey:kBoCPress_Global_ChartImageConfigurationObject];
    
    id<BoCPressEntry> selectedEntry = [_entries objectAtIndex: _currentEntryIndex];
    id lastUpdateDate = [_dataSource queryChartImageConfigurationWithTag:@"updateDate"];
    id lastTimeInterval = [selectedEntry internalName];
    
    id currentUpdateDate = [chartImageConfiguration queryConfigurationWithKey:@"updateDate"];
    id currentImageURL = [chartImageConfiguration queryConfigurationWithKey:@"chartUrl"];
    
    if (!currentImageURL 
        || [currentImageURL rangeOfString: lastTimeInterval].location == NSNotFound)
    {
        //NSLog(@"cancel:%@ %@", currentImageURL, lastTimeInterval);
        return;
    }else 
    {
        
        if ([lastUpdateDate isEqual:currentUpdateDate]
            && [_chartView image])
        {
            NSLog(@"equal, did update: %@ %@", currentImageURL, lastTimeInterval);
            [self didUpdateData];
            
        }else
        {
            NSLog(@"update: %@ %@", currentImageURL, lastTimeInterval);
            
            NSMutableDictionary *imageInfo = [[NSMutableDictionary alloc] init];
            
            NSURL *url = [[NSURL alloc] initWithString: currentImageURL];
            
            [imageInfo setObject: url 
                          forKey: kBoCPress_Global_NSURLObject];
            [url release];
            
            [imageInfo setObject: kBoCPress_View_updateThumbnailImage 
                          forKey: kNetwork_CallbackAction];
            [imageInfo setObject: _handler
                          forKey: kNetwork_CallbackObject];
            
            [_dataSource downloadChartImageWith: imageInfo
                                       callback: _handler];
            
            [imageInfo release];
        }
    }
}

- (void)stopUpdatingData
{
    [_timerForUpdateData invalidate];
    
    [self didUpdateData];
    [_handler cancelAllCallback];
}

- (void)startToUpdateData
{
    [_handler activeAllCallback];
    
    if (![_timerForUpdateData isValid]) 
    {
        [_timerForUpdateData release];
        _timerForUpdateData = [[NSTimer scheduledTimerWithTimeInterval: kChartView_TimeIntervalToGetChartImage
                                                                target: self
                                                              selector: @selector(wantToUpdateDataByTimer:)
                                                              userInfo: nil
                                                               repeats: YES] retain];
    }
    [self wantToUpdateData];
    
}

- (void)foreceUpdateData
{
    [_handler activeAllCallback];
    [_chartView setImage: nil];
    if (![_timerForUpdateData isValid]) 
    {
        [_timerForUpdateData release];
        _timerForUpdateData = [[NSTimer scheduledTimerWithTimeInterval: kChartView_TimeIntervalToGetChartImage
                                                                target: self
                                                              selector: @selector(wantToUpdateDataByTimer:)
                                                              userInfo: nil
                                                               repeats: YES] retain];
    }
    [self wantToUpdateData];
    
}

@end
