//
//  BoCPressFeedBackView.m
//  BoCPress
//
//  Created by LeixSnake on 6/16/11.
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



#import "BoCPressFeedBackView.h"

#import "BoCPressDataSource.h"

#import "BoCPressMarkView.h"

#import "BoCPressConstant.h"

@implementation BoCPressFeedBackView

- (id) initWithNews: (id<BoCPressNews>)news
           callback: (id<BoCPressCallback>) callback
        averageRate: (id) averageRate
          rateCount: (id) rateCount
         dataSource: (id<BoCPressDataSource>)dataSource
         repeatFlag: (id) repeatFlag

{
    self = [super init];
    if (self) 
    {
        _rateCount = [rateCount retain];
        _averageRate = [averageRate retain];
        _news = [news retain];
        _callback = callback;
        _dataSource = [dataSource retain];
        
        [self setFrame:CGRectMake(24, 170, 282, 177)];
        _backGroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BoCPressPanelBackground"]];
        
        [self addSubview:_backGroundView];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 282, 36)];
        [_titleLabel setText:@"评价"];
        [_titleLabel setTextAlignment:UITextAlignmentCenter];
        [_titleLabel setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_titleLabel];
        
        
        
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 36, 282, 44)];
        
        if ([repeatFlag isEqual:kFeedBack_HasCommentedNews]) 
        {
            if (_rateCount && _averageRate)
            {
                
                [_contentLabel setText:[NSString stringWithFormat:@"%@份评价的平均分为%.2f，\n您已经评价过了，请勿重复评价。", _rateCount, [_averageRate floatValue]]];
            }else
            {
                [_contentLabel setText:@"0份评价的平均分为0.0"];
            }
            [_contentLabel setTextAlignment:UITextAlignmentCenter];
            [_contentLabel setBackgroundColor:[UIColor clearColor]];
            [_contentLabel setNumberOfLines:2];
            
            [self addSubview:_contentLabel];
            _cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(90, 125, 113 * 2 /3, 34 * 2/3)];
            [_cancelButton setBackgroundImage:[UIImage imageNamed:@"BoCPressPanelCancelButton"] forState:UIControlStateNormal];
            
            UITapGestureRecognizer *tapGestureRecognizerForCancel = [[UITapGestureRecognizer alloc] initWithTarget: self
                                                                                                            action: @selector(cancelFeedBack)];
            
            [_cancelButton addGestureRecognizer:tapGestureRecognizerForCancel];
            [tapGestureRecognizerForCancel release];
            [self addSubview:_cancelButton];
            
        }else
        {
            
            if (_rateCount && _averageRate)
            {
                
                [_contentLabel setText:[NSString stringWithFormat:@"%@份评价的平均分为%.2f", _rateCount, [_averageRate floatValue]]];
            }else
            {
                [_contentLabel setText:@"0份评价的平均分为0.0"];
            }
            [_contentLabel setTextAlignment:UITextAlignmentCenter];
            [_contentLabel setBackgroundColor:[UIColor clearColor]];
            [self addSubview:_contentLabel];
            
            
            _stars = [[BoCPressMarkView alloc] initWithFrame:CGRectMake(20, 100, 250, 80)];
            [self addSubview:_stars];
                        
            _submitButton = [[UIButton alloc] initWithFrame:CGRectMake(145 + 20, 125 + 10, 113 * 2 / 3, 34 * 2 /3)];
            [_submitButton setBackgroundImage:[UIImage imageNamed:@"BoCPressPanelOKButton"] forState:UIControlStateNormal];
            
            UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget: self 
                                                                                                   action: @selector(submitFeedBack)];            
            [_submitButton addGestureRecognizer:tapGestureRecognizer];
            [tapGestureRecognizer release];
            
            [self addSubview:_submitButton];
            
            _cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(25 + 30, 125 + 10, 113 * 2 / 3, 34 * 2 / 3 )];
            [_cancelButton setBackgroundImage:[UIImage imageNamed:@"BoCPressPanelCancelButton"] forState:UIControlStateNormal];
            
            UITapGestureRecognizer *tapGestureRecognizerForCancel = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelFeedBack)] ;
            
            [_cancelButton addGestureRecognizer:tapGestureRecognizerForCancel];
            
            [tapGestureRecognizerForCancel release];
            
            [self addSubview:_cancelButton];
            
            
            [self bringSubviewToFront:_submitButton];
        }
    }
    
    return self;
}

- (void)dealloc
{
    [_rateCount release];
    [_averageRate release];
    [_news release];

    [_dataSource release];
    
    [super dealloc];
}


- (void)submitFeedBack
{
    [self rate];    
    [_dataSource submitFeedback: self 
                         toNews: _news
                   withCallback: _callback];
}

- (id)target
{
    return _news;
}

- (int)rate
{
    return [_stars markValue];
}

- (id)identity
{
    return @"BoCPressFeedBackView";
}

- (void)cancelFeedBack
{
    NSLog(@"cancel feedback");
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kBoCPressViewControllerPrivateHandler_notificationForRemoveFeedBackView
                                                        object:self 
                                                      userInfo: nil];
}
@end
