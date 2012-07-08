//
//  BoCPressQuoteContentCriticPostViewPrivateHandler.m
//  BoCPress
//
//  Created by E-Reach Administrator on 11/6/11.
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

#import "BoCPressQuoteContentCriticPostViewPrivateHandler.h"

#import "BoCPressConstant.h"

#import "BoCPressNews.h"

#import "BoCPressQuoteContentCriticPostView.h"

@implementation BoCPressQuoteContentCriticPostViewPrivateHandler

- (id)initWithCriticPostView: (BoCPressQuoteContentCriticPostView *)criticPostView
                        criticPosts: (NSArray *)criticPosts
{
    if ((self = [super init]))
    {
        _criticPostView = criticPostView;
        _criticPosts = criticPosts;
        _callbackFlag = YES;
    }
    
    return self;
}

#pragma mark - callback protocol
- (void)callbackForAction:(id)action withData:(id)data
{
    if (_callbackFlag)
    {
        if([kCallbackAction_getQuoteRelatedOpinionsList isEqualToString: action])
        {
            [_criticPostView updateContentWithData: data];
        }
        else if ([kCallbackAction_tryWithPreviousCallbackActionAgainAfterServerError isEqualToString: action])
        {
            NSString *previousCallbackAction = [data objectForKey: kNetwork_CallbackStoredCallbackInfo];
            if ( [previousCallbackAction isEqualToString: kCallbackAction_listOrderedMediaOfType])
            {
                [_criticPostView didUpdateData];
                [_criticPostView wantToUpdateData];
            }
        }
    }
}

#pragma mark - UITableView datasource && delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger index = [indexPath indexAtPosition:1];
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    if (index < [_criticPosts count]) 
    {        
        id<BoCPressNews> news = [_criticPosts objectAtIndex:index];
        UIImageView *backgroudImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BoCPressQuoteContentPageNewsCellBackground"]];
        [cell setBackgroundView:backgroudImageView];
        [backgroudImageView release];
                
        NSString *newsName = [news name];
        [[cell textLabel] setText: newsName];
        CGFloat fontSize = 17;
        
        [[cell textLabel] setFont:[UIFont fontWithName:@"Helvetica" size: fontSize]];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];

    }
    
    return [cell autorelease];
}

#pragma mark - delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    if (row < [_criticPosts count]) 
    {
        [_criticPostView wantToReadContentOfCriticPostAtIndex: row];
    }
    
}

- (void)wantToUpdateDataByTimer: (NSTimer *)timer
{
    if (_callbackFlag)
    {        
        [_criticPostView wantToUpdateData];
    }else
    {
        [timer invalidate];
    }
}
@end
