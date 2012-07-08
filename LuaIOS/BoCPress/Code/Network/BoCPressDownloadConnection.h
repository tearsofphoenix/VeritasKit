//
//  BoCPressDownloadConnection.h
//  BoCPress
//
//  Created by E-Reach Administrator on 7/7/11.
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

@interface BoCPressDownloadConnection : NSObject
{
@private
    NSMutableData *_data;    
    
    id _callbakInfo;
    
    NSURLConnection * _downloadConnection;
}

- (id)initWithURL:(NSURL *)anURL
     callbackInfo: (id)callbackInfo;
@end
