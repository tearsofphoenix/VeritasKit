//
//  BoCPressBuyCardDataSource.m
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

#import "BoCPressBuyCardDataSource.h"

#import "BoCPressDataSource.h"

#import "BoCPressCallback.h"

#import "NSArraySlice.h"

#import "BoCPressProduct.h"

#import "BoCPressConstant.h"

@implementation BoCPressBuyCardDataSource

- (id)initWithService:(id<BoCPressDataSource>)rootDataSource
{
    if ((self = [super init]))
    {
        _rootDataSource = rootDataSource;
    }
    return self;
}

- (void)listOrderedProductIDsRangeFrom: (NSUInteger)rangeFrom
                               rangeTo: (NSUInteger)rangeTo
                              callback: (id<BoCPressCallback>) callback
{
    [_rootDataSource  listOrderedProductIDsRangeFrom:rangeFrom
                                             rangeTo:rangeTo
                                            callback:callback];

}

- (void)wantToBuyProduct:(id<BoCPressProduct>)product 
            withCallback:(id<BoCPressCallback>)callback
{
    [_rootDataSource wantToPurchaseProduct:product 
                              withCallback:callback];
}

- (void)cancelAllPurchase
{
    [_rootDataSource cancelAllPurchase];
}

- (void)verifyReceiptWithInfo: (NSDictionary *)userInfo
                     callback: (id<BoCPressCallback>)callback
{
    [_rootDataSource verifyReceiptWithInfo:userInfo
                                  callback:callback];
}

- (void)didFinishedVerifyReceipt: (id)data
{
    [_rootDataSource didFinishedVerifyReceipt:data];
}

- (void)listOrderedContentInfoOfProducts: (NSArray*)productIDs 
                                callback: (id<BoCPressCallback>)callback
{
    [_rootDataSource listOrderedContentInfoOfProducts:productIDs callback:callback];
}

- (void)getUserInfoFromServerWithInfo: (NSDictionary *)info 
                             callback: (id<BoCPressCallback>)callback
{
    [_rootDataSource getUserInfoFromServerWithInfo: info
                                          callback: callback];
}

- (void)storeUserInfo:(id)data
{
    [_rootDataSource storeUserInfo:data];
}

- (void)createPurchaseOrderWithCallback:(id<BoCPressCallback>)callback
{
    [_rootDataSource createPurchaseOrderWithCallback: callback];
}

- (void)requestPurchaseWithOrderCode: (NSString *)orderCode 
                         productCode: (NSString *)productCode 
                            callback: (id<BoCPressCallback>)callback
{
    [_rootDataSource requestPurchaseWithOrderCode: orderCode 
                                      productCode: productCode
                                         callback: callback];
}

- (void)updatePurchaseInfo:(id)data
{
    [_rootDataSource updatePurchaseInfo:data];
}
@end
