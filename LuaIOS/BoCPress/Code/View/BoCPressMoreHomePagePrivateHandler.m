#import "BoCPressCallback.h"

#import "BoCPressMoreHomePagePrivateHandler.h"

#import "BoCPressConstant.h"

#import "BoCPressMoreHomePage.h"

#import "BoCPressNotificationDefines.h"

#import "BoCPressMoreHomeTableCell.h"

@implementation BoCPressMoreHomePagePrivateHandler

- (id)initWithPage:(BoCPressMoreHomePage *)page
{
    self = [super init];
    if (self) 
    {
        _page = page;
        _callbackFlag = YES;
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(notificationForRemoteNotificationChanged:)
                                                     name: kNotification_SoapDataSource_remoteNotificationDidChanged
                                                   object: nil];
    }
    
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver: self];
    
    [super dealloc];
}

- (NSInteger)tableView: (UITableView *)tableView numberOfRowsInSection: (NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView: (UITableView *)tableView cellForRowAtIndexPath: (NSIndexPath *)indexPath
{
    
    BoCPressMoreHomeTableCell *cell = [[[BoCPressMoreHomeTableCell alloc] init] autorelease];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    [cell setBackgroundView: [[[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressMoreTabCellBackground"]] autorelease]];
    
    [[cell textLabel] setFont: [UIFont fontWithName: @"Helvetica" size: 17]];
    [[cell textLabel] setTextColor: [UIColor colorWithRed: 93.0 / 255
                                                    green: 93.0 / 255
                                                     blue: 93.0 / 255
                                                    alpha: 1]];

    switch ([indexPath indexAtPosition:1])
    {
        case 0:
        {
            [[cell textLabel] setText:@"账户管理"];
            
            UILabel *loginStateLabel = [[UILabel alloc] init];
            
            [loginStateLabel setBackgroundColor:[UIColor clearColor]];
            [loginStateLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
            [loginStateLabel setTextAlignment:UITextAlignmentCenter];
            
            if ([_page loginStatus])
            {
                [loginStateLabel setText:@"已登录"];
                [loginStateLabel setTextColor:[UIColor greenColor]];
            }else
            {
                [loginStateLabel setText:@"未登录"];
                [loginStateLabel setTextColor:[UIColor redColor]];
            }
            
            CGRect frame = [cell frame];
                        
            [loginStateLabel setFrame:CGRectMake(frame.origin.x + frame.size.width - 80, 6, 60, frame.size.height)];
            [cell addSubview:loginStateLabel];
            
            [loginStateLabel release];
            break;
        }
            case 1:
        {
            [[cell textLabel] setText: @"帮助"];
            break;
        }
            case 2:
        {
            [[cell textLabel] setText:@"关于"];
            break;
        }
            case 3:
        {
            [[cell textLabel] setText:@"免责声明"];
            break;
        }
            case 4:
        {
            [[cell textLabel] setText:@"用户反馈"];
            break;
        }
        case 5:
        {
            [[cell textLabel] setText: @"推送配置"];
            break;
        }
        case 6:
        {
            [[cell textLabel] setText: @"推送消息中心"];
            [cell setShouldShowNewRemoteNotificationIndicator: [_page numberOfNewRemoteNotification]];
            break;
        }
        default:
        {
            break;
        }
    }

    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath: indexPath];
    [cell setSelected: NO 
             animated: NO];
    
    switch ([indexPath row]) 
    {
        case 0:
        {

            [[NSNotificationCenter defaultCenter] postNotificationName:kViewController_wantoToShowAccountLoginPage object:self];

            break;
        }
        case 1:
        {
            [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_wantToReadHelpPage 
                                                                object: self];
            break;
        }   
        case 2:
        {
            [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_wantToReadAboutPage 
                                                                object: self];
            break;
        }
        case 3:
        {
            [[NSNotificationCenter defaultCenter] postNotificationName:kViewController_wantToReadProtocolPage 
                                                                object:self];
            break;
        }
            case 4:
        {
            [[NSNotificationCenter defaultCenter] postNotificationName:kViewController_wantoShowUserFeedbackPage 
                                                                object:self];
            break;
        }
        case 5:
        {
            [_page wantToGetRemoteNotificationConfiguration];
            break;
        }
        case 6:
        {
            [_page wantToShowRemoteNotificationListPage];
            break;
        }
        default:
        {
            break;
        }
    }
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 56;
}

#pragma mark - BoCPressCallback protocol
- (void)callbackForAction: (id)action
                 withData: (id)data
{
    if (_callbackFlag) 
    {
        if ([action isEqual:@"submitUserFeedback:"])
        {
            NSLog(@"submitUserFeedback OK!");
        }else if ([kCallbackAction_getRemoteNotificationConfigurationWithCallback isEqualToString: action])
        {
            [_page updateDataWithInfo: data];
        }
    }
}

- (void)notificationForRemoteNotificationChanged: (NSNotification *)notification
{
    if (_callbackFlag)
    {
        [_page didRemoteNotificationChanged];
    }
}

@end
