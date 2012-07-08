//
//  BoCPressMetaService.m
//  BoCPress
//
//  Created by E-Reach Administrator on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressMetaService.h"
#import "BoCPressNetworkService.h"
#import "BoCPressCacheService.h"
#import "BoCPressConfigurationService.h"
#import "BoCPressRequestStringFormatService.h"

#import "BoCPressConstant.h"
#import "BoCPressSharedFunctions.h"
#import "BoCPressNews.h"
#import "BoCPressCallback.h"

#import "BoCPressFeedback.h"

static void soapCallback_GetCommentSummaryResponse(NSDictionary *callbackInfo,
                                              NSDictionary *returnedData,                                              
                                              id<BoCPressCacheService> _cacheService)
{
    id<BoCPressCallback> callback = [callbackInfo objectForKey:kNetwork_CallbackObject];    
    id callbackAction = [callbackInfo objectForKey:kNetwork_CallbackAction];
    
    NSDictionary *storedData = [[NSDictionary alloc] initWithObjectsAndKeys:
                                [returnedData objectForKey:kCommentSummary_PostAverageRateing], kCommentSummary_PostAverageRateing,
                                [returnedData objectForKey:kCommentSummary_PostRateCount], kCommentSummary_PostRateCount,
                                [callbackInfo objectForKey:kNetwork_NewsTag], kNetwork_NewsTag,
                                [returnedData objectForKey:kSoapXMLParser_NewsCommentRepeatRatingFlag], kSoapXMLParser_NewsCommentRepeatRatingFlag,
                                nil];
    
    [callback callbackForAction: callbackAction withData: storedData];
    
    [storedData release];
    
}

static void callbackAction_normalHandleOfCallback(NSDictionary *callbackInfo,
                                                  NSDictionary *returnedData,
                                                  id<BoCPressCacheService> _cacheManage)
{
    id<BoCPressCallback> callback = [callbackInfo objectForKey:kNetwork_CallbackObject];    
    id callbackAction = [callbackInfo objectForKey:kNetwork_CallbackAction];
    [callback callbackForAction: callbackAction
                       withData: returnedData];
}

@implementation BoCPressMetaService

- (void)initSoapCallbackFunctions
{
    [_soapCallbackFunctions setObject: storeCFunctionInNSValue(soapCallback_GetCommentSummaryResponse)
                               forKey: kNetwork_GetCommentSummaryResponse];
    [_soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_normalHandleOfCallback) 
                               forKey: kNetwork_SetCommentResponse ];

}

- (id)initWithNetworkService: (id<BoCPressNetworkService>)networkService
                cacheService: (id<BoCPressCacheService>)cacheService
        configurationService: (id<BoCPressConfigurationService>)configurationService
        requestFormatService: (id<BoCPressRequestStringFormatService>)requestFormatService
{
    if ((self = [super init]))
    {
        _networkService = [networkService retain];
        _cacheService = [cacheService retain];                         
        _configurationService = [configurationService retain];
        _requestFormatService = [requestFormatService retain];
        _soapCallbackFunctions = [[NSMutableDictionary alloc] init];
        
        [self initSoapCallbackFunctions];
    }
    return self;
}

- (void)dealloc
{
    [_networkService release];
    [_cacheService release];
    [_configurationService release];
    [_requestFormatService release];
    [_soapCallbackFunctions release];
    
    [super dealloc];
}

#pragma mark - User feedback

- (NSString *)stringToGetCommentSummaryContentOfNewsWithPostID: (id)postID 
{
    NSString * argString = formatXMLValueAndKey(postID, @"postId");
    
    return [_requestFormatService requestStringWithRequireType: kNetwork_GetCommentSummary
                                             andArgumentString: argString];
}

- (void)getCommentSummaryContentOfNews: (id<BoCPressNews>)news
                          withCallback: (id<BoCPressCallback>)callback
{
    
    NSString *stringToGetCommentSummaryContentOfNews = [self stringToGetCommentSummaryContentOfNewsWithPostID:[news identity]];
    
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  callback, kNetwork_CallbackObject, 
                                  news, kNetwork_NewsTag,
                                  kCallbackAction_getCommentSummaryContentOfNews, kNetwork_CallbackAction,
                                  kNetwork_GetCommentSummaryResponse, kNetwork_SoapResponseType, 
                                  nil];
    //Notice
    //no cache needed here!
    [_networkService postRequestString: stringToGetCommentSummaryContentOfNews
                       andCallbackInfo: callbackInfo
                        parserDelegate: self];
    [callbackInfo release];
    
}


- (NSString*)stringToSetCommentRequestWithTargetID: (id)targetID 
                                              rate: (NSInteger)rate

{
    //    <postId>%@</postId><rating>%i</rating>
    NSString *argString = formatXMLValueAndKey(targetID, @"postId");
    argString = [argString stringByAppendingString: formatXMLIntegerValueAndKey(rate, @"rating")];
    
    return [_requestFormatService requestStringWithRequireType: kNetwork_SetComment
                                             andArgumentString: argString];
}
- (void)submitFeedback: (id<BoCPressFeedback>)feedback 
                toNews: (id<BoCPressNews>)news 
          withCallback: (id<BoCPressCallback>)callback
{
    NSString* stringToSetSubmit = [self stringToSetCommentRequestWithTargetID: [news identity] 
                                                                         rate: [feedback rate]];
    
    id callbackAction = kCallbackAction_submitFeedback;
    
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  news, kNetwork_NewsTag,
                                  callback, kNetwork_CallbackObject,
                                  callbackAction, kNetwork_CallbackAction,
                                  kNetwork_SetCommentResponse, kNetwork_SoapResponseType,
                                  nil];
    
    [_networkService postRequestString: stringToSetSubmit
                       andCallbackInfo: callbackInfo
                        parserDelegate: self];
    [callbackInfo release];      
}

- (void)soapXMLParser: (BoCPressSoapXMLParser *)parser finishedParseWithResult: (id)userInfo
{
    NSDictionary *returnedData = [userInfo objectForKey: kNetworkManager_responsedData];
    NSString *responseType = [returnedData objectForKey: kNetwork_SoapResponseType];
    NSDictionary *callbackInfo = [ userInfo objectForKey: kNetwork_CallbackObject];

    BoCPressSoapDataSourceCalbackFunctionPointer pSoapCallbackFunction = [[_soapCallbackFunctions objectForKey: responseType] pointerValue];
    if (pSoapCallbackFunction)
    {
        pSoapCallbackFunction(callbackInfo, returnedData, _cacheService);
    }
    
}

- (id)identity
{
    return BoCPressMetaServiceID;
}

@end

NSString * const BoCPressMetaServiceID = @"com.bocpress.service.meta";
