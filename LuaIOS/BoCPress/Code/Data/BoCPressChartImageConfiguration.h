//
//  BoCPressChartImageConfiguration.h
//  BoCPress
//
//  Created by E-Reach Administrator on 11/11/11.
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


@protocol NSIdentifiedObject;

@protocol BoCPressChartImageConfiguration<NSCoding, NSObject, NSIdentifiedObject>

- (void)storeConfiguration: (id)configuration 
                    forKey: (id)key;

- (id)queryConfigurationWithKey: (id)key;

- (NSString *)xmlFormattedString;

- (id)initWithXMLString: (NSString *)xmlFormattedString;

- (id)initWithSecurityID: (id)identity;

- (void)copyConfigurationFrom: (id<BoCPressChartImageConfiguration>)anotherConfiguration;

- (void)updateDate: (id)date
          imageURL: (id)imgURL;

@end

@interface BoCPressChartImageConfiguration : NSObject<BoCPressChartImageConfiguration>
{
    NSMutableDictionary *_configuration;
}

- (BOOL)hasSameConfigurationWith: (BoCPressChartImageConfiguration *)anotherConfiguration;

@end
