//
//  BoCPressLongTermQuoteListPagePrivateHandler.h
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

#import "UIGalleryViewDataSource.h"

#import "UIGalleryViewDelegate.h"

#import "BoCPressCallback.h"
//@protocol UIGalleryViewDelegate;
//@protocol UIGalleryViewDataSource;
//@protocol BoCPressCallback;

@class BoCPressLongTermQuoteListPage;

@interface BoCPressLongTermQuoteListPagePrivateHandler : BoCPressCallback<UIGalleryViewDelegate, UIGalleryViewDataSource >
{
    BoCPressLongTermQuoteListPage *_page;
    
    NSArray *_securities;
    
    UIGalleryView * _rowView;
    UIGalleryView *_columnView;
    UIGalleryView *_galleryView;
    
}

- (id)initWithListPage: (BoCPressLongTermQuoteListPage *)page 
               rowView:(UIGalleryView *)rowView 
            columnView:(UIGalleryView *)columnView 
           galleryView:(UIGalleryView *)galleryView 
          ofSecurities:(NSArray *)securities;

- (CGFloat)cellWidth;

- (CGFloat)cellHeight;

@end
