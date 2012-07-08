#import "BoCPressQuoteHomePagePrivateHandler.h"

#import "BoCPressQuoteHomePage.h"

#import "BoCPressSecurityFamily.h"

#import "BoCPressConstant.h"

#import "BoCPressNotificationDefines.h"

#import "BoCPressViewConstants.h"

@implementation BoCPressQuoteHomePagePrivateHandler

- (id)initWithHomePage: (BoCPressQuoteHomePage *)page 
    ofSecurityFamilies: (NSArray *)securityFamilies
{
    
    self = [super init];
    if (self)
    {
        _page = page;        
        _securityFamilies = securityFamilies;
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(notificationForWantToSlideToFirstSecurity:) 
                                                     name: kQuoteHomePage_wantToSlideToFirstSecurity 
                                                   object: nil];
    }
    
    return self;
    
}


- (void)callbackForAction: (id)action
                 withData: (id)data
{
    if(_callbackFlag)
    {
        if ([kCallbackAction_listOrderedSecurityFamilies isEqualToString: action])
        {
            [_page updateSecurityFamilies: data];
            
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
#pragma mark - tab datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_securityFamilies count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    id<BoCPressSecurityFamily> family = [_securityFamilies objectAtIndex: [indexPath indexAtPosition: 1]];
    
    UITableViewCell *cell = [[[UITableViewCell alloc] init] autorelease];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    UIImageView *backgroundView = [[[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressQuoteTabHomeCellBackground"]] autorelease];
    
    [cell setBackgroundView: backgroundView];
    
    UILabel *titleLabel = [[[UILabel alloc] init] autorelease];
    
    [titleLabel setTextColor: [UIColor colorWithRed: 93.0 / 255 
                                              green: 93.0 / 255
                                               blue: 93.0 / 255
                                              alpha: 1.0]];
    [titleLabel setFont: [UIFont fontWithName: @"Helvetica" size: 18]];
    [titleLabel setText: [family name]];
    [titleLabel setBackgroundColor: [UIColor clearColor]];
    [titleLabel setFrame: CGRectMake(23, 19, 280, 20)];
    
    [cell addSubview: titleLabel];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSUInteger index = [indexPath indexAtPosition:1];
    if (index == [_securityFamilies count] - 1)
    {        
        [_page wantToShowContentOfLongTermQuoteAtIndex: index];
        
    }else
    {
        [_page wantToShowContentOfQuoteAtIndex: index];
    }
}

- (void)notificationForWantToSlideToFirstSecurity: (NSNotification *)notification
{
    [[NSNotificationCenter defaultCenter] removeObserver: self
                                                    name: [notification name]
                                                  object: nil];
    [_page wantToShowContentOfQuoteAtIndex: 0];
}

@end
