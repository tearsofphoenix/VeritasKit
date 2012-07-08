#import "BoCPressMediaHomePage.h"

#import "NSMutableArray+UniqueSliceSupported.h"

#import "BoCPressMediaArraySlice.h"
#import "BoCPressMediaHomeDataSource.h"
#import "BoCPressMediaHomePagePrivateHandler.h"

#import "BoCPressMediaType.h"

#import "BoCPressMedia.h"

#import "UIView+LoadingIndicatorView.h"

#import "NSIndexPath+UIGalleryView.h"

#import "BoCPressMediaHomePageCell.h"

#import <QuartzCore/QuartzCore.h>

#import "BoCPressNotificationDefines.h"

#import "BoCPressViewConstants.h"


@implementation BoCPressMediaHomePage



static void BoCPressMediaHomePage_ShowLoadingIndicator(BoCPressMediaHomePage *self, 
                                                       BOOL *_dataLoading, 
                                                       UIView **_loadingIndicator)
{
    
    if (!*_dataLoading)
    {
        
        *_dataLoading = YES;
        
        if(!*_loadingIndicator)
        {
            *_loadingIndicator = [[[self superview] loadingIndicator] retain];
        }
        
        [[self superview] addSubview: *_loadingIndicator];
        
        [*_loadingIndicator setAlpha: 0.0];
        [*_loadingIndicator setFrame:CGRectMake(0, 0, 320, 480-20)];
        [UIView beginAnimations: nil context: nil];
        [UIView setAnimationDuration: 0.5];
        
        [*_loadingIndicator setAlpha: 1.0];
        
        [UIView commitAnimations];
        
    }
    
}

static CGSize BoCPressMediaHomePage_LoopForEveryThumbnail(BoCPressMediaHomePage *self, 
                                                          NSMutableDictionary *_thumbnails,
                                                          BoCPressMediaHomePagePrivateHandler *_handler,
                                                          SEL selector)
{
    
    CGRect layoutSituation = CGRectMake(0, 0, 0, 0);
    CGRect bounds = [self bounds];
    
    //---NSInteger sectionCount = [self numberOfSections];
    NSInteger sectionCount = [_handler numberOfSectionsInView:self];
    
    NSUInteger sectionLooper = 0;
    while (sectionLooper < sectionCount)
    {
        
        NSInteger thumbnailCount = [_handler view:self numberOfRowsInSection:sectionLooper];
        
        NSUInteger thumbnailLooper = 0;
        while (thumbnailLooper < thumbnailCount)
        {
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForThumbnail: thumbnailLooper
                                                              inSection: sectionLooper];
            CGSize size = CGSizeMake(300, 69);
            if ([[self delegate] respondsToSelector: @selector(view:sizeForCellAtIndexPath:)])
            {
                size = [_handler view: self sizeForCellAtIndexPath: indexPath];
            }
            
            
            
            if (layoutSituation.origin.x + size.width >= bounds.origin.x + bounds.size.width)
            {
                
                CGRect frame = CGRectMake(0,
                                          layoutSituation.origin.y + layoutSituation.size.height, 
                                          size.width, 
                                          size.height);
                
                ((void (*)(id, SEL, NSIndexPath *, CGRect))[_handler methodForSelector: selector])(_handler, selector, indexPath, frame);
                
                layoutSituation.origin.x = bounds.origin.x + size.width;
                layoutSituation.origin.y += layoutSituation.size.height;
                layoutSituation.size.height = size.height;
            }
            else
            {
                
                CGRect frame = CGRectMake(layoutSituation.origin.x, 
                                          layoutSituation.origin.y, 
                                          size.width, 
                                          size.height);
                
                ((void (*)(id, SEL, NSIndexPath *, CGRect))[_handler methodForSelector: selector])(_handler, selector, indexPath, frame);
                
                layoutSituation.origin.x += size.width;
                if (layoutSituation.size.height < size.height)
                {
                    layoutSituation.size.height = size.height;
                }
            }
            
            
            ++thumbnailLooper;
        }
        
        ++sectionLooper;
    }
    
    return CGSizeMake(layoutSituation.origin.x + layoutSituation.size.width, layoutSituation.origin.y + layoutSituation.size.height);   
}
- (id)initWithDataSource: (id<BoCPressMediaHomeDataSource>)dataSource
{
    
    self = [super init];
    if (self)
    {
        
        _placer = [[UIView alloc] init];
        
        [self addSubview: _placer];
        
        _mediaHomeDataSource = [dataSource retain];
        
        _media = [[NSMutableDictionary alloc] init];
        
        _types = [[NSMutableArray alloc] init];
        
        _handler = [[BoCPressMediaHomePagePrivateHandler alloc] initWithHomePage: self
                                                                   forMediaTypes: _types
                                                              maximumToShowCount: [_mediaHomeDataSource countOfMediaPerTypeInHomeView]
                                                                         inMedia: _media];
        
        [self setBackgroundColor: [UIColor clearColor]];
        
        _dictionary = [[NSMutableDictionary alloc] init];
        
        _shadowView = [[UIView alloc] init];
        [self addSubview: _shadowView];
        
        UIImageView *contentShadow = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"BoCPressContentShadow"]];
        
        [_shadowView addSubview: contentShadow];
        
        [contentShadow release];
        //[_shadowView setFrame:CGRectMake(0, 0, 320, 44)];
        //[[self superview] addSubview:_shadowView];
        [self addSubview:_shadowView];
        
        _footerView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressMediaHomePageShadow"]];
        [self insertSubview: _footerView belowSubview: _placer];
        
        _emptySectionBackgroundView = [[UIView alloc] init];
        [_emptySectionBackgroundView addSubview: [[[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressMediaTabHomeCellBackground"]] autorelease]];
        [_emptySectionBackgroundView setHidden: YES];

        [self insertSubview: _emptySectionBackgroundView
               belowSubview: _placer];
        [_emptySectionBackgroundView release];
        
        
        [self setDelegate: _handler];
        [self reloadData];
        
        _animationInfo = nil;
        _dataUpdateCounter = 0;
        
        _timerForLoadingIndicator = nil;
        
        _userInfo = nil;
    }
    
    return self;
    
}

- (void)dealloc
{
    [_loadingIndicator release];
    
    [_placer release];
    
    [_mediaHomeDataSource release];
    [_types release];
    
    [_media release];
    
    [_handler release];
    
    [_shadowView release];
    [_footerView release];
    [_dictionary release];
    [_animationInfo release];
    
    [_userInfo release];
    
    [super dealloc];
    
}

- (void)willSwitchToOtherTab
{
    [self didUpdateData];
}

- (void)layoutSubviews
{
    CGFloat topMargin = 5;
    
    [super layoutSubviews];
    
    
    CGFloat top = topMargin;
    CGRect bounds = [self bounds];
    
    NSUInteger realSectionShown = 0;
    NSUInteger realSectionConsiderable = 0;
    BOOL needEmptyCell = NO;
    
    CGFloat sectionHeight = [_handler view:self heightForHeaderInSection:0];
    [_shadowView setFrame: CGRectMake(bounds.origin.x, bounds.origin.y, bounds.size.width, 0)]; 
    
    CGFloat firstCellBottom = bounds.origin.y;
    
    for (int i = 0; i < [_handler numberOfSectionsInView:self]; ++i)
    {
        
        CGFloat sectionTop = top;
        if ([_handler view:self numberOfRowsInSection:i] > 0)
        {
            top += sectionHeight;
            ++realSectionConsiderable;
        }
        
        BOOL cellShown = NO;
        for (int j = 0; j < [_handler view:self numberOfRowsInSection:i]; ++j)
        {
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow: j inSection: i];
            BoCPressMediaHomePageCell* cell = [_dictionary objectForKey: indexPath];
            
            CGFloat cellHeight = [_handler view:self heightForRowAtIndexPath:indexPath];
            
            if (((top + cellHeight > bounds.origin.y + topMargin) || 
                 ((j == [_handler view:self numberOfRowsInSection:i] - 1) && 
                  (top + cellHeight > bounds.origin.y))) && 
                (top < bounds.origin.y + bounds.size.height))
            {
                
                if (!cell)
                {
                    cell = [_handler view:self cellForRowAtIndexPath:indexPath];
                    [_dictionary setObject: cell forKey: indexPath];
                    [self insertSubview:cell belowSubview:_placer];
                }
                
                CGFloat cellTop = top;
                CGFloat cellRealHeight = cellHeight;
                
                if ((top < bounds.origin.y + topMargin) && (realSectionShown == 0))
                {
                    
                    cellRealHeight -= bounds.origin.y + topMargin - top;
                    if ((cellRealHeight < 10) && (j == [_handler view:self numberOfRowsInSection:i] - 1))
                    {
                        cellRealHeight = 10;
                    }
                    
                    cellTop += cellHeight - cellRealHeight;
                }
                
                if (cellRealHeight < 5)
                {
                    cellRealHeight = 0;
                }
                
                [cell setFrame: CGRectMake(bounds.origin.x, cellTop, bounds.size.width, cellRealHeight)];
                
                if (cellTop + cellRealHeight - bounds.origin.y < 10)
                {
                    firstCellBottom = cellTop + cellRealHeight;
                }
                
                cellShown = YES;
                
            }
            else
            {
                
                if (cell)
                {
                    //for animation, not remove the cell
                }
                
            }
            
            top += cellHeight;
            
        }
        
        NSIndexPath *sectionIndex = [NSIndexPath indexPathWithIndex: i];
        UIView *section = [_dictionary objectForKey: sectionIndex];
        if (cellShown || (((sectionTop >= bounds.origin.y) && 
                           (sectionTop < bounds.origin.y + bounds.size.height)) &&
                          ([_handler view:self numberOfRowsInSection:i] > 0)))
        {
            
            if (!section)
            {
                
                section = [_handler view:self viewForHeaderInSection: i];
                [_dictionary setObject: section forKey: sectionIndex];
                
                [self insertSubview:section aboveSubview:_placer];
                
            }
            
            if (sectionTop < bounds.origin.y + topMargin)
            {
                
                if (sectionHeight + bounds.origin.y >= top - 10 - topMargin)
                {
                    sectionTop = top - sectionHeight - 10;
                }
                else
                {
                    sectionTop = bounds.origin.y + topMargin;
                }
                
            }
            
            [section setFrame: CGRectMake(bounds.origin.x, sectionTop, bounds.size.width, sectionHeight)];
            
            if (sectionTop < bounds.origin.y)
            {
                needEmptyCell = YES;
            }
            
            if (needEmptyCell || ((realSectionShown == 0) && (realSectionConsiderable > 1)))
            {
                [_emptySectionBackgroundView setHidden: NO];
                [_emptySectionBackgroundView setFrame: CGRectMake(bounds.origin.x, 
                                                                  firstCellBottom, 
                                                                  bounds.size.width, 
                                                                  bounds.origin.y + 10 - firstCellBottom)];
            }
            else
            {
                [_emptySectionBackgroundView setHidden: YES];
            }
            
            ++realSectionShown;
            
        }
        else
        {
            if (section)
            {
                //for animation, not remove the section
            }
        }
        
    }
    
    if (realSectionShown)
    {
        [_footerView setHidden: NO];
        [_footerView setFrame: CGRectMake(bounds.origin.x, 
                                          top, 
                                          bounds.size.width, 
                                          15)];
    }
    else
    {
        [_footerView setHidden: YES];
    }
    
    [self setContentSize: CGSizeMake(bounds.size.width, top)];
    
}


#pragma mark - Page state

- (id<BoCPressPage>)lastPage
{
    return nil;
}

- (BOOL)couldNavigate
{
    return NO;
}

- (NSString *)pageTitle
{
    return @"影音";
}

- (BOOL)needNavigationBar
{
    return YES;
}

- (BOOL)needTabBar
{
    return YES;
}

- (BOOL)couldShowTimeOutAlertWithInfo:(NSDictionary *)info
{
    return YES;
}
- (void)willBrowseBackward
{
    [self didUpdateData];
    
    [_handler cancelAllCallback];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kViewController_couldBrowseBackward 
                                                        object:self 
                                                      userInfo:nil];
}

- (void)didBeenBackwardToWithInfo: (NSDictionary *)info
{
    [self setUserInteractionEnabled: YES];

    [_handler activeAllCallback];
        
}
- (void)wantToForceRefreshCurrentContentWithInfo:(id)animationInfo
{
    if(!_dataLoading)
    {    
        [self didUpdateData];
        
        [self wantToUpdateDataWithInfo:animationInfo];
    }
}


#pragma mark - Loading procedure
- (void)hideContentView
{
    CGRect frame = [self frame];
    if (_hasSetOriginFrame)
    {
        ;
    }else
    {
        _originFrame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
        _hasSetOriginFrame = YES;
    }
    frame.origin.y = - frame.size.height;
    [self setFrame:frame];
}

- (void)showContentView
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    
    [self setFrame:_originFrame];
    
    [UIView commitAnimations];
}

- (void)wantToUpdateDataWithInfo:(id)animationInfo
{
    
    if (!_dataLoading)
    {
        BoCPressMediaHomePage_ShowLoadingIndicator(self, &_dataLoading, &_loadingIndicator);
        
        [_animationInfo release];
        
        _animationInfo = [animationInfo retain];
        
        if ([[_animationInfo objectForKey:kBoCPress_Global_AnimationType] isEqual:kBoCPress_View_AnimationTypeTopToBottom]) 
        {
            [self hideContentView];
            
        }
        
        [_timerForLoadingIndicator invalidate];
        [_timerForLoadingIndicator release];
        _timerForLoadingIndicator = [[NSTimer scheduledTimerWithTimeInterval:kBoCPress_Global_MinTimerIntervalForLoadingIndicator                                       
                                                                      target:self 
                                                                    selector:@selector(stopTimerOfLoadingIndicator:) 
                                                                    userInfo:nil 
                                                                     repeats:NO] retain];
        _couldHideLoadingIndicator = NO;
        
        [_mediaHomeDataSource listOrderedMediaTypesWithCallback: _handler];
        
    }
    
}


- (void)stopTimerOfLoadingIndicator: (NSTimer*)timer
{
    if (_couldHideLoadingIndicator)
    {
        [self didUpdateData];
    }else
    {
        _couldHideLoadingIndicator = YES;
    }
}

- (void)wantToFinishDataUpdate
{
    if (_couldHideLoadingIndicator)
    {
        [self didUpdateData];
    }else
    {
        _couldHideLoadingIndicator = YES;
    }
}
- (void)didUpdateData
{
    [self setUserInteractionEnabled: YES];

    _dataLoading = NO;
    
    [_loadingIndicator setAlpha: 0];
    
    _couldHideLoadingIndicator = NO;
    [[NSNotificationCenter defaultCenter] postNotificationName:kBoCPress_View_didUpdateDataOfCurrentPage object:self userInfo:nil];
    
}


- (void)updateTypes: (NSArray *)types
{
    //    NSLog(@"update types in mediaHomePage");
    if ([types count] > 0)
    {
        
        id<BoCPressMediaType> type = nil;
        for (type in _types)
        {
            if ([types indexOfObject: type] == NSNotFound)
            {
                [_media removeObjectForKey: [type identity]];
            }
        }
        
        [_types removeAllObjects];
        
        for (type in types)
        {
            
            [_types addObject: type];
        }
        
        type = [types objectAtIndex:0];
        
        [_mediaHomeDataSource listOrderedMediaOfType: type
                                        withCallback: _handler];            
        
    }else
    {
        [self didUpdateData];
    }
}

- (void)updateMediaArraySlice: (BoCPressMediaArraySlice *)slice
{
    //NSLog(@"update media data");
    id<BoCPressMediaType> mediaType = [slice mediaType];
    
    NSMutableArray *mediaList = [_media objectForKey: [mediaType identity]];
    if (!mediaList)
    {
        mediaList = [NSMutableArray array];
        [_media setObject: mediaList forKey: [mediaType identity]];
    }
    
    [mediaList updateWithArraySlice: slice];
    
    ++_dataUpdateCounter;
    
    if (_dataUpdateCounter == [_types count])
    {
        
        _dataUpdateCounter = 0;
        
        [self reloadData];
        
        [self wantToFinishDataUpdate];
        
        if ([[_animationInfo objectForKey:kBoCPress_Global_AnimationType] isEqual:kBoCPress_View_AnimationTypeTopToBottom])
        {
            [self showContentView];
            
        }
        
    }else
    {
        id<BoCPressMediaType> type = [_types objectAtIndex:_dataUpdateCounter];
        [_mediaHomeDataSource listOrderedMediaOfType:type
                                        withCallback:_handler];
    }
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)reloadData
{
    
    NSIndexPath *indexPath = nil;
    for (indexPath in _dictionary)
    {
        [[_dictionary objectForKey: indexPath] removeFromSuperview];
    }
    
    [_dictionary removeAllObjects];    
    
    [self setNeedsLayout];
    
}

- (BoCPressMediaHomePageCell*) cellForRowAtIndexPath: (NSIndexPath*) indexPath
{
    return (BoCPressMediaHomePageCell*)[_dictionary objectForKey:indexPath];
}

- (NSIndexPath*)indexOfCell: (UIView*) cell
{
    for (id keyLooper in [_dictionary allKeys])
    {
        if ([cell isEqual:[_dictionary objectForKey:keyLooper]])
        {
            return keyLooper;
        }
    }
    
    return nil;
}

- (id<BoCPressMediaHomeDataSource>)dataSource
{
    return _mediaHomeDataSource;
}

- (id)identity
{
    return @"mediaHomePage";
}



- (void)beforeRefetchConfiguration
{
    BoCPressMediaHomePage_ShowLoadingIndicator(self, &_dataLoading, &_loadingIndicator);
}

- (void)clearCurrentPageAfterNetworkTimeOutWithInfo:(NSDictionary *)info
{
    [self didUpdateData];
}

- (BOOL)shouldRefetchConfigurationAtCurrentContext
{
    return YES;
}

- (void)willShowContentOfMediaInCellWithData: (NSDictionary *)data
{
    NSIndexPath *selectedIndexPath = [data objectForKey: kBoCPress_Global_Index];
    id<BoCPressMediaType> type = [_types objectAtIndex: [selectedIndexPath section]];
    
    id<BoCPressMedia> media = [[_media objectForKey: [type identity]] objectAtIndex: [_selectedIndexPath row]];
    
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                              type, kType_Global_MediaTypeObject,
                              media, kType_Global_MediaObject, 
                              nil];
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_wantToPlayMedia 
                                                        object: self 
                                                      userInfo: userInfo];
}


- (void)wantToShowContentOfMediaInCell:(UIView *)tapedCell
{
    
    [(UITableViewCell*)tapedCell setSelected:YES];
    
    [_selectedIndexPath release];
    _selectedIndexPath = [[self indexOfCell: tapedCell] retain];

    id<BoCPressMediaType> type = [_types objectAtIndex: [_selectedIndexPath section]];
    
    id<BoCPressMedia> media = [[_media objectForKey: [type identity]] objectAtIndex: [_selectedIndexPath row]];
    
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                              type, kType_Global_MediaTypeObject,
                              media, kType_Global_MediaObject, 
                              nil];
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_wantToPlayMedia 
                                                        object: self 
                                                      userInfo: userInfo];

}

- (NSArray *)supportedInterfaceOrientations
{
    return [NSArray arrayWithObject: [NSNumber numberWithInt: UIInterfaceOrientationPortrait]];
}

- (void)attachCallbackInfo: (NSDictionary *)callbackInfo
                   forType: (NSString *)type
{
    
}

- (BOOL)respondsToRemoteNotification: (NSDictionary *)info
{
    NSDictionary *aps = [info objectForKey: @"aps"];
    NSString *alertMessage = [aps objectForKey: @"alert"];
    
    UIAlertView *alertForRemoteNotification = [[UIAlertView alloc] initWithTitle: @"提示"
                                                                         message: alertMessage 
                                                                        delegate: self
                                                               cancelButtonTitle: @"查看"
                                                               otherButtonTitles: @"取消", nil];
    [alertForRemoteNotification show];
    [alertForRemoteNotification release];
    return YES;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        [[[[[UIApplication sharedApplication] delegate] window] rootViewController] dismissModalViewControllerAnimated: YES];
        
        [[NSNotificationCenter defaultCenter] postNotificationName: kNotification_ViewController_wantToNavigateToServerPushNotificationCenter
                                                            object: self
                                                          userInfo: nil];
    }
}

- (void)didReceivedErrorFromServerWithInfo: (NSDictionary *)info
{
    [self didUpdateData];
}

- (void)didCancelledHandleErrorOfServerWithData: (NSDictionary *)info
{
    
}

- (void)willHandleErrorOfServerWithData: (NSDictionary *)info
{
    
}

- (void)didBeenSlideToWithInfo:(NSDictionary *)info
{
    [self wantToUpdateDataWithInfo: info];
}

@end
