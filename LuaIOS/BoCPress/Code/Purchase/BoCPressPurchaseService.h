//
//  BoCPressPurchaseService.h
//  BoCPress
//
//  Created by LeixSnake on 10/19/11.
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

// InAppPurchaseManager.h
#import <StoreKit/StoreKit.h>

@protocol BoCPressCallback;
@protocol BoCPressProduct;

@class BoCPressPurchaseServicePrivateHandler;

@protocol BoCPressPurchaseService <NSObject, SKProductsRequestDelegate>

- (void)wantToPurchaseProduct: (id<BoCPressProduct>)product 
                 withCallback:(id<BoCPressCallback>)callback;

- (void)listOrderedContentInfoOfProducts: (NSArray*)productIDs 
                                callbackInfo: (id)callbackInfo;

- (void)cancelAllPurchase;

- (void)didFinishedVerifyReceipt:(id)data;

@end


@interface BoCPressPurchaseService : NSObject <BoCPressPurchaseService>
{
@private
    BoCPressPurchaseServicePrivateHandler *_handler;    
    SKProductsRequest* _productsRequest;
    id _callbackInfo;
}
@end
