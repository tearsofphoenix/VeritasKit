#import "BoCPressMediaListPagePrivateHandler.h"

#import "BoCPressMediaListPage.h"

#import "BoCPressColumn.h"
#import "BoCPressColumnBarView.h"

#import "BoCPressMediaTagColumn.h"

#import "BoCPressMedia.h"

#import "BoCPressMediaTagColumn.h"

#import "BoCPressImageView.h"

#import "BoCPressConstant.h"

#import "NSArraySlice.h"

#import "BoCPressMediaListPageCell.h"

#import "BoCPressMediaArraySlice.h"

#import "BoCPressBroadCastCell.h"

#import "NSDate+getStringOfYearMonthDay.h"

#import "BoCPressMoreCell.h"

#import "BoCPressViewConstants.h"


@implementation BoCPressMediaListPagePrivateHandler

#pragma mark - Instance initialization

- (id)initWithListPage: (BoCPressMediaListPage *)page
             inColumns: (NSArray *)columns
               ofMedia: (NSDictionary *)media
{
    
    self = [super init];
    if (self)
    {
        _page = page;
        _columns = columns;
        _media = media;
        _broadCastDates = [[NSMutableArray alloc] init];
        _broadCastData = [[NSMutableDictionary alloc] init];
        
        _hasMoreContentDictionary = [[NSMutableDictionary alloc] init];
        _currentBroadCast = nil;
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(notificationForFinishedPlayingMedia:)
                                                     name:kMediaPlayer_didBeenDismissed
                                                   object:nil];
    }
    
    return self;
    
}

- (void)dealloc
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_hasMoreContentDictionary release];
    [_broadCastDates release];
    [_broadCastData release];
    [_currentBroadCast release];
    [super dealloc];
    
}

#pragma mark - Data source callback

- (void)callbackForAction: (id)action
                 withData: (id)data
{
    if(_callbackFlag)
    {
        
        if ([kCallbackAction_listOrderedMediaTagsInType isEqualToString: action])
        {
            [self initMoreCellFlagForColumns:data];
            
            [_page updateColumns: data];        
        }
        else if ([kCallbackAction_listOrderedMediaWithTag isEqualToString: action])
        {
            [self updateMoreCellFlagForColumns:data];
            
            [_page updateContentForColumn: data];        
            
        }else if ([kCallbackAction_listOrderedBroadCastForcast isEqualToString: action])
        {
            [self updateBroadCastSectionWithData: data];
            
            [_page updateBroadCastColumn: data];
            
        }else if([kCallbackAction_currentBroadCastWithCallback isEqualToString:action])
        {
            [_currentBroadCast release];
            
            _currentBroadCast = [data  retain];
            
            [_page updateCurrentBroadCast:data];
            
        }else if([kBoCPress_View_updateThumbnailImage isEqualToString:action])
        {
            [_page updateBroadCastThumbnailImage:data];
            
        }else if([kCallbackAction_reloadColumnsWithTag isEqualToString:action])
        {
            [_page reloadColumnsWithData:data];
            
        }else if ([kCallbackAction_tryWithPreviousCallbackActionAgainAfterServerError isEqualToString: action])
        {
            NSString *previousCallbackAction = [data objectForKey: kNetwork_CallbackStoredCallbackInfo];
            if ( [previousCallbackAction isEqualToString: kCallbackAction_listOrderedMediaOfType])
            {
                [_page didUpdateData];
                NSDictionary * animationInfo = [[NSDictionary alloc] initWithObjectsAndKeys: 
                                                kBoCPress_View_AnimationTypeTopToBottom, 
                                                kBoCPress_Global_AnimationType, nil];
                [_page wantToUpdateDataWithInfo: animationInfo];
                [animationInfo release];
            }
        }
    }
    
}

#pragma mark - Table data source

- (NSInteger)numberOfSectionsInTableView: (UITableView *)tableView
{
    
    if ([[[_page currentColumn] identity] isEqual:kBroadCastColumnID])
    {
        //return [[_broadCastData allKeys] count];
        return [_broadCastDates count];
    }
    
    else
    {
        return 1;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSUInteger currentColumnIndex = [_columns indexOfObject: [_page currentColumn]];
    
    if (currentColumnIndex < [_columns count])
    {
        id columID = [[_page currentColumn] identity];
        
        if ([columID isEqual:kBroadCastColumnID])
        {
            //broad cast
            //
            // return [_broadCastDates count];
            //NSLog(@"count in section is:%d",[[_broadCastData objectForKey:[_broadCastDates objectAtIndex:section]] count]);
            
            return [[_broadCastData objectForKey:[_broadCastDates objectAtIndex:section]] count];
            
        }else
        {
            if ([[_hasMoreContentDictionary objectForKey:columID] boolValue]) 
            {
                //has the "moreCell"
                //
                return [[_media objectForKey:columID] count] + 1;
            }else
            {
                //does not has "moreCell"
                //
                return [[_media objectForKey:columID ] count];
            }
        }
        
    }
    else
    {
        return 0;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    BoCPressMediaTagColumn *column = [_page currentColumn];
    
    if ([[column name] isEqualToString: @"直播"])
    {
        NSUInteger sectionIndex = [indexPath indexAtPosition:0];
        NSUInteger cellIndex = 0;
        for (int iSectionLooper=0; iSectionLooper<sectionIndex; ++iSectionLooper)
        {
            cellIndex += [self tableView:tableView numberOfRowsInSection:iSectionLooper];
        }
        
        cellIndex += [indexPath indexAtPosition: 1];
        id<BoCPressMedia> media = [[_media objectForKey: [column identity]] objectAtIndex: cellIndex];
        
        //UITableViewCell *cell = [[[UITableViewCell alloc] init] autorelease];
        BoCPressBroadCastCell *cell = [[[BoCPressBroadCastCell alloc] init] autorelease];
        
        [cell setBackgroundView: [[[UIImageView alloc] initWithImage: [UIImage imageNamed:@"BoCPressMediaTabBroadcastCellBackground"]] autorelease]];
        
        UILabel *label = [[[UILabel alloc] initWithFrame: CGRectMake(10, 12, 300, 15)] autorelease];
        
        NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
        [formatter setDateFormat: @"HH:mm"];
        
        [label setText:[NSString stringWithFormat:@"%@ %@",[formatter stringFromDate: [media postTime]],[media name]]];
        [label setBackgroundColor: [UIColor clearColor]];
        [label setFont: [UIFont fontWithName: @"Helvetica" size:15]];
        [cell addSubview: label];
        
        return cell;
        
    }else
    {
        if ([indexPath indexAtPosition:1] < [[_media objectForKey: [column identity]] count])
        {
          id<BoCPressMedia>  media = [[_media objectForKey: [column identity]] objectAtIndex: [indexPath indexAtPosition: 1]];            
            BoCPressMediaListPageCell *cell = [[[BoCPressMediaListPageCell alloc] initWithMedia:media] autorelease];
            return cell;
        }else
        {
            //has more cell            
            BoCPressMoreCell *cell = [[[BoCPressMoreCell alloc] init] autorelease];
                        
            return cell;
        }
    }
    
}

- (CGFloat)tableView: (UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    BoCPressMediaTagColumn *column = [_page currentColumn];
    if ([[column name] isEqualToString: @"直播"])
    {
        return 22.0;
    }else
    {
        return 0.0;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    BoCPressMediaTagColumn *column = [_page currentColumn];
    
    if ([[column name] isEqualToString: @"直播"])
    {
        return 36.5;
    }
    else
    {
        if ([indexPath indexAtPosition:1] < [[_media objectForKey: [column identity]] count])
        {
            
            return 68.5;
            
        }else
        {
            //has more cell
            return 41;
        }
    }
    
}


- (UIView *)tableView: (UITableView *)tableView viewForHeaderInSection: (NSInteger)section
{
    if ( [[[_page currentColumn] identity] isEqual:kBroadCastColumnID])
    {
        
        
        
        UIView *view = [[[UIView alloc] init] autorelease];
        
        UILabel *sectionLabel = [[[UILabel alloc] init] autorelease];
        [sectionLabel setBackgroundColor:[UIColor colorWithRed:162.0 / 255
                                                         green:162.0/255 
                                                          blue:162.0/255 
                                                         alpha:1.0]];
        
        [sectionLabel setFrame:CGRectMake(0, 0, 320, 22)];
        [sectionLabel setTextAlignment:UITextAlignmentCenter];
        
        if (_broadCastDates )
        {
            
            [sectionLabel setText:[NSString stringWithFormat:@"%@", [_broadCastDates objectAtIndex:section]]];
        }
        
        [view addSubview: sectionLabel];
        
        return view;
        
    }
    else
    {
        //        return nil;
        UIView *nilView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)] autorelease];
        
        return nilView;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[tableView cellForRowAtIndexPath: indexPath] setSelected: NO];
 
    BoCPressMediaTagColumn *column = [_page currentColumn];
    
    if ([[column name] isEqualToString: @"直播"])
    {
        
    }else
    {
        NSUInteger index = [indexPath indexAtPosition:1];
        if (index < [[_media objectForKey: [column identity]] count])
        {
            [_page wantToShowContentOfMediaAtIndex: index];
        }else
        {
            [_page wantToUpdateMoreDataOfColumn:column];
        }
        
    }
    
}

- (void)handleTapGestureOfBroadcast: (UIGestureRecognizer *)recognizer
{
    
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                              _currentBroadCast, kType_Global_MediaObject, 
                              [_page mediaType], kType_Global_MediaTypeObject,
                              nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_wantToPlayMedia 
                                                        object: self 
                                                      userInfo: userInfo];
}

#pragma mark - Column delegate

- (void)didColumnSwitchTo: (id<BoCPressColumn>)column
{
    [_page wantToUpdateContentDataWithInfo:[NSDictionary dictionaryWithObjectsAndKeys:
                                            kBoCPress_View_AnimationTypeTopToBottom, kBoCPress_Global_AnimationType,
                                            nil]];
}

- (void)didMoreColumnsSelected
{
    ;
}


-(void)updateBroadCastSectionWithData: (id)data
{
    
    [_broadCastData removeAllObjects];
    [_broadCastDates removeAllObjects];
    
    
    for (int iLooper=0; iLooper<[(NSArraySlice *)data countInSlice]; ++iLooper)
    {
        id<BoCPressMedia> mediaLooper = [(BoCPressMediaArraySlice*)data objectAtIndex:iLooper];
        
        
        id dateOfCurrentMediaLooper  = [[mediaLooper postTime] getStringOfYearMonthDay];
        
        //        NSLog(@"date is:%@", dateOfCurrentMediaLooper);
        //NSLog(@"date is:%@", [mediaLooper postTime]); 
        if ([_broadCastDates indexOfObject:dateOfCurrentMediaLooper] == NSNotFound)
        {
            [_broadCastDates addObject:dateOfCurrentMediaLooper];
        }
    }
    
    for (id dateLooper in _broadCastDates)
    {
        [_broadCastData setObject:[[[NSMutableArray alloc] init] autorelease] forKey:dateLooper];
    }
    
    for (int jLooper=0; jLooper<[(NSArraySlice *)data countInSlice]; ++jLooper)
    {
        id<BoCPressMedia> mediaLooper = [(BoCPressMediaArraySlice*)data objectAtIndex:jLooper];
        
        id dateOfCurrentMediaLooper  = [[mediaLooper postTime] getStringOfYearMonthDay];
        
        [[_broadCastData objectForKey:dateOfCurrentMediaLooper] addObject:mediaLooper];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
    if ([scrollView contentOffset].y < -41)
    {
        [_page wantToUpdateContentDataWithInfo:nil];
    }
    
}

#pragma mark - deal "More Cell"

- (void)initMoreCellFlagForColumns: (NSArray *)columns
{
    for (id<NSIdentifiedObject> columnLooper in columns)
    {
        [_hasMoreContentDictionary setObject:[NSNumber numberWithBool:NO] forKey:[columnLooper identity]];
        
    }
}

- (void)updateMoreCellFlagForColumns: (BoCPressMediaArraySlice*)slice
{
    //    if ([slice count] != kArraySliceMaxCount || [slice countInSlice] == 0)
    if ([[slice userInfo] isEqual:kSoapXMLParser_HasNextFalse])
    {
        
        id columnID = [[slice mediaTag] identity];
        
        [_hasMoreContentDictionary setObject:[NSNumber numberWithBool:NO] forKey:columnID];
        
    }else
    {
        id columnID = [[slice mediaTag] identity];
        
        //        if ([[_hasMoreContentDictionary objectForKey:columnID] boolValue])
        if ([slice countInSlice] <= [[_media objectForKey:columnID] count]) 
        {
            //if has no more, do nothing
            ;
        }else
        {
            [_hasMoreContentDictionary setObject:[NSNumber numberWithBool:YES] forKey:columnID];
        }
        
    }
}

- (void)notificationForFinishedPlayingMedia: (NSNotification *)notification
{
    [_page didBeenBackwardToWithInfo: [notification userInfo]];
}

@end
