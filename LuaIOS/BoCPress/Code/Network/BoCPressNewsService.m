//
//  BoCPressNewsService.m
//  BoCPress
//
//  Created by E-Reach Administrator on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressNewsService.h"
#import "BoCPressConfigurationService.h"
#import "BoCPressNetworkService.h"
#import "BoCPressRequestStringFormatService.h"
#import "BoCPressCacheService.h"
#import "BoCPressSharedFunctions.h"

#import "BoCPressNewsTagColumn.h"
#import "BoCPressFeedback.h"
#import "BoCPressNews.h"
#import "BoCPressNewsArraySlice.h"
#import "BoCPressCallback.h"

#import "BoCPressConstant.h"

static void callbackAction_listOrderedNewsWithTag(NSDictionary *callbackInfo,
                                                         NSDictionary *returnedData, 
                                                         id<BoCPressCacheService> _cacheService)
{    
    id<BoCPressCallback> callback = [callbackInfo objectForKey:kNetwork_CallbackObject];    
    id callbackAction = [callbackInfo objectForKey:kNetwork_CallbackAction];

    
        id<BoCPressNewsTag> tag = [callbackInfo objectForKey:kNetwork_NewsTag];
        
        NSUInteger rangeFrom = [[callbackInfo objectForKey:kNetwork_RangeFrom] intValue];
        
        NSMutableArray *news = [[NSMutableArray alloc] init] ;
        
        NSArray *itemIDs = [returnedData objectForKey:@"itemIDs"];
        
        int itemCount = [itemIDs count];
        
        for (id itemIDLooper in itemIDs) 
        {
            
            [news addObject: [returnedData objectForKey:itemIDLooper]];
            
        }
        int count;
        
        if ([[returnedData objectForKey:kSoapXMLParser_HasNextFlag] isEqual:kSoapXMLParser_HasNextFalse])
        {
            count = rangeFrom + itemCount;
        }else
        {
            count = kArraySliceMaxCount;
        }
        
        
        BoCPressNewsArraySlice *slice = [[BoCPressNewsArraySlice alloc] initWithArray:news 
                                                                               offset:rangeFrom 
                                                                                count: count
                                                                           forNewsTag:tag];
        
        [slice setUserInfo:[returnedData objectForKey:kSoapXMLParser_HasNextFlag]];
        
        NSDictionary *infoForCache = [callbackInfo objectForKey:kBoCPress_Global_InfoForCache];
        
        [_cacheService storeObject: slice
                          withInfo: infoForCache];
        
        [callback callbackForAction: callbackAction 
                           withData: slice];
        
        [news release];
        [slice release];
}

static void callbackAction_contentOfNews(NSDictionary *callbackInfo,
                                         NSDictionary *returnedData,
                                         id<BoCPressCacheService> _cacheService
                                        )
{
    id<BoCPressCallback> callback = [callbackInfo objectForKey:kNetwork_CallbackObject];    
    id callbackAction = [callbackInfo objectForKey:kNetwork_CallbackAction];

    id newsID = [(BoCPressNews*)[callbackInfo objectForKey:kNetwork_NewsTag] identity];
        id newsContent = [returnedData objectForKey:newsID];
        
        NSMutableDictionary *info = [[NSMutableDictionary alloc] initWithDictionary: callbackInfo];        
        
        [info setObject: newsContent
                 forKey: kBoCPress_Global_NewsType];
        
        [callback callbackForAction: callbackAction 
                           withData: info];
        
        NSDictionary *infoForCache = [callbackInfo objectForKey:kBoCPress_Global_InfoForCache];
        
        NSMutableDictionary *infoToBeCached = [[NSMutableDictionary alloc] init];
        [infoToBeCached setObject: newsContent
                           forKey: kBoCPress_Global_NewsType];
        [_cacheService storeObject: infoToBeCached
                          withInfo: infoForCache];
        [infoToBeCached release];
        
        [info release];
}

@implementation BoCPressNewsService

- (void)initSoapCallbackFunctions
{
    [super initSoapCallbackFunctions];
    [_soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_listOrderedNewsWithTag)
                              forKey: kNetwork_GetPostListResponse];
    [_soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_contentOfNews)
                               forKey: kNetwork_GetPostResponse];
}

- ( void)listOrderedNewsTagsWithCallback: (id<BoCPressCallback>) callback
{
    id tags = [_configurationService queryConfigurationWithTag:kBoCPressConfiguration_NewsSubColumns];
    
    id superColumns = [_configurationService queryConfigurationWithTag:kBoCPressConfiguration_NewsSuperColumns];
    
    NSDictionary *data = [NSDictionary dictionaryWithObjectsAndKeys:
                          tags, @"newsTags", 
                          superColumns, kBoCPress_Global_OrderedKeyArray, 
                          nil];
    
    [callback callbackForAction: kCallbackAction_listOrderedNewsTags 
                       withData: data];
}

- (void)listOrderedNewsWithTag: (id<BoCPressNewsTag>)tag 
                     rangeFrom: (NSUInteger)rangeFrom
                       rangeTo: (NSUInteger)rangeTo
                      callback: (id<BoCPressCallback>)callback
{
    
    
    NSString *stringToRequestPostList = [_requestFormatService getPostListRequestStringWithBegin: rangeFrom
                                                                                        columnID: [tag identity]
                                                                                             end: rangeTo
                                                                                     requireType: kNetwork_GetPostList];
    
    id callbackAction = kCallbackAction_listOrderedNewsWithTag;
    NSDictionary *infoForCache = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  kNetwork_RangedIdentifiedObject, kNetwork_FileType,
                                  [NSNumber numberWithInt:rangeFrom], kNetwork_RangeFrom,
                                  [NSNumber numberWithInt:rangeTo], kNetwork_RangeTo,
                                  [tag identity], kBoCPress_Global_ObjectID,
                                  callbackAction, kNetwork_CallbackAction, nil];
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  [NSNumber numberWithInt:rangeFrom], kNetwork_RangeFrom,
                                  [NSNumber numberWithInt:rangeTo], kNetwork_RangeTo,
                                  tag, kNetwork_NewsTag,
                                  [tag identity], kBoCPress_Global_ColumnID,
                                  callback, kNetwork_CallbackObject, 
                                  callbackAction , kNetwork_CallbackAction,
                                  kNetwork_GetPostListResponse, kNetwork_SoapResponseType, 
                                  infoForCache, kBoCPress_Global_InfoForCache,
                                  nil];
    
    [infoForCache release];
    
    [_networkService postRequestString: stringToRequestPostList
                       andCallbackInfo: callbackInfo
                        parserDelegate: self];
    [callbackInfo release];
}

- (void)contentOfNews: (id<BoCPressNews>)news 
                 info: (id)info
         withCallback: (id<BoCPressCallback>)callback

{
    id logInfo = [info objectForKey: @"logInfo"];
    
    NSString *stringToRequestPost = [_requestFormatService getPostRequestStringWithNews: news 
                                                                                logInfo: logInfo] ;
    
    id callbackAction =  kCallbackAction_contentOfNews;
    NSDictionary *infoForCache = [[NSDictionary alloc] initWithObjectsAndKeys: 
                                  kNetwork_SingleIdentifiedObject, kNetwork_FileType,
                                  [news identity], kBoCPress_Global_ObjectID,
                                  callbackAction,kNetwork_CallbackAction,
                                  nil];
    NSMutableDictionary *callbackInfo = [[NSMutableDictionary alloc] initWithDictionary: info];
    
    [callbackInfo setObject: news
                     forKey: kNetwork_NewsTag ];
    
    [callbackInfo setObject: [news identity]
                     forKey: kNetwork_NewsTagID];
    
    [callbackInfo setObject: callback
                     forKey: kNetwork_CallbackObject];
    
    [callbackInfo setObject: callbackAction
                     forKey: kNetwork_CallbackAction];
    [callbackInfo setObject: kNetwork_GetPostResponse 
                     forKey: kNetwork_SoapResponseType];
    [callbackInfo setObject: infoForCache
                     forKey: kBoCPress_Global_InfoForCache];
    
    [infoForCache release];
    
    [_networkService postRequestString: stringToRequestPost
                       andCallbackInfo: callbackInfo
                        parserDelegate: self];
    
    [callbackInfo release];
}

- (id)identity
{
    return BoCPressNewsServiceID;
}

@end

NSString * const BoCPressNewsServiceID = @"com.bocpress.service.news";
