//
//  EGOPhotoController.m
//  EGOPhotoViewer
//
//  Created by Devin Doty on 1/8/10.
//  Copyright 2010 enormego. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "EGOPhotoViewController.h"

#import "EGOPhotoImageView.h"

#import "EGOQuickPhoto.h"

#import "EGOQuickPhotoSource.h"

#import "EGOPhotoScrollView.h"

#import "BoCPressConstant.h"

@interface EGOPhotoViewController ()

- (void)loadScrollViewWithPage:(NSInteger)page;
- (void)layoutScrollViewSubviews;
- (void)setupScrollViewContentSize;
- (void)enqueuePhotoViewAtIndex:(NSInteger)theIndex;
- (void)setBarsHidden:(BOOL)hidden animated:(BOOL)animated;
- (NSInteger)centerPhotoIndex;

@end


@implementation EGOPhotoViewController

@synthesize scrollView=_scrollView;
@synthesize photoSource=_photoSource; 
@synthesize photoViews=_photoViews;

- (id)initWithPhoto:(id<EGOPhoto>)aPhoto 
{
	return [self initWithPhotoSource:[[[EGOQuickPhotoSource alloc] initWithPhotos:[NSArray arrayWithObjects:aPhoto,nil]] autorelease]];
}

- (id)initWithImage:(UIImage*)anImage 
{
	return [self initWithPhoto:[[[EGOQuickPhoto alloc] initWithImage:anImage] autorelease]];
}

- (id)initWithImageURL:(NSURL*)anImageURL 
{
	return [self initWithPhoto:[[[EGOQuickPhoto alloc] initWithImageURL:anImageURL] autorelease]];
}

- (id)initWithPhotoSource:(id <EGOPhotoSource> )aSource
{
	if (self = [super init]) 
    {
		
		[[NSNotificationCenter defaultCenter] addObserver: self 
                                                 selector: @selector(toggleBarsNotification:) 
                                                     name: @"EGOPhotoViewToggleBars"
                                                   object: nil];
		
		self.hidesBottomBarWhenPushed = YES;
		self.wantsFullScreenLayout = YES;		
		_photoSource = [aSource retain];
		_pageIndex=0;
		
	}
	
	return self;
}


#pragma mark -
#pragma mark View Controller Methods

- (void)viewDidLoad 
{
    [super viewDidLoad];
	
	self.view.backgroundColor = [UIColor blackColor];
	self.wantsFullScreenLayout = YES;
	
	if (!_scrollView) 
    {
		
		_scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
		_scrollView.delegate=self;
		_scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth 
                                     | UIViewAutoresizingFlexibleHeight
                                     | UIViewAutoresizingFlexibleLeftMargin
                                     | UIViewAutoresizingFlexibleRightMargin
                                     | UIViewAutoresizingFlexibleTopMargin
                                     | UIViewAutoresizingFlexibleBottomMargin;
		_scrollView.directionalLockEnabled=YES;
		_scrollView.canCancelContentTouches=YES;
		_scrollView.delaysContentTouches=YES;
		_scrollView.clipsToBounds=YES;
		_scrollView.alwaysBounceHorizontal=YES;
		_scrollView.bounces=YES;
		_scrollView.pagingEnabled=YES;
		_scrollView.showsVerticalScrollIndicator=NO;
		_scrollView.showsHorizontalScrollIndicator=NO;
		_scrollView.backgroundColor = self.view.backgroundColor;
        
		[self.view addSubview:_scrollView];
        
	}
	
	//  load photoviews lazily
	NSMutableArray *views = [[NSMutableArray alloc] init];
	for (unsigned i = 0; i < [self.photoSource numberOfPhotos]; i++) 
    {
		[views addObject:[NSNull null]];
	}
	self.photoViews = views;
	[views release];
    
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle: @"返回" 
                                                                   style: UIBarButtonItemStylePlain
                                                                  target: self
                                                                  action: @selector(done:)];
    self.navigationItem.leftBarButtonItem = doneButton;
    [doneButton release];

	if ([self.photoSource numberOfPhotos] == 1) 
    {
		
		[self.navigationController setNavigationBarHidden:NO animated:NO];
		
		[self enqueuePhotoViewAtIndex:_pageIndex];
		[self loadScrollViewWithPage:_pageIndex];
	}
        
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];

    self.navigationController.navigationBar.tintColor = nil;
		self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
		self.navigationController.navigationBar.translucent = YES;
		
		[self setupScrollViewContentSize];
	[self moveToPhotoAtIndex:_pageIndex animated:NO];
		
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
	
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) 
    {
		return YES;
	}
	
   	return (UIInterfaceOrientationIsLandscape(interfaceOrientation) || interfaceOrientation == UIInterfaceOrientationPortrait);
	
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
	_rotating = YES;
	
	if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation))
    {
		CGRect rect = [[UIScreen mainScreen] bounds];
		self.scrollView.contentSize = CGSizeMake(rect.size.height * [self.photoSource numberOfPhotos], rect.size.width);
	}
	
	//  set side views hidden during rotation animation
	NSInteger count = 0;
	for (EGOPhotoImageView *view in self.photoViews)
    {
		if ([view isKindOfClass:[EGOPhotoImageView class]]) 
        {
			if (count != _pageIndex) 
            {
				[view setHidden:YES];
			}
		}
		count++;
	}
	
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	
	for (EGOPhotoImageView *view in self.photoViews){
		if ([view isKindOfClass:[EGOPhotoImageView class]]) {
			[view rotateToOrientation:toInterfaceOrientation];
		}
	}
    
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
	
	[self setupScrollViewContentSize];
	[self moveToPhotoAtIndex:_pageIndex animated:NO];
	[self.scrollView scrollRectToVisible:((EGOPhotoImageView*)[self.photoViews objectAtIndex:_pageIndex]).frame animated:YES];
	
	//  unhide side views
	for (EGOPhotoImageView *view in self.photoViews){
		if ([view isKindOfClass:[EGOPhotoImageView class]]) {
			[view setHidden:NO];
		}
	}
	_rotating = NO;
	
}

- (void)done:(id)sender 
{

   UIInterfaceOrientation interfaceOrientation = [self interfaceOrientation];
   NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                             [NSNumber numberWithInt:interfaceOrientation], @"interfaceOrientation", 
                             nil];
   
   [[NSNotificationCenter defaultCenter] postNotificationName:kNetwork_backwardSignleImageView 
                                                       object:self 
                                                     userInfo:userInfo];
   [userInfo release];    
}

- (NSInteger)currentPhotoIndex
{	
	return _pageIndex;
}

#pragma mark - Bar Methods

- (void)setBarsHidden:(BOOL)hidden animated:(BOOL)animated
{
	if (hidden&&_barsHidden) return;
	
	if (UI_USER_INTERFACE_IDIOM()!=UIUserInterfaceIdiomPad)
    {
        [[UIApplication sharedApplication] setStatusBarHidden: hidden
                                                withAnimation: UIStatusBarAnimationFade];
    }	
    
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
		

        if (animated) 
        {
				[UIView beginAnimations:nil context:NULL];
				[UIView setAnimationDuration:0.3f];
				[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
			}
			
			self.navigationController.navigationBar.alpha = hidden ? 0.0f : 1.0f;
			
			if (animated) 
            {
				[UIView commitAnimations];
			}

	} else 
    {		
		[self.navigationController setNavigationBarHidden:hidden animated:animated];		
	}
    	
	_barsHidden=hidden;
	
}

- (void)toggleBarsNotification:(NSNotification*)notification
{
	[self setBarsHidden:!_barsHidden animated:YES];
}


#pragma mark -
#pragma mark FullScreen Methods

- (CATransform3D)transformForCurrentOrientation
{
	
	UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
	
	switch (orientation) {
		case UIInterfaceOrientationPortraitUpsideDown:
			return CATransform3DMakeRotation((M_PI/180)*180, 0.0f, 0.0f, 1.0f);
			break;
		case UIInterfaceOrientationLandscapeRight:
			return CATransform3DMakeRotation((M_PI/180)*90, 0.0f, 0.0f, 1.0f);
			break;
		case UIInterfaceOrientationLandscapeLeft:
			return CATransform3DMakeRotation((M_PI/180)*-90, 0.0f, 0.0f, 1.0f);
			break;
		default:
			return CATransform3DIdentity;
			break;
	}
	
}

#pragma mark -
#pragma mark Photo View Methods

- (NSInteger)centerPhotoIndex
{
	
	CGFloat pageWidth = self.scrollView.frame.size.width;
	return floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
	
}

- (void)moveToPhotoAtIndex:(NSInteger)index animated:(BOOL)animated 
{
	NSAssert(index < [self.photoSource numberOfPhotos] && index >= 0, @"Photo index passed out of bounds");
	
	_pageIndex = index;
    
	[self enqueuePhotoViewAtIndex:index];
	
	[self loadScrollViewWithPage:index-1];
	[self loadScrollViewWithPage:index];
	[self loadScrollViewWithPage:index+1];
	
	
	[self.scrollView scrollRectToVisible:((EGOPhotoImageView*)[self.photoViews objectAtIndex:index]).frame animated:animated];
	
	if ([[self.photoSource photoAtIndex:_pageIndex] didFail]) {
		[self setBarsHidden:NO animated:YES];
	}
	
	//  reset any zoomed side views
	if (index + 1 < [self.photoSource numberOfPhotos] && (NSNull*)[self.photoViews objectAtIndex:index+1] != [NSNull null]) {
		[((EGOPhotoImageView*)[self.photoViews objectAtIndex:index+1]) killScrollViewZoom];
	} 
	if (index - 1 >= 0 && (NSNull*)[self.photoViews objectAtIndex:index-1] != [NSNull null]) {
		[((EGOPhotoImageView*)[self.photoViews objectAtIndex:index-1]) killScrollViewZoom];
	} 	
	
}

- (void)layoutScrollViewSubviews{
	
	NSInteger _index = [self currentPhotoIndex];
	
	for (NSInteger page = _index -1; page < _index+3; page++) {
		
		if (page >= 0 && page < [self.photoSource numberOfPhotos]){
			
			CGFloat originX = self.scrollView.bounds.size.width * page;
			
			if (page < _index) {
				originX -= EGOPV_IMAGE_GAP;
			} 
			if (page > _index) {
				originX += EGOPV_IMAGE_GAP;
			}
			
			if ([self.photoViews objectAtIndex:page] == [NSNull null] || !((UIView*)[self.photoViews objectAtIndex:page]).superview){
				[self loadScrollViewWithPage:page];
			}
			
			EGOPhotoImageView *_photoView = (EGOPhotoImageView*)[self.photoViews objectAtIndex:page];
			CGRect newframe = CGRectMake(originX, 0.0f, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height);
			
			if (!CGRectEqualToRect(_photoView.frame, newframe)) {	
				
				[UIView beginAnimations:nil context:NULL];
				[UIView setAnimationDuration:0.1];
				_photoView.frame = newframe;
				[UIView commitAnimations];
                
			}
			
		}
	}
	
}

- (void)setupScrollViewContentSize
{		
	CGSize contentSize = self.view.bounds.size;
	contentSize.width = (contentSize.width * [self.photoSource numberOfPhotos]);
	
	if (!CGSizeEqualToSize(contentSize, self.scrollView.contentSize)) 
    {
		self.scrollView.contentSize = contentSize;
	}
	    
}

- (void)enqueuePhotoViewAtIndex:(NSInteger)theIndex{
	
	NSInteger count = 0;
	for (EGOPhotoImageView *view in self.photoViews)
    {
		if ([view isKindOfClass:[EGOPhotoImageView class]]) 
        {
			if (count > theIndex+1 || count < theIndex-1) 
            {
				[view prepareForReusue];
				[view removeFromSuperview];
			} else 
            {
				view.tag = 0;
			}
			
		} 
		count++;
	}	
	
}

- (EGOPhotoImageView*)dequeuePhotoView{
	
	NSInteger count = 0;
	for (EGOPhotoImageView *view in self.photoViews){
		if ([view isKindOfClass:[EGOPhotoImageView class]]) {
			if (view.superview == nil) {
				view.tag = count;
				return view;
			}
		}
		count ++;
	}	
	return nil;
	
}

- (void)loadScrollViewWithPage:(NSInteger)page {
	
    if (page < 0) return;
    if (page >= [self.photoSource numberOfPhotos]) return;
	
	EGOPhotoImageView * photoView = [self.photoViews objectAtIndex:page];
	if ((NSNull*)photoView == [NSNull null]) {
		
		photoView = [self dequeuePhotoView];
		if (photoView != nil) {
			[self.photoViews exchangeObjectAtIndex:photoView.tag withObjectAtIndex:page];
			photoView = [self.photoViews objectAtIndex:page];
		}
		
	}
	
	if (photoView == nil || (NSNull*)photoView == [NSNull null]) {
		
		photoView = [[EGOPhotoImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height)];
		[self.photoViews replaceObjectAtIndex:page withObject:photoView];
		[photoView release];
		
	} 
	
	[photoView setPhoto:[self.photoSource photoAtIndex:page]];
	
    if (photoView.superview == nil) {
		[self.scrollView addSubview:photoView];
	}
	
	CGRect frame = self.scrollView.frame;
	NSInteger centerPageIndex = _pageIndex;
	CGFloat xOrigin = (frame.size.width * page);
	if (page > centerPageIndex) {
		xOrigin = (frame.size.width * page) + EGOPV_IMAGE_GAP;
	} else if (page < centerPageIndex) {
		xOrigin = (frame.size.width * page) - EGOPV_IMAGE_GAP;
	}
	
	frame.origin.x = xOrigin;
	frame.origin.y = 0;
	photoView.frame = frame;
}


#pragma mark -
#pragma mark UIScrollView Delegate Methods


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
	
	NSInteger _index = [self centerPhotoIndex];
	if (_index >= [self.photoSource numberOfPhotos] || _index < 0) {
		return;
	}
	
	if (_pageIndex != _index && !_rotating) {
        
		[self setBarsHidden:YES animated:YES];
		_pageIndex = _index;

		if (![scrollView isTracking]) 
        {
			[self layoutScrollViewSubviews];
		}
		
	}
    
}

- (void)scrollViewDidEndDecelerating: (UIScrollView *)scrollView 
{
	
	NSInteger _index = [self centerPhotoIndex];
	if (_index >= [self.photoSource numberOfPhotos] || _index < 0) 
    {
		return;
	}
	
	[self moveToPhotoAtIndex:_index animated:YES];
    
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
	[self layoutScrollViewSubviews];
}


- (void)viewDidUnload
{
	
	self.photoViews=nil;
	self.scrollView=nil;

}

- (void)dealloc 
{
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	
	[_photoViews release], _photoViews=nil;
	[_photoSource release], _photoSource=nil;
	[_scrollView release], _scrollView=nil;
	
    [super dealloc];
}


@end