//
//  BoCPressEntry.m
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

#import "BoCPressEntry.h"

#import "NSNamedObject.h"

#import "NSIdentifiedObject.h"

@implementation BoCPressEntry

@synthesize internalName = _internalName;
@synthesize isChosen = _isChosen;
@synthesize index = _index;
@synthesize name = _name;
@synthesize identity = _identity;

- (id)initWithName: (NSString *)name
     internalName:(NSString *)inernalName
          identity:(id)identity
{
    if ((self = [super init])) 
    {
        [self setName:name];
        [self setIdentity:identity];
        [self setInternalName:inernalName];
    }
    
    return self;
}

- (void)dealloc
{
    [_name release];
    [_identity release];
    [_internalName release];
    
    [super dealloc];
}
#pragma mark - NSCoding protocol
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super init]))
    {
        [self setInternalName:[aDecoder decodeObjectForKey:@"_internalName"]];
        [self setIsChosen:[aDecoder decodeBoolForKey:@"_isChosen"]];
        [self setIndex:[aDecoder decodeIntegerForKey:@"_index"]];
        [self setName:[aDecoder decodeObjectForKey:@"_name"]];
        [self setIdentity:[aDecoder decodeObjectForKey:@"_identity"]];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_internalName forKey:@"_internalName"];
    [aCoder encodeBool:_isChosen forKey:@"_isChosen"];
    [aCoder encodeInteger:_index forKey:@"_index"];
    [aCoder encodeObject:_name forKey:@"_name"];
    [aCoder encodeObject:_identity forKey:@"_identity"];
}

- (NSString *)description
{
    return [NSString stringWithFormat: @"<BoCPressEntry name:%@, internal:%@>", _name, _internalName];
}
@end

