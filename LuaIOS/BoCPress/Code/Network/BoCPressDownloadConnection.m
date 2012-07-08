//
//  BoCPressDownloadConnection.m
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

#import "BoCPressDownloadConnection.h"

#import "BoCPressConstant.h"

@implementation BoCPressDownloadConnection

- (id)initWithURL:(NSURL *)anURL callbackInfo:(id)callbackInfo
{
    self = [super init];
    if (self) 
    {
        if(anURL)
        {
            _data = [[NSMutableData alloc] init];
            _callbakInfo = [callbackInfo retain];
            
            _downloadConnection = [[NSURLConnection alloc] initWithRequest: [NSURLRequest requestWithURL: anURL] 
                                                                  delegate: self 
                                                          startImmediately: YES];            
        }
    }
    
    return self;
}
- (void)dealloc
{
    [_data release];
    [_callbakInfo release];
    
    [_downloadConnection release];;
    
    [super dealloc];
}

#pragma mark - data download protocol

- (void)connection: (NSURLConnection *)connection didReceiveResponse: (NSURLResponse *)response
{
    [_data setLength:0];
}

- (void)connection: (NSURLConnection *)connection 
    didReceiveData: (NSData *)data
{
    [_data appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    UIImage *image = [UIImage imageWithData:_data];
    if (image)
    {
        
        [[NSNotificationCenter defaultCenter]postNotificationName: kBoCPressSoapDataSourcePrivateHandler_handleDownloadReturnedData
                                                           object: self 
                                                         userInfo: [NSDictionary dictionaryWithObjectsAndKeys:
                                                                   _data, @"data",
                                                                   _callbakInfo, kNetwork_CallbackObject,
                                                                   nil]];
    }else
    {
        NSLog(@"bad image");
    }
}
@end
