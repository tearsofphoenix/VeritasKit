//
//  UIGalleryViewLinkageHandler.h
//  BoCPress
//
//  Created by LeixSnake on 8/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIGalleryView;

@interface UIGalleryViewLinkageHandler : NSObject
{
    UIGalleryView *_selfView;
    
    UIGalleryView *_targetView;
}
- (id)initWithSourceView: (UIGalleryView *)selfView
              targetView: (UIGalleryView *)targetView;

- (void)                 scrollView: (UIScrollView *)scrollView 
doLinkageAnimationWithContentOffset:(CGPoint)contentOffset 
                               info: (id)info;
@end
