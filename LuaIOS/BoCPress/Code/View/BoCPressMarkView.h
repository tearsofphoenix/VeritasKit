//
//  BoCPressMarkView.h
//  Breast
//
//  Created by Zhang Shiyong on 3/24/11.
//  Copyright 2011 SJTU. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kFeedBackStarCount (5)

@interface BoCPressMarkView : UIView 
{
    UIView *_imageView[kFeedBackStarCount];
    
    UILabel *_textOnStars[kFeedBackStarCount];
    
    NSArray *_textStrings;
    
    int _mark;
    
}

- (void)setMark:(int)value ;

- (int)markValue;
@end
