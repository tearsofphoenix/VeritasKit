//
//  BoCPressConfigurationService.h
//  BoCPress
//
//  Created by E-Reach Administrator on 7/15/11.
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

#import "NSIdentifiedObject.h"

@protocol BoCPressCallback;
@protocol BoCPressColumn;

@protocol BoCPressConfigurationService<NSIdentifiedObject>

#pragma mark - Media contents

@required

- (NSUInteger)countOfMediaPerTypeInHomeView;

#pragma mark - load configuration xml

- (void)storeConfiguration:(NSString*)data;

- (void)parseConfiguration;

- (void)loadCachedConfigurationWhenTimeOut;

#pragma mark - query configuration

- (id)queryIdentitedObjectWithID: (id)tag;

- (id)queryConfigurationWithTag: (id)tag;

- (id<BoCPressColumn>)queryColumnWithTag: (id)tag 
                          andColumnIndex: (NSUInteger) columnIndex;

- (id)queryColumnConfigurationWithTag: (id)tag 
                             columnID: (id)columnID 
                     configurationKey: (id)key;

- (void)reloadColumnsWithTag: (id)tag  
                    callback: (id<BoCPressCallback>)callback;
@end

@protocol BoCPressColumn;

@interface BoCPressConfigurationService : NSObject<BoCPressConfigurationService>
{
    NSString* _configurationData;
    
    NSMutableDictionary *_columnConfiguration;
        
    NSMutableDictionary *_columnForCallbackActionDict;
}

- (void)storeConfiguration: (NSString*)data;

@end

extern NSString * const BoCPressConfigurationServiceID;
