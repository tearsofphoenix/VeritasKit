//
//  BoCPressQuoteContentChartView.m
//  BoCPress
//
//  Created by Leix Snake on 11/5/11.
//  Copyright 2011 SJTU. All rights reserved.
//

#import "BoCPressQuoteContentChartView.h"

#import "BoCPressQuoteContentChartViewPrivateHandler.h"

#import "NSNamedObject.h"

#import "BoCPressConstant.h"

#import "NSMutableArray+Shuffling.h"

#import "UIView+LoadingIndicatorView.h"

#import "BoCPressQuoteContentChartLoadingindicator.h"

#import "BoCPressQuoteContentDatasource.h"

#import "BoCPressEntry.h"

#import "BoCPressChartImageConfiguration.h"

#import "NSData+MD5.h"

@implementation BoCPressQuoteContentChartView

@synthesize title = _title;
@synthesize delegate = _delegate;

static void BoCPressQuoteContentChartView_ShowLoadingIndicator(BoCPressQuoteContentChartView *self,
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

- (id)initWithDataSource: (id<BoCPressQuoteContentDatasource>)dataSource 
                   title: (NSString *)title
{
    if ((self = [super init])) 
    {
        _entries = [dataSource timeIntervalTypes];
        _dataSource = dataSource;
        _entryButtons = [[NSMutableArray alloc] initWithCapacity:[_entries count]];
        _handler = [[BoCPressQuoteContentChartViewPrivateHandler alloc] initWithChartView:self 
                                                                                  entries:_entryButtons];
        
        for (id<BoCPressEntry> iLooper in _entries)
        {
            if ([iLooper isChosen])
            {
                _currentEntryIndex = [_entries indexOfObject: iLooper];
                break;
            }
        }
                
        [self setTitle:title];
        
        [self setBackgroundColor:[UIColor clearColor]];
        [self setClipsToBounds:YES];
        
        
        CGRect frame = CGRectMake(0, 3, 58, 21);
        
        _entriesView = [[UIView alloc] init];
        [_entriesView setFrame:CGRectMake(0, 0,302, frame.size.height )];
        [_entriesView setBackgroundColor:[UIColor whiteColor]];
        
        [self addSubview:_entriesView];
        
        UIButton *iButtonLooper = nil;
        CGSize size;
        
        for (id<NSNamedObject> iLooper in _entries)
        {
            iButtonLooper = [[UIButton alloc] init];
            [[iButtonLooper titleLabel] setFont:[UIFont fontWithName:@"Helvetica" size:12]];
            
            size = [[iLooper name] sizeWithFont:[[iButtonLooper titleLabel] font]];
            
            [iButtonLooper setFrame:frame];
            frame.origin.x += size.width + 20;
            
            [iButtonLooper setTitle:[iLooper name] forState:UIControlStateNormal];
            [[iButtonLooper titleLabel] setTextColor:[UIColor grayColor]];
            [iButtonLooper addTarget: _handler 
                              action: @selector(handleEntryButtonPressedEvent:)
                    forControlEvents: UIControlEventTouchDown];            
            
            [_entryButtons addObject:iButtonLooper];
            [_entriesView addSubview:iButtonLooper];
            
            [iButtonLooper release];
        }
        
        UIButton *selectedButton = [_entryButtons objectAtIndex:_currentEntryIndex];
        [selectedButton setBackgroundImage: [UIImage imageNamed:@"BoCPressQuoteContentChartViewSelectedButtonBackground"]
                                  forState: UIControlStateNormal];
        [[selectedButton titleLabel] setTextColor:[UIColor whiteColor]];
        
        _chartView = [[UIImageView alloc] init];
        
        frame = [_entriesView frame];
        frame.origin.x = 0;
        frame.origin.y += frame.size.height + 4;
        frame.size.width = 302;
        frame.size.height = 151;
        [_chartView setFrame:frame];
        
        [_chartView setUserInteractionEnabled:YES];
        [_chartView setBackgroundColor:[UIColor whiteColor]];
        UITapGestureRecognizer *tapForDetailView = [[UITapGestureRecognizer alloc] initWithTarget:_handler 
                                                                                           action:@selector(handleChartViewTouchDownEvent:)];
        [_chartView addGestureRecognizer:tapForDetailView];
        [tapForDetailView release];
        
        
        [self addSubview:_chartView];
        
        
        _thumbnailImages = [[NSMutableArray alloc] initWithCapacity:[_entries count]];
        
        NSUInteger iLooper = 0;
        UIImage *iImageLooper = nil;
        while (iLooper < [_entries count]) 
        {
            iImageLooper = [[UIImage alloc] init];
            [_thumbnailImages addObject:iImageLooper];
            [iImageLooper release];
            ++iLooper;
        }
        
        _timerToUpdateData = [NSTimer scheduledTimerWithTimeInterval: kChartView_TimeIntervalToGetChartImage
                                                              target: self
                                                            selector: @selector(wantToUpdateDataByTimer:)
                                                            userInfo: nil
                                                             repeats: YES];
        [self wantToUpdateData];
    }
    
    return self;
}

- (void)dealloc
{
    
    [_handler release];
    _dataSource = nil;
    [_delegate release];
    [_entryButtons release];
    [_entriesView release];
    [_chartView release];
    [_thumbnailImages release];
    [_title release];
    [_timerToUpdateData invalidate];
    _timerToUpdateData = nil;
    
    [super dealloc];
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
    [_dataSource setChartImageConfigurationValue: @"interval"
                                          forKey: [selectedEntry internalName]];
    
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
    
    [self didUpdateData];
    [_chartView setImage: nil];
    
    [_timerToUpdateData fire];
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


- (void)didChartImageTaped
{
    if (!_dataLoading)
    {
        [_timerToUpdateData invalidate];
        _timerToUpdateData = nil;
        
        if ([_delegate respondsToSelector:@selector(didChartImageTapedInChartView:)]) 
        {
            [_delegate didChartImageTapedInChartView:self];
        }
    }
}

- (NSUInteger)currentEntryIndex
{
    return _currentEntryIndex;
}

- (NSMutableArray *)images
{
    return _thumbnailImages;
}

- (void)stopUpdatingData
{
    [_timerToUpdateData invalidate];
    _timerToUpdateData = nil;
    
    [self didUpdateData];
    [_handler cancelAllCallback];
}

- (void)startToUpdateData
{
    [_handler activeAllCallback];
    [_chartView setImage: nil];
    if (![_timerToUpdateData isValid]) 
    {
        _timerToUpdateData = [NSTimer scheduledTimerWithTimeInterval: kChartView_TimeIntervalToGetChartImage
                                                              target: self
                                                            selector: @selector(wantToUpdateDataByTimer:)
                                                            userInfo: nil
                                                             repeats: YES];
    }
    [self wantToUpdateData];
}

- (void)wantToUpdateData
{
    if (![_chartView image])
    {
        BoCPressQuoteContentChartView_ShowLoadingIndicator(self, _chartView, &_dataLoading, &_loadingIndicator);        
    }
    
    [_dataSource getChartImageWithCallback: _handler];
}

- (void)wantToUpdateDataByTimer: (NSTimer *)timer
{        
    if (![_chartView image])
    {
        BoCPressQuoteContentChartView_ShowLoadingIndicator(self, _chartView, &_dataLoading, &_loadingIndicator);        
    }
    
    [_dataSource getChartImageWithCallbackByTimer: _handler];
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

- (void)reloadView
{
    [_handler activeAllCallback];
    
    for(id<BoCPressEntry> entryLooper in _entries)
    {
        if ([entryLooper isChosen])
        {
            _currentEntryIndex = [_entries indexOfObject: entryLooper];
            break;
        }
    }
    
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
    
    [_chartView setImage: [_thumbnailImages objectAtIndex: _currentEntryIndex]];
    
    if (![_timerToUpdateData isValid]) 
    {
        _timerToUpdateData = [NSTimer scheduledTimerWithTimeInterval: kChartView_TimeIntervalToGetChartImage
                                                               target: self
                                                             selector: @selector(wantToUpdateDataByTimer:)
                                                             userInfo: nil
                                                              repeats: YES];
    }
    
    [self wantToUpdateData];
}
@end
