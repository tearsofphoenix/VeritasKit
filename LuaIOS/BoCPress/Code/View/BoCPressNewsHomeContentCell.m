//
//  BoCPressNewsHomeContentCell.m
//  BoCPress
//
//  Created by E-Reach Administrator on 3/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressNewsHomeContentCell.h"
#import "BoCPressNews.h"

@implementation BoCPressNewsHomeContentCell

- (id)initWithNews: (id<BoCPressNews>) news
{
    self = [super init];
    if (self) 
    {        
        [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];

        UIImageView *backgroundView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressNewsTabCellBackground"]];
        
        [self setBackgroundView: backgroundView];
        [backgroundView release];
        
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setTextColor: [UIColor colorWithRed: 93.0 / 255 
                                                  green: 93.0 / 255
                                                   blue: 93.0 / 255
                                                  alpha: 1.0]];

        [_titleLabel setFont: [UIFont fontWithName: @"Helvetica" size: 16]];
        [_titleLabel setText: [news name]];
        
        [_titleLabel setBackgroundColor: [UIColor clearColor]];
        
        [[self contentView] addSubview: _titleLabel];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat: @"发布时间：yyyy-MM-dd HH:mm"];        
        NSString *time = [formatter stringFromDate: [news postTime]];
        [formatter release];
        
        _postTimeLabel = [[UILabel alloc] init];
        [_postTimeLabel setText: time];
        [_postTimeLabel setTextColor: [UIColor colorWithRed: 93.0 / 255 
                                                     green: 93.0 / 255
                                                      blue: 93.0 / 255
                                                     alpha: 1.0]];
        [_postTimeLabel setFont: [UIFont fontWithName: @"Helvetica" size: 10]];
        [_postTimeLabel setBackgroundColor: [UIColor clearColor]];
        
        [[self contentView] addSubview: _postTimeLabel];
                
        CGSize size = [[_titleLabel text] sizeWithFont: [_titleLabel font]];
        static const CGFloat maxTitleLabelWidth = 280;
        if (size.width > maxTitleLabelWidth)
        {
            [_titleLabel setNumberOfLines: 2];
        }else
        {
            [_titleLabel setNumberOfLines: 1];
        }
        
        NSUInteger numberOfLines = [_titleLabel numberOfLines];
        [_titleLabel setFrame: CGRectMake(16, 7, 280, 20 * numberOfLines)];
        
        CGRect frame = [_titleLabel frame];
        frame.origin.y += frame.size.height + 3;
        frame.size.height = [[_postTimeLabel text] sizeWithFont: [_postTimeLabel font]].height;
        [_postTimeLabel setFrame: frame];
        
    }
    return self;
}

@end
