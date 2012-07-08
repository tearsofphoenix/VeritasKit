//
//  BoCPressMediaDataSource.m
//  BoCPress
//
//  Created by E-Reach Administrator on 7/17/11.
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

#import "BoCPressMediaDataSource.h"

#import "BoCPressMedia.h"

#import "BoCPressCallback.h"

#import "BoCPressDataSource.h"

@implementation BoCPressMediaDataSource

- (id)initWithService: (id<BoCPressDataSource>)rootDataSource
{
    self = [super init];
    if (self) 
    {
        _rootDataSource = rootDataSource;
    }
    
    return self;
}

- (void)contentOfMedia: (id<BoCPressMedia>)media 
             mediaType: (id<BoCPressMediaType>)mediaType 
          withCallback: (id<BoCPressCallback>)callback
{
    [_rootDataSource contentOfMedia: media
                          mediaType: mediaType
                       withCallback: callback];
}

@end
