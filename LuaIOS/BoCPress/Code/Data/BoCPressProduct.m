//
//  BoCPressProduct.m
//  BoCPress
//
//  Created by LeixSnake on 10/28/11.
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

#import "BoCPressProduct.h"

@implementation BoCPressProduct

@synthesize productFamily = _productFamily;
@synthesize productIdentifier = _productIdentifier;
@synthesize productDescription = _productDescription;
@synthesize storeName = _storeName;
@synthesize identity = _identity;
@synthesize name = _name;
@synthesize localizedPrice = _localizedPrice;
@synthesize currencyName = _currencyName;

- (void)dealloc
{

    [_productFamily release];
    [_productIdentifier release];
    [_productDescription release];
    [_storeName release];
    [_identity release];
    [_name release];
    [_localizedPrice release];
    [_currencyName release];
    
    [super dealloc];
}
@end
