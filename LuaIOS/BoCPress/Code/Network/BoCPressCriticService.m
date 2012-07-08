//
//  BoCPressCriticService.m
//  BoCPress
//
//  Created by E-Reach Administrator on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressCriticService.h"
#import "BoCPressConfigurationService.h"
#import "BoCPressNetworkService.h"
#import "BoCPressRequestStringFormatService.h"
#import "BoCPressSharedFunctions.h"
#import "BoCPressCacheService.h"

#import "BoCPressConstant.h"

#import "BoCPressCallback.h"
#import "BoCPressAuthor.h"
#import "BoCPressColumn.h"
#import "BoCPressNews.h"
#import "NSArraySlice.h"

#import "BoCPressFeedback.h"


static void callbackAction_contentOfPost(NSDictionary *callbackInfo,
                                         NSDictionary *returnedData,
                                         id<BoCPressCacheService> _cacheService
                                        )
{
    id<BoCPressCallback> callback = [callbackInfo objectForKey:kNetwork_CallbackObject];    
    id callbackAction = [callbackInfo objectForKey:kNetwork_CallbackAction];
    
        id newsID = [(BoCPressNews*)[callbackInfo objectForKey:kNetwork_NewsTag] identity];
        id postContent = [returnedData objectForKey:newsID];
        
        NSDictionary *infoForCache = [callbackInfo objectForKey:kBoCPress_Global_InfoForCache];
        
        NSMutableDictionary *infoToBeCached = [[NSMutableDictionary alloc] init];
        [infoToBeCached setObject: postContent
                           forKey: @"criticPost"];
        
        [_cacheService storeObject: infoToBeCached 
                          withInfo: infoForCache];
        
        [infoToBeCached release];
        
        NSMutableDictionary *info = [[NSMutableDictionary alloc] initWithDictionary: callbackInfo];        
        [info setObject: postContent
                 forKey: @"criticPost"];
        
        [callback callbackForAction: callbackAction 
                           withData: info];
        
        [info release];
    
}

static void network_GetAuthorListOrGetOpinionListResponse(NSDictionary *callbackInfo,
                                                          NSDictionary *returnedData, 
                                                          id<BoCPressCacheService> _cacheService)
{
    id<BoCPressCallback> callback = [callbackInfo objectForKey:kNetwork_CallbackObject];    
    id callbackAction = [callbackInfo objectForKey:kNetwork_CallbackAction];
    
    NSUInteger rangeFrom = [[callbackInfo objectForKey:kNetwork_RangeFrom] intValue];
    
    NSArray *itemIDs = [returnedData objectForKey:@"itemIDs"];
    NSMutableArray* opinions = [[NSMutableArray alloc] init];
    
    for (id itemIDLooper in itemIDs)
    {
        [opinions addObject:[returnedData objectForKey:itemIDLooper]];
    }
    
    int itemCount = [itemIDs count];
    
    
    int count;
    
    if ([[returnedData objectForKey:kSoapXMLParser_HasNextFlag] isEqual:kSoapXMLParser_HasNextFalse])
    {
        count = rangeFrom + itemCount;
    }else
    {
        count = kArraySliceMaxCount;
    }
    
    NSArraySlice *slice = [[NSArraySlice alloc]initWithArray: opinions
                                                      offset: rangeFrom
                                                       count: count];
    [opinions release];
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                              slice, kBoCPress_Global_ArraySliceObject, 
                              [returnedData objectForKey:kSoapXMLParser_HasNextFlag], kSoapXMLParser_HasNextFlag,
                              nil];
    
    NSDictionary *infoForCache = [callbackInfo objectForKey:kBoCPress_Global_InfoForCache];
    
    [_cacheService storeObject:userInfo withInfo:infoForCache];
    
    [callback callbackForAction: callbackAction withData: userInfo];
    
    [slice release];
    [userInfo release];
}

static void network_GetAuthorResponse( NSDictionary *callbackInfo,
                                      NSDictionary *returnedData,
                                      id<BoCPressCacheService> _cacheService)
{
    id<BoCPressCallback> callback = [callbackInfo objectForKey:kNetwork_CallbackObject];    
    id callbackAction = [callbackInfo objectForKey:kNetwork_CallbackAction];
    
    id infoOfAuthor = [returnedData objectForKey:kNetwork_ReturnedInfoOfAuthor];
    
    NSDictionary *infoForCache = [callbackInfo objectForKey:kBoCPress_Global_InfoForCache];
    
    [_cacheService storeObject:infoOfAuthor withInfo:infoForCache];
    
    [callback callbackForAction: callbackAction withData: infoOfAuthor];
    
}

@implementation BoCPressCriticService

- (void)initSoapCallbackFunctions
{
    [super initSoapCallbackFunctions];
    [_soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_contentOfPost)
                               forKey: kNetwork_GetPostResponse];
    [_soapCallbackFunctions setObject: storeCFunctionInNSValue(network_GetAuthorResponse)
                              forKey: kNetwork_GetAuthorResponse];    
    [_soapCallbackFunctions setObject: storeCFunctionInNSValue(network_GetAuthorListOrGetOpinionListResponse)
                              forKey: kNetwork_GetAuthorListResponse];
    [_soapCallbackFunctions setObject: storeCFunctionInNSValue(network_GetAuthorListOrGetOpinionListResponse)
                              forKey: kNetwork_GetOpinionListResponse];

}

- (void)listOrderedCriticColumnsWithCallback: (id<BoCPressCallback>)callback
{
    id tags = [_configurationService queryConfigurationWithTag:kBoCPressConfiguration_CriticColumns];
    if (tags)
    {
        [callback callbackForAction: kCallbackAction_listOrderedCriticColumns 
                           withData: tags];
        
    }else
    {
        /*
        NSDictionary *storedCallbackInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                                            callback, kNetwork_CallbackObject, 
                                            kCallbackAction_listOrderedCriticColumns, kNetwork_CallbackAction,
                                            kBoCPressConfiguration_CriticColumns, kConfiguration_QueryTag,
                                            nil];
        
        NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                      _handler, kNetwork_CallbackObject,
                                      storedCallbackInfo, kNetwork_CallbackStoredCallbackInfo,
                                      kSoapDataSource_refetchGUIConfiguration, kNetwork_CallbackAction,
                                      kNetwork_getConfigurationResponse, kNetwork_SoapResponseType, nil];
        
        [self refechGUIConfigurationWithCallbackInfo:callbackInfo];
        
        [callbackInfo release];
         */
    }
    
}

- (NSString *)stringToGetAuthorListWithBegin: (NSUInteger)begin
                                         end: (NSUInteger)end
{
    NSString * argString = formatXMLIntegerValueAndKey(begin, @"begin");
    argString = [argString stringByAppendingString: formatXMLIntegerValueAndKey(end, @"end")];
    argString = [argString stringByAppendingString: formatXMLValueAndKey(@"1001", @"type")];
    
    return [_requestFormatService requestStringWithRequireType: kNetwork_GetAuthorList
                                             andArgumentString: argString];
}

- (void)listOrderedCriticsRangeFrom: (NSUInteger)rangeFrom
                            rangeTo: (NSUInteger)rangeTo 
                       withCallback: (id<BoCPressCallback>)callback
{
    NSString *stringToGetAuthorList = [self stringToGetAuthorListWithBegin: rangeFrom 
                                                                       end: rangeTo];
    
    id callbackAction = kCallbackAction_listOrderedCritics;
    id columnID = [[_configurationService queryColumnWithTag:kBoCPressConfiguration_CriticColumns andColumnIndex:2] identity];
    NSDictionary *infoForCache = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  kNetwork_RangedIdentifiedObject, kNetwork_FileType,
                                  [NSNumber numberWithInt:rangeFrom], kNetwork_RangeFrom,
                                  [NSNumber numberWithInt:rangeTo], kNetwork_RangeTo,
                                  columnID, kBoCPress_Global_ObjectID,
                                  callbackAction, kNetwork_CallbackAction,
                                  nil];
    
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  [NSNumber numberWithInt:rangeFrom], kNetwork_RangeFrom,
                                  [NSNumber numberWithInt:rangeTo], kNetwork_RangeTo,
                                  callback, kNetwork_CallbackObject, 
                                  columnID, kBoCPress_Global_ColumnID,
                                  callbackAction, kNetwork_CallbackAction,
                                  kNetwork_GetAuthorListResponse, kNetwork_SoapResponseType, 
                                  infoForCache, kBoCPress_Global_InfoForCache,
                                  nil];
    
    [infoForCache release];
    [_networkService postRequestString: stringToGetAuthorList
                       andCallbackInfo: callbackInfo
                        parserDelegate: self];
    [callbackInfo release];
}

- (NSString*)stringToGetOpinionWithColumnID: (id)columnID
                                         AuthorID: (id)authorID
                                            begin: (NSUInteger) begin 
                                              end: (NSUInteger)end
                                             type: (id)type
{
    NSString *argString = formatXMLValueAndKey(columnID, @"columnId");
    argString = [argString stringByAppendingString: formatXMLValueAndKey(authorID, @"authorId")];
    argString = [argString stringByAppendingString: formatXMLIntegerValueAndKey(begin, @"begin")];
    argString = [argString stringByAppendingString: formatXMLIntegerValueAndKey(end, @"end")];
    argString = [argString stringByAppendingString: formatXMLValueAndKey(type, @"type")];

    return [_requestFormatService requestStringWithRequireType: kNetwork_GetOpinionList
                                             andArgumentString: argString];
}
- (void)listLatestCriticPostRangeFrom: (NSUInteger)rangeFrom
                              rangeTo: (NSUInteger)rangeTo
                         withCallback: (id<BoCPressCallback>)callback
{
    //NSLog(@"dkajsdkjaskdj");
    
    NSString *stringToGetOpinionList = [self stringToGetOpinionWithColumnID: kLatestCriticsID
                                                                   AuthorID: @"0" 
                                                                      begin: rangeFrom 
                                                                        end: rangeTo
                                                                       type: kLatestCriticsType];
    
    id callbackAction = kCallbackAction_listLatestCriticPost;
    id columID = [[_configurationService queryColumnWithTag:kBoCPressConfiguration_CriticColumns andColumnIndex:0] identity];
    NSDictionary *infoForCache = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  kNetwork_RangedIdentifiedObject, kNetwork_FileType,
                                  [NSNumber numberWithInt:rangeFrom], kNetwork_RangeFrom,
                                  [NSNumber numberWithInt:rangeTo], kNetwork_RangeTo,
                                  callbackAction, kNetwork_CallbackAction,
                                  columID, kBoCPress_Global_ObjectID,
                                  nil];
    
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  [NSNumber numberWithInt:rangeFrom], kNetwork_RangeFrom,
                                  [NSNumber numberWithInt:rangeTo], kNetwork_RangeTo,
                                  callback, kNetwork_CallbackObject, 
                                  callbackAction, kNetwork_CallbackAction,
                                  kNetwork_GetOpinionListResponse, kNetwork_SoapResponseType, 
                                  columID, kBoCPress_Global_ColumnID,
                                  infoForCache, kBoCPress_Global_InfoForCache,
                                  nil];
    
    [infoForCache release];
    
    [_networkService postRequestString: stringToGetOpinionList
                       andCallbackInfo: callbackInfo
                        parserDelegate: self];
    [callbackInfo release];
}

- (void)listOrderedFavoriteCriticsRangeFrom: (NSUInteger)rangeFrom
                                    rangeTo: (NSUInteger)rangeTo
                               withCallback: (id<BoCPressCallback>)callback
{
    
    NSString *stringToGetOpinionList = [self stringToGetOpinionWithColumnID: kFavoriteCriticsID
                                                                   AuthorID: @"0" 
                                                                      begin: rangeFrom
                                                                        end: rangeTo
                                                                       type: kHotestCriticsType];
    
    id callbackAction = kCallbackAction_listOrderedFavoriteCritics;
    id columnID = [[_configurationService queryColumnWithTag:kBoCPressConfiguration_CriticColumns andColumnIndex:1] identity];
    NSDictionary *infoForCache = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  kNetwork_RangedIdentifiedObject, kNetwork_FileType,
                                  [NSNumber numberWithInt:rangeFrom], kNetwork_RangeFrom,
                                  [NSNumber numberWithInt:rangeTo], kNetwork_RangeTo,
                                  callbackAction, kNetwork_CallbackAction,
                                  columnID, kBoCPress_Global_ObjectID, nil];
    
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  [NSNumber numberWithInt:rangeFrom], kNetwork_RangeFrom,
                                  [NSNumber numberWithInt:rangeTo], kNetwork_RangeTo,
                                  callback, kNetwork_CallbackObject, 
                                  callbackAction, kNetwork_CallbackAction,
                                  kNetwork_GetOpinionListResponse, kNetwork_SoapResponseType,
                                  columnID, kBoCPress_Global_ColumnID,
                                  infoForCache, kBoCPress_Global_InfoForCache,
                                  nil];
    
    [infoForCache release];
    
    [_networkService postRequestString: stringToGetOpinionList
                       andCallbackInfo: callbackInfo
                        parserDelegate: self];
    [callbackInfo release];
}

- (void)listOrderedPostsFromCritic: (id<BoCPressAuthor>)critic 
                         rangeFrom: (NSUInteger)rangeFrom
                           rangeTo: (NSUInteger)rangeTo 
                      withCallback: (id<BoCPressCallback>)callback
{
    NSString *stringToGetOpinionList = [self stringToGetOpinionWithColumnID: kOrderedCriticsID
                                                                   AuthorID: [critic identity] 
                                                                      begin: rangeFrom
                                                                        end: rangeTo
                                                                       type: @"1003"];
    
    id callbackAction = kCallbackAction_listOrderedPostsFromCritic;
    NSDictionary *infoForCache = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  kNetwork_RangedIdentifiedObject, kNetwork_FileType,
                                  [NSNumber numberWithInt:rangeFrom], kNetwork_RangeFrom,
                                  [NSNumber numberWithInt:rangeTo], kNetwork_RangeTo,
                                  [critic identity], kBoCPress_Global_ObjectID,
                                  callbackAction, kNetwork_CallbackAction, nil];
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  [NSNumber numberWithInt:rangeFrom], kNetwork_RangeFrom,
                                  [NSNumber numberWithInt:rangeTo], kNetwork_RangeTo,
                                  callback, kNetwork_CallbackObject, 
                                  callbackAction, kNetwork_CallbackAction,
                                  [critic identity], kNetwork_CriticID,
                                  [critic identity], kBoCPress_Global_ColumnID,
                                  infoForCache, kBoCPress_Global_InfoForCache,
                                  kNetwork_GetOpinionListResponse, kNetwork_SoapResponseType, 
                                  nil];
    [infoForCache release];
    
    [_networkService postRequestString: stringToGetOpinionList
                       andCallbackInfo: callbackInfo
                        parserDelegate: self];
    [callbackInfo release];
}

- (NSString *)stringToGetAuthorWithAuthorID: (id)authorID
{
    NSString *argString =  formatXMLValueAndKey(authorID, @"authorId");
    return [_requestFormatService requestStringWithRequireType: kNetwork_GetAuthor
                                             andArgumentString: argString];
}
- (void)contentOfCritic: (id<BoCPressAuthor>)critic
               userInfo: (id)userInfo
           withCallback: (id<BoCPressCallback>)callback
{
    NSString *stringToGetAuthor = [self stringToGetAuthorWithAuthorID:[critic identity]];
    
    NSDictionary *callbackInfo = nil;
    id callbackAction = kBoCPress_Global_CallbackAction_contentOfCritic;
    NSDictionary *infoForCache = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  kNetwork_SingleIdentifiedObject, kNetwork_FileType,
                                  callbackAction, kNetwork_CallbackAction,
                                  [critic identity], kBoCPress_Global_ObjectID, 
                                  nil];
    if (userInfo)
    {
        
        callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                        callback, kNetwork_CallbackObject,
                        callbackAction, kNetwork_CallbackAction,
                        [critic identity], kNetwork_CriticID, 
                        kNetwork_GetAuthorResponse, kNetwork_SoapResponseType,
                        infoForCache, kBoCPress_Global_InfoForCache,
                        nil];
    }else
    {
        callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                        callback, kNetwork_CallbackObject,
                        callbackAction, kNetwork_CallbackAction,
                        [critic identity], kNetwork_CriticID, 
                        kNetwork_GetAuthorResponse, kNetwork_SoapResponseType,
                        infoForCache, kBoCPress_Global_InfoForCache,
                        nil];
    }
    
    [infoForCache release];
    
    [_networkService postRequestString: stringToGetAuthor 
                       andCallbackInfo: callbackInfo
                        parserDelegate: self];
    
    [callbackInfo release];
}

- (void)contentOfCriticPost: (id<BoCPressNews>)criticPost 
                       info: (id)info
               withCallback: (id<BoCPressCallback>)callback
{
    id logInfo = [info objectForKey: @"logInfo"];
    
    NSString *stringToRequestcontentOfCriticPost = [_requestFormatService getPostRequestStringWithNews: criticPost 
                                                                                               logInfo: logInfo] ;
    
    id callbackAction = kCallbackAction_contentOfCriticPost;
    NSDictionary *infoForCache = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  kNetwork_SingleIdentifiedObject, kNetwork_FileType,
                                  callbackAction, kNetwork_CallbackAction,
                                  [criticPost identity], kBoCPress_Global_ObjectID,
                                  nil];
    
    
    NSMutableDictionary *callbackInfo = [[NSMutableDictionary alloc] initWithDictionary: info];
    
    [callbackInfo setObject: criticPost 
                     forKey: kNetwork_NewsTag];
    [callbackInfo setObject: callback
                     forKey: kNetwork_CallbackObject];
    [callbackInfo setObject: callbackAction
                     forKey: kNetwork_CallbackAction];
    [callbackInfo setObject: [criticPost identity]
                     forKey:  kNetwork_CriticPostID];
    [callbackInfo setObject: kNetwork_GetPostResponse
                     forKey: kNetwork_SoapResponseType];
    [callbackInfo setObject: infoForCache
                     forKey: kBoCPress_Global_InfoForCache];
    
    [infoForCache release];
    
    [_networkService postRequestString: stringToRequestcontentOfCriticPost 
                       andCallbackInfo: callbackInfo
                        parserDelegate: self];
    
    [callbackInfo release];
}

- (id)identity
{
    return BoCPressCriticServiceID;
}

@end

NSString * const BoCPressCriticServiceID = @"com.bocpress.service.critic";
