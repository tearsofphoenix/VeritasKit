//
//  BoCPressNewsHomeContentCell.h
//  BoCPress
//
//  Created by E-Reach Administrator on 3/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BoCPressNews;

@interface BoCPressNewsHomeContentCell : UITableViewCell
{
    UILabel *_titleLabel;
    UILabel *_postTimeLabel;
}

- (id)initWithNews: (id<BoCPressNews>) news;

@end
