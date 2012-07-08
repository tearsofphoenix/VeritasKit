//
//  UIGalleryViewLinkageHandler.m
//  BoCPress
//
//  Created by LeixSnake on 8/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIGalleryViewLinkageHandler.h"

#import "UIGalleryView.h"

@implementation UIGalleryViewLinkageHandler

- (id)initWithSourceView:(UIGalleryView *)selfView 
              targetView:(UIGalleryView *)targetView
{
    self = [super init];
    if (self) 
    {
            // Initialization code here.
        _selfView = selfView;
        _targetView = targetView;
    }
    
    return self;
}

- (void)scrollView:(UIScrollView *)scrollView 
doLinkageAnimationWithContentOffset:(CGPoint)contentOffset 
              info:(id)info
{
    if ([info isEqual:@"direction_x"]) 
    {
//        CGPoint offset = CGPointMake([_selfView contentOffset].x, [_targetView contentOffset])
    }
}

@end
