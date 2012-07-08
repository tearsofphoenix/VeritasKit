#import "BoCPressCriticHomePagePrivateHandler.h"

#import "BoCPressCriticHomePage.h"

#import "BoCPressColumn.h"

#import "BoCPressAuthor.h"

#import "BoCPressNews.h"

#import "BoCPressConstant.h"

#import "BoCPressCriticHomePageCell.h"

#import "BoCPressMoreCell.h"

#import "BoCPressColumn.h"

#import "BoCPressViewConstants.h"


@implementation BoCPressCriticHomePagePrivateHandler

#pragma mark - Instance initialization

- (id)initWithHomePage: (BoCPressCriticHomePage *)page
             inColumns: (NSArray *)columns
         fromColumnBar: (BoCPressColumnBarView *)columnBar
                ofData: (NSDictionary *)data
{
    
    self = [super init];
    if (self)
    {
        _page = page;
        _columns = columns;
        _data = data;
        _columnBar = columnBar;
                        
        _hasMoreContentDictionary = [[NSMutableDictionary alloc] init];
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(notificationForWantToGetMoreCritic:) 
                                                     name:kBocPress_View_wantToGetMoreCritic 
                                                   object:nil];
    }
    
    return self;
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];

    [_hasMoreContentDictionary release];
    
    [super dealloc];
}

#pragma  mark - notification

- (void)notificationForWantToGetMoreCritic: (NSNotification *)notification
{
    [_page wantToUpdateMoreContentData];
}

#pragma mark - call back

- (void)callbackForAction:(id)action withData:(id)data
{
    if(_callbackFlag)
    {
        NSLog(@"in func:%s line:%d", __func__, __LINE__);
        
        if ([kCallbackAction_listOrderedCriticColumns isEqualToString: action])
        {
            
            [self initMoreCellFlagForColumns:data];
            
            [_page updateData: data];
        }
        else if ([kCallbackAction_listLatestCriticPost isEqualToString: action])
        {
            NSArraySlice *slice = [data objectForKey:kBoCPress_Global_ArraySliceObject];
            
            [self updateMoreCellFlagWithData:data forColumn:kLatestCriticsID];
            
            [_page updateLatestCriticPost: slice];
        }
        else if ([kCallbackAction_listOrderedFavoriteCritics isEqualToString: action])
        {
            NSArraySlice *slice = [data objectForKey:kBoCPress_Global_ArraySliceObject];
            
            [self updateMoreCellFlagWithData:data forColumn:kFavoriteCriticsID];
            
            [_page updateOrderedFavoriteCritics: slice];
        }
        else if ([kCallbackAction_listOrderedCritics isEqualToString: action])
        {
            NSArraySlice *slice = [data objectForKey:kBoCPress_Global_ArraySliceObject];
            
            [self updateMoreCellFlagWithData:data forColumn:kFavoriteCriticsID];
            
            [_page updateOrderedCritics: slice];
        }
        else if([kBoCPress_Global_CallbackAction_contentOfCritic isEqualToString:action])
        {
            [_page stepToReadPostsOfCriticWithData: data];
            
        }else if([kCallbackAction_reloadColumnsWithTag isEqualToString:action])
        {
            [_page reloadColumnsWithData:data];
            
        }else if([@"willShowContentOfCriticPost" isEqualToString: action])
        {
            [_page willShowContentOfCriticPostWithData: data];
        }else if([@"wantToReadPostsOfCritic:" isEqualToString: action])
        {
            [_page willReadPostsOfCriticWithData: data];
            
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

#pragma mark - column processing

- (void)didColumnSwitchTo: (id<BoCPressColumn>)column
{
    NSLog(@"in func:%s line:%d", __func__, __LINE__);

    [_page wantToUpdateContentDataWithInfo:[NSDictionary dictionaryWithObjectsAndKeys:
                                            kBoCPress_View_AnimationTypeTopToBottom, kBoCPress_Global_AnimationType, nil]];
}

- (void)didMoreColumnsSelected
{
    ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    id columnID = [[_page currentColumn] identity];

    if ([columnID isEqual:kLatestCriticsID] 
        || [columnID isEqual:kFavoriteCriticsID])
    {
        
        if ([[_hasMoreContentDictionary objectForKey:columnID] boolValue])
        {
            return [[_data objectForKey: columnID] count] + 1;
        }else
        {
            return [[_data objectForKey:columnID] count];
        }
    }else
    {
        //more cell for critic
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<BoCPressColumn> column = [_page currentColumn];
    
    if ([indexPath indexAtPosition:1] < [[_data objectForKey: [column identity]] count])
    {
        return 82;
    }else
    {
        //for more cell
        //    
        return 41;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    id columnID = [[_page currentColumn] identity];
    if ([columnID isEqualToString: kLatestCriticsID]
        || [columnID isEqualToString: kFavoriteCriticsID])
    {
        
        if ([indexPath indexAtPosition:1] < [[_data objectForKey:columnID ] count])
        {
            id<BoCPressNews> news = [[_data objectForKey: columnID] objectAtIndex: [indexPath indexAtPosition: 1]];
            
            id<BoCPressAuthor> author = [[[_data objectForKey: columnID] objectAtIndex: [indexPath indexAtPosition: 1]] author];
            BoCPressCriticHomePageCell *cell = [[[BoCPressCriticHomePageCell alloc] initWithNews:news author:author] autorelease];

            return cell;
        }
        else
        {

            BoCPressMoreCell *cell = [[[BoCPressMoreCell alloc] init] autorelease];            
            return cell;
        }
        
    }
    //for critic
    //
    else
    {
        BoCPressMoreCell *cell = [[[BoCPressMoreCell alloc] init] autorelease];        
        return cell;
    }

    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id columnID = [[_page currentColumn] identity];

    if ([columnID isEqualToString: kLatestCriticsID]
        ||[columnID isEqualToString: kFavoriteCriticsID])
    {
        NSUInteger index = [indexPath indexAtPosition:1];
        if (index < [[_data objectForKey:columnID] count])
        {
            
            [_page wantToShowContentOfCriticPostAtIndex: index];

        }else
        {
            [_page wantToUpdateMoreContentData];
        }
        
    }else
        //for critic
    {
        [_page wantToUpdateMoreContentData];
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

- (void)updateMoreCellFlagWithData:(id)data forColumn:(id)columnID
{
    //    if ([slice count] != kArraySliceMaxCount || [slice countInSlice] == 0)
    NSArraySlice *slice = [data objectForKey:kBoCPress_Global_ArraySliceObject];
    
    if ([[data objectForKey:kSoapXMLParser_HasNextFlag] isEqual:kSoapXMLParser_HasNextFalse])
    {
        [_hasMoreContentDictionary setObject:[NSNumber numberWithBool:NO] forKey:columnID];
        
    }else
    {
        if ([slice countInSlice] <= [[_data objectForKey:columnID] count])
        {
            //update partcail, do nothing
            ;
        }else
        {
            [_hasMoreContentDictionary setObject:[NSNumber numberWithBool:YES] forKey:columnID];
        }
        
    }
}

#pragma mark - Critic Item taped handle
- (void)wantToReadListOfCritic: (id<BoCPressAuthor>) critic
{
    [_page wantToReadPostsOfCritic:critic];
}


#pragma mark - NSSuperHandler protocol

- (id)queryInfoWithTag:(id)tag
{
    id columnID = [tag objectForKey:kBoCPress_Global_ColumnID];
    id queryCommand = [tag objectForKey:kBoCPress_Global_QueryCommand];
    
    if ([queryCommand isEqual:kBoCPress_View_HasMoreTag])
    {
        return [_hasMoreContentDictionary objectForKey:columnID];
    }
    
    return nil;
}
@end
