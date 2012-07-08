//
//  BoCPressLongTermQuoteListPage.h
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

#import <UIKit/UIKit.h>

#import "BoCPressMetaPage.h"

@protocol BoCPressQuoteListDataSource;
@protocol BoCPressSecurityFamily;
@class BoCPressLongTermQuoteListPagePrivateHandler;
@class UIGalleryView;

@interface BoCPressLongTermQuoteListPage : BoCPressMetaPage
{
    id<BoCPressSecurityFamily> _family;
    NSMutableArray *_securities;
    id<BoCPressQuoteListDataSource> _dataSource;
        
    UIGalleryView *_galleryView;
    
    UIImageView *_familiesView;

    UIGalleryView *_timeHeaderView;

    UIImageView *_shadowViewOfHeader;
    
    UILabel *_updateTimeLabel;
    
    UIImageView *_footerShadowView;

    
    
    UIView *_backgroundHeaderView;
    UIImageView *_backgroundView;
    
    UILabel *_securityNameLabel;
}

- (id)initWithLastPage: (id<BoCPressPage>)lastPage
     forSecurityFamily: (id<BoCPressSecurityFamily>)family
        fromDataSource: (id<BoCPressQuoteListDataSource>)dataSource;

- (void)updateData: (NSArray *)securities;

- (void)linkageOfContentOffset: (CGPoint)contentOffset;

@end
