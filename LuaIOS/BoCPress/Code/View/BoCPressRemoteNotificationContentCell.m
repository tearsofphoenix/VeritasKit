//
//  BoCPressRemoteNotificationContentCell.m
//  BoCPress
//
//  Created by E-Reach Administrator on 4/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressRemoteNotificationContentCell.h"

#import "BoCPressServerPushNotification.h"

@implementation BoCPressRemoteNotificationContentCell


- (id)initWithServerPushNotification: (id<BoCPressServerPushNotification>)serverPushNotification
{
    self = [super init];
    if (self) 
    {        
        [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
//        UIImageView *backgroundView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressNewsTabCellBackground"]];
//        
//        [self setBackgroundView: backgroundView];
//        [backgroundView release];
        
        UILabel *titleLabel = [[UILabel alloc] init];
        [titleLabel setTextColor: [UIColor colorWithRed: 93.0 / 255 
                                                   green: 93.0 / 255
                                                    blue: 93.0 / 255
                                                   alpha: 1.0]];
        
        [titleLabel setFont: [UIFont fontWithName: @"Helvetica" size: 16]];
        [titleLabel setText: [serverPushNotification messageTitle]];
        
        [titleLabel setBackgroundColor: [UIColor clearColor]];
        
        BOOL hasBeenRead = [serverPushNotification hasBeenRead];
        
        if (hasBeenRead)
        {
            [titleLabel setFont: [UIFont fontWithName: @"Helvetica" 
                                                 size: 15]];
        }else 
        {
            [titleLabel setFont: [UIFont boldSystemFontOfSize: 17]];
        }

        [[self contentView] addSubview: titleLabel];
    
        
        CGSize size = [[titleLabel text] sizeWithFont: [titleLabel font]];
        static const CGFloat maxTitleLabelWidth = 280;
        if (size.width > maxTitleLabelWidth)
        {
            [titleLabel setNumberOfLines: 2];
        }else
        {
            [titleLabel setNumberOfLines: 1];
        }
        
        NSUInteger numberOfLines = [titleLabel numberOfLines];
        [titleLabel setFrame: CGRectMake(16, 7, 280, 20 * numberOfLines)];
        
    }
    
    return self;
}

@end
