//
//  BoCPressMediaListPageCell.m
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

#import "BoCPressMediaListPageCell.h"

#import "BoCPressMediaListDataSource.h"

#import "BoCPressMediaListPageCellPrivateHandler.h"

#import "BoCPressMedia.h"

#import "BoCPressConstant.h"


@implementation BoCPressMediaListPageCell


- (id)initWithMedia:(id<BoCPressMedia>) media
{
    
    if ((self = [super init]))
    {
        _handler = [[BoCPressMediaListPageCellPrivateHandler alloc] initWithCell:self];
        [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        [self setBackgroundView: [[[UIImageView alloc] initWithImage: [UIImage imageNamed:@"BoCPressMediaTabCellBackground"]] autorelease]];
        
        _thumbnailView = [[UIImageView alloc] init];

        [_thumbnailView setImage:[UIImage imageNamed:@"BoCPressDefaultImage"]];

        [_thumbnailView setBackgroundColor: [UIColor blackColor]];
        [_thumbnailView setFrame: CGRectMake(10, 6, 75, 56)];
        
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
        
        UILabel *nameLabel = [[[UILabel alloc] init] autorelease];
        
        [nameLabel setTextColor: [UIColor colorWithRed: 93.0 / 255 
                                                 green: 93.0 / 255
                                                  blue: 93.0 / 255
                                                 alpha: 1]];
        [nameLabel setBackgroundColor: [UIColor clearColor]];
        [nameLabel setTextAlignment: UITextAlignmentLeft];
        [nameLabel setText: [media name]];
        [nameLabel setFont: [UIFont fontWithName: @"Helvetica" size: 15]];
        
        [nameLabel setFrame: CGRectMake(93, 6, 190, 15)];
        
        [self addSubview: nameLabel];
        
        UILabel *detailLabel = [[[UILabel alloc] init] autorelease];
        [detailLabel setTextColor: [UIColor colorWithRed: 93.0 / 255 
                                                   green: 93.0 / 255
                                                    blue: 93.0 / 255
                                                   alpha: 1]];
        [detailLabel setBackgroundColor: [UIColor clearColor]];
        [detailLabel setFont: [UIFont fontWithName: @"Helvetica" size: 12]];
        
        NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
        [formatter setDateFormat: @"yyyy-MM-dd HH:mm"];
        NSString *time = [formatter stringFromDate: [media postTime]];
        
        
        id playingDuration = [media mediaPlayingDuration];
        [detailLabel setText: [NSString stringWithFormat: @"发布时间：%@\n播放时长：%@", time, playingDuration]];
        [detailLabel setNumberOfLines: 2];
        [detailLabel setLineBreakMode: UILineBreakModeCharacterWrap];
        
        [detailLabel setFrame: CGRectMake(93, 35, 190, 28)];
        
        [self addSubview: detailLabel];
        
    }
    
    return self;
}

- (void)dealloc
{
    
    [_handler cancelAllCallback];
    [_handler release];
    [_thumbnailView release];
    
    [super dealloc];
}

- (void)updateThumbnailImage:(id)data
{
    if (data)
    {
        UIImage *image = [UIImage imageWithData: [data objectForKey: @"data"]];
        [_thumbnailView setImage: image];
    }
}


@end
