//
//  BoCPressLongTermQuoteListPagePrivateHandler.m
//  BoCPress
//
//  Created by LeixSnake on 8/2/11.
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

#import "BoCPressLongTermQuoteListPagePrivateHandler.h"

#import "BoCPressLongTermQuoteListPage.h"

#import "UIGalleryViewThumbnail.h"

#import "BoCPressLongTermSecurity.h"

#import "BoCPressConstant.h"

#import "BoCPressViewConstants.h"


@implementation BoCPressLongTermQuoteListPagePrivateHandler

- (id)initWithListPage: (BoCPressLongTermQuoteListPage *)page 
               rowView:(UIGalleryView *)rowView 
            columnView:(UIGalleryView *)columnView 
           galleryView:(UIGalleryView *)galleryView 
          ofSecurities:(NSArray *)securities
{
    self = [super init];
    if (self) 
    {
        // Initialization code here.
        _page = page;
        _securities = securities;
        _rowView = rowView;
        _columnView = columnView;
        _galleryView = galleryView;
    }
    
    return self;
}

#pragma mark - gellery view
- (CGFloat)cellWidth
{
    return 106;
}

- (CGFloat)cellHeight
{
    return 34;
}

- (UIGalleryViewThumbnail *)galleryView:(UIGalleryView *)galleryView thumbnailAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellWidth = [self cellWidth];
    CGFloat cellHeight = [self cellHeight];
    
    NSUInteger securitiesCount = [_securities count];
    
    UIGalleryViewThumbnail *galleryViewThumbnail = [[[UIGalleryViewThumbnail alloc] init] autorelease];
    
    NSUInteger timeLabelIndex = [indexPath indexAtPosition:1];
    
    [galleryViewThumbnail setFrame:CGRectMake(cellWidth * timeLabelIndex, 0, cellWidth, 320)];
    
    NSMutableArray *securityLabels = [[NSMutableArray alloc] init];
    
    for (int securityLooper = 0; securityLooper < securitiesCount; ++securityLooper)
    {
        UILabel *securityLabelLooper = [[UILabel alloc] init];
        
        [securityLabelLooper setTextAlignment:UITextAlignmentCenter];
        [securityLabelLooper setBackgroundColor: [UIColor clearColor]];
        [securityLabelLooper setFont: [UIFont fontWithName: @"Helvetica" size: 15]];
        [securityLabels addObject:securityLabelLooper];
        
        [securityLabelLooper release];
    }
        
    switch (timeLabelIndex)
    {
        case 0:
        {
            
            for (int securityLooper = 0; securityLooper<securitiesCount; ++securityLooper)
            {
                BoCPressLongTermSecurity *security = [_securities objectAtIndex:securityLooper];
                
                [[securityLabels objectAtIndex:securityLooper] setText:[security oneWeekValue]];
            }
            
            break;
        }
        case 1:
        {

            for (int securityLooper = 0; securityLooper<securitiesCount; ++securityLooper)
            {
                BoCPressLongTermSecurity *security = [_securities objectAtIndex:securityLooper];
                
                [[securityLabels objectAtIndex:securityLooper] setText:[security oneMonthValue]];
            }
            
            break;
        }
        case 2:
        {

            for (int securityLooper = 0; securityLooper<securitiesCount; ++securityLooper)
            {
                BoCPressLongTermSecurity *security = [_securities objectAtIndex:securityLooper];
                
                [[securityLabels objectAtIndex:securityLooper] setText:[security threrMonthValue]];
            }
            
            break;
        }
        case  3:
        {

            for (int securityLooper = 0; securityLooper<securitiesCount; ++securityLooper)
            {
                BoCPressLongTermSecurity *security = [_securities objectAtIndex:securityLooper];
                
                [[securityLabels objectAtIndex:securityLooper] setText:[security sixMonthValue]];
            }
            
            break;
        }
        case 4:
        {

            for (int securityLooper = 0; securityLooper<securitiesCount; ++securityLooper)
            {
                BoCPressLongTermSecurity *security = [_securities objectAtIndex:securityLooper];
                
                [[securityLabels objectAtIndex:securityLooper] setText:[security nineMonthValue]];
            }
            
            break;
        }
        case 5:
        {

            for (int securityLooper = 0; securityLooper<securitiesCount; ++securityLooper)
            {
                BoCPressLongTermSecurity *security = [_securities objectAtIndex:securityLooper];
                
                [[securityLabels objectAtIndex:securityLooper] setText:[security twelveMonthValue]];
            }
            
            break;
        }
        default:
        {
            break;
        }
    }
        
    for (int securityLooper = 0; securityLooper<securitiesCount; ++securityLooper)
    {
        UILabel *securityLabelLooper = [securityLabels objectAtIndex:securityLooper];
        
        [securityLabelLooper setFrame:CGRectMake(0, cellHeight * securityLooper , cellWidth, cellHeight)];
        
        [galleryViewThumbnail addSubview:securityLabelLooper];
    }
    
    [securityLabels release];
    
    return galleryViewThumbnail;
}

- (NSInteger)galleryView: (UIGalleryView *)galleryView numberOfThumbnailsInSectionAtIndex:(NSInteger)sectionIndex
{
    return kBoCPress_View_LongTermSecurityTimeCount;
}

- (NSInteger) numberOfSectionsInGalleryView: (UIGalleryView *)galleryView
{
    return 1;
}

- (CGSize)galleryView:(UIGalleryView *)galleryView sizeForThumbnailAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger cellCount = [_securities count];
    
    return CGSizeMake([self cellWidth], [self cellHeight] * cellCount);
}

- (void)galleryView: (UIGalleryView *)galleryView willSelectThumbnailAtIndexPath: (NSIndexPath *)indexPath
{
    ;
}

- (void)galleryView: (UIGalleryView *)galleryView didSelectThumbnailAtIndexPath: (NSIndexPath *)indexPath
{
    ;
}

- (void) galleryView:(UIGalleryView *)galleryView didSetContentOffset:(CGPoint)contentOffset
{
    if (galleryView == _rowView 
        || galleryView == _columnView) 
    {
        [_page linkageOfContentOffset:contentOffset];
    }
}

#pragma mark - BoCPress Callback

- (void)callbackForAction:(id)action withData:(id)data
{
    if (_callbackFlag)
    {
        if ([action isEqual:kCallbackAction_listOrderedLongTermSecurityInFamily])
        {
            NSArray *slice = [data objectForKey: kType_Global_NSArray];
            [_page updateData: slice];
            
        }else if ([kCallbackAction_tryWithPreviousCallbackActionAgainAfterServerError isEqualToString: action])
        {
            NSString *previousCallbackAction = [data objectForKey: kNetwork_CallbackStoredCallbackInfo];
            if ( [previousCallbackAction isEqualToString: kCallbackAction_listOrderedMediaOfType])
            {
                [_page didUpdateData];
                NSDictionary * animationInfo = [[NSDictionary alloc] initWithObjectsAndKeys: 
                                                kBoCPress_View_AnimationTypeTopToBottom, 
                                                kBoCPress_Global_AnimationType, nil];
                [_page wantToUpdateDataWithInfo: animationInfo];
                [animationInfo release];
            }
        }
    }
}
@end
