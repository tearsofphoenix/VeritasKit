//
//  BoCPressEntry.h
//  BoCPress
//
//  Created by E-Reach Administrator on 11/7/11.
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

@protocol NSNamedObject;
@protocol NSIdentifiedObject;

@protocol BoCPressEntry <NSCoding,NSNamedObject, NSIdentifiedObject>

@property (nonatomic) BOOL isChosen;

- (NSInteger)index;

- (NSString *)internalName;
@end

@interface BoCPressEntry : NSObject<BoCPressEntry>
{
}

@property (nonatomic, retain) NSString *internalName;
@property (nonatomic) NSInteger index;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) id identity;

- (id)initWithName: (NSString *)name
     internalName: (NSString *)inernalName
          identity: (id)identity;
@end
