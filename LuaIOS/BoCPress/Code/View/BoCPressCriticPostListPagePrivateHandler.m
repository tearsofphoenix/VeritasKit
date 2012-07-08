#import "BoCPressCriticPostListPagePrivateHandler.h"

#import "BoCPressNews.h"

#import "BoCPressCriticPostListPage.h"

#import "BoCPressConstant.h"

#import "NSArraySlice.h"

#import "BoCPressMoreCell.h"

#import "BoCPressViewConstants.h"

@implementation BoCPressCriticPostListPagePrivateHandler

- (id)initWithCriticPostListPage: (BoCPressCriticPostListPage *)page
                           posts: (NSArray *)posts
{
    
    self = [super init];
    if (self) 
    {
        _page = page;
        _posts = posts;
                
        _hasMoreCell = NO;
    }
    
    return self;
    
}

#pragma mark - callback

- (void)callbackForAction:(id)action withData:(id)data
{
    if(_callbackFlag)
    {
        if ([kBoCPress_Global_CallbackAction_contentOfCritic isEqual:action])
        {
            [_page updateCriticInfoWithData:data];
            
        }else if ([kCallbackAction_listOrderedPostsFromCritic isEqualToString: action])
        {
            NSArraySlice *slice = [data objectForKey:kBoCPress_Global_ArraySliceObject];
            
            id hasNextFlag = [data objectForKey:kSoapXMLParser_HasNextFlag];
            if(hasNextFlag && 
               [hasNextFlag isEqualToString:kSoapXMLParser_HasNextFalse])
            {
                _hasMoreCell = NO;
            }else
            {
                _hasMoreCell = YES;
            }
            [_page updateData: slice];
            
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

#pragma mark - tab dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_hasMoreCell)
    {
        return [_posts count] + 1;
    }else
    {
        return [_posts count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath indexAtPosition: 1] < [_posts count])
    {
        id<BoCPressNews> news = [_posts objectAtIndex: [indexPath indexAtPosition: 1]];
        
        UITableViewCell *cell = [[[UITableViewCell alloc] init] autorelease];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
          
        UIImageView *backgroundView = [[[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressCriticTabPostCellBackground"]] autorelease];
        
        [cell setBackgroundView: backgroundView];
        
        UILabel *nameLabel = [[[UILabel alloc] init] autorelease];
        [nameLabel setText: [news name]];
        [nameLabel setFont: [UIFont fontWithName: @"Helvetica" size: 16]];
        [nameLabel setFrame: CGRectMake(10, 11, 300, 16)];
        [nameLabel setBackgroundColor: [UIColor clearColor]];
        [nameLabel setTextColor: [UIColor colorWithRed: 93.0 / 255
                                                 green: 93.0 / 255
                                                  blue: 93.0 / 255
                                                 alpha: 1]];
        [cell addSubview: nameLabel];
        
        NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
        [formatter setDateFormat: @"yyyy-MM-dd HH:mm"];        
        NSString *time = [formatter stringFromDate: [news postTime]];
        
        UILabel *postTimeLabel = [[[UILabel alloc] init] autorelease];
        [postTimeLabel setText: time];
        [postTimeLabel setFont: [UIFont fontWithName: @"Helvetica" size: 9]];
        [postTimeLabel setFrame: CGRectMake(10, 36, 300, 8)];
        [postTimeLabel setBackgroundColor: [UIColor clearColor]];
        [postTimeLabel setTextColor: [UIColor colorWithRed: 93.0 / 255
                                                     green: 93.0 / 255
                                                      blue: 93.0 / 255
                                                     alpha: 1]];
        [cell addSubview: postTimeLabel];
        
        return cell;
    }else
    {
        BoCPressMoreCell *cell = [[[BoCPressMoreCell alloc] init] autorelease];
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath indexAtPosition: 1] < [_posts count])
    {
        return 56;
    }else
    {
        return 41;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[tableView cellForRowAtIndexPath: indexPath] setSelected:NO];

    if ([indexPath indexAtPosition: 1] < [_posts count])
    {
        [_page wantToReadCriticPostAtIndex: indexPath];        
    }else
    {
        [_page wantToUpdateMoreData];
    }
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if ([scrollView contentOffset].y < -41)
    {
        [_page wantToUpdateDataWithInfo:nil];
    }
}


@end
