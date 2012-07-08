//
//  BoCPressPurchaseService.m
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

#import "BoCPressPurchaseService.h"

#import "BoCPressPurchaseServicePrivateHandler.h"

#import "BoCPressConstant.h"

#import "BoCPressCallback.h"

#import "NSArraySlice.h"

#import "BoCPressProduct.h"

@implementation BoCPressPurchaseService

- (id)init
{
    if ((self = [super init]))
    {
        _handler = [[BoCPressPurchaseServicePrivateHandler alloc] initWithManager:self];
        _productsRequest = nil;
        _callbackInfo = nil;

    }
    
    return self;
}

- (void)dealloc
{
    [_handler release];
    [_productsRequest release];

    [_callbackInfo release];
    
    [super dealloc];
}



- (void)wantToPurchaseProduct: (id<BoCPressProduct>)product 
                 withCallback:(id<BoCPressCallback>)callback
{
    [_handler wantToPurchaseProduct:product withCallback:callback];
}

- (void)listOrderedContentInfoOfProducts: (NSArray*)productIDs 
                                callbackInfo:(id)callbackInfo
{
    if ([SKPaymentQueue canMakePayments])
    {
        NSSet *productIdentifiers = [NSSet setWithArray:productIDs];

        [_productsRequest release];
        _productsRequest  = [[SKProductsRequest alloc] initWithProductIdentifiers:productIdentifiers];
        [_productsRequest setDelegate:self];
        [_productsRequest start];
        
        [_callbackInfo release];
        _callbackInfo = [callbackInfo retain];
        
    }else
    {
        id callbackAction = kPurchaseManager_showErrorConnotMakePayments;
        id callback = [_callbackInfo objectForKey:kNetwork_CallbackObject];
        NSString *errorContent = @"Cann't make payments!";
        [callback callbackForAction:callbackAction withData:errorContent];
        
    }
}
#pragma mark - SKProductsRequestDelegate methods

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
    NSArray *products = [response products];

    
    if ([products count] > 0)
    {        
        NSUInteger rangeFrom = [[_callbackInfo objectForKey:kNetwork_RangeFrom] unsignedIntegerValue];
        
        NSArraySlice *slice = [[NSArraySlice alloc] initWithArray:products offset:rangeFrom count:[products count]];
        
        id callbackAction = [_callbackInfo objectForKey:kNetwork_CallbackAction];
        id callback = [_callbackInfo objectForKey:kNetwork_CallbackObject];
        [callback callbackForAction:callbackAction withData:slice];
        [slice release];
    }else
    {
        id callbackAction = kPurchaseManager_showErrorConnotMakePayments;
        id callback = [_callbackInfo objectForKey:kNetwork_CallbackObject];
        NSString *errorContent = @"Cann't make payments!";
        [callback callbackForAction:callbackAction withData:errorContent];

    }
    
    for (NSString *invalidProductId in [response invalidProductIdentifiers])
    {
        NSLog(@"Invalid product id: %@" , invalidProductId);
    }
        
}

- (void)cancelAllPurchase
{
    [_productsRequest cancel];
    [_handler cancelAllCallback];
    
    [_callbackInfo release];
    _callbackInfo = nil;
    
}

- (void)didFinishedVerifyReceipt:(id)data
{
    [_handler didFinishedVerifyReceipt:data];
}
@end
