//
//  NSString+AllFilePathsUnderDirectory.m
//  BoCPress
//
//  Created by E-Reach Administrator on 12/1/11.
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

#import "NSString+AllFilePathsUnderDirectory.h"

@implementation NSString (AllFilePathsUnderDirectory)

- (NSArray*) allFilePathsUnderSelf
{
    NSMutableArray* array = [NSMutableArray array];
    
    NSFileManager* fileMgr = [NSFileManager defaultManager];
    
    NSArray* tempArray = [fileMgr contentsOfDirectoryAtPath:self error:nil];
    
    for (NSString* fileName in tempArray) 
    {
        BOOL flag = YES;
        
        NSString* fullPath = [self stringByAppendingPathComponent:fileName];
        
        if ([fileMgr fileExistsAtPath:fullPath isDirectory:&flag]) 
        {
            if (!flag) 
            {
                [array addObject:fullPath];
            }
        }
    }
    
    return array;
}
@end
