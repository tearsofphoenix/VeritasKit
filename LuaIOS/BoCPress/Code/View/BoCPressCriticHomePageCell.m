//
//  BoCPressCriticHomePageCell.m
//  BoCPress
//
//  Created by E-Reach Administrator on 7/8/11.
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

#import "BoCPressCriticHomePageCell.h"

#import "BoCPressCriticHomePageCellPrivateHandler.h"

#import "BoCPressNews.h"

#import "BoCPressAuthor.h"

#import "BoCPressCriticDataSource.h"

#import "BoCPressConstant.h"

@implementation BoCPressCriticHomePageCell

- (id)initWithNews:(id<BoCPressNews>) news
            author: (id<BoCPressAuthor> )author
{
    self = [super init];
    if (self) 
    {
        // Initialization code here.
        [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];

        _handler = [[BoCPressCriticHomePageCellPrivateHandler alloc] initWithCell:self];
        
        UIImageView *backgroundView = [[[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressCriticTabCellBackground"]] autorelease];
        [self setBackgroundView: backgroundView];
                
        _thumbnailView = [[UIImageView alloc] init];
        
            [_thumbnailView setImage:[UIImage imageNamed:@"BoCPressDefaultImage"]];
        
        
        [_thumbnailView setBackgroundColor: [UIColor blackColor]];
        [_thumbnailView setFrame: CGRectMake(15, 10, 60, 45)];
        
        NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                                  _handler, kNetwork_CallbackObject,
                                  kBoCPress_View_updateThumbnailImage, kNetwork_CallbackAction,
                                  [author authorAvatarImageURL], kBoCPress_Global_NSURLObject, 
                                  [author identity], @"imageID",
                                  nil];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kSoapDataSource_notificationForGetImage 
                                                            object:self
                                                          userInfo:userInfo];

        [self addSubview: _thumbnailView];
        
        UILabel *authorNameLabel = [[[UILabel alloc] init] autorelease];
        [authorNameLabel setText: [[news author] name]];
        [authorNameLabel setFrame: CGRectMake(15, 55, 60, 16)];
        [authorNameLabel setBackgroundColor: [UIColor colorWithRed: 183.0 / 255
                                                             green: 24.0 / 255 
                                                              blue: 47.0 / 255
                                                             alpha: 1]];
        [authorNameLabel setTextColor: [UIColor whiteColor]];
        [authorNameLabel setTextAlignment: UITextAlignmentCenter];
        [authorNameLabel setFont: [UIFont fontWithName: @"Helvetica" size: 10]];
        [self addSubview: authorNameLabel];
        
        CGFloat labelOffset = 3;
        
        UILabel *newsNameLabel = [[[UILabel alloc] init] autorelease];
        NSString *newsName = [news name];
        CGFloat newsNameHeight = [newsName sizeWithFont:[UIFont fontWithName: @"Helvetica" size: 15]].height;
        
        [newsNameLabel setText: [news name]];
        [newsNameLabel setTextColor: [UIColor colorWithRed: 183.0 / 255
                                                     green: 24.0 / 255 
                                                      blue: 47.0 / 255
                                                     alpha: 1]];
        [newsNameLabel setFrame: CGRectMake(90, 10, 209, newsNameHeight)];
        [newsNameLabel setFont: [UIFont fontWithName: @"Helvetica" size: 15]];
        [newsNameLabel setBackgroundColor: [UIColor clearColor]];
        [self addSubview: newsNameLabel];
        
        UILabel *newsAbstractLabel = [[[UILabel alloc] init] autorelease];
        CGFloat newsAbstractHeight = [[news articleAbstract] sizeWithFont:[UIFont fontWithName: @"Helvetica" size: 12]].height;
        [newsAbstractLabel setText: [news articleAbstract]];
        [newsAbstractLabel setNumberOfLines: 2];
        [newsAbstractLabel setLineBreakMode: UILineBreakModeWordWrap];
        [newsAbstractLabel setFrame: CGRectMake(90, [newsNameLabel frame].origin.y + newsNameHeight + labelOffset, 209, newsAbstractHeight * [newsAbstractLabel numberOfLines])];
        [newsAbstractLabel setFont: [UIFont fontWithName: @"Helvetica" size: 12]];
        [newsAbstractLabel setBackgroundColor: [UIColor clearColor]];
        [newsAbstractLabel setTextColor: [UIColor colorWithRed: 93.0 / 255
                                                         green: 93.0 / 255
                                                          blue: 93.0 / 255 
                                                         alpha: 1]];
        
        [self addSubview: newsAbstractLabel];
        
        NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
        [formatter setDateFormat: @"发布时间：yyyy-MM-dd HH:mm"];        
        NSString *time = [formatter stringFromDate: [news postTime]];

        CGFloat timeStringHeight = [time sizeWithFont:[UIFont fontWithName: @"Helvetica" size: 10]].height;
        
        UILabel *postTimeLabel = [[[UILabel alloc] init] autorelease];
        [postTimeLabel setText: time];
        [postTimeLabel setTextColor: [UIColor colorWithRed: 93.0 / 255 
                                                     green: 93.0 / 255
                                                      blue: 93.0 / 255
                                                     alpha: 1.0]];
        [postTimeLabel setFont: [UIFont fontWithName: @"Helvetica" size: 10]];
        [postTimeLabel setBackgroundColor: [UIColor clearColor]];

        CGFloat minTimeLabelOriginY = 60;
        if (minTimeLabelOriginY < [newsAbstractLabel frame].origin.y + newsAbstractHeight * [newsAbstractLabel numberOfLines] + labelOffset)
        {
            minTimeLabelOriginY = [newsAbstractLabel frame].origin.y + newsAbstractHeight * [newsAbstractLabel numberOfLines] + labelOffset;
        }
        
        [postTimeLabel setFrame: CGRectMake(90, minTimeLabelOriginY, 280, timeStringHeight)];
        
        [self addSubview:postTimeLabel];
        

    }
    
    return self;
}

- (void)dealloc
{
    
    [_handler release];
    [_thumbnailView release];
    
    [super dealloc];
}

- (void)updateThumbnailImage:(id)data
{
    UIImage *image = [UIImage imageWithData: [data objectForKey: @"data"]];
    if (image)
    {
        [_thumbnailView setImage: image];
    }
}


@end
