//
//  ViewController.m
//  OriginApp
//
//  Created by Mac003 on 14/12/30.
//  Copyright (c) 2014年 NewGrace. All rights reserved.
//

#import "ViewController.h"
#import <CoreGraphics/CoreGraphics.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear: animated];
    
    NSLog(@"%@", NSStringFromCGRect(CGRectNull));
    NSLog(@"%@", NSStringFromCGRect(CGRectInfinite));
 
}

@end
