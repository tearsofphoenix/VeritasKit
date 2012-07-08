//
//  BoCPressBuyCardPagePrivateHandler.m
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

#import "BoCPressBuyCardPagePrivateHandler.h"

#import "BoCPressBuyCardPage.h"

#import "BoCPressConstant.h"

#import "BoCPressMoreCell.h"

#import "BoCPressProduct.h"

#import <StoreKit/StoreKit.h>

@implementation BoCPressBuyCardPagePrivateHandler

- (id)initWithPage:(BoCPressBuyCardPage *)page
        ofProducts:(NSArray *)products
{
    if ((self = [super init]))
    {
        _page = page;
        _products = products;
        NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
        [ defaultCenter addObserver:self
                           selector:@selector(notificationForTransactionSucceeded:) 
                               name:kBoCPress_TransactionSucceededNotification 
                             object:nil];
        [ defaultCenter addObserver:self
                           selector:@selector(notificationForTransactionFailed:) 
                               name:kBoCPress_TransactionFailedNotification 
                             object:nil];
        
        [ defaultCenter addObserver:self
                           selector:@selector(notificationForTransactionCanceled:) 
                               name:kBoCPress_TransactionCanceledNotification
                             object:nil];
        [defaultCenter addObserver:self
                          selector:@selector(notificationForFinishedShowVIPAuthorizeSuccessView:)
                              name:kViewController_finishedShowVIPAuthorizeSuccessView 
                            object:nil];
    }
    
    return self;
}
- (void)dealloc
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [super dealloc];
}

- (void)callbackForAction:(id)action withData:(id)data
{
    if (_callbackFlag)
    {
        if([kPurchaseManager_showErrorConnotMakePayments isEqualToString:action])
        {
            [_page showErrorMessageWithData:data];
        }else if([kCallbackAction_verifyreceipt  isEqualToString:action])
        {
            [_page updateStateWithVerifyReceiptResult: data];
        }else if([kCallbackAction_listOrderedProductIDs isEqualToString:action])
        {
            [_page updateProductIDs: data];
        }else if([kCallbackAction_updateUserInfo isEqualToString:action])
        {
            NSDictionary *returnedData = [data objectForKey: @"returnedData"];
            
            [_page updateUserInfo: returnedData];
            
        }else if([kCallbackAction_handleServerError isEqualToString:action])            
        {
            [_page showServerErrorWithData:data];
        }else if([kCallbackAction_createPurchaseOrder isEqualToString:action])
        {
            [_page updatePurchaseOrder:data];
        }else if([kCallbackAction_requestPurchase isEqualToString:action])
        {
            [_page updatePurchaseInfo:data];
        }else if ([kCallbackAction_listOrderedProductContentInfo isEqual:action])
        {
//            [_page updateContentWithProducts:data];
            
        }
    }
}

#pragma mark - UITableView dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_hasMoreCell)
    {
        return [_products count] + 1;
    }else
    {
        return [_products count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger index = [indexPath indexAtPosition:1];
    
    if (index < [_products count])
    {
        
        BoCPressProduct *product = [_products objectAtIndex:index];
        
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
        UIImageView *backgroundView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressBuyCardCellBackground"]] ;
        
        [cell setBackgroundView: backgroundView];
        [backgroundView release];
        
        UILabel *titleLabel = [[UILabel alloc] init] ;
        [titleLabel setTextColor: [UIColor colorWithRed: 93.0 / 255 
                                                  green: 93.0 / 255
                                                   blue: 93.0 / 255
                                                  alpha: 1.0]];
        [titleLabel setFont: [UIFont fontWithName: @"Helvetica" size: 19]];
        [titleLabel setText: [product name]];
        [titleLabel setBackgroundColor: [UIColor clearColor]];
        
        CGSize size = [[titleLabel text] sizeWithFont:[titleLabel font]];
        [titleLabel setFrame: CGRectMake(16, 10, size.width, size.height)];
        
        [cell addSubview: titleLabel];
        [titleLabel release];
        
        
        CGRect frame = [titleLabel frame];
        
        UILabel *priceLabel = [[UILabel alloc] init];
        [priceLabel setFont:[UIFont fontWithName:@"Helvetica" size:19]];
        [priceLabel setBackgroundColor:[UIColor clearColor]];
//        NSString *price = [product stringOfLocalizedPrice];
        NSString *priceString = [NSString stringWithFormat: @"%@%@", [product currencyName], [product localizedPrice]];
        size = [priceString sizeWithFont:[priceLabel font]];
        [priceLabel setText: priceString];
        [priceLabel setFrame:CGRectMake(frame.origin.x + frame.size.width + 5, frame.origin.y , size.width, size.height)];
        
        [cell addSubview:priceLabel];
        [priceLabel release];
        
        UILabel *productDescriptionLabel = [[UILabel alloc] init] ;
        [productDescriptionLabel setText: [product productDescription]];
        [productDescriptionLabel setFont: [UIFont fontWithName: @"Helvetica" size: 12]];
        
        size = [[productDescriptionLabel text] sizeWithFont:[productDescriptionLabel font]];
        
        [productDescriptionLabel setTextColor: [UIColor colorWithRed: 93.0 / 255 
                                                               green: 93.0 / 255
                                                                blue: 93.0 / 255
                                                               alpha: 1.0]];
        
        [productDescriptionLabel setBackgroundColor: [UIColor clearColor]];
        [productDescriptionLabel setFrame: CGRectMake(16, frame.origin.y + frame.size.height + 10, size.width , size.height)];
        
        [cell addSubview: productDescriptionLabel];
        
        [productDescriptionLabel release];
        
        
        return [cell autorelease];
    }else
    {
        BoCPressMoreCell *cell = [[[BoCPressMoreCell alloc] init] autorelease];
        
        return cell;
    }
}

#pragma mark - UITableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSUInteger index = [indexPath indexAtPosition:1];
    if (index < [_products count])
    {
        
        [_page wantToBuyProduct: [_products objectAtIndex:index]];
        
    }else
    {
        [_page wantToUpdateMoreData];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
    if ([scrollView contentOffset].y < -41 )
    {
        [_page wantToUpdateDataWithInfo:nil];
    }
    
}

- (void)notificationForTransactionFailed: (NSNotification *)notification
{
    if (_callbackFlag) 
    {
        NSDictionary *userInfo = [notification userInfo];
        
        [_page failedTransaction:userInfo];
    }
    
}

- (void)notificationForTransactionSucceeded: (NSNotification *)notification
{
    if (_callbackFlag) 
    {
        NSDictionary *userInfo = [notification userInfo];
        
        [_page succeededTransaction:userInfo];
    }
}

- (void)notificationForTransactionCanceled: (NSNotification *)notification
{
    if (_callbackFlag)
    {        
        [_page canceledTransactionWithInfo:[notification userInfo]];
    }
}

- (void)notificationForFinishedShowVIPAuthorizeSuccessView: (NSNotification *)notification
{
    [_page didFinishedShowVIPAuthorizeSuccessView];     
}

@end

