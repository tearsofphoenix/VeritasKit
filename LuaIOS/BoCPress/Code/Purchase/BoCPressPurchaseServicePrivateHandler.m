//
//  BoCPressPurchaseServicePrivateHandler.m
//  BoCPress
//
//  Created by LeixSnake on 10/20/11.
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

#import "BoCPressPurchaseServicePrivateHandler.h"

#import "BoCPressConstant.h"

#import "BoCPressCallback.h"

#import "BoCPressProduct.h"

@implementation BoCPressPurchaseServicePrivateHandler
- (id)initWithManager:(id<BoCPressPurchaseService>)manager
{
    if ((self = [super init]))
    {
        _manager = manager;
        [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
        
    }
    
    return self;
}

- (void)dealloc
{
    
    [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
    
    [super dealloc];
}
#pragma mark - BoCPressCallback
- (void)activeAllCallback
{
    [super activeAllCallback];
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
}

- (void)cancelAllCallback
{
    [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
    [super cancelAllCallback];    
}
#pragma - Purchase helpers

//
// saves a record of the transaction by storing the receipt to disk
//
- (void)recordTransaction:(SKPaymentTransaction *)transaction
{
        // save the transaction receipt to disk
    [[NSUserDefaults standardUserDefaults] setObject:transaction.transactionReceipt forKey:kPurchaseManager_transactionReceipt];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

//
// enable pro features
//
- (void)provideContent:(NSString *)productId
{
    if ([productId isEqualToString:kBoCPress_Global_ProductId])
    {
        // enable the pro features
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isPurchased" ];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)didCancelTransaction: (SKPaymentTransaction *)transaction
{
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                              transaction, @"transaction", 
                              nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kBoCPress_TransactionCanceledNotification
                                                        object:self
                                                      userInfo:userInfo];
    
    [userInfo release];
}
//
// removes the transaction from the queue and posts a notification with the transaction result
//
- (void)finishTransaction:(SKPaymentTransaction *)transaction wasSuccessful:(BOOL)wasSuccessful
{
        NSLog(@"Debug#: in %s line %d", __FUNCTION__, __LINE__);
    // remove the transaction from the payment queue.
    [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
    
    NSDictionary *userInfo =nil;
    
    if (wasSuccessful)
    {
        NSString *transactionReceipt = [[NSString alloc] initWithData:[transaction transactionReceipt] 
                                                             encoding:NSUTF8StringEncoding];
        
        userInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                    transactionReceipt, kPurchaseManager_transactionReceipt , 
                    nil];
        
        [transactionReceipt release];
        // send out a notification that we’ve finished the transaction
        [[NSNotificationCenter defaultCenter] postNotificationName:kBoCPress_TransactionSucceededNotification 
                                                            object:self 
                                                          userInfo:userInfo];
    }
    else
    {
        userInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                    [transaction error], @"error", 
                    nil];
        
        // send out a notification for the failed transaction
        [[NSNotificationCenter defaultCenter] postNotificationName:kBoCPress_TransactionFailedNotification
                                                            object:self
                                                          userInfo:userInfo];
    }
}

//
// called when the transaction was successful
//
- (void)completeTransaction:(SKPaymentTransaction *)transaction
{
        NSLog(@"Debug#: in %s line %d", __FUNCTION__, __LINE__);
    [self recordTransaction:transaction];
    [self provideContent:transaction.payment.productIdentifier];
    [self finishTransaction:transaction wasSuccessful:YES];
}

//
// called when a transaction has been restored and and successfully completed
//
- (void)restoreTransaction:(SKPaymentTransaction *)transaction
{
        NSLog(@"Debug#: in %s line %d", __FUNCTION__, __LINE__);
    [self recordTransaction:transaction.originalTransaction];
    [self provideContent:transaction.originalTransaction.payment.productIdentifier];
    [self finishTransaction:transaction wasSuccessful:YES];
}

//
// called when a transaction has failed
//
- (void)failedTransaction:(SKPaymentTransaction *)transaction
{
    NSLog(@"Debug#: in %s line %d", __FUNCTION__, __LINE__);
    if (transaction.error.code != SKErrorPaymentCancelled)
    {
        // error!
        [self finishTransaction:transaction wasSuccessful:NO];
    }
    else
    {
        // this is fine, the user just cancelled, so don’t notify
        [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
        [self didCancelTransaction:transaction];
    }
}

#pragma mark - SKPaymentTransactionObserver methods

//
// called when the transaction status is updated
//
- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions
{
    NSLog(@"Debug#: in %s line %d", __FUNCTION__, __LINE__);
    
    for (SKPaymentTransaction *transaction in transactions)
    {
        switch (transaction.transactionState)
        {
            case SKPaymentTransactionStatePurchased:
            {
                [self completeTransaction:transaction];
                break;
            }
            case SKPaymentTransactionStateFailed:
            {
                [self failedTransaction:transaction];
                break;
            }
            case SKPaymentTransactionStateRestored:
            {
                [self restoreTransaction:transaction];
                break;
            }
            case SKPaymentTransactionStatePurchasing:
            {
                NSLog(@"purchasing");
                break;
            }
            default:
            {
                break;
            }
        }
    }
}

- (void)wantToPurchaseProduct: (id<BoCPressProduct>)product 
                 withCallback:(id<BoCPressCallback>)callback
{
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    
    SKPayment *payment = [SKPayment paymentWithProductIdentifier:[product productIdentifier]];
    
    [[SKPaymentQueue defaultQueue] addPayment:payment];
}

- (void)didFinishedVerifyReceipt:(id)data
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kPurchaseManager_transactionReceipt];
}
@end
