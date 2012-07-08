//
//  BoCPressRemoteNotificationConfigurationCell.m
//  BoCPress
//
//  Created by E-Reach Administrator on 4/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressRemoteNotificationConfigurationCell.h"

@implementation BoCPressRemoteNotificationConfigurationCell

- (id)initWithTag: (NSInteger)tag
      switchState: (BOOL)state
           target: (id)target 
           action: (SEL)action;
{
    if((self = [super init]))
    {
        [self setSelectionStyle: UITableViewCellSelectionStyleNone];
        _switch = [[UISwitch alloc] init];
        [_switch setTag: tag];
        [_switch setOn: state];
        [_switch addTarget: target
                     action: action
           forControlEvents: UIControlEventValueChanged];
        [self addSubview: _switch];
    }
    return self;
}

- (void)dealloc
{
    [_switch release];
    
    [super dealloc];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect frame = [self bounds];
    
    for (UIView *iLooper in [self subviews])
    {
        if ([iLooper class] == [UISwitch class])
        {
            frame.origin.y += (frame.size.height - [iLooper frame].size.height) / 2.0;
            frame.origin.x += frame.size.width - [iLooper frame].size.width - 30;
            [iLooper setFrame: frame];
        }
    }
}

- (void)restoreToLastState: (BOOL)lastStatus
{
    [_switch setOn: lastStatus];
}

@end
