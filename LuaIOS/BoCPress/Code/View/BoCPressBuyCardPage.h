//
//  BoCPressBuyCardPage.h
//  BoCPress
//
//  Created by LeixSnake on 10/24/11.
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

#import "BoCPressUpdateArrowTableView.h"

@protocol BoCPressBuyCardDataSource;

@class BoCPressBuyCardPagePrivateHandler;
@class NSArraySlice;

@interface BoCPressBuyCardPage : BoCPressMetaPage<BoCPressShowUpdateTimePage>
{
    BoCPressUpdateArrowTableView *_contentView;

    id<BoCPressBuyCardDataSource> _buyCardDataSource;
    
    CGRect _originFrameOfContentView;
    BOOL _hasSetOriginFrame;
    NSMutableArray *_productInfoFromServer;
    
    id _animationInfo;
    BOOL _inPurchasing;
}

- (id)initWithLastPage: (id<BoCPressPage>)lastPage 
            dataSource: (id<BoCPressBuyCardDataSource>) dataSource;

- (void)showServerErrorWithData:(id)data;

- (void)wantToUpdateMoreData;

- (void)wantToBuyProduct: (id)product;

- (void)succeededTransaction: (id)info;

- (void)showErrorMessageWithData: (id)data;

- (void)failedTransaction: (id)data;

- (void)updateStateWithVerifyReceiptResult: (id)data;

- (void)updateProductIDs: (id)data;

- (void)updateUserInfo: (id)data;

- (void)canceledTransactionWithInfo: (id)userInfo;

- (void)updatePurchaseOrder: (id)data;

- (void)updatePurchaseInfo: (id)data;

- (void)didFinishedShowVIPAuthorizeSuccessView;
@end
