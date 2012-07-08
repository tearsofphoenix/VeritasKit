//
//  BoCPressRemoteNotificationConfigurationCell.h
//  BoCPress
//
//  Created by E-Reach Administrator on 4/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BoCPressRemoteNotificationConfigurationCell : UITableViewCell
{
@private
    UISwitch *_switch;
}

- (id)initWithTag: (NSInteger)tag
      switchState: (BOOL)state
           target: (id)target 
           action: (SEL)action;

- (void)restoreToLastState: (BOOL)lastStatus;

@end
