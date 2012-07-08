//
//  BoCPressVIPServicePage.h
//  BoCPress
//
//  Created by LeixSnake on 9/20/11.
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

@protocol BoCPressVIPServiceDataSource;

@interface BoCPressVIPServicePage : BoCPressMetaPage
{    
    UITextView *_announceMentLabel;
    id<BoCPressVIPServiceDataSource> _dataSource;
    
    UITableView *_buttonGroup;
}

- (id)initWithLastPage: (id<BoCPressPage>) lastPage 
            dataSource: (id<BoCPressVIPServiceDataSource>)dataSource;

- (void)updatePromptMessage: (id)data;

@end
