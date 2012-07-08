//
//  BoCPressMarkView.m
//  Breast
//
//  Created by Zhang Shiyong on 3/24/11.
//  Copyright 2011 SJTU. All rights reserved.
//

#import "BoCPressMarkView.h"

#define kFeedBackStarTag (1000)

#define kMarkView_DRAW_START_X (20)

#define kMarkView_DRAW_START_Y (80)

#define kMarkView_DRAW_Width (32)

#define kMarkView_DefaultMark (3)

#define kMarkView_MinMark (1)

@implementation BoCPressMarkView

- (id)initWithFrame:(CGRect)frame 
{
    self=[super initWithFrame:frame];
    if(self) 
    {
        
        UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] 
                                                        initWithTarget:self
                                                        action:@selector(handlePanEvent:)];
        
        [self addGestureRecognizer:panGestureRecognizer];
        
        
        _textStrings = [NSArray arrayWithObjects:@"差",@"较差",@"一般",@"好",@"非常好", nil];
        
        CGRect frameLooper;        
        CGSize stringSize;
        
        for (int iLooper=0; iLooper<kFeedBackStarCount; ++iLooper)
        {
            UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapEvent:)] ;
            
            _imageView[iLooper] = [[UIView alloc] init];
            [_imageView[iLooper] addSubview:[[UIImageView alloc] initWithImage: [UIImage imageNamed:@"BoCPressFeedbackDeactiveStar"]]];
            
            [_imageView[iLooper] setFrame:CGRectMake(50 * iLooper, 0, 32, 31)];
            [_imageView[iLooper] addGestureRecognizer:tapGestureRecognizer];
            
            [tapGestureRecognizer release];
            
            _imageView[iLooper].tag = iLooper + 1 + kFeedBackStarTag;
            
            [self addSubview:_imageView[iLooper]];
            
            frameLooper = [_imageView[iLooper] frame];
            
            stringSize = [[_textStrings objectAtIndex:iLooper] sizeWithFont:[UIFont fontWithName:@"Heiti TC" size:20]];
            
            _textOnStars[iLooper] = [[UILabel alloc] init];
            frame.origin.y -= stringSize.height;
            frame.size = stringSize;
            [_textOnStars[iLooper] setFrame: frame];
            [_textOnStars[iLooper] setText:[_textStrings objectAtIndex:iLooper]];
            [_textOnStars[iLooper] setBackgroundColor:[UIColor clearColor]];
            
            [self addSubview:_textOnStars[iLooper]];
            
        }
        [self setBackgroundColor:[UIColor clearColor]];
        
        [self setUserInteractionEnabled:YES];
        
        [self setMark:kMarkView_DefaultMark];
    }
    return self;
}
- (void)dealloc
{
    for (int i=0; i<kFeedBackStarCount; ++i)
    {
        [_imageView[i] release];
        
        [_textOnStars[i] release];
    }
    
    [super dealloc];
}

- (void)setMark:(int)value 
{
    if(value>0&&value<=kFeedBackStarCount&&_mark!=value) 
    {
        _mark=value;
        
        for (int iLooper=0; iLooper<kFeedBackStarCount; ++iLooper) 
        {
            for( id subViewLooper in [_imageView[iLooper] subviews])
            {
                [subViewLooper removeFromSuperview];
            }
            
            [_imageView[iLooper] addSubview:[[UIImageView alloc] initWithImage: [UIImage imageNamed:@"BoCPressFeedbackDeactiveStar"]]];
            
            [_textOnStars[iLooper] setHidden:YES];
            
        }
        
        [_textOnStars[_mark - 1] setHidden:NO];
        
        for (int iLooper=0; iLooper<_mark; ++iLooper)
        {
            UIImageView *tmpImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"BoCPressFeedbackActiveStar"]] ;
            
            [_imageView[iLooper] addSubview:tmpImageView];            
            [_imageView[iLooper] bringSubviewToFront:tmpImageView];
            
            [tmpImageView release];
        }
    }
}
- (void)handleTapEvent: (id)sender
{
    [self setMark: [sender view].tag - kFeedBackStarTag];
}

- (int)markValue
{
    return _mark;
}

- (void)handlePanEvent: (id)sender
{    
    CGPoint panPoint = [(UIPanGestureRecognizer*)sender locationInView:self];
    int starCount = panPoint.x / 50 + 1;
    [self setMark:starCount];
}

@end
