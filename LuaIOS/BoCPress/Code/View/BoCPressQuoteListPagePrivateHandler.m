#import "BoCPressQuoteListPagePrivateHandler.h"

#import "BoCPressQuoteListPage.h"

#import "BoCPressSecurity.h"

#import "BoCPressQuoteConstants.h"

#import "BoCPressViewConstants.h"

#import "BoCPressConstant.h"

#import <QuartzCore/QuartzCore.h>

@implementation BoCPressQuoteListPagePrivateHandler

- (id)initWithListPage: (BoCPressQuoteListPage *)page 
          ofSecurities: (NSArray *)securities
{
    
    self = [super init];
    if (self)
    {
        _page = page;
        _securities = securities;
        _previousQuoteData = [[NSMutableArray alloc] init];
        
        _dataUpdateCount = 0;
    }
    
    return self;
    
}
- (void)dealloc
{
    
    
    [_previousQuoteData release];
    
    [super dealloc];
    
}

#pragma mark - callback

- (void)callbackForAction: (id)action
                 withData: (id)data
{
    if(_callbackFlag)
    {
        
        if ([kCallbackAction_listOrderedSecurityInFamily isEqualToString: action])
        {
            ++_dataUpdateCount;
            NSArray *slice = [data objectForKey: kType_Global_NSArray];
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
    return [_securities count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    id<BoCPressSecurity> security = [_securities objectAtIndex: [indexPath indexAtPosition: 1]];
    
    UITableViewCell *cell = [[[UITableViewCell alloc] init] autorelease];
    
    UIImageView *backgroundView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressQuoteListPageTabCellBackground"]];
    
    [cell setBackgroundView: backgroundView];
    [backgroundView release];
    
    
    
    UILabel *nameLabel = [[UILabel alloc] init] ;
    NSString *name = [security name];
    [nameLabel setText: [security name]];
    [nameLabel setBackgroundColor:[UIColor clearColor]];
    [nameLabel setTextAlignment: UITextAlignmentCenter];
    [nameLabel setFont: [UIFont fontWithName: @"Helvetica" size: 15]];
    
    CGSize size = [name sizeWithFont:[nameLabel font]];
    
    [nameLabel setFrame: CGRectMake(8, 10, 100, size.height)];
    
    [cell addSubview: nameLabel];
    [nameLabel release];
    
    CGRect frame = [nameLabel frame];
    
    UILabel *latestLabel = [[UILabel alloc] init];
    [latestLabel setText: [security lastValue]];
    
    [latestLabel setTextAlignment: UITextAlignmentCenter];
    [latestLabel setFont: [UIFont fontWithName: @"Helvetica" size: 15]];
    [latestLabel setFrame: CGRectMake(114, frame.origin.y, 93, 22)];
    [latestLabel setBackgroundColor:[UIColor clearColor]];
    
    [cell addSubview: latestLabel];
    [latestLabel release];
    
    frame = [latestLabel frame];
    
    UILabel *changedRateLabel = [[UILabel alloc] init];
    
    [changedRateLabel setText: [security lastPercentage]];
    [changedRateLabel setTextAlignment: UITextAlignmentCenter];
    [changedRateLabel setFont: [UIFont fontWithName: @"Helvetica" size: 15]];
    [changedRateLabel setFrame: CGRectMake(frame.origin.x + frame.size.width, frame.origin.y, 93, 22)];
    [changedRateLabel setBackgroundColor:[UIColor clearColor]];
    
    [cell addSubview: changedRateLabel];
    [changedRateLabel release];
    
    if ([[_page  familyIdentity] isEqualToString:kString_Global_ExchangeRateViewIdentity]) 
    {
        [cell setUserInteractionEnabled:NO];
    }else
    {
        if ([[security isTradebleFlag] isEqualToString: kQuoteListPage_IsNotAvaliableString])
        {
            [cell setUserInteractionEnabled: NO];
            
        }else
        {
            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
            [cell setUserInteractionEnabled:YES];
        }
        
        if ([[security lastPercentage] floatValue] < 0)
        {
            [changedRateLabel setTextColor: [UIColor colorWithRed: 51.0 / 255 
                                                            green: 153.0 / 255
                                                             blue: 0
                                                            alpha: 1]];
        }else
        {
            [changedRateLabel setTextColor: [UIColor colorWithRed: 217.0 / 255 
                                                            green: 63.0 / 255
                                                             blue: 63.0 / 255
                                                            alpha: 1]];
            
        }
        
        
        if([self findPreviousDataOfSecurity:security]
           &&
           ![[security lastPercentage] isEqualToString:[self findPreviousDataOfSecurity:security] ])
        {
            float backgroundColorAnimationTimeInterval = 1.0;
            
            if (_dataUpdateCount > 1)
            {
                
                
                if ([[security lastPercentage] floatValue] < 0)
                {                    
                    
                    [UIView beginAnimations:nil context:nil];
                    [UIView setAnimationDuration:backgroundColorAnimationTimeInterval];
                    
                    
                    [[changedRateLabel layer] setBackgroundColor: [[UIColor colorWithRed:52.0 / 255 
                                                                                   green:153.0 / 255 
                                                                                    blue:0 
                                                                                   alpha:1] CGColor]];
                    [[latestLabel layer] setBackgroundColor: [[UIColor colorWithRed:52.0 / 255 
                                                                              green:153.0 / 255 
                                                                               blue:0 
                                                                              alpha:1] CGColor]];
                    
                    [UIView commitAnimations];
                    [UIView beginAnimations:nil context:nil];
                    [UIView setAnimationDuration:backgroundColorAnimationTimeInterval];
                    
                    [changedRateLabel layer].backgroundColor = [UIColor clearColor].CGColor;
                    [latestLabel layer].backgroundColor = [UIColor clearColor].CGColor;
                    [UIView commitAnimations];
                    
                }
                else
                {
                    
                    
                    [UIView beginAnimations:nil context:nil];
                    [UIView setAnimationDuration:backgroundColorAnimationTimeInterval];
                    
                    [changedRateLabel layer].backgroundColor = [UIColor colorWithRed: 204.0 / 255 
                                                                               green: 0.0 / 255
                                                                                blue: 0.0 / 255
                                                                               alpha: 1].CGColor;
                    [latestLabel layer].backgroundColor = [UIColor colorWithRed: 204.0 / 255 
                                                                          green: 0.0 / 255
                                                                           blue: 0.0 / 255
                                                                          alpha: 1].CGColor;
                    
                    [UIView commitAnimations];
                    [UIView beginAnimations:nil context:nil];
                    [UIView setAnimationDuration:backgroundColorAnimationTimeInterval];
                    [changedRateLabel layer].backgroundColor = [UIColor clearColor].CGColor;
                    [latestLabel layer].backgroundColor = [UIColor clearColor].CGColor;
                    [UIView commitAnimations];                    
                    
                }
            }
        }
    }
    
    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger index = [indexPath indexAtPosition:1];
    if (index < [_securities count])
    {    
        [_page wantToShowQuoteContentOfSecurityAtIndex: index];
    }

}

#pragma mark - event handle

- (void)wantToUpdateDataRaisedByTimer: (NSTimer*)theTimer
{
    if (_callbackFlag) 
    {        
        [_page wantToUpdateDataWithInfoByTimer];
        
    }else
    {
        [theTimer invalidate];
    }
}

- (void)storePreviousQuoteData: (NSArray*) previousSecurities
{
    if ([previousSecurities count] > 0)
    {
        [_previousQuoteData setArray:previousSecurities];
    }
}
- (id)findPreviousDataOfSecurity: (id<BoCPressSecurity>) security
{
    for (id iLooper in _previousQuoteData)
    {
        if ([[(id<NSIdentifiedObject>)iLooper identity] isEqual:[security identity]])
        {
            return [iLooper lastPercentage];
        }
    }
    
    return nil;
}

@end
