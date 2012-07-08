//
//  BoCPressQuoteService.m
//  BoCPress
//
//  Created by E-Reach Administrator on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressQuoteService.h"
#import "BoCPressConfigurationService.h"
#import "BoCPressNetworkService.h"
#import "BoCPressRequestStringFormatService.h"
#import "BoCPressSharedFunctions.h"

#import "BoCPressConstant.h"

#import "BoCPressSecurityFamily.h"
#import "BoCPressSecurity.h"
#import "BoCPressCallback.h"

#import "BoCPressChartImageConfiguration.h"

static void soapCallback_GetQuoteListResponse(NSDictionary *callbackInfo,
                                              NSDictionary *returnedData, 
                                              NSMutableDictionary * _lastUpdateTimeForCallbackAction)
{
    id<BoCPressCallback> callback = [callbackInfo objectForKey:kNetwork_CallbackObject];    
    id callbackAction = [callbackInfo objectForKey:kNetwork_CallbackAction];
    
    NSArray* itemIDs = [returnedData objectForKey:@"itemIDs"];
    NSString *lastUpdateTime = [returnedData objectForKey:kNetwork_UpdateTime];
    if (lastUpdateTime)
    {
//        [_lastUpdateTimeForCallbackAction setObject: lastUpdateTime 
//                                             forKey: kBoCPress_Global_LastUpdateSecuritiesTime];
    }
    
    NSMutableArray* families = [[NSMutableArray alloc] init];
    
    for (id itemIDLooper in itemIDs)
    {
        [families addObject:[returnedData objectForKey:itemIDLooper]];
    }
    
    NSMutableDictionary *repackedInfo = [[NSMutableDictionary alloc] initWithDictionary: callbackInfo];
    [repackedInfo setObject: families
                     forKey: kType_Global_NSArray];
    
    [callback callbackForAction: callbackAction
                       withData: repackedInfo];
    [repackedInfo release];
    
    [families release];
}

static void soapCallback_getQuoteDetailResponse(NSDictionary *callbackInfo,
                                                  NSDictionary *returnedData,
                                                  id<BoCPressCacheService> _cacheManage)
{
    id<BoCPressCallback> callback = [callbackInfo objectForKey:kNetwork_CallbackObject];    
    id callbackAction = [callbackInfo objectForKey:kNetwork_CallbackAction];
    
    NSMutableDictionary *repackedData = [[NSMutableDictionary alloc] initWithDictionary: returnedData];
    NSArray *securities = [callbackInfo objectForKey: kType_Global_NSArray];
    if (securities)
    {
        [repackedData setObject: securities
                         forKey: kType_Global_NSArray];
    }
    
    
    [callback callbackForAction: callbackAction
                       withData: repackedData];
    
    [repackedData release];
    
}

static void callbackAction_listQuoteRelatedCriticPosts(NSDictionary *callbackInfo,
                                                       NSDictionary *returnedData,
                                                       id<BoCPressCacheService> _cacheService)
{
    id<BoCPressCallback> callback = [callbackInfo objectForKey:kNetwork_CallbackObject];    
    id callbackAction = [callbackInfo objectForKey:kNetwork_CallbackAction];
    
    NSArray *itemIDs = [returnedData objectForKey:@"itemIDs"];
    NSMutableArray* opinions = [[NSMutableArray alloc] init];
    
    for (id itemIDLooper in itemIDs)
    {
        [opinions addObject:[returnedData objectForKey:itemIDLooper]];
    }
    
    [callback callbackForAction: callbackAction 
                       withData: opinions];
    
    [opinions release];     
}

static void callbackAction_listQuoteRelatedNews(NSDictionary *callbackInfo,
                                                NSDictionary *returnedData,
                                                id<BoCPressCacheService> _cacheService)
{
    id<BoCPressCallback> callback = [callbackInfo objectForKey:kNetwork_CallbackObject];    
    id callbackAction = [callbackInfo objectForKey:kNetwork_CallbackAction];
    
    NSArray *itemIDs = [returnedData objectForKey:@"itemIDs"];
    NSMutableArray* news = [[NSMutableArray alloc] init];
    
    for (id itemIDLooper in itemIDs)
    {
        [news addObject:[returnedData objectForKey:itemIDLooper]];
    }
    
    [callback callbackForAction: callbackAction
                       withData: news];
    
    [news release];     
}


@implementation BoCPressQuoteService

- (void)initSoapCallbackFunctions
{
    [super initSoapCallbackFunctions];
    [_soapCallbackFunctions setObject: storeCFunctionInNSValue(soapCallback_GetQuoteListResponse)
                               forKey: kNetwork_GetQuoteListResponse];
    [_soapCallbackFunctions setObject: storeCFunctionInNSValue(soapCallback_getQuoteDetailResponse) 
                              forKey:kNetwork_getQuoteDetailResponse];
    [_soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_listQuoteRelatedNews)
                              forKey: kNetwork_getQuoteRelatedNewsListResponse];
    [_soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_listQuoteRelatedCriticPosts)
                              forKey: kNetwork_getQuoteRelatedOpinionsListResponse];


}

- (NSString *) getQuotePostListStringWithColumnID: (id) columnID
                                      triggerFlag: (NSString *)flag
{
    NSString *arg = formatXMLValueAndKey(columnID, @"type");
    arg = [arg stringByAppendingString: formatXMLValueAndKey(flag, @"rsvdStr1")];
    
    return [_requestFormatService requestStringWithRequireType: kNetwork_GetQuoteList
                                             andArgumentString: arg];
}

- (void)listOrderedLongTermSecurityInFamily: (id<BoCPressSecurityFamily>)family 
                               withCallback: (id<BoCPressCallback>)callback
{
    id callbackAction = kCallbackAction_listOrderedLongTermSecurityInFamily;
    
    NSString *stringToGetQutoteList = [self getQuotePostListStringWithColumnID: [family identity] 
                                                                   triggerFlag: kString_Global_UpdateTriggerFlagByUser] ;
    
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  family, kType_Global_SecurityFamily,
                                  [family identity], kBoCPress_Global_ColumnID,
                                  callback, kNetwork_CallbackObject, 
                                  callbackAction, kNetwork_CallbackAction,
                                  kNetwork_GetQuoteListResponse, kNetwork_SoapResponseType, nil];
    
    
    [_networkService postRequestString: stringToGetQutoteList
                       andCallbackInfo: callbackInfo
                        parserDelegate: self];
    [callbackInfo release];
}

- (void)listOrderedSecurityInFamily: (id<BoCPressSecurityFamily>)family 
                       withCallback: (id<BoCPressCallback>)callback
                        triggerFlag: (NSString *)flag
{
    NSString *stringToGetQutoteList = [self getQuotePostListStringWithColumnID: [family identity] 
                                                                   triggerFlag: flag] ;
    
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  family, kType_Global_SecurityFamily,
                                  [family identity], kBoCPress_Global_ColumnID,
                                  callback, kNetwork_CallbackObject, 
                                  kCallbackAction_listOrderedSecurityInFamily, kNetwork_CallbackAction,
                                  kNetwork_GetQuoteListResponse, kNetwork_SoapResponseType, nil];
    
    
    [_networkService postRequestString: stringToGetQutoteList
                       andCallbackInfo: callbackInfo
                        parserDelegate: self];
    [callbackInfo release];
}

- (void)listOrderedSecurityFamiliesWithCallback: (id<BoCPressCallback>)callback
{
    
    id tags = [_configurationService queryConfigurationWithTag:kBoCPressConfiguration_QuoteFamilies];
    
    [callback callbackForAction: kCallbackAction_listOrderedSecurityFamilies 
                       withData: tags];
    
}

- (NSString *)getQuoteDetailStringWithQuoteID: (id)quoteID
                                  triggerFlag: (NSString *)triggerFlag
{
    NSString *arg = formatXMLValueAndKey(triggerFlag, @"rsvdStr1");
    arg = [arg stringByAppendingString: formatXMLValueAndKey(quoteID, @"rsvdLong1")];
    
    return [_requestFormatService requestStringWithRequireType: kNetwork_GetQuoteDetail
                                             andArgumentString: arg];    
}

- (void)contentOfQuote: (id<BoCPressSecurity>)security
          inSecurities: (NSArray *)securities
          withCallback: (id<BoCPressCallback>)callback
           triggerFlag: (NSString *)flag
{
    NSString *stringToGetQuoteDetailString = [self getQuoteDetailStringWithQuoteID: [security identity] 
                                                                       triggerFlag: flag];
    
    NSMutableDictionary *callbackInfo = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                         security, kType_GLobal_SecurityObject,
                                         [security identity], kBoCPress_Global_ColumnID,
                                         callback, kNetwork_CallbackObject, 
                                         kCallbackAction_contentOfQuoteDetail, kNetwork_CallbackAction,
                                         flag, kString_QuoteContentPage_TriggerFlag,
                                         kNetwork_getQuoteDetailResponse, kNetwork_SoapResponseType, nil];
    
    if (securities)
    {
        [callbackInfo setObject: securities
                         forKey: kType_Global_NSArray];
    }
    
    [_networkService postRequestString: stringToGetQuoteDetailString 
                       andCallbackInfo: callbackInfo
                        parserDelegate: self];
    [callbackInfo release];
}

- (NSString *)getChartImageRequestStringWithCongfiguration: (id<BoCPressChartImageConfiguration>)chartImageConfiguration
                                               triggerFlag: (NSString *)flag
{
    NSString *argString = [chartImageConfiguration xmlFormattedString];
    argString = [argString stringByAppendingString: formatXMLValueAndKey(flag, @"rsvdStr1")];
    
    return [_requestFormatService requestStringWithRequireType: kNetwork_getChart 
                                             andArgumentString: argString];
}
- (void)getChartImage: (id<BoCPressChartImageConfiguration>)chartImageConfiguration
         withCallback: (id<BoCPressCallback>)callback
          triggerFlag: (NSString *)flag
{
    NSString *stringToGetChartImage = [self getChartImageRequestStringWithCongfiguration: chartImageConfiguration 
                                                                             triggerFlag: flag];
    
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  callback, kNetwork_CallbackObject, 
                                  kCallbackAction_getChartImageWithImageConfiguration, kNetwork_CallbackAction,
                                  kNetwork_getChartResponse, kNetwork_SoapResponseType, 
                                  nil];
    
    [_networkService postRequestString: stringToGetChartImage
                       andCallbackInfo: callbackInfo
                        parserDelegate: self];
    
    [callbackInfo release];
}

- (void)listOrderedRelatedCriticPostsOfSecurity: (id<BoCPressSecurity>)security 
                                   withCallback: (id<BoCPressCallback>)callback
{
    NSString *argString = formatXMLValueAndKey([security identity], @"type");
    NSString *stringToListRelatedCriticPosts = [_requestFormatService requestStringWithRequireType: kNetwork_getQuoteRelatedOpinionsList 
                                                                                 andArgumentString: argString];
    id callbackAction = kCallbackAction_getQuoteRelatedOpinionsList;
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                              callbackAction, kNetwork_CallbackAction,
                              callback, kNetwork_CallbackObject,
                              kNetwork_getQuoteRelatedOpinionsListResponse, kNetwork_SoapResponseType,
                              nil];
    
    [_networkService postRequestString: stringToListRelatedCriticPosts
                       andCallbackInfo: userInfo
                        parserDelegate: self];
    
    [userInfo release];
}

- (void)listOrderedRelatedNewsOfSecurity: (id<BoCPressSecurity>)security 
                            withCallback: (id<BoCPressCallback>)callback 
{
    NSString *argString = formatXMLValueAndKey([security identity], @"type");
    
    NSString *stringToListRelatedNews = [_requestFormatService requestStringWithRequireType: kNetwork_getQuoteRelatedNewsList 
                                                                          andArgumentString: argString];
    id callbackAction = kCallbackAction_getQuoteRelatedNewsList;
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                              callbackAction, kNetwork_CallbackAction,
                              callback, kNetwork_CallbackObject,
                              kNetwork_getQuoteRelatedNewsListResponse, kNetwork_SoapResponseType,
                              nil];
    
    [_networkService postRequestString: stringToListRelatedNews
                       andCallbackInfo: userInfo
                        parserDelegate: self];
    
    [userInfo release];
}

- (void)storeQuoteContentPageChartConfiguration:(id)configuration 
{
    NSString *documentsDirectory = [_configurationService queryConfigurationWithTag:kSoapConfiguration_ApplicationDocumentDirectory];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"BoCPressChartConfiguration"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:filePath]) 
    {
        [fileManager removeItemAtPath:filePath error:nil];
    }
    
    [NSKeyedArchiver archiveRootObject: configuration 
                                toFile: filePath];
}

- (void)downloadChartImageWith:(id)info
                      callback:(id<BoCPressCallback>)callback
{
    NSURL *imageURL = [info objectForKey:kBoCPress_Global_NSURLObject];
    
    NSMutableDictionary *wrappedInfo = [[NSMutableDictionary alloc] initWithDictionary: info];
    [wrappedInfo setObject: [NSNumber numberWithBool:YES] 
                    forKey: kBoCPress_Global_NotUseCacheFlag];
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                              [imageURL absoluteString], kNetworkManager_TargetURL,
                              wrappedInfo, kNetwork_CallbackObject,
                              nil];
    [wrappedInfo release];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kNetworkManager_postRequestNotification 
                                                        object: self 
                                                      userInfo: userInfo];
    
    [userInfo release];
}

- (id)quoteContentPageChartConfiguration
{
    NSString *documentsDirectory = [_configurationService queryConfigurationWithTag:kSoapConfiguration_ApplicationDocumentDirectory];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"BoCPressChartConfiguration"];
    return [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
}

- (id)identity
{
    return BoCPressQuoteServiceID;
}

@end

NSString * const BoCPressQuoteServiceID = @"com.bocpress.service.quote";
