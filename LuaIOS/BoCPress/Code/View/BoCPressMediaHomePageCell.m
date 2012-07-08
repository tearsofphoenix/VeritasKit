//
//  BoCPressMediaHomePageCell.m
//  BoCPress
//
//  Created by E-Reach Administrator on 7/6/11.
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

#import "BoCPressMediaHomePageCell.h"

#import "BoCPressImageView.h"

#import "BoCPressMedia.h"

#import "BoCPressMediaHomeDataSource.h"

#import "BoCPressMediaHomePageCellPrivateHandler.h"

#import "BoCPressConstant.h"

@implementation BoCPressMediaHomePageCell

@synthesize selected = _selected;

- (id)initWithMedia: (id<BoCPressMedia>)media 
{
    self = [super init];
    if (self)
    {
        // Initialization code
        
        _selected = NO;
        
        _handler = [[BoCPressMediaHomePageCellPrivateHandler alloc] initWithCell:self];
        [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
        
        [self setClipsToBounds:YES];
        
        UIImageView *backgroundView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"BoCPressMediaTabHomeCellBackground"]];
        [self addSubview:backgroundView];
        [backgroundView release];
        
        
        
        _thumbnailView = [[UIImageView alloc] init];

        
        [_thumbnailView setImage:[UIImage imageNamed:@"BoCPressDefaultImage"]];


        [_thumbnailView setBackgroundColor: [UIColor blackColor]];
        [_thumbnailView setFrame: CGRectMake(17, 6, 75, 56)];
        
        NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                                  _handler, kNetwork_CallbackObject,
                                  kBoCPress_View_updateThumbnailImage, kNetwork_CallbackAction,
                                  [media thumbnailImageURL], kBoCPress_Global_NSURLObject, 
                                  [media identity], @"imageID", 
                                  nil];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kSoapDataSource_notificationForGetImage 
                                                            object:self
                                                          userInfo:userInfo];
        
        [self addSubview: _thumbnailView];
        
        _nameLabel = [[UILabel alloc] init] ;
        
        [_nameLabel setTextColor: [UIColor colorWithRed: 93.0 / 255 
                                                  green: 93.0 / 255
                                                   blue: 93.0 / 255
                                                  alpha: 1]];
        [_nameLabel setBackgroundColor: [UIColor clearColor]];
        [_nameLabel setTextAlignment: UITextAlignmentLeft];
        [_nameLabel setText: [media name]];
        [_nameLabel setFont: [UIFont fontWithName: @"Helvetica" size: 15]];
        
        [_nameLabel setFrame: CGRectMake(100, 6, 190, 15)];
        
        [self addSubview: _nameLabel];
        
        _detailLabel = [[UILabel alloc] init] ;
        [_detailLabel setTextColor: [UIColor colorWithRed: 93.0 / 255 
                                                    green: 93.0 / 255
                                                     blue: 93.0 / 255
                                                    alpha: 1]];
        [_detailLabel setBackgroundColor: [UIColor clearColor]];
        [_detailLabel setFont: [UIFont fontWithName: @"Helvetica" size: 12]];
        
        NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
        [formatter setDateFormat: @"yyyy-MM-dd HH:mm"];
        NSString *time = [formatter stringFromDate: [media postTime]];
        
        id playingDuration = [media mediaPlayingDuration];
        
        [_detailLabel setText: [NSString stringWithFormat: @"发布时间：%@\n播放时长：%@", time, playingDuration]];
        [_detailLabel setNumberOfLines: 2];
        [_detailLabel setLineBreakMode: UILineBreakModeCharacterWrap];
        
        [_detailLabel setFrame: CGRectMake(100, 35, 190, 28)];
        
        [self addSubview: _detailLabel];
        
        
    }
    return self;
}
- (void)dealloc
{
    
    [_handler cancelAllCallback];
    [_handler release];

    [_thumbnailView release];
    [_nameLabel release];
    [_detailLabel release];
    
    [super dealloc];
}

- (void)layoutSubviews
{
    CGRect frame = [self frame];
    
    CGFloat cellHeight = 69;
    CGFloat adjustY = cellHeight - frame.size.height;
    
    [_thumbnailView setFrame: CGRectMake(17, 6 - adjustY, 75, 56)];
    [_nameLabel setFrame: CGRectMake(100, 6 - adjustY, 190, 15)];
    [_detailLabel setFrame: CGRectMake(100, 35 - adjustY, 190, 28)];
    
}

- (void)updateThumbnailImage:(id)data
{
    UIImage *image = [UIImage imageWithData: [data objectForKey: @"data"]];
    if(image)
    {
        [_thumbnailView setImage: image];
    }
}




@end
