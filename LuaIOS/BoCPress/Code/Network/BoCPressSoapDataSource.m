//
//  BocPressNetworkDataSource.m
//  BoCPress
//
//  Created by LeixSnake on 6/7/11.
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
#import "BoCPressDataSource.h"

#import "BoCPressCallback.h"

#import "BoCPressNews.h"

#import "BoCPressNewsArraySlice.h"

#import "BoCPressNewsTagColumn.h"

#import "BoCPressMediaTagColumn.h"

#import "BoCPressSoapDataSource.h"

#import "BoCPressConstant.h"

#import "BoCPressNetworkService.h"

#import "BoCPressConstant.h"

#import "BoCPressSoapDataSourcePrivateHandler.h"

#import "BoCPressConfigurationService.h"

#import "SqliteDatabase.h"
#import "SqliteDatabase(ApplicationDirectories).h"

#import "UIHardwareDevice.h"

#import "BoCPressLongTermSecurity.h"

#import "BoCPressCacheService.h"

#import "BoCPressUserInfoService.h"

#import "BoCPressPurchaseService.h"

#import "BoCPressViewController.h"

#import "BoCPressChartImageConfiguration.h"

#import "BoCPressProduct.h"

#import "BoCPressSharedFunctions.h"

#import "NSString+MD5.h"

#import "NSString+AllFilePathsUnderDirectory.h"

#import "NSDate+getStringOfYearMonthDay.h"

#import "BoCPressNotificationDefines.h"

#import "BoCPressAlertView.h"

#import "BoCPressColumn.h"

#import "BoCPressEntry.h"

#import "NSArray+ReversedArray.h"

#import "BoCPressServerPushNotification.h"

#import "BoCPressNetworkConstant.h"

#import "BoCPressMetaService.h"
#import "BoCPressQuoteService.h"
#import "BoCPressMediaService.h"
#import "BoCPressNewsService.h"
#import "BoCPressCriticService.h"
#import "BoCPressAccountService.h"
#import "BoCPressRequestStringFormatService.h"
#import "BoCPressMediaArraySlice.h"
#import "BoCPressSoapXMLParser.h"

#pragma mark - callback actions and responses

static void callbackAction_listOrderedProducts(NSDictionary *callbackInfo,
                                               NSDictionary *returnedData,
                                               id<BoCPressCacheService> _cacheService
                                               )
{
    id<BoCPressCallback> callback = [callbackInfo objectForKey:kNetwork_CallbackObject];    
    id callbackAction = [callbackInfo objectForKey:kNetwork_CallbackAction];
    
    NSArray *products = [returnedData objectForKey:kType_Global_NSArray];
    NSUInteger rangeFrom = [[callbackInfo objectForKey:kNetwork_RangeFrom] integerValue];
    
    NSArraySlice *slice = [[NSArraySlice alloc] initWithArray:products 
                                                       offset:rangeFrom 
                                                        count:[products count]];
    
    [callback callbackForAction:callbackAction withData:slice];
    
    [slice release];
    
}

static void callbackAction_getPushConfigResponse(NSDictionary *callbackInfo,
                                                 NSDictionary *returnedData,
                                                 id<BoCPressCacheService> _cacheService)
{
    id<BoCPressCallback> callback = [callbackInfo objectForKey:kNetwork_CallbackObject];    
    id callbackAction = [callbackInfo objectForKey:kNetwork_CallbackAction];
    
    NSDictionary *config = [returnedData objectForKey: kBoCPressSoap_RemoteNotificationConfigurationFromServer];
    [callback callbackForAction: callbackAction
                       withData: config];
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

static void callbackAction_normalHandleOfCallbackIncludeCallbackInfo(NSDictionary *callbackInfo,
                                                                     NSDictionary *returnedData,
                                                                     id<BoCPressCacheService> _cacheManage)
{
    id<BoCPressCallback> callback = [callbackInfo objectForKey:kNetwork_CallbackObject];    
    id callbackAction = [callbackInfo objectForKey:kNetwork_CallbackAction];
    
    NSMutableDictionary *returnInfo = [[NSMutableDictionary alloc] initWithDictionary: returnedData];
    [returnInfo addEntriesFromDictionary: callbackInfo];
    
    [callback callbackForAction: callbackAction
                       withData: returnInfo];
    [returnInfo release];
}

static void callbackAction_handlGetPushNotificationListResponse(NSDictionary *callbackInfo,
                                                                NSDictionary *returnedData,
                                                                id<BoCPressCacheService> _cacheService)
{
    id<BoCPressCallback> callback = [callbackInfo objectForKey:kNetwork_CallbackObject];    
    id callbackAction = [callbackInfo objectForKey:kNetwork_CallbackAction];
        
    NSArray *itemIDs = [returnedData objectForKey:@"itemIDs"];
    NSMutableArray* notifications = [[NSMutableArray alloc] init];
    
    for (id itemIDLooper in itemIDs)
    {
        [notifications addObject: [returnedData objectForKey:itemIDLooper]];
    }
        
    [callback callbackForAction: callbackAction
                       withData: notifications];
    
    [notifications release];
}

static void callbackAction_normalHandleOfCallbackBlock(NSDictionary *callbackInfo,
                                                       NSDictionary *returnedData,
                                                       id<BoCPressCacheService> _cacheManage)
{
    void(^callback)(id data) = [callbackInfo objectForKey:kNetwork_CallbackObject];    
    if (callback)
    {
        callback(returnedData);
    }
}

static void BoCPressSoapDataSource_initPreConfiguration(NSMutableDictionary **_dataSourceConfiguration,
                                                        NSMutableDictionary **_soapCallbackFunctions)
{
    NSMutableDictionary *dataSourceConfiguration = [[NSMutableDictionary alloc] init];
    [dataSourceConfiguration setObject:@"30" 
                                forKey:kViewState_currentTabIdentity];
    *_dataSourceConfiguration = dataSourceConfiguration;
    
    NSMutableDictionary *soapCallbackFunctions = [[NSMutableDictionary alloc] init];

    [soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_listOrderedProducts)
                              forKey: kNetwork_getFeeScheduleResponse];
    
    [soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_getPushConfigResponse)
                              forKey: kNetwork_getPushConfigResponse];
    [soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_normalHandleOfCallback) 
                              forKey: kNetwork_GetHelpInfoResponse];
    [soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_normalHandleOfCallbackBlock) 
                              forKey:kNetwork_SetFeedBackResponse ];

    [soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_normalHandleOfCallback) 
                              forKey:kNetwork_ActivateCodeResponse ];
    [soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_normalHandleOfCallback) 
                              forKey:kNetwork_getChartResponse ];
    [soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_normalHandleOfCallback) 
                              forKey:kNetwork_verifyReceiptResponse ];
    [soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_normalHandleOfCallback) 
                              forKey:kNetwork_createPurchaseOrderResponse ];
    [soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_normalHandleOfCallback) 
                              forKey:kNetwork_requestPurchaseResponse ];
    [soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_normalHandleOfCallback) 
                              forKey:kNetwork_getConfigurationResponse ];
    [soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_normalHandleOfCallback) 
                              forKey: kNetwork_getAdsResponse ];
    [soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_normalHandleOfCallback) 
                              forKey: kNetwork_getSplashAdsResponse ];
    [soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_normalHandleOfCallback)
                              forKey: kNetwork_setPushBadgeResponse];
    
    [soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_normalHandleOfCallbackIncludeCallbackInfo)
                              forKey: kNetwork_setPushConfigResponse];
    
    [soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_handlGetPushNotificationListResponse)
                              forKey: kNetwork_getPushNotificationListResponse];
    
    [soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_normalHandleOfCallbackIncludeCallbackInfo) 
                              forKey: kNetwork_getPushNotificationResponse ];
    
    *_soapCallbackFunctions = soapCallbackFunctions;
    
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    id deadLineOfRemoteNotificationConfiguration = [standardUserDefaults objectForKey: kNetwork_DataSource_DeadLineOfRemoteNotificationConfiguration];
    if (!deadLineOfRemoteNotificationConfiguration)
    {
        [standardUserDefaults setObject: @"month_1"
                                 forKey: kNetwork_DataSource_DeadLineOfRemoteNotificationConfiguration];
    }
}

#pragma mark - database operation

static BOOL writeDatabaseToFixUpdateBug(NSString *databaseFileName)
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    id<SQLDatabase> avatarCacheDatabase = [[SqliteDatabase alloc] initWithFilePathInDocumentDirectoryInIOS:databaseFileName];
    BOOL noException = YES;
    @try 
    {
        id<SQLStatement> storeAvatarStatement = [avatarCacheDatabase prepareStatementForSQL:@"insert or replace into ImageCache(imageID , imageURL, imageTimeStamp) values(?, ?, ?)"];
        
        [storeAvatarStatement setStringParameter:1 withString:@"<>"];
        [storeAvatarStatement setStringParameter:2 withString:@"<>"];
        [storeAvatarStatement setFloatParameter:3 withFloat:[NSDate timeIntervalSinceReferenceDate]];
        [storeAvatarStatement execute];
        
        id<SQLStatement> deleteStatement = [avatarCacheDatabase prepareStatementForSQL:@"delete from ImageCache where imageID=?"];
        [deleteStatement setStringParameter:1 withString:@"<>"];
        [deleteStatement execute];
        
    }
    @catch (NSException *exception) 
    {
        NSLog(@"Exception:%@", exception);
        noException = NO;
    }
    @finally 
    {
        [avatarCacheDatabase release];
        
        [pool release];
        
        return noException;
    }
    
    
}

static void prepareDatabaseFile(NSString *fileName)
{
    NSArray *arrayPaths = NSSearchPathForDirectoriesInDomains(
                                                              NSDocumentDirectory,
                                                              NSUserDomainMask,
                                                              YES);
    
    NSString* fileToPath = [[arrayPaths objectAtIndex:0] stringByAppendingPathComponent:fileName];
    
    NSString* fileFromPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: fileName];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSError *fileCopyerror = nil;
    
    if ([fileManager fileExistsAtPath:fileToPath])
    {
        if(!writeDatabaseToFixUpdateBug(fileToPath))            
        {
            //Write to fix failed, so delete old database files
            //
            
            [fileManager removeItemAtPath:fileToPath error:&fileCopyerror];
            
            if (fileCopyerror) 
            {
                NSLog(@"file copy error is:%@", fileCopyerror);
            }
        }
    }else
    {
        
        [fileManager copyItemAtPath:fileFromPath toPath:fileToPath error:&fileCopyerror];
        
        if (fileCopyerror)
        {
            NSLog(@"file copy error is:%@", fileCopyerror);
        }
    }
    
    
    //    <id>12</id>
    //    <msgActionExtra>17176</msgActionExtra>
    //    <msgActionType>post</msgActionType>
    //    <msgContent></msgContent>
    //    <msgTitle>日本将协助缅甸组建证交所--消息</msgTitle>
    //    <plannedSendDateTime>2012-04-11 10:25:45</plannedSendDateTime>
    //    <pushType>USER</pushType>
    //    <status>DONE</status>
    //    <statusLastUpdate>2012-04-11 10:27:54</statusLastUpdate>
    //    <targetDeviceVersion>["all"]</targetDeviceVersion>
    //    <targetSoftVersion>["all"]</targetSoftVersion>
    //    <targetUserEmail></targetUserEmail>
    //    <targetUserType>["all"]</targetUserType>
    
    @autoreleasepool 
    {
        NSString *sqlString = @"CREATE TABLE if not exists BoCPressRemoteNotification (NotificationID integer PRIMARY KEY UNIQUE,TimeStamp double,MessageTitle text,MessageContent text,PlannedSendDateTime text,PushType text,Status text,StatusLastUpdateDate text,TargetDeviceVersion text,TargetSoftVersion text,TargetUserEmail text,TargetUserType text, Action text,ActionArgument text, HasBeenRead text, DeleteStatus text)";
        id<SQLDatabase> database = [[SqliteDatabase alloc] initWithFilePathInDocumentDirectoryInIOS: fileName];
        id<SQLStatement> createState = [database prepareStatementForSQL: sqlString];
        [createState execute];
        [database release];        
    }
}

static void scheduleImageCache(id<BoCPressConfigurationService> _configurationService)
{
    
    NSString *imageCacheDirectory = [_configurationService queryConfigurationWithTag: kSoapConfiguration_ImageCacheDirectory];
    
    NSArray *filePaths = [imageCacheDirectory allFilePathsUnderSelf];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDictionary *fileAttributes = nil;
    NSError *error = nil;
    for (NSString *filePathLooper in filePaths) 
    {
        fileAttributes = [fileManager attributesOfItemAtPath: filePathLooper
                                                       error: &error];
        if (error) 
        {
            NSLog(@"error:%@", error);
        }else
        {
            NSDate *fileCreateDate = [fileAttributes fileCreationDate];
            if ( fabs([fileCreateDate timeIntervalSinceNow]) > kSecondsCountOfSevenDays)
            {
                [fileManager removeItemAtPath:filePathLooper 
                                        error: &error];
                if (error)
                {
                    NSLog(@"error:%@:", error);
                }
            }
        }
    }
}

#pragma mark - schedule failed receipt

static void BoCPressSoapDataSource_scheduleReceipt(id<BoCPressConfigurationService> _configurationService,
                                                   BoCPressSoapDataSource *dataSource,
                                                   id<BoCPressCallback> callback)
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *transactionReceiptData =  [userDefaults objectForKey:kPurchaseManager_transactionReceipt];
    
    if (transactionReceiptData)
    {
        NSString *transactionReceiptString = [[NSString alloc] initWithData:transactionReceiptData encoding:NSUTF8StringEncoding];
        
        NSString *solidInfoString = [_configurationService queryConfigurationWithTag:kBoCPress_Configuration_SolidInfoString];
        
        NSString *userId = [userDefaults objectForKey:@"userId"];
        NSString *passwd = [userDefaults objectForKey:@"passwd"];
        
        NSString *orderCodeString = [userDefaults objectForKey:kPurchaseManager_OrderCode];
        NSString *productCodeString = [userDefaults objectForKey: kBuyCard_productCode];
        
        solidInfoString = [solidInfoString stringByAppendingString:formatXMLValueAndKey(userId, @"userId")];
        solidInfoString = [solidInfoString stringByAppendingString:formatXMLValueAndKey(passwd, @"passwd")];
        
        appendResolvedStringsToString(solidInfoString, 2);
        
        NSString *templateString = [_configurationService queryConfigurationWithTag:kSoapConfiguration_SoapXMLTemplateString];    
        NSString *argString = formatXMLValueAndKey(transactionReceiptString, @"rsvdStr1");    
        argString = [argString stringByAppendingString:formatXMLValueAndKey(orderCodeString, @"orderCode")];
        argString = [argString stringByAppendingString:formatXMLValueAndKey(productCodeString, @"prodCode")];
        
        NSString *stringToVerifyReceipt = [NSString stringWithFormat:templateString, kNetwork_verifyReceipt, solidInfoString, argString, kNetwork_verifyReceipt];
        
        [transactionReceiptString release];
        
        id callbackAction = kCallbackAction_verifyreceipt;
        
        NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  callback, kNetwork_CallbackObject,
                                  callbackAction, kNetwork_CallbackAction,
                                  kNetwork_verifyReceiptResponse, kNetwork_SoapResponseType,
                                  nil];
        
        [dataSource postRequestString:stringToVerifyReceipt andCallbackInfo:userInfo];
        
        [userInfo release];
    }
    
}

static NSString *BoCPressSoapDataSource_queryReadMessageIDs(void)
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    id<SQLDatabase> messageConfigurationDatabase = [[SqliteDatabase alloc] initWithFilePathInDocumentDirectoryInIOS:kBoCPress_CacheDatabasePath];
    id<SQLStatement> queryStatement = [messageConfigurationDatabase prepareStatementForSQL:@"select messageID from messageConfiguration order by postDate desc limit 20"];
    
    [queryStatement execute];
    id<SQLResultSet> resultSet = [queryStatement currentResultSet];
    [resultSet moveCursorToNextRecord];
    id<SQLRecord> record = [resultSet currentRecord];
    
    NSString *stringOfMessageIDs = [record stringValueNamed: @"messageID"];
    
    while ([resultSet moveCursorToNextRecord])
    {
        record = [resultSet currentRecord];
        stringOfMessageIDs = [stringOfMessageIDs stringByAppendingFormat:@"|%@", [record stringValueNamed: @"messageID"]];
    }
    
    NSString *stringToReturn = nil;
    
    if (stringOfMessageIDs)
    {
        stringToReturn = [[NSString alloc] initWithString: stringOfMessageIDs];
    }
    
    [messageConfigurationDatabase release];
    [pool release];
    
    return [stringToReturn autorelease];
}

@implementation BoCPressSoapDataSource


#pragma mark - init


- (id)init
{
    if ((self = [super init])) 
    {        
        _handler = [[BoCPressSoapDataSourcePrivateHandler alloc] initWithDataSource:self];
        _lastUpdateTimeForCallbackAction = [[NSMutableDictionary alloc] init];

        _supportedServices = [[NSMutableDictionary alloc] init];

        //core services
        //
        _configurationService = [[BoCPressConfigurationService alloc] init];
        [_supportedServices setObject: _configurationService
                               forKey: [_configurationService identity]];
        _userPrivateInfoService = [[BoCPressUserInfoService alloc] init];
        [_supportedServices setObject: _userPrivateInfoService
                               forKey: [_userPrivateInfoService identity]
         ];
        _networkService = [[BoCPressNetworkService alloc] init];
        [_supportedServices setObject: _networkService
                               forKey: [_networkService identity]];
        
        _cacheService = [[BoCPressCacheService alloc] init];
        [_supportedServices setObject: _cacheService
                               forKey: [_cacheService identity]];
        
        _requestFormatService = [[BoCPressRequestStringFormatService alloc] initWithUserInfoService: _userPrivateInfoService
                                                                               configurationService: _configurationService];
        [_supportedServices setObject: _requestFormatService
                               forKey: [_requestFormatService identity]];
        
        BoCPressSoapDataSource_initPreConfiguration(&_dataSourceConfiguration, &_soapCallbackFunctions);
        BoCPressSoapDataSource_scheduleReceipt(_configurationService, self, _handler);
        
        prepareDatabaseFile(kBoCPress_CacheDatabasePath);      
        
        _alertView = [[BoCPressAlertView alloc] initWithTitle: @"提示"
                                                      message: nil
                                                     delegate: nil
                                            cancelButtonTitle: @"确定"
                                            otherButtonTitles: @"取消", nil];
        
        //application service
        //
        _quoteService = [[BoCPressQuoteService alloc] initWithNetworkService: _networkService
                                                                cacheService: _cacheService
                                                        configurationService: _configurationService
                                                        requestFormatService: _requestFormatService];
        [_supportedServices setObject: _quoteService
                               forKey: [_quoteService identity]];
        
        _mediaService = [[BoCPressMediaService alloc] initWithNetworkService: _networkService
                                                                cacheService: _cacheService
                                                        configurationService: _configurationService
                                                        requestFormatService: _requestFormatService];
        [_supportedServices setObject: _mediaService
                               forKey: [_mediaService identity]];
        
        _newsService = [[BoCPressNewsService alloc] initWithNetworkService: _networkService
                                                              cacheService: _cacheService
                                                      configurationService: _configurationService
                                                      requestFormatService: _requestFormatService];
        
        [_supportedServices setObject: _newsService
                               forKey: [_newsService identity]];
        
        _criticService = [[BoCPressCriticService alloc] initWithNetworkService: _networkService
                                                                  cacheService: _cacheService
                                                          configurationService: _configurationService
                                                          requestFormatService: _requestFormatService];
        [_supportedServices setObject: _criticService
                               forKey: [_criticService identity]];
        
        _purchaseService = [[BoCPressPurchaseService alloc] init];

        _accountService = [[BoCPressAccountService alloc] initWithNetworkService: _networkService
                                                                    cacheService: _cacheService
                                                            configurationService: _configurationService
                                                            requestFormatService: _requestFormatService];
        [_supportedServices setObject: _accountService
                               forKey: [_accountService identity]];
    }
    return self;
}

- (void) dealloc
{
    [_dataSourceConfiguration release];
    [_lastUpdateTimeForCallbackAction release];
    
    [_cacheService release];
    
    [_configurationService release];
    
    [_networkService release];
    
    [_handler release];
    
    [_storedCallbackInfo release];
    [_purchaseService release];
    [_soapCallbackFunctions release];
    [_alertView release];
    
    [_requestFormatService release];
    [_quoteService release];
    [_mediaService release];
    [_newsService release];
    [_criticService release];
    [_accountService release];
    
    [_supportedServices release];
    
    [super dealloc];
}

- (id)serviceByIdentity: (id)identity
{
    return [_supportedServices objectForKey: identity];
}

#pragma mark - generate request Soap strings

- (NSString *)getBaseStringWithRequireType: (NSString *)requireType 
                         andArgumentString: (NSString *)argString
{
    return [_requestFormatService requestStringWithRequireType: requireType
                                             andArgumentString: argString];
}

- (NSString *)getConfigurationRequestStringWithReadMessageIDs: (NSString *)readMessageIDs
{
    NSString *documentsDirectory = [_configurationService queryConfigurationWithTag:kSoapConfiguration_ApplicationDocumentDirectory];
    NSString *versionFilePath = [documentsDirectory stringByAppendingPathComponent:kSoapConfiguration_ApplicationVersionFile];    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *argString = nil;
    
    
    if ([fileManager fileExistsAtPath:versionFilePath])
    {
        argString = formatXMLValueAndKey(@"visit", @"actionType");
    }else
    {
        argString = formatXMLValueAndKey(@"install", @"actionType");
    }
    
    NSString *bundleVersionString = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    
    if ([fileManager fileExistsAtPath:versionFilePath])
    {
        NSString *storedBundleVersion = [NSString stringWithContentsOfFile:versionFilePath 
                                                                  encoding:NSUTF8StringEncoding 
                                                                     error:nil];
        
        if ([storedBundleVersion isEqualToString:bundleVersionString])
        {
            //just lantch
            //
        }else
        {
            //install
            //
            [bundleVersionString writeToFile: versionFilePath 
                                  atomically: YES
                                    encoding: NSUTF8StringEncoding 
                                       error: nil];
        }
    }else
    {
        //install
        //
        [bundleVersionString writeToFile: versionFilePath 
                              atomically: YES
                                encoding: NSUTF8StringEncoding 
                                   error: nil];
    }
    
    
    
    argString = [argString stringByAppendingString: formatXMLValueAndKey(readMessageIDs, @"rsvdStr1")];
    
    return [self getBaseStringWithRequireType: kNetwork_getConfiguration 
                            andArgumentString: argString];
}

#pragma mark - Application configurations

- (id<BoCPressConfigurationService>)configuration
{
    return _configurationService;;
}


- (NSTimeInterval) lastUpdateTimeIntervalWithColumnID: (id) columnID
{
    NSDate *lastUpdateTime = [_lastUpdateTimeForCallbackAction objectForKey:columnID];
    NSDate * currentTime = [NSDate date];
    
    NSTimeInterval updateTimeInterval = [currentTime timeIntervalSinceDate:lastUpdateTime];
    return updateTimeInterval;
    
}

- (id)currentVersionInfo
{
    id currentVersionID = [_configurationService queryConfigurationWithTag: kBoCPress_Configuration_SoftwareVersion];
    return [_configurationService queryConfigurationWithTag:currentVersionID];
}

#pragma mark - media service

- (void)listOrderedMediaTypesWithCallback: (id<BoCPressCallback>)callback
{
    [_mediaService listOrderedMediaTypesWithCallback: callback];
}


- (void)listOrderedMediaOfType: (id<BoCPressMediaType>)type 
                     rangeFrom: (NSUInteger)rangeFrom
                       rangeTo: (NSUInteger)rangeTo
                  withCallback: (id<BoCPressCallback>)callback
{
    [_mediaService listOrderedMediaOfType: type
                                rangeFrom: rangeFrom
                                  rangeTo: rangeTo
                             withCallback: callback];
}

- (void)listOrderedMediaTagsInType: (id<BoCPressMediaType>)type
                      withCallback: (id<BoCPressCallback>)callback
{
    [_mediaService listOrderedMediaTagsInType: type
                                 withCallback: callback];
}


- (void)contentOfMedia: (id<BoCPressMedia>)media
             mediaType: (id<BoCPressMediaType>)mediaType 
          withCallback: (id<BoCPressCallback>)callback
{
    [_mediaService contentOfMedia: media
                        mediaType: mediaType
                     withCallback: callback];
}


- (void)listOrderedMediaWithTag: (BoCPressMediaTagColumn* )tag
                      rangeFrom: (NSUInteger)rangeFrom
                        rangeTo: (NSUInteger)rangeTo
                       callback: (id<BoCPressCallback>)callback
{
    
     [_mediaService listOrderedMediaWithTag: tag
                                  rangeFrom: rangeFrom
                                    rangeTo: rangeTo
                                   callback: callback];
}

#pragma mark - BroadCast content

- (void)listOrderedBroadCastForcastWithCallback: (id<BoCPressCallback>)callback
{
    [_mediaService listOrderedBroadCastForcastWithCallback: callback];
}

- (void)contentOfBroadCast: (id<BoCPressMedia>) media
              withCallback: (id<BoCPressCallback>)callback
{
    [_mediaService contentOfBroadCast: media
                         withCallback: callback];
}

- (void)currentBroadCastWithCallback: (id<BoCPressCallback>) callback
{
    [_mediaService currentBroadCastWithCallback: callback];
}

#pragma mark - News content

- ( void)listOrderedNewsTagsWithCallback: (id<BoCPressCallback>) callback
{
    [_newsService listOrderedNewsTagsWithCallback: callback];
}

- (void)listOrderedNewsWithTag: (id<BoCPressNewsTag>)tag 
                     rangeFrom: (NSUInteger)rangeFrom
                       rangeTo: (NSUInteger)rangeTo
                      callback: (id<BoCPressCallback>)callback
{
    [_newsService listOrderedNewsWithTag: tag
                               rangeFrom: rangeFrom
                                 rangeTo: rangeTo
                                callback: callback];
}


- (void)contentOfNews: (id<BoCPressNews>)news 
                 info: (id)info
         withCallback: (id<BoCPressCallback>)callback

{
    [_newsService contentOfNews: news
                           info: info
                   withCallback: callback];
}


- (void)submitFeedback: (id<BoCPressFeedback>)feedback 
                toNews: (id<BoCPressNews>)news 
          withCallback: (id<BoCPressCallback>)callback
{
    [_newsService submitFeedback: feedback
                          toNews: news
                    withCallback: callback];
}


#pragma mark - Securities and their quotes


- (id)lastUpdateSecuritiesTime
{
    NSString *lastUpdateSecuritiesTimeString = [_lastUpdateTimeForCallbackAction objectForKey:kBoCPress_Global_LastUpdateSecuritiesTime];
    
    if (lastUpdateSecuritiesTimeString)
    {
        return lastUpdateSecuritiesTimeString;
    }else
    {
        //this will be converted to max NSUInteger
        return [NSDate date];
    }
}

- (void)listOrderedLongTermSecurityInFamily: (id<BoCPressSecurityFamily>)family 
                               withCallback: (id<BoCPressCallback>)callback
{
    [_quoteService listOrderedLongTermSecurityInFamily: family
                                          withCallback: callback];
}

- (void)listOrderedSecurityInFamily: (id<BoCPressSecurityFamily>)family 
                       withCallback: (id<BoCPressCallback>)callback
                        triggerFlag: (NSString *)flag
{
    [_quoteService listOrderedSecurityInFamily: family
                                  withCallback: callback
                                   triggerFlag: flag];
}

- (void)listOrderedSecurityFamiliesWithCallback: (id<BoCPressCallback>)callback
{
    [_quoteService listOrderedSecurityFamiliesWithCallback: callback];
}

- (void)contentOfQuote: (id<BoCPressSecurity>)security 
          inSecurities: (NSArray *)securities 
          withCallback: (id<BoCPressCallback>)callback
{
    [_quoteService contentOfQuote: security
                     inSecurities: securities
                     withCallback: callback
                      triggerFlag: kString_Global_UpdateTriggerFlagByUser];
}

- (void)contentOfQuoteByTimer: (id<BoCPressSecurity>)security
                 inSecurities: (NSArray *)securities 
                 withCallback: (id<BoCPressCallback>)callback
{
    [_quoteService contentOfQuote: security
                     inSecurities: securities
                     withCallback: callback
                      triggerFlag: kString_Global_UpdateTriggerFlagByTimer];
}

- (void)getChartImage:(id<BoCPressChartImageConfiguration>)chartImageConfiguration
         withCallback:(id<BoCPressCallback>)callback
{
    [_quoteService getChartImage: chartImageConfiguration
                    withCallback: callback
                     triggerFlag: kString_Global_UpdateTriggerFlagByUser];
}

- (void)getChartImage: (id<BoCPressChartImageConfiguration>)chartImageConfiguration
  withCallbackByTimer: (id<BoCPressCallback>)callback
{
    [_quoteService getChartImage: chartImageConfiguration
                    withCallback: callback
                     triggerFlag: kString_Global_UpdateTriggerFlagByTimer];
}

- (void)listOrderedRelatedCriticPostsOfSecurity: (id<BoCPressSecurity>)security 
                                   withCallback: (id<BoCPressCallback>)callback
{
    [_quoteService listOrderedRelatedCriticPostsOfSecurity: security
                                              withCallback: callback];
}

- (void)listOrderedRelatedNewsOfSecurity: (id<BoCPressSecurity>)security 
                            withCallback: (id<BoCPressCallback>)callback 
{
    [_quoteService listOrderedRelatedNewsOfSecurity: security
                                       withCallback: callback];
}

- (void)storeQuoteContentPageChartConfiguration: (id)configuration 
{
    [_quoteService storeQuoteContentPageChartConfiguration: configuration];
}

- (void)downloadChartImageWith:(id)info
                      callback:(id<BoCPressCallback>)callback
{
    [_quoteService downloadChartImageWith: info
                                 callback: callback];
}

- (id)quoteContentPageChartConfiguration
{
    return [_quoteService quoteContentPageChartConfiguration];
}

#pragma mark - Critics and their posts

- (void)getCommentSummaryContentOfNews: (id<BoCPressNews>)news
                          withCallback:(id<BoCPressCallback>)callback
{
    [(BoCPressMetaService *)_criticService getCommentSummaryContentOfNews: news
                                                             withCallback: callback];
}

- (void)listOrderedCriticColumnsWithCallback: (id<BoCPressCallback>)callback
{
    [_criticService listOrderedCriticColumnsWithCallback: callback];
}

- (void)listOrderedCriticsRangeFrom: (NSUInteger)rangeFrom
                            rangeTo: (NSUInteger)rangeTo 
                       withCallback: (id<BoCPressCallback>)callback
{
    [_criticService listOrderedCriticsRangeFrom: rangeFrom
                                        rangeTo: rangeTo
                                   withCallback: callback];
}


- (void)listLatestCriticPostRangeFrom: (NSUInteger)rangeFrom
                              rangeTo: (NSUInteger)rangeTo
                         withCallback: (id<BoCPressCallback>)callback
{
    [_criticService listLatestCriticPostRangeFrom: rangeFrom
                                          rangeTo: rangeTo
                                     withCallback: callback];
}

- (void)listOrderedFavoriteCriticsRangeFrom: (NSUInteger)rangeFrom
                                    rangeTo: (NSUInteger)rangeTo
                               withCallback: (id<BoCPressCallback>)callback
{
    [_criticService listOrderedFavoriteCriticsRangeFrom: rangeFrom
                                                rangeTo: rangeTo
                                           withCallback: callback];
}

- (void)listOrderedPostsFromCritic: (id<BoCPressAuthor>)critic 
                         rangeFrom: (NSUInteger)rangeFrom
                           rangeTo: (NSUInteger)rangeTo 
                      withCallback: (id<BoCPressCallback>)callback
{
    [_criticService listOrderedPostsFromCritic: critic
                                     rangeFrom: rangeFrom
                                       rangeTo: rangeTo
                                  withCallback: callback];
}

- (void)contentOfCritic: (id<BoCPressAuthor>)critic
               userInfo: (id)userInfo
           withCallback: (id<BoCPressCallback>)callback
{
    [_criticService contentOfCritic: critic
                           userInfo: userInfo
                       withCallback: callback];
}

- (void)contentOfCriticPost: (id<BoCPressNews>)criticPost 
                       info: (id)info
               withCallback: (id<BoCPressCallback>)callback
{
    [_criticService contentOfCriticPost: criticPost
                                   info: info
                           withCallback: callback];
}

#pragma mark - login
- (void)loginWithUserName:(NSString *)userName
                 password: (NSString *)password
                 callback:(id<BoCPressCallback>)callback
{
   [_accountService loginWithUserName: userName
                                     password: password
                                     callback: callback];
}

- (void)wantToLogoutCurrentUserWithCallback: (id<BoCPressCallback>) callback
{
    [_accountService wantToLogoutCurrentUserWithCallback: callback];
}

- (void)didLogoutCurrentUser
{
    [_userPrivateInfoService clearUserInfo];
}

- (void)getUserInfoFromServerWithInfo: (NSDictionary *)info 
                             callback: (id<BoCPressCallback>)callback
{
    [_accountService getUserInfoFromServerWithInfo: info
                                          callback: callback];
}

#pragma mark - register

- (void)storeUserInfo:(id)userInfo
{
    [_userPrivateInfoService storeUserInfo:userInfo];
    
}

- (void)registerNormalAccountWithEmail:(NSString *)email
                              password:(NSString *)password 
                              callback:(id<BoCPressCallback>)callback
{
    [_accountService registerNormalAccountWithEmail: email
                                           password: password
                                           callback: callback];  
}

- (void)getProtocolContentWithCallback:(id<BoCPressCallback>)callback
{
    [_accountService getProtocolContentWithCallback: callback];
}

#pragma mark -  find password

- (void)wantToResetPasswordWithEmail:(NSString *)email 
                            callback:(id<BoCPressCallback>)callback
{
    [_accountService wantToResetPasswordWithEmail: email
                                                 callback: callback];
}

- (void)didResetPasswordWithCallback:(id<BoCPressCallback>)callback
{
    [_userPrivateInfoService changeUserPasswordToNewPassword: nil];
}

#pragma mark - activate
- (NSString *)getActivateStringWithCode: (NSString *)code 
{
    NSString *solidInfoString = [_configurationService queryConfigurationWithTag:kBoCPress_Configuration_SolidInfoString];
    
    solidInfoString = [solidInfoString stringByAppendingString:formatXMLValueAndKey([_userPrivateInfoService queryUserID], @"userId")];
    solidInfoString = [solidInfoString stringByAppendingString:formatXMLValueAndKey([_userPrivateInfoService queryPassword], @"passwd")];
    solidInfoString = [solidInfoString stringByAppendingString:formatXMLValueAndKey(code, @"rsvd2")];
    
    appendResolvedStringsToString(solidInfoString, 3);
    
    NSString *templateString = [_configurationService queryConfigurationWithTag:kSoapConfiguration_SoapXMLTemplateString];    
    NSString *argString = @" ";
    
    return [NSString stringWithFormat:templateString, kNetwork_ActivateCodeRequest , solidInfoString, argString, kNetwork_ActivateCodeRequest];
    
}

- (void)wantToActivateCode:(NSString *)code
              withCallback:(id<BoCPressCallback>)callback
{
    NSString *stringToActivateCode = [self getActivateStringWithCode:code];
    id callbackAction = kCallbackAction_activateCode;
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  callback, kNetwork_CallbackObject, 
                                  callbackAction, kNetwork_CallbackAction,
                                  kNetwork_ActivateCodeResponse, kNetwork_SoapResponseType,  
                                  nil];
    
    [self postRequestString:stringToActivateCode andCallbackInfo:callbackInfo];
    [callbackInfo release];
}

- (void)getPromptMessageWithArgument: (NSString *)argument 
                            callback: (id<BoCPressCallback>)callback
{
    [_accountService getPromptMessageWithArgument: argument
                                                 callback: callback];
}

#pragma mark - change password

- (void)changeOldPassword:(NSString *)oldPassword 
            toNewPassword:(NSString *)newPassword
                 callback:(id<BoCPressCallback>)callback
{
    [_accountService changeOldPassword: oldPassword
                                 toNewPassword: newPassword
                                      callback: callback];
}

- (void)didChangedToNewPassword: (NSString *)newPassword
                       callback: (id<BoCPressCallback>)callback
{
    [_userPrivateInfoService changeUserPasswordToNewPassword: newPassword];
}

- (BOOL)getUserLoginStatus
{
    if([_userPrivateInfoService queryUserID])
    {
        return YES;
    }else
    {
        return NO;
    }
    
}

- (id)getUserInfo
{
    return [_userPrivateInfoService userInfo];
}

#pragma mark - remote notification

- (NSString *)stringToGetRemoteNotificationConfiguration
{
    NSString *deviceToken = [[NSUserDefaults standardUserDefaults] objectForKey: kBoCPress_Global_DeviceToken];
    
    NSString *arg = formatXMLValueAndKey(deviceToken, @"rsvdStr1");
    return [self getBaseStringWithRequireType: kNetwork_getPushConfigRequest
                            andArgumentString: arg];
}

- (void)getRemoteNotificationConfigurationWithCallback: (id<BoCPressCallback>)callback
{
    NSString *callbackAction = kCallbackAction_getRemoteNotificationConfigurationWithCallback;
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys: 
                                  callback, kNetwork_CallbackObject,
                                  callbackAction, kNetwork_CallbackAction,
                                  nil];
    [self postRequestString: [self stringToGetRemoteNotificationConfiguration]
            andCallbackInfo: callbackInfo];
    [callbackInfo release];
}
#pragma mark - purchase

- (void)wantToPurchaseProduct: (id<BoCPressProduct>)product 
                 withCallback: (id<BoCPressCallback>)callback
{
    [_purchaseService  wantToPurchaseProduct:product withCallback:callback];
}

- (void)cancelAllPurchase
{
    [_purchaseService cancelAllPurchase];
}
- (NSString *)getListOrderedProductRequestString
{
    NSString *solidInfoString = [_configurationService queryConfigurationWithTag:kBoCPress_Configuration_SolidInfoString];
    
    solidInfoString = [solidInfoString stringByAppendingString:formatXMLValueAndKey([_userPrivateInfoService queryUserID], @"userId")];
    solidInfoString = [solidInfoString stringByAppendingString:formatXMLValueAndKey([_userPrivateInfoService queryPassword], @"passwd")];
    
    appendResolvedStringsToString(solidInfoString, 2);
    
    NSString *templateString = [_configurationService queryConfigurationWithTag:kSoapConfiguration_SoapXMLTemplateString];    
    NSString *argString = @" ";    
    return [NSString stringWithFormat:templateString, kNetwork_getFeeSchedule, solidInfoString, argString, kNetwork_getFeeSchedule];
}

- (void)listOrderedProductIDsRangeFrom: (NSUInteger)rangeFrom
                               rangeTo: (NSUInteger)rangeTo
                              callback: (id<BoCPressCallback>) callback
{
    NSString *stringToListOrderedProduct = [self getListOrderedProductRequestString];
    id callbackAction = kCallbackAction_listOrderedProductIDs;
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                              [NSNumber numberWithInteger:rangeFrom], kNetwork_RangeFrom, 
                              [NSNumber numberWithInteger: rangeTo], kNetwork_RangeTo,
                              callback, kNetwork_CallbackObject,
                              callbackAction, kNetwork_CallbackAction,
                              kNetwork_getFeeScheduleResponse, kNetwork_SoapResponseType,
                              nil];
    
    [self postRequestString:stringToListOrderedProduct andCallbackInfo:userInfo];
    
    [userInfo release];
}

- (NSString *)getVerifyReceiptRequestStringWithTransactionReceipt: (NSString *)transactionReceipt
                                              purchaseOrderString: (NSString *)purchaseOrderString
                                                productCodeString: (NSString *)productCodeString
{
    NSString *solidInfoString = [_configurationService queryConfigurationWithTag:kBoCPress_Configuration_SolidInfoString];
    
    solidInfoString = [solidInfoString stringByAppendingString:formatXMLValueAndKey([_userPrivateInfoService queryUserID], @"userId")];
    solidInfoString = [solidInfoString stringByAppendingString:formatXMLValueAndKey([_userPrivateInfoService queryPassword], @"passwd")];
    
    appendResolvedStringsToString(solidInfoString, 2);
    
    NSString *templateString = [_configurationService queryConfigurationWithTag:kSoapConfiguration_SoapXMLTemplateString];    
    NSString *argString = formatXMLValueAndKey(transactionReceipt, @"rsvdStr1");    
    argString = [argString stringByAppendingString:formatXMLValueAndKey(purchaseOrderString, @"orderCode")];
    argString = [argString stringByAppendingString:formatXMLValueAndKey(productCodeString, @"prodCode")];
    
    return [NSString stringWithFormat:templateString, kNetwork_verifyReceipt, solidInfoString, argString, kNetwork_verifyReceipt];
}

- (void)verifyReceiptWithInfo: (NSDictionary *)transactionInfo
                     callback: (id<BoCPressCallback>)callback
{
    NSString *transactionReceipt = [transactionInfo objectForKey:kPurchaseManager_transactionReceipt];
    NSString *purchaseOrderString = [transactionInfo objectForKey:kPurchaseManager_OrderCode];
    NSString *productCodeString = [transactionInfo objectForKey:kBuyCard_productCode];
    
    NSString *stringToVerifyReceipt = [self getVerifyReceiptRequestStringWithTransactionReceipt:transactionReceipt 
                                                                            purchaseOrderString: purchaseOrderString
                                                                              productCodeString: productCodeString];
    id callbackAction = kCallbackAction_verifyreceipt;
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                              callback, kNetwork_CallbackObject,
                              callbackAction, kNetwork_CallbackAction,
                              kNetwork_verifyReceiptResponse, kNetwork_SoapResponseType,
                              nil];
    
    [self postRequestString:stringToVerifyReceipt andCallbackInfo:userInfo];
    
    [userInfo release];
}

- (void)didFinishedVerifyReceipt:(id)data
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults removeObjectForKey:@"userId"];
    [userDefaults removeObjectForKey:@"passwd"];
    [userDefaults removeObjectForKey:kPurchaseManager_transactionReceipt];
    [userDefaults removeObjectForKey:kPurchaseManager_OrderCode];
    [userDefaults removeObjectForKey:kBuyCard_productCode];
    
    [_purchaseService didFinishedVerifyReceipt:data];
}

- (void)listOrderedContentInfoOfProducts: (NSArray*)productIDs 
                                callback: (id<BoCPressCallback>)callback
{
    id callbackAction = kCallbackAction_listOrderedProductContentInfo;
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  callback, kNetwork_CallbackObject,
                                  callbackAction, kNetwork_CallbackAction,
                                  nil];
    
    [_purchaseService listOrderedContentInfoOfProducts:productIDs callbackInfo:callbackInfo];
    
    [callbackInfo release];
}

- (NSString *)stringToCreatePurchaseOrder
{
    return [self getBaseStringWithRequireType:kNetwork_createPurchaseOrderRequest andArgumentString:@" "];
}
- (void)createPurchaseOrderWithCallback:(id<BoCPressCallback>)callback
{
    NSString *stringToCreatePurchaseOrder = [self stringToCreatePurchaseOrder];
    id callbackAction = kCallbackAction_createPurchaseOrder;
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  callback, kNetwork_CallbackObject,
                                  callbackAction, kNetwork_CallbackAction,
                                  kNetwork_createPurchaseOrderResponse, kNetwork_SoapResponseType,
                                  nil];
    [self postRequestString:stringToCreatePurchaseOrder andCallbackInfo:callbackInfo];
    [callbackInfo release];
}
- (NSString *)stringToRequestPurchaseWithOrderCode: (NSString *)orderCode
                                       productCode: (NSString *)productCode
{
    NSString *argString = formatXMLValueAndKey(orderCode, @"orderCode");
    argString = [argString stringByAppendingString:formatXMLValueAndKey(productCode, @"prodCode")];
    
    return [self getBaseStringWithRequireType:kNetwork_requestPurchase andArgumentString:argString];
}

- (void)requestPurchaseWithOrderCode: (NSString *)orderCode 
                         productCode: (NSString *)productCode 
                            callback: (id<BoCPressCallback>)callback
{
    NSString *stringToRequestPurchase = [self stringToRequestPurchaseWithOrderCode:orderCode 
                                                                       productCode:productCode];
    
    id callbackAction = kCallbackAction_requestPurchase;
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  callback, kNetwork_CallbackObject,
                                  callbackAction, kNetwork_CallbackAction,
                                  kNetwork_requestPurchaseResponse, kNetwork_SoapResponseType,
                                  nil];
    [self postRequestString:stringToRequestPurchase andCallbackInfo:callbackInfo];
    [callbackInfo release];
}

- (void)updatePurchaseInfo:(id)data
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    NSString *userId = [_userPrivateInfoService queryUserID];
    NSString *passwd = [_userPrivateInfoService queryPassword];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSString *orderCode = [data objectForKey: kPurchaseManager_OrderCode];
    if (orderCode)
    {        
        [userDefaults setObject:orderCode forKey:kPurchaseManager_OrderCode];
    }
    NSString *purchaseCode = [data objectForKey: kBuyCard_productCode];
    if (purchaseCode)
    {
        [userDefaults setObject:purchaseCode forKey: kBuyCard_productCode];         
    }
    
    [userDefaults setObject:userId forKey:@"userId"];
    [userDefaults setObject:passwd forKey:@"passwd"];
    
}

#pragma mark - remote notification configuration

- (void)storeRemoteNotificationConfiguration:(NSDictionary *)remoteNotificationConfiguration
{
    if (![_remoteNotificationConfiguration isEqualToDictionary: remoteNotificationConfiguration])
    {
        [_remoteNotificationConfiguration release];
        _remoteNotificationConfiguration = [[NSMutableDictionary alloc] initWithDictionary: remoteNotificationConfiguration];
        
        NSArray *timeConfig = [_remoteNotificationConfiguration objectForKey: @"keep_days"];
        for (id<BoCPressEntry> entryLooper in timeConfig)
        {
            if ([entryLooper isChosen])
            {
                NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
                [standardUserDefaults setObject: [entryLooper name]
                                         forKey: kNetwork_DataSource_DeadLineOfRemoteNotificationConfiguration];
                [standardUserDefaults synchronize];
                    
                break;
            }
        }

    }
}

- (NSDictionary *)loadRemoteNotificationConfiguration
{
    return _remoteNotificationConfiguration;
}

- (void)setColumn: (id)tag notificationEnable: (BOOL)enable
{
    for (NSArray *valuLooper in [_remoteNotificationConfiguration allValues])
    {
        
        if ([valuLooper isKindOfClass: [NSArray class]])
        {
            for (id<BoCPressEntry> entryLooper in valuLooper)
            {
                if ([entryLooper conformsToProtocol: @protocol(BoCPressEntry)]
                    && [[entryLooper identity] isEqual: tag])
                {
                    [entryLooper setIsChosen: enable];
                    return;
                }
            }
        }
    }
}

- (void)restoreDeadLineOfConfigurationWithValue: (id)oldValue
{
    [self setRemoteNotificationDeadLine: oldValue
                           withCallback: nil];
}

- (void)setRemoteNotificationDeadLine: (id)deadLine
                         withCallback: (id<BoCPressCallback>)callback
{    
    NSArray *timeConfig = [_remoteNotificationConfiguration objectForKey: @"keep_days"];
    for (id<BoCPressEntry> entryLooper in timeConfig)
    {
        if ([[entryLooper name] isEqualToString: deadLine])
        {
            [entryLooper setIsChosen: YES];
            NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
            [standardUserDefaults setObject: deadLine
                                     forKey: kNetwork_DataSource_DeadLineOfRemoteNotificationConfiguration];
            [standardUserDefaults synchronize];
            
        }else
        {
            [entryLooper setIsChosen: NO];
        }
    }
}

- (NSUInteger)numberOfNewRemoteNotification
{

    NSUInteger newCount = 0; 
    @autoreleasepool 
    {
        
        id<SQLDatabase> queryDatabase = [[SqliteDatabase alloc] initWithFilePathInDocumentDirectoryInIOS: kBoCPress_CacheDatabasePath];

        NSString *sqlString = @"select count(*) as count from BoCPressRemoteNotification where DeleteStatus<>? and HasBeenRead<>?";
        
        id<SQLStatement> queryStatment = [queryDatabase prepareStatementForSQL: sqlString];
        [queryStatment setStringParameter: 1
                               withString: @"YES"];
        [queryStatment setStringParameter: 2
                               withString: @"YES"];
        [queryStatment execute];
        
        id<SQLResultSet> resultSet = [queryStatment currentResultSet];
        [resultSet moveCursorToNextRecord];
        id<SQLRecord> record = [resultSet currentRecord];
        
        newCount = [record integerValueNamed: @"count"];

        [queryDatabase release];
    }
    
    return newCount;
}

- (NSString *)stringToSetPushRemoteNotificationConfiguration
{
    NSString *deviceToken = [[NSUserDefaults standardUserDefaults] objectForKey: kBoCPress_Global_DeviceToken];
    
    NSString *arg = formatXMLValueAndKey(deviceToken, @"rsvdStr1");
    return [self getBaseStringWithRequireType: kNetwork_setPushConfigRequest
                            andArgumentString: arg];
}

- (void)didReceiveDeviceToken: (NSData *)deviceToken 
                 withCallback: (id<BoCPressCallback>)callback
{
    NSString *tokenString = [NSString stringWithFormat: @"%@", deviceToken];
    tokenString = [tokenString stringByReplacingOccurrencesOfString: @" " withString: @""];
    tokenString = [tokenString stringByReplacingOccurrencesOfString: @"<" withString: @""];
    tokenString = [tokenString stringByReplacingOccurrencesOfString: @">" withString: @""];
    
    [[NSUserDefaults standardUserDefaults] setObject: tokenString
                                              forKey: kBoCPress_Global_DeviceToken];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys: 
                                  callback, kNetwork_CallbackObject,
                                  kCallbackAction_uploadRemoteNotificationConfiguration, kNetwork_CallbackAction,
                                  nil];
    
    [self postRequestString: [self stringToSetPushRemoteNotificationConfiguration]
            andCallbackInfo: callbackInfo];
    
    [callbackInfo release];
}


- (NSString *)stringToUploadRemoteNotificationConfiguration
{
    NSString *deviceToken = [[NSUserDefaults standardUserDefaults] objectForKey: kBoCPress_Global_DeviceToken];
    NSDictionary *remoteNotificationConfiguration = _remoteNotificationConfiguration;
    
    NSArray *columnTags = [remoteNotificationConfiguration objectForKey: kType_Global_NSArray];
    
    NSString *xmlString = @"<![CDATA[";
    
    for (NSString* keyLooper in columnTags)
    {
        NSArray *configLooper = [remoteNotificationConfiguration objectForKey: keyLooper];
        xmlString = [xmlString stringByAppendingFormat: @"<%@>", keyLooper];
        
        if ([keyLooper isEqualToString: @"keep_days"])
        {
            for (id<BoCPressEntry> entry in configLooper)
            {
                xmlString = [xmlString stringByAppendingString: formatXMLValueAndKey([entry isChosen] ? @"1" : @"0", [entry internalName])];
            }
            
        }else 
        {
            
            for (id<BoCPressEntry> entry in configLooper)
            {
                xmlString = [xmlString stringByAppendingFormat: @"<id_%@>%@</id_%@>", [entry internalName], [entry isChosen] ? @"1" : @"0", [entry internalName]];
            }
        }
        xmlString = [xmlString stringByAppendingFormat:  @"</%@>", keyLooper];
    }
    
    xmlString = [xmlString stringByAppendingString: @"]]>"];
    
    NSString *arg = formatXMLValueAndKey(deviceToken, @"rsvdStr1");
    arg = [arg stringByAppendingString: formatXMLValueAndKey(xmlString, @"rsvdStr2")];
    
    return [self getBaseStringWithRequireType: kNetwork_setPushConfigRequest andArgumentString: arg];
}

- (void)uploadRemoteNotificationConfigurationOfColumn: (id)column
                                               enable: (BOOL)enable
                                         withCallback: (id<BoCPressCallback>)callback
{
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  callback, kNetwork_CallbackObject,
                                  kCallbackAction_uploadRemoteNotificationConfiguration, kNetwork_CallbackAction,
                                  column, kNetwork_CallbackArgument,
                                  [NSNumber numberWithBool: enable], kRemoteNotificationPage_ColumnEnableStatus,
                                  nil];
    
    [self postRequestString: [self stringToUploadRemoteNotificationConfiguration]
            andCallbackInfo: callbackInfo];
    
    [callbackInfo release];
}

- (void)uploadRemoteNotificationConfigurationOfDeadline: (id)oldDeadLine
                                            newDeadLine: (id)newDeadLine
                                           withCallback: (id<BoCPressCallback>)callback
{
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  callback, kNetwork_CallbackObject,
                                  kCallbackAction_uploadRemoteNotificationConfigurationDeadLine, kNetwork_CallbackAction,
                                  oldDeadLine, kNetwork_CallbackArgument,
                                  newDeadLine, kObject_RemoteNotification_NewDeadLine,
                                  nil];
    
    [self postRequestString: [self stringToUploadRemoteNotificationConfiguration]
            andCallbackInfo: callbackInfo];
    
    [callbackInfo release];
}
#pragma mark - Get gui.xml

- (void)stepToRefreshCurrentPage
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    id callback = [_storedCallbackInfo objectForKey:kNetwork_CallbackObject];
    id callbackAction = [_storedCallbackInfo objectForKey:kNetwork_CallbackAction];
    id queryTag = [_storedCallbackInfo objectForKey:kConfiguration_QueryTag];
    
    if (callback)
    {
        id result = [_configurationService queryConfigurationWithTag:queryTag];
        
        if (result)
        {
            [callback callbackForAction:callbackAction withData:result];
        }
    }else
    {
        [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_wantToUpdateCurrentPage 
                                                            object: self];
    }
    
}

- (void)refechGUIConfigurationWithCallbackInfo:(id)callbackInfo
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    BoCPressSoapDataSource_scheduleReceipt(_configurationService, self, _handler);    
    
    /*
    scheduleImageCache(_configurationService);

    [self stepToRefreshCurrentPage];
    */
    //comment here for remote notification
    //
    
    
    NSString *readMessageIDs = BoCPressSoapDataSource_queryReadMessageIDs();
    NSString *stringToGetConfiguration = [self getConfigurationRequestStringWithReadMessageIDs: readMessageIDs];
    
    [self postRequestString: stringToGetConfiguration 
            andCallbackInfo: callbackInfo];
     
}

- (void)reloadConfigurationWithConfigurationString: (NSString *)configurationString 
                             andStoredCallbackInfo: (id)storedCallbackInfo
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    [_configurationService storeConfiguration: configurationString];
    
    [_configurationService parseConfiguration];
    
    [_storedCallbackInfo release];
    _storedCallbackInfo = [storedCallbackInfo retain];
    
    [self stepToRefreshCurrentPage];
    
    scheduleImageCache(_configurationService);
    
}


- (void)getGUIConfiguration
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    NSString *readMessageIDs = BoCPressSoapDataSource_queryReadMessageIDs();
    
    NSString *stringToGetConfiguration = [self getConfigurationRequestStringWithReadMessageIDs: readMessageIDs];
    
    NSDictionary *callbackInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                                  _handler, kNetwork_CallbackObject,
                                  kSoapDataSource_getGUIConfigurationXMLFromURL, kNetwork_CallbackAction,
                                  kNetwork_getConfigurationResponse, kNetwork_SoapResponseType,
                                  nil];
    
    [self postRequestString: stringToGetConfiguration 
            andCallbackInfo: callbackInfo];
    
}


- (void)loadConfigurationWithConfigurationString: (NSString *)configurationString
{    
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    [_configurationService storeConfiguration: configurationString];
    
    [_configurationService parseConfiguration];
    
    NSString *messageID = [_configurationService queryConfigurationWithTag:@"messageID"];
    NSString *messageTitle = [_configurationService queryConfigurationWithTag:@"messageTitle"];
    NSString *messagePostDate = [_configurationService queryConfigurationWithTag:@"messagePostDate"];
    NSString *messageContent =[_configurationService queryConfigurationWithTag:@"messageContent"];
    NSString *messageFlag = [_configurationService queryConfigurationWithTag:@"messageFlag"];
    NSString *itemURL = [_configurationService queryConfigurationWithTag:@"itemURL"];
    
    NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
    if (messageID)
    {
        [userInfo setObject:messageID forKey:@"messageID"];
    }
    
    if (messageTitle)
    {
        [userInfo setObject:messageTitle forKey:@"messageTitle"];
    }
    
    if (messagePostDate)
    {
        [userInfo setObject:messagePostDate forKey:@"messagePostDate"];
    }
    
    if (messageContent)
    {
        [userInfo setObject:messageContent forKey:@"messageContent"];
    }
    
    if (messageFlag) 
    {
        [userInfo setObject:messageFlag forKey:@"messageFlag"];
    }
    
    if (itemURL)
    {
        [userInfo setObject:itemURL forKey:@"itemURL"];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didLoadGUIConfiguration 
                                                        object: self 
                                                      userInfo: userInfo];
    [userInfo release];
    
    scheduleImageCache(_configurationService);
    
}

- (void)loadConfigurationWhenTimeOut
{
    [_configurationService loadCachedConfigurationWhenTimeOut];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didLoadGUIConfigurationWhenTimeOut
                                                        object: self
                                                      userInfo: nil];
}

- (void)reloadColumnsWithTag: (id)tag  andCallback:(id<BoCPressCallback>)callback
{
    [_configurationService reloadColumnsWithTag: tag
                                       callback: callback];
}

#pragma mark - Reload data

- (void)handleServerErrorResponseWithCallbackInfo: (NSDictionary *)callbackInfo
                                     returnedData: (NSDictionary *)returnedData
{
    if ([_alertView isVisible])
    {
        return;
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didUpdateDataOfCurrentPageWhenServerError
                                                        object: self
                                                      userInfo: nil];
    
  
    id<BoCPressCallback> callback = [callbackInfo objectForKey: kNetwork_CallbackObject];
    id callbackAction = [callbackInfo objectForKey: kNetwork_CallbackAction];
    
    //re-pack the callback info
    //
    NSMutableDictionary *repackedCallbackInfo = [[NSMutableDictionary alloc] init];
    [repackedCallbackInfo setObject: callback 
                             forKey: kNetwork_CallbackObject];
    [repackedCallbackInfo setObject: kCallbackAction_tryWithPreviousCallbackActionAgainAfterServerError
                             forKey: kNetwork_CallbackAction];
    [repackedCallbackInfo setObject: callbackAction
                             forKey: kNetwork_CallbackStoredCallbackInfo];
    
    NSInteger errorCode = [[returnedData objectForKey: kBoCPress_Global_ServerErrorCode] intValue];
    NSString *errorMessage = [returnedData objectForKey: kBoCPress_Global_ServerErrorMessage_CN];
    [_alertView setMessage: errorMessage];
    
    [callback callbackForAction: kCallbackAction_willHandleErrorOfServer
                       withData: repackedCallbackInfo];
    
    switch (errorCode)
    {
        case kBoCPress_Global_ServerErrorNeedLogin:
        {
            NSUInteger buttonIndex = [_alertView show];
            if (buttonIndex == 0)
            {
                [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_wantoToShowAccountLoginPageWithCallbackInfo
                                                                    object: nil
                                                                  userInfo: repackedCallbackInfo];
            }else 
            {
                [callback callbackForAction: kCallbackAction_didCancelledHandleErrorOfServer
                                   withData: repackedCallbackInfo];
            }
            
            break;
        }
        case kBoCPress_Global_ServerErrorPayExpired:
        {
            NSInteger buttonIndex = [_alertView show];
            if (buttonIndex == 0)
            {
                [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_wantToShowVIPAccountRegisterPageWithCallbackInfo
                                                                    object: nil
                                                                  userInfo: repackedCallbackInfo];
            }else 
            {
                [callback callbackForAction: kCallbackAction_didCancelledHandleErrorOfServer
                                   withData: repackedCallbackInfo];
            }
            
            break;
        }
        default:
        {
            //ignore any other kinds of server errors
            //
            [_alertView show];
            break;
        }
    }
    
    [repackedCallbackInfo release];
}

- (void)soapXMLParser: (BoCPressSoapXMLParser *)parser finishedParseWithResult: (id)userInfo
{
    //    NSLog(@"In Function:%s at line number:%d, userInfo:%@", __FUNCTION__, __LINE__, userInfo);
    
    NSDictionary *returnedData = [userInfo objectForKey:kNetworkManager_responsedData];
    
    NSString *responseType = [returnedData objectForKey:kNetwork_SoapResponseType];
    
    
    NSDictionary *callbackInfo = [ userInfo objectForKey:kNetwork_CallbackObject];
        
    id callbackAction = [callbackInfo objectForKey:kNetwork_CallbackAction];
    
    //store last update time
    //
    id columnID = [callbackInfo objectForKey:kBoCPress_Global_ColumnID];
    
    [self storeColumnUpdateTimeInfoWithColumnID:columnID];
    
    BoCPressSoapDataSourceCalbackFunctionPointer pSoapCallbackFunction = [[_soapCallbackFunctions objectForKey: responseType] pointerValue];
    if (pSoapCallbackFunction)
    {
        pSoapCallbackFunction(callbackInfo, returnedData, _cacheService);
    }
    
    if([kSoapDataSource_refetchGUIConfiguration isEqualToString:callbackAction])
    {
        NSDictionary *storedCallbackInfo = [userInfo objectForKey:kNetwork_CallbackStoredCallbackInfo];
        
        NSString *configurationString = [returnedData objectForKey:kNetwork_XMLConfigurationString];
        [self reloadConfigurationWithConfigurationString: configurationString
                                   andStoredCallbackInfo: storedCallbackInfo];
    }else if([kNetwork_ErrorResponse isEqualToString:responseType])
    {
        [self handleServerErrorResponseWithCallbackInfo: callbackInfo
                                           returnedData: returnedData];
        
    }  
    
}


#pragma mark - Cache

- (void)useCacheWhenTimeOutWithInfo:(id)callbackInfo
{
    id infoForCache = [callbackInfo objectForKey:kBoCPress_Global_InfoForCache];
    id<BoCPressCallback> callback = [callbackInfo objectForKey:kNetwork_CallbackObject];
    id callbackAction = [callbackInfo objectForKey:kNetwork_CallbackAction];    
    
    //specialize for `advertisement`
    if([callbackAction isEqualToString: kCallbackAction_getAds])
    {
        [callback callbackForAction: kCallbackAction_handleTimeOutEventOfGetAds
                           withData: callbackInfo];
        return;
    }
    
    if ([callbackAction isEqualToString: kSoapDataSource_getGUIConfigurationXMLFromURL]
        ||[callbackAction isEqualToString: kSoapDataSource_refetchGUIConfiguration])
    {
        ;
    }else
    {
        id cachedObject = [_cacheService cachedObjectWithCallbackInfo:infoForCache];
        
        if (cachedObject)
        {
            [callback callbackForAction: callbackAction 
                               withData: cachedObject];
        }
    }
}


#pragma mark - network

- (void) postRequestString: (id)requestString 
           andCallbackInfo: (id)callbackInfo
{
//    NSLog(@"in Func:%s, line:%d re:%@", __func__, __LINE__, requestString);
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:                                                                
                              kNetwork_SoapURLString, kNetworkManager_TargetURL,
                              requestString, kNetworkManager_RequestString, 
                              callbackInfo, kNetwork_CallbackObject,
                              self, kNetwork_SoapXMLParserDelegate,
                              nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kNetworkManager_postRequestNotification 
                                                        object:self 
                                                      userInfo:userInfo];
    
    [userInfo release];
}

#pragma mark - image cache

- (void)storeAuthorAvatar: (id)data
{
    
    if ([data count] > 0) 
    {
        NSDictionary *callbackInfo = [data objectForKey:kNetwork_CallbackObject];
        
        NSString *md5StringOfImageURL = [[[callbackInfo objectForKey:kBoCPress_Global_NSURLObject] absoluteString] MD5];
        
        NSData *imageData = [data objectForKey:@"data"];
        
        NSString *imageCacheDirectory = [_configurationService queryConfigurationWithTag:kSoapConfiguration_ImageCacheDirectory];
        NSString *avatarURLCacheFile = [imageCacheDirectory stringByAppendingPathComponent: md5StringOfImageURL];
        
        [imageData writeToFile:avatarURLCacheFile atomically:YES];
        
        
    }
}

- (NSString *)cacheImageDirectoryPath
{
    return [_configurationService queryConfigurationWithTag: kSoapConfiguration_ImageCacheDirectory];
}

- (UIImage*) getAvatarWithURL: (NSString*) imageURLString
{
    NSString *maybeCachedImageFileName = [imageURLString MD5];
    NSString *maybeCachedImageFilePath = [[_configurationService queryConfigurationWithTag: kSoapConfiguration_ImageCacheDirectory] 
                                          stringByAppendingPathComponent: maybeCachedImageFileName];
    
    return   [UIImage imageWithContentsOfFile: maybeCachedImageFilePath];
}

- (UIImage*)getAvatarWithImageInfo:(id)imageInfo 
                      withCallback:(id<BoCPressCallback>)callback
{
    //check if the arguments are valid
    //
    NSString *imageURLString = [[imageInfo objectForKey:kBoCPress_Global_NSURLObject] absoluteString];
    
    
    if (imageURLString && callback)
    {
        NSString *imageCacheDirectory = [_configurationService queryConfigurationWithTag: kSoapConfiguration_ImageCacheDirectory];
        NSString *maybeCachedFilePath = [imageCacheDirectory stringByAppendingPathComponent: [imageURLString MD5]];
        
        UIImage *cachedImage = [UIImage imageWithContentsOfFile: maybeCachedFilePath];
        
        if (cachedImage)
        {
            NSDictionary *data = [[NSDictionary alloc] initWithObjectsAndKeys: 
                                  [NSData dataWithContentsOfFile: maybeCachedFilePath], @"data", nil];
            [callback callbackForAction: kBoCPress_View_updateThumbnailImage 
                               withData: data];
            [data release];
        }else
        {
            
            [[NSNotificationCenter defaultCenter] postNotificationName:kNetworkManager_postRequestNotification 
                                                                object:self 
                                                              userInfo:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                        imageURLString, kNetworkManager_TargetURL,
                                                                        imageInfo, kNetwork_CallbackObject,
                                                                        self, kNetwork_SoapXMLParserDelegate,
                                                                        nil]];
        }        
        
        return cachedImage;
        
    }else
    {
        return nil;
    }
}

- (void)handleDownloadReturnedData: (id)data
{    
    id callbackInfo = [data objectForKey:kNetwork_CallbackObject];
    id callback = [callbackInfo objectForKey:kNetwork_CallbackObject];
    id callbackAction = [callbackInfo objectForKey:kNetwork_CallbackAction];
    BOOL notUseCacheFlag = [[callbackInfo objectForKey:kBoCPress_Global_NotUseCacheFlag] boolValue];

    [callback callbackForAction: callbackAction 
                       withData: data];
    
    if (!notUseCacheFlag)
    {
        [self storeAuthorAvatar:data];
    }
}

#pragma mark - store column update time info
- (void)storeColumnUpdateTimeInfoWithColumnID:(id)columnID
{
    if (columnID)
    {
        NSDate *updateDate = [[[NSDate alloc] init] autorelease];
        [_lastUpdateTimeForCallbackAction setObject:updateDate forKey:columnID];
    }
}



- (void)storeInfoOfReadMessage:(id)messageID
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    id<SQLDatabase> messageConfigurationDatabase = [[SqliteDatabase alloc] initWithFilePathInDocumentDirectoryInIOS:kBoCPress_CacheDatabasePath];
    id<SQLStatement> storeAvatarStatement = [messageConfigurationDatabase prepareStatementForSQL:@"insert or replace into messageConfiguration(messageID , postDate) values(?, ?)"];
    
    [storeAvatarStatement setStringParameter:1 withString:messageID];
    [storeAvatarStatement setStringParameter:2 withFloat: [NSDate timeIntervalSinceReferenceDate]];
    
    [storeAvatarStatement execute];
    
    [messageConfigurationDatabase release];    
    [pool release];
}

- (void)setConfigurationValue:(id)value forTag:(id)tag
{
    if (value && tag)
    {
        [_dataSourceConfiguration setObject:value forKey:tag];
    }
}

- (BOOL)isEnableEmailAsAccountName
{
    return [[_configurationService queryConfigurationWithTag:kAppStore_boc_enable_email_as_account] boolValue];
}

- (BOOL)enableCoupon
{
    return [[_configurationService queryConfigurationWithTag: kAppStore_boc_enable_coupon_function] boolValue];
}

- (void)handleServerErrorWithData:(id)data
{
    NSString *errorCode = [data objectForKey: kBoCPress_Global_ServerErrorCode];
    if ([errorCode isEqualToString: kPurchaseManager_ErrorCode_ReceiptAlreadyProcessed])
    {
        [self didFinishedVerifyReceipt: data];
        
    }else if([errorCode isEqualToString: kPurchaseManager_ErrorCode_UpdateUserInfoFailed])
    {
        //ignore
        ;
    }
}

- (BOOL)couldShowAdvertisementInCurrentContext
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    id<SQLDatabase> adConfigurationDatabase = [[SqliteDatabase alloc] initWithFilePathInDocumentDirectoryInIOS:kBoCPress_CacheDatabasePath];
    id<SQLStatement> queryStatement = [adConfigurationDatabase prepareStatementForSQL:@"select shownDate from AdvertisementInfo order by shownDate desc limit 1"];
    
    [queryStatement execute];
    
    BOOL couldShowAdvertisementInCurrentContext = YES; 
    
    id<SQLResultSet> resultSet = [queryStatement currentResultSet];
    [resultSet moveCursorToNextRecord];
    id<SQLRecord> record = [resultSet currentRecord];
    NSTimeInterval lastShownTime = [[record stringValueNamed: @"shownDate"] floatValue];
    NSDate *lastShownDate = [NSDate dateWithTimeIntervalSinceReferenceDate: lastShownTime];
    
    if ([[NSDate date] isSameDayWithDate: lastShownDate])
    {
        couldShowAdvertisementInCurrentContext = NO;
    }
    
    [adConfigurationDatabase release];    
    [pool release];
    
    return couldShowAdvertisementInCurrentContext;
}

- (void)recordAdvertisementWithData:(id)data
{
    id<BoCPressNews> news = [data objectForKey: kBoCPress_Global_NewsType];
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    id<SQLDatabase> adConfigurationDatabase = [[SqliteDatabase alloc] initWithFilePathInDocumentDirectoryInIOS:kBoCPress_CacheDatabasePath];
    id<SQLStatement> recordStatement = [adConfigurationDatabase prepareStatementForSQL:@"insert or replace into AdvertisementInfo(advertisementID, shownDate, userInfo) values(?, ?, ?)"];
    
    [recordStatement setStringParameter: 1 withString: [news identity]];
    [recordStatement setStringParameter: 2 withFloat: [NSDate timeIntervalSinceReferenceDate]];
    [recordStatement setStringParameter: 3 withString: [data objectForKey: @"tag"]];
    
    [recordStatement execute];
    
    [adConfigurationDatabase release];    
    [pool release];
    
}

- (BOOL)couldShowAdvertisement:(id<BoCPressNews>)news
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    id<SQLDatabase> adConfigurationDatabase = [[SqliteDatabase alloc] initWithFilePathInDocumentDirectoryInIOS:kBoCPress_CacheDatabasePath];
    id<SQLStatement> queryStatement = [adConfigurationDatabase prepareStatementForSQL:@"select advertisementID, userInfo from AdvertisementInfo where advertisementID=?"];
    
    [queryStatement setStringParameter: 1 withString: [news identity]];
    [queryStatement execute];
    
    BOOL couldShowAdvertisement = YES; 
    
    id<SQLResultSet> resultSet = [queryStatement currentResultSet];
    [resultSet moveCursorToNextRecord];
    id<SQLRecord> record = [resultSet currentRecord];
    NSString *advertisementId = [record stringValueNamed: @"advertisementID"];
    if (advertisementId)
    {        
        NSString *userInfo = [record stringValueNamed: @"userInfo"];
        if ([userInfo isEqualToString: kAdvertisementInteraction])
        {
            couldShowAdvertisement = NO;
        }
    }
    
    [adConfigurationDatabase release];    
    [pool release];
    
    return couldShowAdvertisement;
}

#pragma mark - get splash advertisement
- (NSString *)stringToGetSplashAdvertisement
{
    return [self getBaseStringWithRequireType: kNetwork_getSplashAds
                            andArgumentString: nil];
}
- (void)wantToGetSplashAdvertisement
{
    NSString *stringToGetSplashAdvertisement = [self stringToGetSplashAdvertisement];
    id callbackAction = kCallbackAction_getSplashAds;
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys: 
                                  _handler, kNetwork_CallbackObject,
                                  callbackAction, kNetwork_CallbackAction,
                                  kNetwork_getSplashAdsResponse, kNetwork_SoapResponseType,
                                  nil];
    
    [self postRequestString: stringToGetSplashAdvertisement
            andCallbackInfo: callbackInfo];
    
    [callbackInfo release];
}

- (NSString *)stringToGetPushNotificationWithArgument: (NSString *)argument
{
    NSString *arg = formatXMLValueAndKey(argument, @"postId");
    return [self getBaseStringWithRequireType: kNetwork_getPushNotificationRequest
                            andArgumentString: arg];
}

- (void)requestRemoteNotificationForNotification: (NSDictionary *)info
                                        callback: (id<BoCPressCallback>)callback
{
    id<BoCPressServerPushNotification> serverNotification = [info objectForKey: @"notification"];

    NSString *argument = [serverNotification actionArgument];
    
    NSString *requestString = [self stringToGetPushNotificationWithArgument: argument];
    
    NSString *callbackAction = kCallbackAction_getPushNotification;
    
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  callback, kNetwork_CallbackObject,
                                  callbackAction, kNetwork_CallbackAction,  
                                  argument, kNetwork_getPushNotificationArgument,
                                  nil];
    
    [self postRequestString: requestString
            andCallbackInfo: callbackInfo];
    
    [callbackInfo release];
}

- (NSArray *)queryRemoteNotification
{
    
    NSMutableArray *notifications = [[NSMutableArray alloc] init];
    
    @autoreleasepool 
    {
        
        id<SQLDatabase> queryDatabase = [[SqliteDatabase alloc] initWithFilePathInDocumentDirectoryInIOS: kBoCPress_CacheDatabasePath];
        NSString *sqlString = @"select * from BoCPressRemoteNotification where DeleteStatus<>? order by NotificationID desc";
        
        id<SQLStatement> queryStatment = [queryDatabase prepareStatementForSQL: sqlString];
        [queryStatment setStringParameter: 1
                               withString: @"YES"];
        [queryStatment execute];
        
        id<SQLResultSet> resultSet = [queryStatment currentResultSet];
        id<SQLRecord> recordLooper = nil;
        id<BoCPressServerPushNotification> notificationLooper = nil;
        while ([resultSet moveCursorToNextRecord])
        {
            recordLooper = [resultSet currentRecord];
            notificationLooper = [[BoCPressServerPushNotification alloc] init];
            
            [notificationLooper setIdentity: [NSString stringWithFormat: @"%d", [recordLooper integerValueNamed: @"NotificationID"]]];
            [notificationLooper setAction: [recordLooper stringValueNamed: @"Action"]];
            [notificationLooper setActionArgument: [recordLooper stringValueNamed: @"ActionArgument"]];
            [notificationLooper setMessageTitle: [recordLooper stringValueNamed: @"MessageTitle"]];
            [notificationLooper setMessageContent: [recordLooper stringValueNamed: @"MessageContent"]];
            [notificationLooper setPlannedSendDateTime: [recordLooper stringValueNamed: @"PlannedSendDateTime"]];
            [notificationLooper setPushType: [recordLooper stringValueNamed: @"PushType"]];
            [notificationLooper setStatus: [recordLooper stringValueNamed: @"Status"]];
            [notificationLooper setStatusLastUpdate: [recordLooper stringValueNamed: @"StatusLastUpdateDate"]];
            [notificationLooper setTargetDeviceVersion: [recordLooper stringValueNamed: @"TargetDeviceVersion"]];
            [notificationLooper setTargetSoftVersion: [recordLooper stringValueNamed: @"TargetSoftVersion"]];
            [notificationLooper setTargetUserEmail: [recordLooper stringValueNamed: @"TargetUserEmail"]];
            [notificationLooper setTargetUserType: [recordLooper stringValueNamed: @"TargetUserType"]];
            [notificationLooper setHasBeenRead: [[recordLooper stringValueNamed: @"HasBeenRead"] boolValue]];
            [notificationLooper setDeleteStatus: [[recordLooper stringValueNamed: @"DeleteStatus"] boolValue]];
            
            [notifications addObject: notificationLooper];
            [notificationLooper release];
        }
        
        [queryDatabase release];
    }
    
    NSArray *ret = [NSArray arrayWithArray: notifications];
    [notifications release];
    return ret;
}

- (void)applicationWillBecomeDeactive
{
    NSArray *remoteNotifications = [self queryRemoteNotification];
    NSUInteger badgeNumber = [remoteNotifications count];
    
    for (id<BoCPressServerPushNotification> notificationLooper in remoteNotifications)
    {
        if ([notificationLooper hasBeenRead])
        {
            --badgeNumber;
        }
    }
    
}

- (void)resetBadgeNumber
{    
    NSLog(@"in func:%s line:%d", __func__, __LINE__);
    //clean notification list in system
    //
    UIApplication *sharedApplication = [UIApplication sharedApplication];
    NSUInteger badgeNumber = [self numberOfNewRemoteNotification];
    [sharedApplication setApplicationIconBadgeNumber: 0];
    [sharedApplication setApplicationIconBadgeNumber: badgeNumber];  
}


- (NSTimeInterval)timeIntervalOfString: (NSString *)name
{
    static const NSTimeInterval secondsOfOneDay = 24 * 60 * 60;

    if ([name isEqualToString: @"week_1"])
    {
        return [NSDate timeIntervalSinceReferenceDate] - secondsOfOneDay * 7;
    }
    
    if ([name isEqualToString: @"month_1"])
    {
        return [NSDate timeIntervalSinceReferenceDate] - secondsOfOneDay * 30;
    }
    
    if ([name isEqualToString: @"month_3"])
    {
        return [NSDate timeIntervalSinceReferenceDate] - secondsOfOneDay * 30 * 3;
    }
    
    return 0;
}

- (void)deleteOldRemoteNotificationBeforeDeadLine: (NSString *)deadLine
{
    @autoreleasepool 
    {
        NSTimeInterval date = [self timeIntervalOfString: deadLine];
        NSLog(@"date:%@ interval:%f", deadLine, date);
        id<SQLDatabase> remoteNotificationDataBase = [[SqliteDatabase alloc] initWithFilePathInDocumentDirectoryInIOS: kBoCPress_CacheDatabasePath];
        NSString *sqlString = @"delete from BoCPressRemoteNotification where TimeStamp < ?";
        id<SQLStatement> deleteStateMent = [remoteNotificationDataBase prepareStatementForSQL: sqlString];
        [deleteStateMent setFloatParameter: 1 
                                 withFloat:  date];
        [deleteStateMent execute];
        
        [remoteNotificationDataBase release];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kNotification_SoapDataSource_remoteNotificationDidChanged
                                                        object: self
                                                      userInfo: nil];
}

- (NSString *)getRemoteNotificationDeadLine
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    return [standardUserDefaults objectForKey: kNetwork_DataSource_DeadLineOfRemoteNotificationConfiguration];
}

- (void)scheduleToDeleteLocalStorageOfRemoteNotification
{
    [self deleteOldRemoteNotificationBeforeDeadLine: [self getRemoteNotificationDeadLine]];
}

@end
