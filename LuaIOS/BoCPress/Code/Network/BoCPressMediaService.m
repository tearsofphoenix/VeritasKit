//
//  BoCPressMediaService.m
//  BoCPress
//
//  Created by E-Reach Administrator on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressMediaService.h"

#import "BoCPressConstant.h"

#import "BoCPressNetworkService.h"

#import "BoCPressCacheService.h"

#import "BoCPressConfigurationService.h"

#import "BoCPressCallback.h"

#import "BoCPressSharedFunctions.h"

#import "BoCPressRequestStringFormatService.h"

#import "BoCPressMediaArraySlice.h"

#import "BoCPressMedia.h"

#import "BoCPressMediaType.h"

static void callbackAction_listOrderedMediaWithTag(NSDictionary *callbackInfo,
                                                   NSDictionary *returnedData, 
                                                   id<BoCPressCacheService> _cacheService)
{    
    id<BoCPressCallback> callback = [callbackInfo objectForKey:kNetwork_CallbackObject];    
    id callbackAction = [callbackInfo objectForKey:kNetwork_CallbackAction];
    
    BoCPressMediaTagColumn*  tag = [callbackInfo objectForKey:kNetwork_NewsTag];
    
    NSUInteger rangeTo = [[callbackInfo objectForKey:kNetwork_RangeTo] intValue];
    
    NSUInteger rangeFrom = [[callbackInfo objectForKey:kNetwork_RangeFrom] intValue];
    
    NSUInteger count = rangeTo - rangeFrom;
    
    if (rangeTo > kNetwork_MaxNewsCount)
    {
        count = kNetwork_MaxNewsCount - rangeFrom;
    }
    
    NSMutableArray *media = [[NSMutableArray alloc] init];
    
    NSArray *itemIDs = [returnedData objectForKey:@"itemIDs"];
    
    
    for (id itemIDLooper in itemIDs) 
    {
        
        [media addObject: [returnedData objectForKey:itemIDLooper]];
        
    }
    
    BoCPressMediaArraySlice *slice = [[BoCPressMediaArraySlice alloc] initWithArray: media 
                                                                             offset: rangeFrom 
                                                                              count: count
                                                                        forMediaTag: tag];
    
    [slice setUserInfo:[returnedData objectForKey:kSoapXMLParser_HasNextFlag]];
    
    [media release];
    
    NSDictionary *infoForCache = [callbackInfo objectForKey:kBoCPress_Global_InfoForCache];
    
    [_cacheService storeObject:slice withInfo:infoForCache];
    
    [callback callbackForAction: callbackAction withData: slice];
    
    [slice release];
    
}


static void callbackAction_contentOfMedia(NSDictionary *callbackInfo,
                                          NSDictionary *returnedData,
                                          id<BoCPressCacheService> _cacheService
                                          )
{
    id<BoCPressCallback> callback = [callbackInfo objectForKey:kNetwork_CallbackObject];    
    id callbackAction = [callbackInfo objectForKey:kNetwork_CallbackAction];
    
    id mediaID = [callbackInfo objectForKey:kBoCPress_Global_ObjectID];
    BoCPressMedia* media = [returnedData objectForKey:mediaID];
    id<BoCPressMediaType> mediaType = [callbackInfo objectForKey: kType_Global_MediaTypeObject];
    
    NSDictionary *repackedInfo = [[NSDictionary alloc] initWithObjectsAndKeys: 
                                  media, kType_Global_MediaObject, 
                                  mediaType, kType_Global_MediaTypeObject,
                                  nil];
    
    [callback callbackForAction: callbackAction 
                       withData: repackedInfo];
    [repackedInfo release];
}


static void network_GetSubColumnPostListResponse(NSDictionary *callbackInfo,
                                                 NSDictionary *returnedData, 
                                                 id<BoCPressCacheService> _cacheService)
{
    id<BoCPressCallback> callback = [callbackInfo objectForKey:kNetwork_CallbackObject];    
    id callbackAction = [callbackInfo objectForKey:kNetwork_CallbackAction];
    
    id<BoCPressMediaType> mediaType = [callbackInfo objectForKey:kNetwork_MediaType];
    
    NSUInteger rangeTo = [[callbackInfo objectForKey:kNetwork_RangeTo] intValue];
    
    NSUInteger rangeFrom = [[callbackInfo objectForKey:kNetwork_RangeFrom] intValue];
    
    NSUInteger count = rangeTo - rangeFrom;
    
    if (rangeTo > kNetwork_MaxNewsCount)
    {
        count = kNetwork_MaxNewsCount - rangeFrom;
    }
    
    
    NSMutableArray *media = [[[NSMutableArray alloc] init] autorelease];
    
    
    NSArray *itemIDs = [returnedData objectForKey:@"itemIDs"];
    
    int itemCount = [itemIDs count];
    
    if (count > itemCount) 
    {
        //FIXME:post notification to get more
    }
    
    int iLooper = 0;
    
    for (id itemIDLooper in itemIDs) 
    {
        if (iLooper < count)
        {
            [media addObject: [returnedData objectForKey:itemIDLooper]];
            iLooper++;
        }else
        {
            break;
        }
        
    }
    
    BoCPressMediaArraySlice *slice = [[BoCPressMediaArraySlice alloc]initWithArray:media 
                                                                            offset:rangeFrom 
                                                                             count:count 
                                                                      forMediaType:mediaType];
    
    NSDictionary *infoForCache = [callbackInfo objectForKey:kBoCPress_Global_InfoForCache];
    
    [_cacheService storeObject:slice withInfo:infoForCache];
    
    [callback callbackForAction: callbackAction withData: slice];
    
    [slice release];
}

static void network_GetBroadcastLivingResponse(id callbackInfo,
                                               NSDictionary *returnedData,  
                                               id<BoCPressCacheService> _cacheService)
{
    id<BoCPressCallback> callback = [callbackInfo objectForKey:kNetwork_CallbackObject];    
    id callbackAction = [callbackInfo objectForKey:kNetwork_CallbackAction];
    
    //Notice:
    // current broad cast is only "1", so the itemIDs contains only one object
    NSArray *itemIDs = [returnedData objectForKey:@"itemIDs"];
    
    id itemID = [itemIDs objectAtIndex:0];
    
    id livingBroadCast = [returnedData objectForKey:itemID];
    
    NSDictionary *infoForCache = [callbackInfo objectForKey:kBoCPress_Global_InfoForCache];
    
    [_cacheService storeObject:livingBroadCast withInfo:infoForCache];
    
    
    [callback callbackForAction: callbackAction withData: livingBroadCast];
    
}

static void network_GetBroadcastForecastResponse(NSDictionary *callbackInfo,
                                                 NSDictionary *returnedData, 
                                                 id<BoCPressCacheService> _cacheService)
{
    id<BoCPressCallback> callback = [callbackInfo objectForKey:kNetwork_CallbackObject];    
    id callbackAction = [callbackInfo objectForKey:kNetwork_CallbackAction];
    
    NSMutableArray *media = [[NSMutableArray alloc] init];
    
    NSArray *itemIDs = [returnedData objectForKey:@"itemIDs"];
    
    int itemCount = [itemIDs count];
    
    for (id itemIDLooper in itemIDs) 
    {
        
        [media addObject: [returnedData objectForKey:itemIDLooper]];
        
    }
    
    BoCPressMediaArraySlice *slice = [[BoCPressMediaArraySlice alloc] initWithArray: media 
                                                                             offset: 0 
                                                                              count: itemCount
                                                                        forMediaTag: nil];
    
    [media release];
    
    NSDictionary *infoForCache = [callbackInfo objectForKey:kBoCPress_Global_InfoForCache];
    
    [_cacheService storeObject:slice withInfo:infoForCache];
    
    [callback callbackForAction: callbackAction withData: slice];
    
    [slice release];
    
    
}

@implementation BoCPressMediaService

- (void)initSoapCallbackFunctions
{
    [super initSoapCallbackFunctions];
    [_soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_listOrderedMediaWithTag)
                               forKey: kNetwork_GetPostListResponse];
    [_soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_contentOfMedia) 
                               forKey: kNetwork_GetPostResponse];
    [_soapCallbackFunctions setObject: storeCFunctionInNSValue(network_GetSubColumnPostListResponse) 
                              forKey: kNetwork_GetSubColumnPostListResponse];
    [_soapCallbackFunctions setObject: storeCFunctionInNSValue(network_GetBroadcastLivingResponse) 
                              forKey: kNetwork_GetBroadcastLivingResponse];    
    [_soapCallbackFunctions setObject: storeCFunctionInNSValue(network_GetBroadcastForecastResponse) 
                              forKey: kNetwork_GetBroadcastForecastResponse];

    
}

- (NSString *)getPostRequestStringWithMedia: (id<BoCPressMedia>) media
{
    NSString *argString = formatXMLValueAndKey([media identity], @"postId");
    argString = [argString stringByAppendingString:formatXMLValueAndKey(@"vod", @"actionType")];
    
    return [_requestFormatService requestStringWithRequireType: kNetwork_GetPost 
                                             andArgumentString: argString ];
}


#pragma mark - Media content

- (void)listOrderedMediaTypesWithCallback: (id<BoCPressCallback>)callback
{
    [callback callbackForAction: kCallbackAction_listOrderedMediaTypes 
                       withData: [_configurationService queryConfigurationWithTag:kBoCPressConfiguration_MediaTypes]];
}


- (void)listOrderedMediaOfType: (id<BoCPressMediaType>)type 
                     rangeFrom: (NSUInteger)rangeFrom
                       rangeTo: (NSUInteger)rangeTo
                  withCallback: (id<BoCPressCallback>)callback
{
    
    NSString *stringToRequestPostList = [_requestFormatService getPostListRequestStringWithBegin: rangeFrom
                                                                                        columnID: [type identity]
                                                                                             end: rangeTo
                                                                                     requireType: kNetwork_GetSubColumnPostList];
    
    id callbackAction = kCallbackAction_listOrderedMediaOfType;
    NSDictionary *infoForCache = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  kNetwork_RangedIdentifiedObject, kNetwork_FileType,
                                  [type identity], kBoCPress_Global_ObjectID,
                                  [NSNumber numberWithInt:rangeFrom], kNetwork_RangeFrom,
                                  [NSNumber numberWithInt:rangeTo], kNetwork_RangeTo,
                                  callbackAction, kNetwork_CallbackAction, nil];
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  [NSNumber numberWithInt:rangeFrom], kNetwork_RangeFrom,
                                  [NSNumber numberWithInt:rangeTo], kNetwork_RangeTo,
                                  type, kNetwork_MediaType,
                                  [type identity], kNetwork_MediaTypeID,
                                  callback, kNetwork_CallbackObject, 
                                  callbackAction, kNetwork_CallbackAction,
                                  kNetwork_GetSubColumnPostListResponse, kNetwork_SoapResponseType,
                                  infoForCache, kBoCPress_Global_InfoForCache,
                                  nil];
    
    
    [infoForCache release];
    
    [_networkService postRequestString: stringToRequestPostList 
                       andCallbackInfo: callbackInfo
                        parserDelegate: self];
    [callbackInfo release];
}

- (void)listOrderedMediaTagsInType: (id<BoCPressMediaType>)type
                      withCallback: (id<BoCPressCallback>)callback
{
    [callback callbackForAction: kCallbackAction_listOrderedMediaTagsInType 
                       withData: [_configurationService queryConfigurationWithTag:[type identity]]];
    
}


- (void)contentOfMedia: (id<BoCPressMedia>)media
             mediaType: (id<BoCPressMediaType>)mediaType 
          withCallback: (id<BoCPressCallback>)callback
{
    NSString *stringToRequestPost = [self getPostRequestStringWithMedia:media] ;
    
    id callbackAction = kCallbackAction_contentOfMedia;
    
    NSDictionary *infoForCache = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  kNetwork_SingleIdentifiedObject, kNetwork_FileType,
                                  [media identity], kNetwork_UserInfo,
                                  callbackAction, kNetwork_CallbackAction, nil];
    
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  media, kBoCPress_Global_MediaObject,
                                  [media identity], kBoCPress_Global_ObjectID,
                                  callback, kNetwork_CallbackObject, 
                                  callbackAction, kNetwork_CallbackAction,
                                  kNetwork_GetPostResponse, kNetwork_SoapResponseType,
                                  mediaType, kType_Global_MediaTypeObject,
                                  infoForCache, kBoCPress_Global_InfoForCache,
                                  nil];
    
    [infoForCache release];
    [_networkService postRequestString: stringToRequestPost 
                       andCallbackInfo: callbackInfo
                        parserDelegate: self];
    
    [callbackInfo release];
}


- (void)listOrderedMediaWithTag: (BoCPressMediaTagColumn* )tag
                      rangeFrom: (NSUInteger)rangeFrom
                        rangeTo: (NSUInteger)rangeTo
                       callback: (id<BoCPressCallback>)callback
{
    
    NSString *stringToRequestPostList = [_requestFormatService getPostListRequestStringWithBegin: rangeFrom
                                                                                        columnID: [tag identity]
                                                                                             end: rangeTo
                                                                                     requireType: kNetwork_GetPostList];
    id callbackAction = kCallbackAction_listOrderedMediaWithTag;
    
    NSDictionary *infoForCache = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  kNetwork_RangedIdentifiedObject, kNetwork_FileType,
                                  [NSNumber numberWithInt:rangeFrom], kNetwork_RangeFrom,
                                  [NSNumber numberWithInt:rangeTo], kNetwork_RangeTo,
                                  [tag identity], kBoCPress_Global_ObjectID,
                                  callbackAction, kNetwork_CallbackAction,
                                  nil];
    
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

#pragma mark - BroadCast content

- (NSString *)getBroadCastForcastRequestStringWithColumnID: (id)columnID
{
    NSString *argString = formatXMLValueAndKey(columnID, @"columnId");
    argString = [argString stringByAppendingString:formatXMLValueAndKey(@"live", @"actionType")];
    
    return [_requestFormatService requestStringWithRequireType: kNetwork_GetBroadcastForecast
                                             andArgumentString: argString];
}

- (void)listOrderedBroadCastForcastWithCallback: (id<BoCPressCallback>)callback
{
    NSString *stringToRequestBroadCastForcast = [self getBroadCastForcastRequestStringWithColumnID:kBroadCastColumnID];
    id callbackAction = kCallbackAction_listOrderedBroadCastForcast;
    
    NSDictionary *infoForCache = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  kNetwork_SingleIdentifiedObject, kNetwork_FileType,
                                  callbackAction, kNetwork_CallbackAction, nil];
    
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  callback, kNetwork_CallbackObject, 
                                  callbackAction, kNetwork_CallbackAction,
                                  kNetwork_GetBroadcastForecastResponse, kNetwork_SoapResponseType, 
                                  infoForCache, kBoCPress_Global_InfoForCache,
                                  nil];
    [infoForCache release];
    
    [_networkService postRequestString: stringToRequestBroadCastForcast
                       andCallbackInfo: callbackInfo
                        parserDelegate: self];
    
    [callbackInfo release];
}

- (void)contentOfBroadCast: (id<BoCPressMedia>) media
              withCallback: (id<BoCPressCallback>)callback
{
    [callback callbackForAction: kCallbackAction_contentOfBroadCast 
                       withData: media];
}


- (NSString *)getBroadCastLivingRequestStringWithColumnID: (id)columnID
{
    NSString * argString = formatXMLValueAndKey(columnID, @"columnId");
    argString = [argString stringByAppendingString:formatXMLValueAndKey(@"live", @"actionType")];
    
    return [_requestFormatService requestStringWithRequireType: kNetwork_GetBroadcastLiving 
                                             andArgumentString: argString];
}

- (void)currentBroadCastWithCallback: (id<BoCPressCallback>) callback
{
    
    NSString *stringToRequestBroadCastLiving = [self getBroadCastLivingRequestStringWithColumnID:kBroadCastColumnID];
    
    id callbackAction = kCallbackAction_currentBroadCastWithCallback;
    NSDictionary *infoForCache = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  kNetwork_SingleIdentifiedObject, kNetwork_FileType,
                                  callbackAction, kNetwork_CallbackAction, nil];
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  callback, kNetwork_CallbackObject, 
                                  callbackAction, kNetwork_CallbackAction,
                                  kNetwork_GetBroadcastLivingResponse, kNetwork_SoapResponseType,                                  
                                  infoForCache, kBoCPress_Global_InfoForCache, 
                                  nil];
    
    [infoForCache release];
    
    [_networkService postRequestString: stringToRequestBroadCastLiving 
                       andCallbackInfo: callbackInfo
                        parserDelegate: self];
    
    [callbackInfo release];
}

- (id)identity
{
    return BoCPressMediaServiceID;
}

@end

NSString * const BoCPressMediaServiceID = @"com.bocpress.service.media";
