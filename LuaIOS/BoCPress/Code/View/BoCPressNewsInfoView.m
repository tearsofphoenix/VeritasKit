//
//  BoCPressNewsInfoView.m
//  BoCPress
//
//  Created by LeixSnake on 7/27/11.
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

#import "BoCPressNewsInfoView.h"

#import "BoCPressNews.h"

#import "BoCPressAuthor.h"

@implementation BoCPressNewsInfoView

- (id)initWithNews:(id<BoCPressNews>)news
{
    self = [super init];
    if (self) 
    {
        // Initialization code here.
//        _authorNameLabel = [[[UILabel alloc] init] autorelease];
//        [_authorNameLabel setText: [[news author] name]];
//        [_authorNameLabel setFrame: CGRectMake(15, 55, 60, 16)];
//        [_authorNameLabel setBackgroundColor: [UIColor colorWithRed: 183.0 / 255
//                                                              green: 24.0 / 255 
//                                                               blue: 47.0 / 255
//                                                              alpha: 1]];
//        [_authorNameLabel setTextColor: [UIColor whiteColor]];
//        [_authorNameLabel setTextAlignment: UITextAlignmentCenter];
//        [_authorNameLabel setFont: [UIFont fontWithName: @"Helvetica" size: 10]];
//        [self addSubview: _authorNameLabel];
        NSString *newsName = [news name];
        CGFloat newsNameHeight = [newsName sizeWithFont:[UIFont fontWithName: @"Helvetica" size: 15]].height;
        
        CGFloat offset = 3;
        
        _newsNameLabel = [[[UILabel alloc] init] autorelease];
        [_newsNameLabel setText: [news name]];
        [_newsNameLabel setTextColor: [UIColor colorWithRed: 183.0 / 255
                                                      green: 24.0 / 255 
                                                       blue: 47.0 / 255
                                                      alpha: 1]];
        [_newsNameLabel setFrame: CGRectMake(0, offset, 320, newsNameHeight)];
        [_newsNameLabel setFont: [UIFont fontWithName: @"Helvetica" size: 15]];
        [_newsNameLabel setNumberOfLines:2];
        [_newsNameLabel setBackgroundColor: [UIColor clearColor]];
        [_newsNameLabel setTextAlignment:UITextAlignmentCenter];
        
        
        [self addSubview: _newsNameLabel];
        
//        NSString *newsAbstract = [news articleAbstract];
//        CGFloat newsAbstractHeight = [newsAbstract sizeWithFont:[UIFont fontWithName: @"Helvetica" size: 12]].height;
//        
//        _newsAbstractLabel = [[UILabel alloc] init] ;
//        [_newsAbstractLabel setText: [news articleAbstract]];
//        [_newsAbstractLabel setNumberOfLines: 2];
//        [_newsAbstractLabel setLineBreakMode: UILineBreakModeWordWrap];
//        
//        [_newsAbstractLabel setFrame: CGRectMake(0, [_newsNameLabel frame].origin.y + newsNameHeight + offset, 320, newsAbstractHeight)];
//        [_newsAbstractLabel setFont: [UIFont fontWithName: @"Helvetica" size: 12]];
//        [_newsAbstractLabel setBackgroundColor: [UIColor clearColor]];
//        [_newsAbstractLabel setTextColor: [UIColor colorWithRed: 93.0 / 255
//                                                         green: 93.0 / 255
//                                                          blue: 93.0 / 255 
//                                                         alpha: 1]];
//        [_newsAbstractLabel setTextAlignment:UITextAlignmentCenter];
//        
//        [self addSubview: _newsAbstractLabel];
        
        NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
        [formatter setDateFormat: @"发布时间：yyyy-MM-dd HH:mm"];        
        NSString *time = [formatter stringFromDate: [news postTime]];
   
        CGFloat timeStringHeight = [time sizeWithFont:[UIFont fontWithName: @"Helvetica" size: 10]].height;
        
        _postTimeLabel = [[UILabel alloc] init] ;
        [_postTimeLabel setText: time];
        [_postTimeLabel setTextColor: [UIColor colorWithRed: 93.0 / 255 
                                                     green: 93.0 / 255
                                                      blue: 93.0 / 255
                                                     alpha: 1.0]];
        [_postTimeLabel setFont: [UIFont fontWithName: @"Helvetica" size: 10]];
        [_postTimeLabel setBackgroundColor: [UIColor clearColor]];
        [_postTimeLabel setFrame: CGRectMake(0, [_newsNameLabel frame].origin.y + newsNameHeight + offset, 320, timeStringHeight)];
        
        [_postTimeLabel setTextAlignment:UITextAlignmentCenter];
        [self addSubview:_postTimeLabel];
     
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    
    return self;
}

- (void)dealloc
{
    [_newsNameLabel release];
//    [_newsAbstractLabel release];
    [_postTimeLabel release];
    
    [super dealloc];
}
- (void)setNews:(id<BoCPressNews>)news
{
    if (news)
    {
        [_newsNameLabel setText:[news name]];
//        [_newsAbstractLabel setText:[news articleAbstract]];
        
        NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
        [formatter setDateFormat: @"发布时间：yyyy-MM-dd HH:mm"];        
        NSString *time = [formatter stringFromDate: [news postTime]];
        
        [_postTimeLabel setText:time];
    }
}
@end
