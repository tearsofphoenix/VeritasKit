//
//  BoCPressSingleImageView.h
//  MG5Car
//
//  Created by E-Reach Administrator on 4/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BoCPressSingleImageView : UIScrollView<UIScrollViewDelegate>
{
@private
    UIImageView *_singleImageView;
}

- (void)setImage: (UIImage *)image;

- (void)rotateToInterfaceOrientation: (UIInterfaceOrientation)toInterfaceOrientation;

@end
