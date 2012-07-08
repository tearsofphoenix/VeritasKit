//
//  BoCPressBuyCardPage.m
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

#import "BoCPressBuyCardPage.h"

#import "BoCPressBuyCardPagePrivateHandler.h"

#import "BoCPressBuyCardDataSource.h"

#import "BoCPressConstant.h"

#import "NSArraySlice.h"

#import "NSMutableArray+UniqueSliceSupported.h"

#import "UIView+LoadingIndicatorView.h"

#import "NSDate+getStringOfYearMonthDay.h"

#import "BoCPressUpdateArrowTableView.h"

#import "NSString+NSDateWithYearMonthDayString.h"

#import "NSDate+getStringOfYearMonthDay.h"

#import "BoCPressProduct.h"

#import "BoCPressViewConstants.h"

@implementation BoCPressBuyCardPage

static NSString *purchaseOrderCodeString = nil;
static NSString *productCodeString = nil;

- (id)initWithLastPage:(id<BoCPressPage>)lastPage 
            dataSource:(id<BoCPressBuyCardDataSource>)dataSource
{
    if ((self = [super init])) 
    {
        [self setLastPage: lastPage];         
        _buyCardDataSource = [dataSource retain];

        _productInfoFromServer = [[NSMutableArray alloc] init];
        
        _handler = [[BoCPressBuyCardPagePrivateHandler alloc] initWithPage: self 
                                                                ofProducts: _productInfoFromServer];
        
        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BoCPressBuyCardPageBackground"]]];
        
        _contentView = [[BoCPressUpdateArrowTableView alloc] initWithSuperPage:self];
        
        [_contentView setSeparatorStyle: UITableViewCellSeparatorStyleNone];
        [_contentView setBackgroundColor: [UIColor clearColor]];
        
        [_contentView setDelegate: (BoCPressBuyCardPagePrivateHandler *)_handler];
        [_contentView setDataSource: (BoCPressBuyCardPagePrivateHandler *)_handler];
        
        [self addSubview:_contentView];
        [self setPageTitle: @"购买VIP服务"];
        
        _inPurchasing = NO;
    }
    return self;
}

- (void)dealloc
{
    
    [_buyCardDataSource release];
    [_contentView release];
    [_handler release];

    [_productInfoFromServer release];
    
    [super dealloc];
}

#pragma mark - BoCPressPage protocol

- (void)willBrowseBackward
{
    [self didUpdateData];
    
    [_handler cancelAllCallback];
    [_buyCardDataSource cancelAllPurchase];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kViewController_couldBrowseBackward 
                                                        object:self 
                                                      userInfo:nil];
}

- (BOOL)needNavigationBar
{
    return YES;
}

- (void)wantToForceRefreshCurrentContentWithInfo: (id)animationInfo
{
    if (!_dataLoading)
    {        
        [self didUpdateData];
        [self wantToUpdateDataWithInfo:animationInfo];
    }
}

- (void)showServerErrorWithData:(id)data
{

    [self didUpdateData];

    NSString *errorCode = [data objectForKey: kBoCPress_Global_ServerErrorCode];
    
    if ([errorCode isEqualToString: kPurchaseManager_ErrorCode_ReceiptAlreadyProcessed])
    {
        [_buyCardDataSource didFinishedVerifyReceipt: data];
        
    }else if([errorCode isEqualToString: kPurchaseManager_ErrorCode_UpdateUserInfoFailed])
    {
        //ignore
        ;
    }

    UIAlertView *alertForFailToLogin = [[UIAlertView alloc] initWithTitle:@"错误" 
                                                                  message:nil 
                                                                 delegate:nil
                                                        cancelButtonTitle:@"确定"
                                                        otherButtonTitles: nil];
    [alertForFailToLogin setMessage:[data objectForKey:kBoCPress_Global_ServerErrorMessage_CN]];
    [alertForFailToLogin show];
    [alertForFailToLogin release];
}

- (void)willSwitchToOtherTab
{
    [self didUpdateData];
    [_buyCardDataSource cancelAllPurchase];
}

- (void)didUpdateData
{
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys: 
                              [NSNumber numberWithBool: YES], kBoCPress_Global_UserInteractionState,
                              nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kNotification_Global_seteUserInteraction
                                                        object: self 
                                                      userInfo: userInfo];
    
    [userInfo release];
    
    _dataLoading = NO;
    
    if (_loadingIndicator)
    {
        
        [_loadingIndicator removeFromSuperview];
        
        [_loadingIndicator release];
        
        _loadingIndicator = nil;
        
    }
    
    _couldHideLoadingIndicator = NO;
    UITableViewCell *selectedCell = [_contentView cellForRowAtIndexPath:[_contentView indexPathForSelectedRow]];
    [selectedCell setSelected:NO];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kBoCPress_View_didUpdateDataOfCurrentPage object:self userInfo:nil];
    
}

#pragma mark - Animation 

- (void)hideContentView
{
    CGRect frame = [_contentView frame];
    if (_hasSetOriginFrame)
    {
        ;
    }else
    {
        _originFrameOfContentView = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
        _hasSetOriginFrame = YES;
    }
    frame.origin.y = - frame.size.height;
    [_contentView setFrame:frame];
}

- (void)showContentView
{
    [UIView animateWithDuration: 0.5
                     animations: (^{
        
                                    [_contentView setFrame:[self bounds]];
                                })
     ];
}

//TODO
//
- (NSTimeInterval) lastUpdateTimeInterval
{
    return 10;
}

- (void)showErrorMessageWithData: (id)data
{
    [self wantToFinishDataUpdate];
        
    UIAlertView *alertForFail = [[UIAlertView alloc] initWithTitle:@"错误" 
                                                           message:[NSString stringWithFormat:@"%@", data]
                                                          delegate:nil
                                                 cancelButtonTitle:@"确定" 
                                                 otherButtonTitles:nil];
    [alertForFail show];
    [alertForFail release];
}


- (BOOL)shouldRefetchConfigurationAtCurrentContext
{    
    if (_inPurchasing)
    {
        return NO;
    }else
    {
        return YES;
    }
}

#pragma mark - Data updating

- (void)wantToUpdateDataWithInfo: (id)info
{
    [[NSNotificationCenter defaultCenter] postNotificationName: kNotification_Global_seteUserInteraction
                                                        object: self 
                                                      userInfo: nil];

    if ([[_animationInfo objectForKey:kBoCPress_Global_AnimationType] isEqual:kBoCPress_View_AnimationTypeTopToBottom])
    {
        [self hideContentView];
    }
    
            [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                        onsuperView: NO];
    
    [_buyCardDataSource listOrderedProductIDsRangeFrom: 0 
                                               rangeTo: 10
                                              callback:_handler];
}

- (void)wantToUpdateMoreData
{
            [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                        onsuperView: NO];
          
    [_buyCardDataSource listOrderedProductIDsRangeFrom:[_productInfoFromServer count] 
                                               rangeTo:[_productInfoFromServer count] + 10
                                              callback:_handler];
    
}

#pragma mark - request

- (void)updateProductIDs:(NSArraySlice *)productInfo
{
    
    [_productInfoFromServer updateWithArraySlice:productInfo];
    
    [_buyCardDataSource createPurchaseOrderWithCallback: _handler];
    
    [_contentView reloadData];
    
    [self wantToFinishDataUpdate];
    
    if ([[_animationInfo objectForKey:kBoCPress_Global_AnimationType] isEqual:kBoCPress_View_AnimationTypeTopToBottom]) 
    {
        [self showContentView];
    }else
    {
        [_contentView setFrame:[self bounds]];
        
    }
    
}

- (void)updatePurchaseOrder:(id)data
{
    [purchaseOrderCodeString release];
    purchaseOrderCodeString = [[data objectForKey:kPurchaseManager_OrderCode] retain];
}

- (void)wantToBuyProduct:(id)product
{
    [[NSNotificationCenter defaultCenter] postNotificationName: kNotification_Global_seteUserInteraction
                                                        object: self 
                                                      userInfo: nil];
    _inPurchasing = YES;
    
            [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                        onsuperView: NO];
    
    [_buyCardDataSource requestPurchaseWithOrderCode: purchaseOrderCodeString
                                         productCode: [product productIdentifier]
                                            callback: _handler];
    
    [_buyCardDataSource wantToBuyProduct:product withCallback:_handler];
}

- (void)succeededTransaction:(id)info
{
    _inPurchasing = NO;
    
    if (info)
    {
        NSString *transactionReceipt = [info objectForKey:kPurchaseManager_transactionReceipt];        
        NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
        
        [userInfo setObject:transactionReceipt forKey: kPurchaseManager_transactionReceipt];
        [userInfo setObject:purchaseOrderCodeString forKey: kPurchaseManager_OrderCode];
        [userInfo setObject:productCodeString forKey: kBuyCard_productCode];
        
        [_buyCardDataSource verifyReceiptWithInfo:userInfo callback: _handler];
        
        [userInfo release];
        
    }
}

- (void)failedTransaction:(id)data
{
    _inPurchasing = NO;
    [self didUpdateData];    
}

- (void)canceledTransactionWithInfo:(id)userInfo
{
    _inPurchasing = NO;
    [self didUpdateData];
}

- (void)updateStateWithVerifyReceiptResult: (id)data
{
    BOOL verifyReceiptStatus = [[data objectForKey:kBoCPress_Global_ResponseStatus] boolValue];
    if (verifyReceiptStatus)
    {
        [_buyCardDataSource didFinishedVerifyReceipt:data];
        
        [_buyCardDataSource getUserInfoFromServerWithInfo: nil
                                                 callback: _handler];
    }else
    {
        UIAlertView *alertForFailToVerifyReceipt = [[UIAlertView alloc] initWithTitle:@"错误"
                                                                              message:nil 
                                                                             delegate:nil
                                                                    cancelButtonTitle:@"确定"
                                                                    otherButtonTitles: nil];
        [alertForFailToVerifyReceipt setMessage:[data objectForKey:kBoCPress_Global_ServerErrorMessage_EN]];
        [alertForFailToVerifyReceipt show];
        [alertForFailToVerifyReceipt release];
        
        
    }
}


- (void)updateUserInfo:(id)data
{
    [self wantToFinishDataUpdate];
    BOOL responseStatus = [[data objectForKey:kBoCPress_Global_ResponseStatus] boolValue];
    
    if (responseStatus)
    {
        
        [_buyCardDataSource storeUserInfo:data];
        
        NSString *title = @"您已成功购买金汇VIP服务，感谢使用金汇掌中宝";
        NSString *endTime = [data objectForKey:@"PAY_END_DATE"];
        NSString *deadLine = [endTime stringOfYearMonthDayWithFormatterString:kNetwork_DateFormatterString];
        
        NSString *content = [NSString stringWithFormat:@"VIP服务有效期至：\n%@", deadLine];
        
        NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  title, kBoCPressVIPAuthorizeView_Title,
                                  content, kBoCPressVIPAuthorizeView_Content,
                                  nil];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kViewController_wantToShowVIPAuthorizeSuccessView 
                                                            object:self 
                                                          userInfo:userInfo];
        
        [userInfo release];
    }else
    {
        NSString *errorMessage = [data objectForKey:kBoCPress_Global_ServerErrorMessage_EN];
        UIAlertView *alertForFail = [[UIAlertView alloc] initWithTitle:@"错误" 
                                                               message:errorMessage
                                                              delegate:nil
                                                     cancelButtonTitle:@"确定" 
                                                     otherButtonTitles:nil];
        [alertForFail show];
        [alertForFail release];
        
    }
}

- (void)updatePurchaseInfo: (id)data
{
    [_buyCardDataSource updatePurchaseInfo:data];
    NSLog(@"server purchase info:%@", data);
    productCodeString = [[data objectForKey:kBuyCard_productCode] retain];
}

- (void)didFinishedShowVIPAuthorizeSuccessView
{
    [self willBrowseBackward];
}

- (void)attachCallbackInfo: (NSDictionary *)callbackInfo
                   forType: (NSString *)type
{
    
}
@end
