//
//  BoCPressSingleImageViewController.m
//  BoCPress
//
//  Created by E-Reach Administrator on 4/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressSingleImageViewController.h"

#import "BoCPressSingleImageView.h"

#import "BoCPressConstant.h"

@implementation BoCPressSingleImageViewController

- (id)initWithImage: (UIImage *)anImage
{
    self = [super init];
    if (self) 
    {
        // Custom initialization
        _singleImageView = [[BoCPressSingleImageView alloc] init];
        [_singleImageView setImage: anImage];

        [self setWantsFullScreenLayout: YES];
    }
    return self;
}

- (void)dealloc
{
    [_singleImageView release];
    [super dealloc];
}

- (void)handleReturnButtonTapedEvent: (id)sender
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

- (void)viewDidLoad
{
	// Do any additional setup after loading the view.
    UIView *selfView = [self view];
    [selfView setBackgroundColor: [UIColor blackColor]];
    [selfView addSubview: _singleImageView];
    [_singleImageView setFrame: [selfView bounds]];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle: @"返回" 
                                                                   style: UIBarButtonItemStylePlain 
                                                                  target: self
                                                                  action: @selector(handleReturnButtonTapedEvent:)];
    [[self navigationItem] setLeftBarButtonItem: doneButton];
    [doneButton release];
    
    UINavigationBar *navigationBar = [[self navigationController] navigationBar];
    [navigationBar setTintColor: nil];
    [navigationBar setBarStyle: UIBarStyleBlack];
    [navigationBar setTranslucent: YES];
    
    [super viewDidLoad];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
//    return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return YES;
}

- (void)willAnimateRotationToInterfaceOrientation: (UIInterfaceOrientation)toInterfaceOrientation
                                         duration: (NSTimeInterval)duration
{
    [_singleImageView rotateToInterfaceOrientation: toInterfaceOrientation];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    
}
@end
