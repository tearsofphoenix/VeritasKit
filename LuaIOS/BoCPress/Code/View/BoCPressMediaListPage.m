#import "BoCPressMediaListPage.h"

#import "BoCPressMediaListDataSource.h"

#import "BocPressMediaType.h"

#import "BoCPressColumnBarView.h"

#import "BoCPressColumn.h"

#import "BoCPressMediaListPagePrivateHandler.h"

#import "BoCPressMediaArraySlice.h"

#import "BoCPressMediaTagColumn.h"

#import "NSMutableArray+UniqueSliceSupported.h"

#import "UIView+LoadingIndicatorView.h"

#import "BoCPressMedia.h"

#import "BoCPressImageView.h"

#import "BoCPressConstant.h"

#import "BoCPressUpdateArrowTableView.h"

#import "BoCPressUpdateArrowTableView.h"

#import "BoCPressMediaTagColumn.h"

#import "BoCPressAlertView.h"

#import "BoCPressViewConstants.h"


@implementation BoCPressMediaListPage

#pragma mark - Instance initialization

- (id)initWithLastPage: (id<BoCPressPage>)lastPage
            dataSource: (id<BoCPressMediaListDataSource>)listDataSource
{
    
    self = [super init];
    if (self)
    {
        
        [self setLastPage: lastPage];
        
        _listDataSource = [listDataSource retain];
        
        _columns = [[NSMutableArray alloc] init];
        
        _medias = [[NSMutableDictionary alloc] init];
        
        _handler = [[BoCPressMediaListPagePrivateHandler alloc] initWithListPage: self
                                                                       inColumns: _columns
                                                                         ofMedia: _medias];
        
        
        
        
        _broadcastTitleView = [[UILabel alloc] init];
        [_broadcastTitleView setBackgroundColor: [UIColor clearColor]];
        
        
        
        _contentView = [[BoCPressUpdateArrowTableView alloc] initWithSuperPage:self];
        [_contentView setFrame: CGRectMake(0, 0, 320, 480-20)];
        [_contentView setAlpha: 0.0];
        [_contentView setSeparatorStyle: UITableViewCellSeparatorStyleNone];
        [_contentView setBackgroundColor: [UIColor clearColor]];
        [_contentView setDelegate: (BoCPressMediaListPagePrivateHandler*)_handler];
        [_contentView setDataSource: (BoCPressMediaListPagePrivateHandler*)_handler];
        [self addSubview:_contentView];
        
        _broadcastView = [[UIView alloc] init];
        [_broadcastView setFrame: CGRectMake(0, -103, 320, 103)];
        [_broadcastView setAlpha: 0.0];
        
        _broadcastLivingView = [[UIView alloc] init];
        [_broadcastLivingView setFrame:CGRectMake(0, 0, 320, 67)];
        [_broadcastLivingView addSubview:[[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BoCPressMediaTabBroadcast"]] autorelease]];
        
        
        UITapGestureRecognizer *recognizer = [[[UITapGestureRecognizer alloc] initWithTarget: _handler action: @selector(handleTapGestureOfBroadcast:)] autorelease];
        
        [_broadcastLivingView addGestureRecognizer: recognizer];
        
        [_broadcastView addSubview:_broadcastLivingView];
        
        _broadcastMenuImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BoCPressMediaTabBroadcastMenu"]];
        [_broadcastMenuImageView setFrame:CGRectMake(0, 67, 320, 36)];
        
        [_broadcastView addSubview:_broadcastMenuImageView];
        
        [self addSubview: _broadcastView];
        [_broadcastView setAlpha:0];
        
        _columnBar = [[BoCPressColumnBarView alloc] init];
        [_columnBar setColumnDelegate: (BoCPressMediaListPagePrivateHandler*)_handler];        
        [_columnBar setFrame: CGRectMake(0, -35, 320, 35)];   
        [self addSubview: _columnBar];
        [self bringSubviewToFront:_columnBar];
        
        _animationInfo = nil;

        _couldHideLoadingIndicator = NO;
        _hasSetOriginFrame = NO;
        
    }
    
    return self;
    
}

#pragma mark - Memory management

- (void)dealloc
{
    

    [_columnBar release];
    [_handler release];
    [_medias release];
    [_columns release];
    [_listDataSource release];
    [_broadcastView release];
    [_broadcastTitleView release];
    [_broadcastThumbnailView release];
    [_broadcastMenuImageView release];
    [_broadcastLivingView release];
    
    [_contentView setSuperPage:nil];
    
    [_contentView release];
    [_animationInfo release];
    [_userInfo release];

    [super dealloc];
}

#pragma mark - Page parameters

- (NSString *)pageTitle
{
    return [[_listDataSource mediaType] name];
}

- (BOOL)needNavigationBar
{
    return YES;
}

- (id<BoCPressMediaType>)mediaType
{
    return [_listDataSource mediaType];
}

- (void)wantToForceRefreshCurrentContentWithInfo:(id)animationInfo
{
    if(!_dataLoading)
    {
        NSLog(@"%@", animationInfo);
        
        [_handler activeAllCallback];
        [self setUserInteractionEnabled: YES];

        [self didUpdateData];
        [self wantToReloadColumns];
        [self wantToUpdateContentDataWithInfo: animationInfo];
        
    }
}

-(void)didBeenBackwardToWithInfo:(NSDictionary *)info
{
    [self setUserInteractionEnabled: YES];

    [_handler activeAllCallback];
    [[_contentView cellForRowAtIndexPath:[_contentView indexPathForSelectedRow]] setSelected:NO];
    [_contentView reloadData];
}



#pragma mark - Data updating

- (void)hideContentView
{
    CGRect frame = [_contentView frame];
    if (_hasSetOriginFrame)
    {
        ;
    }else
    {
        _originFrameOfContentView = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
        _hasSetOriginFrame = YES;
    }
    frame.origin.y = - frame.size.height;
    [_contentView setFrame:frame];
}

- (void)showContentView
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    _originFrameOfContentView.origin.y = [_columnBar frame].origin.y + [_columnBar frame].size.height;
    _originFrameOfContentView.size.height = [self bounds].size.height - [_columnBar frame].size.height;
    [_contentView setFrame:_originFrameOfContentView];
    
    [UIView commitAnimations];
}


- (void)wantToUpdateDataWithInfo:(id)info
{    
    [self setUserInteractionEnabled: YES];

    [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                onsuperView: NO];
    
    [_listDataSource listOrderedMediaTagsWithCallback: _handler];
}

- (void)wantToUpdateContentDataWithInfo: (id)animationInfo
{
    
    if (_animationInfo != animationInfo)
    {

        [_animationInfo release];
        _animationInfo = [animationInfo retain];
    }
     
    [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                        onsuperView: NO];
    
    id<BoCPressColumn> currentColumn = [self currentColumn];
    if ([[currentColumn identity] isEqual:kBroadCastColumnID])
    {
        [_broadcastView setAlpha:1];
        if ([[_animationInfo objectForKey:kBoCPress_Global_AnimationType] isEqual:kBoCPress_View_AnimationTypeTopToBottom]) 
        {
            
            CGRect broadCastFrame = [_broadcastView frame];
            CGRect contentViewFrame = [_contentView frame];
            
            [_contentView setFrame:CGRectMake(0, -broadCastFrame.origin.y - broadCastFrame.size.height, contentViewFrame.size.width, contentViewFrame.size.height)];
        }
        [_listDataSource currentBroadCastWithCallback:_handler];
        
        [_listDataSource listOrderedBroadCastForcastWithCallback:_handler];
        
        
        
    }else
    {
        if ([[_animationInfo objectForKey:kBoCPress_Global_AnimationType] isEqual:kBoCPress_View_AnimationTypeTopToBottom]) 
        {
            [self hideContentView];
        }
        
        [_listDataSource listOrderedMediaWithTag: [_columns objectAtIndex: [_columnBar currentColumnIndex]] 
                                       rangeFrom: 0 
                                         rangeTo: [currentColumn fetchSize]
                                        callback: _handler];
        
        
    }
}

- (void)willUpdateMoreDataForCurrentColumn
{
    [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                onsuperView: NO];
    
    BoCPressMediaTagColumn*  currentColumn = [self currentColumn];
    NSArray *currnetMediaArray = [_medias objectForKey: [currentColumn identity]];
    
    [_listDataSource listOrderedMediaWithTag: currentColumn 
                                   rangeFrom: [currnetMediaArray count] 
                                     rangeTo: [currnetMediaArray count] + [currentColumn fetchMoreSize] 
                                    callback: _handler];
}

- (void)wantToUpdateMoreDataOfColumn:(BoCPressMediaTagColumn* )column
{
    [self willUpdateMoreDataForCurrentColumn];
}

- (void)updateColumns:(NSArray *)columns
{
    
    [UIView animateWithDuration: 0.5
                     animations: (^{
                                [_columnBar setFrame: CGRectMake(0, 0, 320, 35)];   
                                [_contentView setAlpha: 1.0];
                                [_broadcastView setAlpha: 1.0];
                     })];

    [_columnBar clearColumns];
    [_columns removeAllObjects];
    
    id<BoCPressColumn> column = nil;
    for (column in columns)
    {
        [_columnBar addColumn: column];
        [_columns addObject: column];
    }
    
    if ([_columnBar currentColumnIndex] > [_columns count])
    {
        [_columnBar switchToColumn: [_columns objectAtIndex: 0]];
    }
    
}

- (void)updateContentForColumn: (BoCPressMediaArraySlice *)slice
{
    if ([slice countInSlice] > 0)
    {
        
        NSMutableArray *media = [_medias objectForKey: [[slice mediaTag] identity]];
        if (!media)
        {
            media = [[[NSMutableArray alloc] init] autorelease];
            [_medias setObject: media forKey: [[slice mediaTag] identity]];
        }
        
        [media updateWithArraySlice: slice];
        
        [_contentView reloadData];
        
        if (![[[self currentColumn] name] isEqualToString: @"直播"])
        {    
            [_broadcastView setAlpha:0];
        }
        
        [self wantToFinishDataUpdate];
        
        if ([[_animationInfo objectForKey:kBoCPress_Global_AnimationType] isEqual:kBoCPress_View_AnimationTypeTopToBottom])
        {
            [self showContentView];
        }
        [_animationInfo release];
        _animationInfo = nil;
    }else
    {
        [self wantToFinishDataUpdate];
    }
}

#pragma mark - Broad cast

- (void)updateCurrentBroadCast:(id)data
{
    if (data)
    {
        
        [_broadcastTitleView setText:nil];
        
        [_broadcastTitleView setText: [data name]];
        [_broadcastTitleView setFrame: CGRectMake(90, 25, 200, 15)];
        [_broadcastTitleView setTextColor: [UIColor colorWithRed:182.0/255 green:47.0/255 blue:29.0/255 alpha: 1.0]];
        [_broadcastView addSubview: _broadcastTitleView];
        
        BoCPressMedia *media = (BoCPressMedia*)data;
        
        UIImage *image = [_listDataSource getAvatarWithImageInfo:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                  [media thumbnailImageURL], kBoCPress_Global_NSURLObject,
                                                                  [(id<NSIdentifiedObject>)media identity], @"imageID",  nil] withCallback:_handler];
        
        _broadcastThumbnailView = [[UIImageView alloc] init];
        
        [_broadcastThumbnailView setImage:image];
        
        if (image)
        {
            [_broadcastThumbnailView setImage:image];
        }else
        {
            [_broadcastThumbnailView setImage:[UIImage imageNamed:@"BoCPressDefaultImage"]];
        }
        
        [_broadcastThumbnailView setFrame: CGRectMake(8, 6, 75, 56)];
        
        [_broadcastView addSubview: _broadcastThumbnailView];
    }else
    {
        [self wantToFinishDataUpdate];
    }
}

- (void)playInitializationAnimation
{
    
    if ([[[self currentColumn] name] isEqualToString: @"直播"])
    {
        CGRect frame = [_contentView frame];
        
        CGFloat origin_Y = frame.origin.y;
        
        frame.origin.y = -frame.size.height + [_broadcastView frame].size.height;
        
        CGRect broadCastOriginFrame = [_broadcastView frame];
        
        CGRect hideFrameForBroadCastView = CGRectMake(broadCastOriginFrame.origin.x, -broadCastOriginFrame.size.height-frame.size.height, broadCastOriginFrame.size.width, broadCastOriginFrame.size.height);
        
        float origin_Y_OfBroadCastView = broadCastOriginFrame.origin.y;
        //hide the tableView first
        //
        [_contentView setFrame:frame];
        [_broadcastView setFrame:hideFrameForBroadCastView];
        
        //show the tabView
        //
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        
        frame.origin.y = origin_Y;
        broadCastOriginFrame.origin.y = origin_Y_OfBroadCastView;
        
        [_broadcastView setFrame:broadCastOriginFrame];
        [_contentView setFrame:frame];
        
        [UIView commitAnimations];
        
    }else
    {
        CGRect frame = [_contentView frame];
        
        CGFloat origin_Y = frame.origin.y;
        
        frame.origin.y = -frame.size.height - [_columnBar frame].size.height;
        
        //hide the tableView first
        //
        [_contentView setFrame:frame];
        
        
        //show the tabView
        //
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        frame.origin.y = origin_Y;
        [_contentView setFrame:frame];
        [UIView commitAnimations];
    }
}

- (void)updateBroadCastColumn: (BoCPressMediaArraySlice *)slice
{
    [UIView beginAnimations: nil context: nil];
    [UIView setAnimationDuration: 0.5];
    [_broadcastView setFrame: CGRectMake(0, 35, 320, 103)];
    
    [_contentView setFrame: CGRectMake(0, [_broadcastView frame].origin.y + [_broadcastView frame].size.height, 320, [self bounds].size.height - 138)];
    [UIView commitAnimations];
    
    if ([slice countInSlice] > 0)
    {
        
        NSMutableArray *media = [[[NSMutableArray alloc] init] autorelease];
        
        [media updateWithArraySlice: slice];
        
        [_medias setObject: media forKey: kBroadCastColumnID];
        
        
        [_contentView reloadData];
        
        [self wantToFinishDataUpdate];
        
        if ([[_animationInfo objectForKey:kBoCPress_Global_AnimationType] isEqual:kBoCPress_View_AnimationTypeTopToBottom])
        {
            
            [self playInitializationAnimation];
        }
    }else
    {
        [self wantToFinishDataUpdate];
    }
    
}

#pragma mark - Column settings

- (BoCPressMediaTagColumn* )currentColumn
{
    
    NSUInteger currentIndex = [_columnBar currentColumnIndex];
    if (currentIndex < [_columns count])
    {
        return [_columns objectAtIndex: currentIndex];
    }
    else
    {
        return nil;
    }
    
}

- (void)updateBroadCastThumbnailImage: (id)data
{
    if (data)
    {        
        UIImage *image = [UIImage imageWithData: [data objectForKey: @"data"]];
        [_broadcastThumbnailView setImage: image];
    }
}

- (id<BoCPressMediaListDataSource>)dataSource
{
    return _listDataSource;
}

- (id)identity
{
    return [(id<NSIdentifiedObject>)[self currentColumn] identity];
}

- (void)wantToReloadColumns
{
    [_listDataSource reloadColumnsWithCallback:_handler];
}

- (void)reloadColumnsWithData: (id)columns
{
    if (columns)
    {
        
        NSUInteger currentColumnIndex = [_columnBar currentColumnIndex];
        
        [_columnBar clearColumns];
        [_columns removeAllObjects];
        
        id<BoCPressColumn> column = nil;
        for (column in columns)
        {
            [_columnBar addColumn: column];
            [_columns addObject: column];
        }
        
        
        [_columnBar setCurrentColumnIndex:currentColumnIndex];
        
    }
}

- (NSTimeInterval)lastUpdateTimeInterval
{
    return [_listDataSource lastUpdateTimeIntervalWithColumnID:[(id<NSIdentifiedObject>)[self currentColumn] identity ]];
}

- (void)wantToShowContentOfMediaAtIndex: (NSUInteger)index
{
    [self setUserInteractionEnabled: NO];

    _indexOfSelectedCell = index;
    BoCPressMediaTagColumn *currentColumn = [self currentColumn];
    id<BoCPressMedia> media = [[_medias objectForKey:[currentColumn identity]] objectAtIndex: _indexOfSelectedCell];

    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  media, kType_Global_MediaObject,
                                  [self mediaType], kType_Global_MediaTypeObject,
                                  _handler, kNetwork_CallbackObject,
                                  nil];

    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_wantToPlayMedia 
                                                        object: self 
                                                      userInfo: callbackInfo];

    [callbackInfo release];
    
}


@end
