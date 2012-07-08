//
//  BoCPressMoreHomeTableCell.m
//  BoCPress
//
//  Created by E-Reach Administrator on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressMoreHomeTableCell.h"

@implementation BoCPressMoreHomeTableCell

@synthesize shouldShowNewRemoteNotificationIndicator = _shouldShowNewRemoteNotificationIndicator;

- (void)setShouldShowNewRemoteNotificationIndicator: (BOOL)shouldShowNewRemoteNotificationIndicator
{
    if (_shouldShowNewRemoteNotificationIndicator != shouldShowNewRemoteNotificationIndicator)
    {
        _shouldShowNewRemoteNotificationIndicator = shouldShowNewRemoteNotificationIndicator;
        if (_shouldShowNewRemoteNotificationIndicator)
        {
            if (!_newRemoteNotificationIndicator)
            {
                UIImage *image = [UIImage imageNamed: @"BoCPressRemoteNotificationNewIndicator"];
                _newRemoteNotificationIndicator = [[UIImageView alloc] initWithImage: image];
                [_newRemoteNotificationIndicator setFrame: CGRectMake(250, (56.0 - 25.0) / 2.0, 25, 25)];
                [[self contentView] addSubview: _newRemoteNotificationIndicator];                                                       
            }
            
            [_newRemoteNotificationIndicator setAlpha: 1];
            
        }else 
        {
            [_newRemoteNotificationIndicator setAlpha: 0];
        }
    }
}

@end
