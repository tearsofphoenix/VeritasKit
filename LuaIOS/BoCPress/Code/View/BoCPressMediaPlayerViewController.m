//
//  BoCPressMediaPlayerViewController.m
//  BoCPress
//
//  Created by LeixSnake on 7/22/11.
/*************************************************************************
 
 *
 
 * EREACH CONFIDENTIAL
 
 * ____________________
 
 *
 
 * [2011] eReach Mobile Software Technology Co., Ltd.
 
 * All Rights Reserved.
 
 *
 
 * NOTICE: All information contained herein is, and remains the
 
 * property of eReach Mobile Software Technology and its suppliers,
 
 * if any. The intellectual and technical concepts contained herein
 
 * are proprietary to eReach Mobile Software Technology and its
 
 * suppliers and may be covered by U.S. and Foreign Patents, patents
 
 * in process, and are protected by trade secret or copyright law.
 
 * Dissemination of this information or reproduction of this material
 
 * is strictly forbidden unless prior written permission is obtained
 
 * from eReach Mobile Software Technology Co., Ltd.
 
 */

#import "BoCPressMediaPlayerViewController.h"

#import "BoCPressConstant.h"

#import "BoCPressViewController.h"

#import "BoCPressMedia.h"

#import "BoCPressMediaType.h"

#import "BoCPressMediaDataSource.h"

#import "BoCPressMediaPlayerViewControllerPrivateHandler.h"

@implementation BoCPressMediaPlayerViewController

- (UIView*)mediaLodingViewWithTitle:(NSString*)aTitle 
                           textFont:(UIFont*)aFont
{
	UIView  *topView = [[[UIView alloc] init] autorelease];
	[topView setBackgroundColor: [UIColor clearColor]];
	
	int offsetX = 15;
	
	CGSize size = [aTitle sizeWithFont:aFont];
	
	UIActivityIndicatorView* indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
	
	[indicator setCenter: CGPointMake(indicator.frame.size.width,indicator.frame.size.width)];	
	[indicator startAnimating];	
	
	[topView addSubview:indicator];
	[indicator release];
	
	UILabel *titleLabel = [[[UILabel alloc] init] autorelease];
	[titleLabel setBackgroundColor: [UIColor clearColor]];
	[titleLabel setText: aTitle];
	[titleLabel setFont: aFont];
	[titleLabel setTextColor: [UIColor whiteColor]];
	
	[titleLabel setFrame: CGRectMake(indicator.center.x + offsetX, 
                                     indicator.frame.origin.y + (size.height - indicator.frame.size.width)/2, 
                                     size.width, 
                                     size.height)];
    
	[topView addSubview:titleLabel];
    
	[topView setFrame: CGRectMake(0, 0,
                                  indicator.frame.size.width + titleLabel.frame.size.width + offsetX, 
                                  titleLabel.frame.size.height)];
	
	return topView;
}


- (id)initWithMedia:(id<BoCPressMedia>)media 
         dataSource:(id<BoCPressMediaDataSource>)dataSource 
          mediaType:(id<BoCPressMediaType>)mediaType
{
    if ((self = [super init]))
    {
        _mediaType = [mediaType retain];
        _media = [media retain];
        _dataSource = [dataSource retain];
        _handler = [[BoCPressMediaPlayerViewControllerPrivateHandler alloc] initWithMediaPlayerViewController:self];
        
        [[self moviePlayer] setMovieSourceType:MPMovieSourceTypeStreaming];
        
        CGRect frame = CGRectMake(0, 0, 320, 480);
        UIColor *mediaBackground = nil;
        if ([[_mediaType name] isEqualToString:@"音频"])
        {
            frame = CGRectMake(0, 0, 320, 480);        
            mediaBackground  = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"BoCPressAudioPlayerBackground"]] ;
            
        }else if([[_mediaType name] isEqualToString:@"视频"])
        {
            frame = CGRectMake(0, 0, 480, 320);        
            mediaBackground = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"BoCPressMediaBackground.jpg"]] ;
        }
        
        _mediaLoadingView = [[UIView alloc] initWithFrame:frame];
        
        [_mediaLoadingView setBackgroundColor:mediaBackground];        
        [mediaBackground release];
        
        frame = [_mediaLoadingView frame];
        
        UIView *loadingView = [self mediaLodingViewWithTitle:@"载入中..." textFont:[UIFont systemFontOfSize:16]];        
        int width = loadingView.frame.size.width;
        int height = loadingView.frame.size.height;        
        [loadingView setFrame:CGRectMake((frame.size.width - width)/2, (frame.size.height - height) / 2,width,height)];
        
        [_mediaLoadingView addSubview:loadingView];
        
        
        UIButton *returnButtonForLoading = [[UIButton alloc] init];
        [returnButtonForLoading setFrame:CGRectMake(5, 27, 32, 32)];
        [returnButtonForLoading setBackgroundImage:[UIImage imageNamed:@"BoCPressMediaReturnButtonBackground"] 
                                          forState:UIControlStateNormal];
        
        [returnButtonForLoading addTarget:_handler 
                                   action:@selector(handleReturnButtonPressedEvent:) 
                         forControlEvents:UIControlEventTouchDown];
        
        
        [_mediaLoadingView addSubview:returnButtonForLoading];
        [_mediaLoadingView bringSubviewToFront:returnButtonForLoading];
        
        [returnButtonForLoading release];
        
        [[self view] addSubview:_mediaLoadingView];
        [_mediaLoadingView release];
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(mediaFinished:) 
                                                     name:MPMoviePlayerPlaybackDidFinishNotification 
                                                   object:[self moviePlayer]];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(mediaContentLoading:) 
                                                     name:MPMoviePlayerLoadStateDidChangeNotification 
                                                   object:[self moviePlayer]];
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(playStatedDidChanged:)
                                                     name: MPMoviePlayerPlaybackStateDidChangeNotification
                                                   object: nil];
        
        [_dataSource contentOfMedia: _media
                          mediaType: mediaType 
                       withCallback: _handler];
    }
    
    return self;
}

- (void)dealloc
{
    
    [_mediaType release];
    [_media release];
    [_dataSource release];
    [_handler cancelAllCallback];
    [_handler release];
    _handler = nil;
    
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    if([[_mediaType name] isEqualToString:@"视频"])
    {
        return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
    }
    
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
    
}

- (void)updateMediaWithData:(id)data
{
    id<BoCPressMedia> returnedMedia = [data objectForKey: kType_Global_MediaObject];
    
    if (_media != returnedMedia)
    {
        
        [_media release];
        _media = [returnedMedia retain];
        
        NSString *path = [_media mediaContent];
        
        NSLog(@"media_path_is:%@", path);
        
        if (path)
        {
            NSURL *mediaURL = [NSURL URLWithString:path];
            
            [[self moviePlayer] setContentURL:mediaURL];
            
            [[self moviePlayer] prepareToPlay];
            
            [[self moviePlayer] play];
            
        }
        else
        {
            UIAlertView  *alertForInvalidURL = [[UIAlertView alloc] initWithTitle:@"错误" 
                                                                          message:@"非法的URL" 
                                                                         delegate:self 
                                                                cancelButtonTitle:@"确定" 
                                                                otherButtonTitles: nil];
            
            [alertForInvalidURL show];
            [alertForInvalidURL release];
            
            
        }
    }
}

- (void)playStatedDidChanged: (NSNotification *)notification
{
    NSLog(@"userInfo%@", [notification userInfo]);
}

- (void)mediaFinished: (id)sender
{
    [[self moviePlayer] stop];
    
    UIViewController *rootViewController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [rootViewController dismissMoviePlayerViewControllerAnimated];    
    [[NSNotificationCenter defaultCenter] postNotificationName:kMediaPlayer_didBeenDismissed
                                                        object:self
                                                      userInfo:nil];

}

- (void)willCancelMediaLoading
{
    [[self moviePlayer] stop];
    UIViewController *rootViewController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [rootViewController dismissMoviePlayerViewControllerAnimated];    
    [[NSNotificationCenter defaultCenter] postNotificationName:kMediaPlayer_didBeenDismissed
                                                        object:self
                                                      userInfo:nil];
}

- (void)mediaContentLoading: (id)sender
{
    if( [[self moviePlayer] loadState] !=  MPMovieLoadStateUnknown )
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        
        [_mediaLoadingView setAlpha:0];
        
        [UIView commitAnimations];
    }
}

@end
