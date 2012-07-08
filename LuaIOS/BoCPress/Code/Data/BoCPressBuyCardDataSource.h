//
//  BoCPressBuyCardDataSource.h
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

#import <Foundation/Foundation.h>

@protocol BoCPressDataSource;
@protocol BoCPressCallback;
@protocol BoCPressProduct;


@protocol BoCPressBuyCardDataSource<NSObject>

- (void)listOrderedProductIDsRangeFrom: (NSUInteger)rangeFrom
                               rangeTo: (NSUInteger)rangeTo
                              callback: (id<BoCPressCallback>) callback;

- (void)wantToBuyProduct: (id<BoCPressProduct>)product 
            withCallback: (id<BoCPressCallback>)callback;

- (void)cancelAllPurchase;

- (void)verifyReceiptWithInfo: (NSDictionary *)userInfo
         callback: (id<BoCPressCallback>)callback;


- (void)didFinishedVerifyReceipt: (id)data;

- (void)listOrderedContentInfoOfProducts: (NSArray*)productIDs 
                                callback: (id<BoCPressCallback>)callback;

- (void)storeUserInfo: (id)data;
- (void)getUserInfoFromServerWithInfo: (NSDictionary *)info 
                             callback: (id<BoCPressCallback>)callback;

- (void)createPurchaseOrderWithCallback: (id<BoCPressCallback>)callback;
- (void)requestPurchaseWithOrderCode: (NSString *)orderCode 
                             productCode: (NSString *)productCode 
                            callback: (id<BoCPressCallback>)callback;

- (void)updatePurchaseInfo: (id)data;

@end

@interface BoCPressBuyCardDataSource : NSObject<BoCPressBuyCardDataSource>
{
    id<BoCPressDataSource> _rootDataSource;
}

- (id)initWithService: (id<BoCPressDataSource>) rootDataSource;

@end
