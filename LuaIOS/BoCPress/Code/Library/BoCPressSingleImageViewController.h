//
//  BoCPressSingleImageViewController.h
//  BoCPress
//
//  Created by E-Reach Administrator on 4/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BoCPressSingleImageView;

@interface BoCPressSingleImageViewController : UIViewController
{
@private
    BoCPressSingleImageView *_singleImageView;
}

- (id)initWithImage:(UIImage*)anImage;

@end
