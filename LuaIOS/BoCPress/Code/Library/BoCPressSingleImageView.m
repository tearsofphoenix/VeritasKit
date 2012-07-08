//
//  BoCPressSingleImageView.m
//  MG5Car
//
//  Created by E-Reach Administrator on 4/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressSingleImageView.h"

#define EGOPV_ZOOM_SCALE 2.5

@implementation BoCPressSingleImageView

- (id)init
{
    if ((self = [super init]))
    {
		[self setMaximumZoomScale: 10.0f];
		[self setMinimumZoomScale: 1.0f];
		[self setShowsHorizontalScrollIndicator: NO];
		[self setShowsVerticalScrollIndicator: NO];
		[self setBackgroundColor: [UIColor blackColor]];
        [self setDelegate: self];
        
        _singleImageView = [[UIImageView alloc] init];
        [self addSubview: _singleImageView];
        [_singleImageView setUserInteractionEnabled: YES];
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget: self 
                                                                       action: @selector(handleTapEvent:)];
        [tapGestureRecognizer setNumberOfTapsRequired: 2];
        [self addGestureRecognizer: tapGestureRecognizer];
        
        [tapGestureRecognizer release];

    }
    return self;
}

- (void)dealloc
{
    [_singleImageView release];
    
    [super dealloc];
}

- (void)setImage: (UIImage *)image
{
    CGSize size = [image size];
    CGRect frame = [_singleImageView frame];

    CGFloat scale =  1024.0 / size.width;
    size.width *= scale;
    size.height *= scale;
    frame.size = size;
    [_singleImageView setFrame: frame];
    [_singleImageView setImage: image];
    
    [self setContentSize: size];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _singleImageView;
}


- (void)zoomRectWithCenter:(CGPoint)center
{
    
	CGRect rect;
	rect.size = CGSizeMake(self.frame.size.width / EGOPV_ZOOM_SCALE, self.frame.size.height / EGOPV_ZOOM_SCALE);
	rect.origin.x = MAX((center.x - (rect.size.width / 2.0f)), 0.0f);		
	rect.origin.y = MAX((center.y - (rect.size.height / 2.0f)), 0.0f);
	
	CGRect frame = [self.superview convertRect:self.frame toView:self.superview];
	CGFloat borderX = frame.origin.x;
	CGFloat borderY = frame.origin.y;
	
	if (borderX > 0.0f && (center.x < borderX || center.x > self.frame.size.width - borderX)) 
    {
        
		if (center.x < (self.frame.size.width / 2.0f)) {
			
			rect.origin.x += (borderX/EGOPV_ZOOM_SCALE);
			
		} else {
			
			rect.origin.x -= ((borderX/EGOPV_ZOOM_SCALE) + rect.size.width);
			
		}	
	}
	
	if (borderY > 0.0f && (center.y < borderY || center.y > self.frame.size.height - borderY)) 
    {
        
		if (center.y < (self.frame.size.height / 2.0f)) 
        {
			
			rect.origin.y += (borderY/EGOPV_ZOOM_SCALE);
			
		} else 
        {
            
			rect.origin.y -= ((borderY/EGOPV_ZOOM_SCALE) + rect.size.height);
			
		}
		
	}
    
	[self zoomToRect: rect
            animated: YES];	
    
}


- (void)handleTapEvent: (id)sender
{
    UITapGestureRecognizer *tapGestureRecognizer = (UITapGestureRecognizer *)sender;
    
    [self zoomRectWithCenter: [tapGestureRecognizer locationInView: self]];
}

- (void)rotateToInterfaceOrientation: (UIInterfaceOrientation)toInterfaceOrientation;
{
    CGRect frame = [_singleImageView frame];
    CGRect bounds = [self bounds];
    
    CGFloat height = MIN(CGRectGetHeight(frame) + frame.origin.x, CGRectGetHeight(bounds));
    CGFloat  width = MIN(CGRectGetWidth(frame) + frame.origin.y, CGRectGetWidth(bounds));
    
    [self setFrame: CGRectMake((bounds.size.width / 2) - (width / 2), (bounds.size.height / 2) - (height / 2), width, height)];
    

}

@end
