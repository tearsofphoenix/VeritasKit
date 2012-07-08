//
//  BoCPressConfigurationService.m
//  BoCPress
//
//  Created by E-Reach Administrator on 7/15/11.
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

#import "BoCPressConfigurationService.h"

#import "XMLDocument.h"

#import "XMLNode.h"

#import "BoCPressMediaType.h"

#import "BoCPressColumn.h"

#import "BoCPressConstant.h"

#import "BoCPressMediaTagColumn.h"

#import "BoCPressNewsTagColumn.h"

#import "BoCPressSecurityFamily.h"

#import "SQLDatabase.h"

#import "SQLStatement.h"

#import "SqliteDatabase.h"

#import "SqliteDatabase(ApplicationDirectories).h"

#import "BoCPressConfigurationService.h"

#import "UIHardwareDevice.h"

#import "BoCPressSharedFunctions.h"
#import "BoCPressCallback.h"

#define kSoapConfiguration_cachedConfiguration @"kSoapConfiguration_cachedConfiguration"

static void initPreConfiguration(NSMutableDictionary *_columnConfiguration)
{
    UIDevice *currentDevice = [UIDevice currentDevice];
    
    NSString *deviceModel = [currentDevice model];
    NSString *systemVersion = [currentDevice systemVersion];
    
    NSString *resolution = @" ";   
    
    if ([systemVersion floatValue] >= 4.0 )
    {
        resolution = @"640x960";
    }else
    {
        resolution = @"320x480";
    }
    
    if ([deviceModel rangeOfString:@"iPad"].location != NSNotFound) 
    {
        resolution = @"1024x768";
    }
    
    
    
    //solid info string
    
    NSString *channelId = @"App Store";
    
    NSString *idString = @" ";
    
    NSString *descr = [currentDevice name];
    
    NSString *deviceCode = [currentDevice uniqueIdentifier];
    
    NSString *os = [currentDevice systemName];
    
    NSString *platform = @"iPhone";
    
    NSString *productId = @"2001";
    
    NSString *softwareVersion = @"2.1.1";
    NSString *bundleVersionString = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    
    [_columnConfiguration setObject:bundleVersionString forKey:kBoCPress_Configuration_BundleVersion];
    
    
    
    NSString *reservedString1 = [UIHardwareDevice platformString];
    
    //configuration
    [_columnConfiguration setObject:channelId forKey:kBoCPress_Configuration_ChannelID];
    [_columnConfiguration setObject:descr forKey:kBoCPress_Configuration_DeviceName];
    [_columnConfiguration setObject:deviceCode forKey:kBoCPress_Configuration_DeviceUDID]; 
    [_columnConfiguration setObject: deviceModel forKey:kBoCPress_Configuration_DeviceModel];
    [_columnConfiguration setObject:os forKey:kBoCPress_Configuration_SystemName];
    [_columnConfiguration setObject:platform forKey:kBoCPress_Configuration_Platform];
    [_columnConfiguration setObject:productId forKey:kBoCPress_Configuration_ProductID];
    [_columnConfiguration setObject:systemVersion forKey:kBoCPress_Configuration_SystemVersion];
    [_columnConfiguration setObject:softwareVersion forKey:kBoCPress_Configuration_SoftwareVersion];
    [_columnConfiguration setObject:resolution forKey:kBoCPress_Configuration_DeviceResolution];
    [_columnConfiguration setObject:reservedString1  forKey:kBoCPress_Configuration_HardwarePlatform];
    
    //solid info string
    NSString *contentString = @" ";
    contentString = [contentString stringByAppendingString:formatXMLValueAndKey(channelId, @"channelId")];
    contentString = [contentString stringByAppendingString:formatXMLValueAndKey(descr, @"descr")];
    contentString = [contentString stringByAppendingString:formatXMLValueAndKey(deviceCode, @"deviceCode")];
    contentString = [contentString stringByAppendingString:formatXMLValueAndKey(idString, @"id")];
    contentString = [contentString stringByAppendingString:formatXMLValueAndKey(deviceModel, @"model")];
    contentString = [contentString stringByAppendingString:formatXMLValueAndKey(os, @"os")];
    contentString = [contentString stringByAppendingString:formatXMLValueAndKey(platform, @"platform")];
    contentString = [contentString stringByAppendingString:formatXMLValueAndKey(productId, @"productId")];
    contentString = [contentString stringByAppendingString:formatXMLValueAndKey(resolution, @"resolution")];
    contentString = [contentString stringByAppendingFormat:formatXMLValueAndKey(systemVersion, @"version")];
    contentString = [contentString stringByAppendingString:formatXMLValueAndKey(softwareVersion, @"softVersion")];
    contentString = [contentString stringByAppendingString:formatXMLValueAndKey(reservedString1, @"rsvd1")];
    
    [_columnConfiguration setObject:contentString forKey:kBoCPress_Configuration_SolidInfoString];
    
    [_columnConfiguration setObject:[NSNumber numberWithBool:YES] forKey:kBoCPress_Configuration_NetworkStatus];
    
    NSString * textPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/BoCPressSoapTemplate.xml"];
    
    NSString *fileText = [NSString stringWithContentsOfFile:textPath encoding:NSUTF8StringEncoding error:nil];   
    [_columnConfiguration setObject:fileText forKey:kSoapConfiguration_SoapXMLTemplateString];
    
    NSArray*    paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    
    [_columnConfiguration setObject:documentDirectory
                             forKey:kSoapConfiguration_ApplicationDocumentDirectory];
    [_columnConfiguration setObject: [documentDirectory stringByAppendingFormat: @"/%@", kSoapDataSource_RemoteNotificationStoreFileName]
                             forKey: kSoapDataSource_RemoteNotificationStoreFileName];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *imageCacheDirectoryName = [documentDirectory stringByAppendingPathComponent: @"ImageCache"];
    
    if (![fileManager fileExistsAtPath:imageCacheDirectoryName])
    {
        NSError *error = nil;
        [fileManager createDirectoryAtPath: imageCacheDirectoryName
               withIntermediateDirectories: YES 
                                attributes: nil 
                                     error: &error];        
        if (!error)
        {
            [_columnConfiguration setObject:imageCacheDirectoryName forKey:kSoapConfiguration_ImageCacheDirectory];
        }
    }else
    {
        [_columnConfiguration setObject:imageCacheDirectoryName forKey:kSoapConfiguration_ImageCacheDirectory];
    }
 
    NSMutableArray *remoteNotificationConfigurableColumns = [[NSMutableArray alloc] init];
    [_columnConfiguration setObject: remoteNotificationConfigurableColumns 
                             forKey: kSoapConfiguration_RemoteNotificationConfigurableColumnsKey];
    [remoteNotificationConfigurableColumns release];
}

@implementation BoCPressConfigurationService

- (id)init
{
    self = [super init];
    if (self) 
    {
        // Initialization code here.
        
        _configurationData  = nil;
        
        _columnConfiguration = [[NSMutableDictionary alloc] init];
        
        initPreConfiguration(_columnConfiguration);
    }
    
    return self;
}

- (void)dealloc
{
    
    [_configurationData release];
    
    [_columnConfiguration release];
    
    [super dealloc];
}

#pragma mark - load configuration

- (void)storeConfiguration: (NSString*)data
{
    if (data)
    {
        [_configurationData release];        
        _configurationData = [data retain];
        
        NSString *documentDirectoryFilePath = [_columnConfiguration objectForKey: kSoapConfiguration_ApplicationDocumentDirectory];
        NSString *cachedConfigurationString = [documentDirectoryFilePath stringByAppendingPathComponent: kSoapConfiguration_cachedConfiguration];
        NSFileManager *defaultFileManager = [NSFileManager defaultManager];
        
        if ([defaultFileManager fileExistsAtPath: cachedConfigurationString]) 
        {
            [defaultFileManager removeItemAtPath: cachedConfigurationString
                                           error: nil];            
        }
        
        if([NSKeyedArchiver archiveRootObject: data
                                       toFile: cachedConfigurationString])
        {
            NSLog(@"store configuration to file ok!");
        }else
        {
            NSLog(@"failed to store configuration to file.");
        }
    }
}

- (void)parseServerMessage
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    //    <message>
    //    <id>5651</id>
    //    <date>2011-08-05 11:36:18</date>
    //    <subject>欢迎</subject>
    //    <text>欢迎使用中国银行金汇掌中宝系统！</text>
    //    <flag>ALWAYS_SHOW</flag>
    //    </message>
    XMLDocument *document = [[XMLDocument alloc] initWithData: [_configurationData dataUsingEncoding:NSUTF8StringEncoding]] ;
    
    NSArray *messages = [document evaluateXPathExpression: @"//message" withNamespaces: nil];
    if ([messages count] < 1)
    {
        [document release];
        [pool release];
        return;
    }
    XMLNode *messageNode = [messages objectAtIndex:0];
    NSString *messageID = [messageNode getTextContentWithChildNodeName:@"id"];
    NSString *messageTitle = [messageNode getTextContentWithChildNodeName:@"subject"];
    NSString *messagePostDate = [messageNode getTextContentWithChildNodeName:@"date"];
    NSString *messageContent =[messageNode getTextContentWithChildNodeName:@"text"];
    NSString *messageFlag = [messageNode getTextContentWithChildNodeName:@"flag"];
    NSString *itemURL = [messageNode getTextContentWithChildNodeName:@"url"];
    NSArray *effectedVersions = [[messageNode getTextContentWithChildNodeName:@"for_ver"] componentsSeparatedByString:@","];
    
    if (messageID)
    {
        [_columnConfiguration setObject:messageID forKey:@"messageID"];
    }
    
    if (messageTitle)
    {
        [_columnConfiguration setObject:messageTitle forKey:@"messageTitle"];
    }
    
    if (messagePostDate)
    {
        [_columnConfiguration setObject:messagePostDate forKey:@"messagePostDate"];
    }
    
    if (messageContent)
    {
        [_columnConfiguration setObject:messageContent forKey:@"messageContent"];
    }
    
    if (messageFlag) 
    {
        [_columnConfiguration setObject:messageFlag forKey:@"messageFlag"];
    }else
    {
        [_columnConfiguration setObject:@" " forKey:@"messageFlag"];
    }
    
    if (itemURL)
    {
        [_columnConfiguration setObject:itemURL forKey:@"itemURL"];
    }
    
    if (effectedVersions)
    {
        [_columnConfiguration setObject:effectedVersions forKey:kBoCPress_MessageEffectedVersions];
    }
    
    [document release];
    
    [pool release];
}

- (void)parseOrderedMediaTags
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    XMLDocument *document = [[XMLDocument alloc] initWithData: [_configurationData dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSArray* types = [_columnConfiguration objectForKey:kBoCPressConfiguration_MediaTypes];
    
    
    NSArray *columns = [document evaluateXPathExpression: @"//column" withNamespaces: nil];
    
    
    for (id<BoCPressMediaType> typeLooper in types)
    {
        
        for (XMLNode *columLooper in columns) 
        {
            //            NSLog(@"%@", [columLooper attributeWithName:@"name"]);
            
            
            if ([(NSString*)[columLooper attributeWithName:@"name"] isEqualToString:[typeLooper name]]) 
            {
                XMLNode *childNodeLooper = [columLooper firstChild];
                NSMutableArray *tags = [[NSMutableArray alloc] init];
                
                while (childNodeLooper) 
                {
                    
                    //NSLog(@"name:%@", childNodeLooper);
                    if ([childNodeLooper attributeWithName:@"id"]) 
                    {
                        BOOL isChargeColumnFlag = [[childNodeLooper attributeWithName:@"chargeFlag"] boolValue];
                        BOOL currentChargeFlag = [[childNodeLooper attributeWithName:@"currentCharge"] boolValue];
                        
                        BoCPressMediaTagColumn *tmpMediaTagColumn = [[BoCPressMediaTagColumn alloc] initWithIdentity:[childNodeLooper attributeWithName:@"id"] 
                                                                                                                name: [childNodeLooper attributeWithName:@"name"] 
                                                                                                           mediaType:typeLooper
                                                                                                          chargeFlag:isChargeColumnFlag 
                                                                                                   currentChargeFlag:currentChargeFlag];
                        [tags addObject: tmpMediaTagColumn];
                        [tmpMediaTagColumn release];
                    }
                    
                    childNodeLooper = [childNodeLooper nextSibling];
                    
                    [_columnConfiguration setObject:tags forKey:[typeLooper identity]];
                }
                
                [tags release];
                
            }
        }
    }
    
    [document release];
    [pool release];
}

- (void)parseVersionInfo
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    //    <version id="1.0.0" chargeSupport="NO" 
    //    chargeRemindingMsg="本栏目为金汇掌中宝VIP收费服务，目前提供用户免费使用。"
    //    upgradeRequiredMsg="本栏目为金汇掌中宝VIP收费服务，您当前的版本不支持收费功能，请点击确定升级后再尝试。"
    //    upgradeUrlApple="http://itunes.apple.com"
    //    upgradeUrlAndroid="http://android.google.com"/>
    
    XMLDocument *document = [[XMLDocument alloc] initWithData: [_configurationData dataUsingEncoding:NSUTF8StringEncoding]] ;
    
    NSArray *versions = [document evaluateXPathExpression: @"//versions" withNamespaces: nil];
    
    XMLNode *versionsNode = [versions objectAtIndex:0];
    
    if ([versions count] < 1)
    {
        [document release];
        [pool release];
        return;
    }
    
    NSString *currentVersion = [versionsNode attributeWithName:@"current"];
    [_columnConfiguration setObject:currentVersion forKey:kBoCPressConfiguration_CurrentVersion];
    
    XMLNode *versionNodeLooper = [versionsNode firstChild];
    NSMutableDictionary *versionInfoLooper = nil;
    
    while (versionNodeLooper)
    {
        NSString *versionID = [versionNodeLooper attributeWithName:@"id"];
        
        if (versionID)
        {
            
            versionInfoLooper  = [[NSMutableDictionary alloc] init];
            
            NSString *versionChargeSupport = [versionNodeLooper attributeWithName:@"chargeSupport"];
            NSString *chargeRemindingMsg = [versionNodeLooper attributeWithName:@"chargeRemindingMsg"];
            NSString *upgradeRequiredMsg = [versionNodeLooper attributeWithName:@"upgradeRequiredMsg"];
            NSString *upgradeUrlApple = [versionNodeLooper attributeWithName:@"upgradeUrlApple"];
            NSString *chargeExpiredMsg = [versionNodeLooper attributeWithName: @"chargeExpiredMsg"];
            NSString *loginRequiredMsg = [versionNodeLooper attributeWithName: @"loginRequiredMsg"];
            
            if (versionID)
            {
                [versionInfoLooper setObject:versionID forKey:@"id"];
            }
            
            if (versionChargeSupport)
            {
                [versionInfoLooper setObject:versionChargeSupport forKey:@"chargeSupport"];
            }
            
            if (chargeRemindingMsg)
            {
                [versionInfoLooper setObject:chargeRemindingMsg forKey:@"chargeRemindingMsg"];
            }
            
            if (upgradeRequiredMsg)
            {
                [versionInfoLooper setObject:upgradeRequiredMsg forKey:@"upgradeRequiredMsg"];
            }
            
            if (upgradeUrlApple)
            {
                [versionInfoLooper setObject:upgradeUrlApple forKey:@"upgradeUrlApple"];
            }
            if (chargeExpiredMsg)
            {
                [versionInfoLooper setObject:chargeExpiredMsg forKey:@"chargeExpiredMsg"];
            }
            if (loginRequiredMsg)
            {
                [versionInfoLooper setObject:loginRequiredMsg forKey:@"loginRequiredMsg"];
            }
            
            [_columnConfiguration setObject:versionInfoLooper forKey:versionID];
            
            [versionInfoLooper release];
        }
        
        versionNodeLooper = [versionNodeLooper nextSibling];
    }
    [document release];
    [pool release];
}

static void BoCPressSoapConfiguration_parseFlags(XMLDocument *document, 
                                                 NSMutableDictionary *_columnConfiguration)
{
    NSArray *nodes = [document evaluateXPathExpression:@"//flags" withNamespaces:nil];
    
    if ([nodes count] > 0)
    {
        
        XMLNode *flagsNode = [nodes objectAtIndex:0];
        XMLNode *nodeLooper = [flagsNode firstChild];
        while (nodeLooper)
        {
            NSString *name = [nodeLooper attributeWithName: @"name"];
            NSString *content = [nodeLooper textContent];
            if (name && content)
            {
                
                [_columnConfiguration setObject: content
                                         forKey: name];
            }
            nodeLooper = [nodeLooper nextSibling];
        }
    }
    
}

- (void)parseConfiguration
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    XMLDocument *document = [[XMLDocument alloc] initWithData: [_configurationData dataUsingEncoding:NSUTF8StringEncoding]] ;
    
    BoCPressSoapConfiguration_parseFlags(document, _columnConfiguration);
    
    NSArray *columns = [document evaluateXPathExpression: @"//columns" withNamespaces: nil];
    
    if ([columns count] < 1)
    {
        [document release];
        [pool release];
        return;
    }
    
    XMLNode *columnsNode = [columns objectAtIndex:0];
    
    XMLNode *columnLooperNode = [columnsNode firstChild];
    
    while(columnLooperNode)
    {

        if ([(NSString*)[columnLooperNode attributeWithName:@"name"] isEqualToString:@"观点"]) 
        {
            XMLNode *childNodeLooper = [columnLooperNode firstChild];
            
            NSMutableArray *tags = [[NSMutableArray alloc] init] ;
            
            while (childNodeLooper) 
            {
                
                if ([childNodeLooper attributeWithName:@"id"]) 
                {
                    BOOL isChargeColumnFlag = [[childNodeLooper attributeWithName:@"chargeFlag"] boolValue];
                    BOOL currentChargeFlag = [[childNodeLooper attributeWithName:@"currentCharge"] boolValue];
                    NSString *columnID = [childNodeLooper attributeWithName:@"id"];
                    BoCPressColumn *columnLooper = [[BoCPressColumn alloc] initWithIdentity: columnID
                                                                                       name: [childNodeLooper attributeWithName:@"name"]
                                                                            couldBeSelected: YES 
                                                                                columnWidth: 0
                                                                                 chargeFlag:isChargeColumnFlag
                                                                          currentChargeFlag:currentChargeFlag]; 
                    
                    NSString* fetchSize = [childNodeLooper attributeWithName:@"fetchSize"];
                    NSString* fetchMoreSize = [childNodeLooper attributeWithName:@"fetchMoreSize"];
                    
                    if (fetchSize)
                    {
                        
                        [columnLooper storeConfiguration:fetchSize forKey:@"fetchSize"];
                    }
                    
                    if (fetchMoreSize)
                    {
                        [columnLooper storeConfiguration:fetchMoreSize  forKey:@"fetchMoreSize"];
                    }
                    
                    [tags addObject: columnLooper];
                    [_columnConfiguration setObject: columnLooper
                                             forKey: columnID];
                    [columnLooper release];
                }
                
                childNodeLooper = [childNodeLooper nextSibling];
            }
            
            
            [_columnConfiguration setObject:tags forKey:kBoCPressConfiguration_CriticColumns];
            
            [tags release];
        }
        
        if ([(NSString*)[columnLooperNode attributeWithName:@"name"] isEqualToString:@"影音"]) 
        {
            XMLNode *childNodeLooper = [columnLooperNode firstChild];
            
            NSMutableArray *types = [[NSMutableArray alloc] init];
            
            while (childNodeLooper) 
            {
                
                //                NSLog(@"name:%@", [childNodeLooper attributeWithName:@"name"]);
                NSString *mediaTypeID = [childNodeLooper attributeWithName:@"id"];
                if (mediaTypeID) 
                {
                    BOOL isChargeColumnFlag = [[childNodeLooper attributeWithName:@"chargeFlag"] boolValue];
                    BOOL currentChargeFlag = [[childNodeLooper attributeWithName:@"currentCharge"] boolValue];
                    
                    BoCPressMediaType *typeLooper = [[BoCPressMediaType alloc] initWithIdentity:mediaTypeID
                                                                                           name: [childNodeLooper attributeWithName:@"name"]
                                                                                     chargeFlag:isChargeColumnFlag 
                                                                              currentChargeFlag:currentChargeFlag
                                                     ];
                    
                    [types addObject: typeLooper];
                    
                    [typeLooper release];
                }
                
                childNodeLooper = [childNodeLooper nextSibling];
            }
            
            //parse mediaType over
            
            [_columnConfiguration setObject:types forKey:kBoCPressConfiguration_MediaTypes];
            
            [types release];
        }
        
        if ([(NSString*)[columnLooperNode attributeWithName:@"name"] isEqualToString:@"资讯"]) 
        {
            NSMutableDictionary *tags = [[NSMutableDictionary alloc] init];
            
            NSMutableArray* superColumns = [[NSMutableArray alloc] init];
            
            XMLNode *childNodeLooper = [columnLooperNode firstChild];
            
            
            while (childNodeLooper) 
            {
                //In super column
                //NSLog(@"name:%@", childNodeLooper);
                if ([childNodeLooper attributeWithName:@"id"]) 
                {
                    //                    NSLog(@"id=%@", [childNodeLooper attributeWithName:@"id"]);
                    
                    //parse  subColumns of a superColumn
                    //
                    NSMutableArray* subColumns = [[NSMutableArray alloc] init];
                    
                    XMLNode *subColumnNodeLooper = [childNodeLooper firstChild];
                    
                    while (subColumnNodeLooper)
                    {
                        if ([subColumnNodeLooper attributeWithName:@"id"])
                        {
                            //                            NSLog(@"sub column name=%@", [subColumnNodeLooper attributeWithName:@"name"]);
                            BOOL isChargeColumnFlag = [[subColumnNodeLooper attributeWithName:@"chargeFlag"] boolValue];
                            BOOL currentChargeFlag = [[subColumnNodeLooper attributeWithName:@"currentCharge"] boolValue];
                            NSString *columnID = [subColumnNodeLooper attributeWithName:@"id"];
                            BoCPressNewsTagColumn* newsTagColumnLooper = [[BoCPressNewsTagColumn alloc] 
                                                                          initWithIdentity:[subColumnNodeLooper attributeWithName:@"id"]
                                                                          name:[subColumnNodeLooper attributeWithName:@"name"]
                                                                          chargeFlag:isChargeColumnFlag 
                                                                          currentChargeFlag:currentChargeFlag];
                            
                            NSString* fetchSize = [subColumnNodeLooper attributeWithName:@"fetchSize"];
                            NSString* fetchMoreSize = [subColumnNodeLooper attributeWithName:@"fetchMoreSize"];
                            
                            if (fetchSize)
                            {
                                
                                [newsTagColumnLooper storeConfiguration:fetchSize forKey:@"fetchSize"];
                            }
                            
                            if (fetchMoreSize)
                            {
                                [newsTagColumnLooper storeConfiguration:fetchMoreSize  forKey:@"fetchMoreSize"];
                            }
                            
                            [subColumns addObject:newsTagColumnLooper];
                            [_columnConfiguration setObject: newsTagColumnLooper
                                                     forKey: columnID];
                            
                            [newsTagColumnLooper release];
                        }
                        
                        subColumnNodeLooper = [subColumnNodeLooper nextSibling];
                    }
                    
                    BOOL isChargeColumnFlag = [[childNodeLooper attributeWithName:@"chargeFlag"] boolValue];
                    BOOL currentChargeFlag = [[childNodeLooper attributeWithName:@"currentCharge"] boolValue];
                    
                    BoCPressNewsTagColumn *superColumnLooper = [[BoCPressNewsTagColumn alloc] initWithIdentity:[childNodeLooper attributeWithName:@"id"]                                                                                                name: [childNodeLooper attributeWithName:@"name"]
                                                                                                    chargeFlag:isChargeColumnFlag 
                                                                                             currentChargeFlag:currentChargeFlag];
                    
                    NSString* fetchSize = [childNodeLooper attributeWithName:@"fetchSize"];
                    NSString* fetchMoreSize = [childNodeLooper attributeWithName:@"fetchMoreSize"];
                    
                    if (fetchSize)
                    {
                        
                        [superColumnLooper storeConfiguration:fetchSize forKey:@"fetchSize"];
                    }
                    
                    if (fetchMoreSize)
                    {
                        [superColumnLooper storeConfiguration:fetchMoreSize  forKey:@"fetchMoreSize"];
                    }
                    
                    
                    [superColumns addObject:superColumnLooper];
                    
                    [tags setObject:subColumns forKey:[superColumnLooper identity]];
                    
                    [subColumns release];
                    [superColumnLooper release];
                }
                
                childNodeLooper = [childNodeLooper nextSibling];
            }
            
            //parse news over
            
            [_columnConfiguration setObject:superColumns forKey:kBoCPressConfiguration_NewsSuperColumns];
            [_columnConfiguration setObject:tags forKey:kBoCPressConfiguration_NewsSubColumns];
            
            [tags release];
            [superColumns release];
        }
        
        if ([(NSString*)[columnLooperNode attributeWithName:@"name"] isEqualToString:@"报价"]) 
        {
            XMLNode *childNodeLooper = [columnLooperNode firstChild];
            
            NSMutableArray *tags = [[NSMutableArray alloc] init];
            
            
            while (childNodeLooper) 
            {
                
                //NSLog(@"name:%@", childNodeLooper);
                NSString *securityFamilyID = [childNodeLooper attributeWithName:@"id"];
                if (securityFamilyID) 
                {
                    BOOL isChargeColumnFlag = [[childNodeLooper attributeWithName:@"chargeFlag"] boolValue];
                    BOOL currentChargeFlag = [[childNodeLooper attributeWithName:@"currentCharge"] boolValue];
                    
                    BoCPressSecurityFamily * securityFamilyLooper = [[BoCPressSecurityFamily alloc] initWithIdentity:securityFamilyID                                                                                            
                                                                                                                name: [childNodeLooper attributeWithName:@"name"]
                                                                                                          chargeFlag:isChargeColumnFlag
                                                                                                   currentChargeFlag:currentChargeFlag];
                    
                    NSString* fetchSize = [childNodeLooper attributeWithName:@"fetchSize"];
                    NSString* fetchMoreSize = [childNodeLooper attributeWithName:@"fetchMoreSize"];
                    
                    if (fetchSize)
                    {
                        
                        [securityFamilyLooper storeConfiguration:fetchSize forKey:@"fetchSize"];
                    }
                    
                    if (fetchMoreSize)
                    {
                        [securityFamilyLooper storeConfiguration:fetchMoreSize  forKey:@"fetchMoreSize"];
                    }
                    
                    
                    [tags addObject: securityFamilyLooper];
                    [_columnConfiguration setObject: securityFamilyLooper
                                             forKey: securityFamilyID];
                    
                    [securityFamilyLooper release];
                }
                
                childNodeLooper = [childNodeLooper nextSibling];
            }
            
            
            [_columnConfiguration setObject:tags forKey:kBoCPressConfiguration_QuoteFamilies];
            
            [tags release];
        }
        
        columnLooperNode = [columnLooperNode nextSibling];
    }
    
    [document release];
    
    [pool release];
    
    [self parseOrderedMediaTags];
    [self parseServerMessage];
    [self parseVersionInfo];
}



- (id)queryConfigurationWithTag:(id)tag
{
    return [_columnConfiguration objectForKey:tag];
}

- (id<BoCPressColumn>)queryColumnWithTag: (id)tag 
                          andColumnIndex: (NSUInteger) columnIndex
{
    NSArray* columns = [_columnConfiguration objectForKey:tag];
    
    if (columns && columnIndex < [columns count])
    {
        
        return [columns objectAtIndex:columnIndex];
        
    }else
    {
        return nil;
    }
}

- (id)queryColumnConfigurationWithTag: (id)tag 
                             columnID: (id)columnID 
                     configurationKey: (id)key
{
    NSArray* columns = [_columnConfiguration objectForKey:tag];
    
    if (columns)
    {
        for (id<BoCPressColumn> columnLooper in columns)
        {
            if ([[columnLooper identity] isEqual: columnID]) 
            {
                id value = [columnLooper  queryConfigurationWithKey:key];
                return value;
            }
        }
        
        // has not found column
        return nil;
    }
    
    //tag not match
    return nil;
}

- (void)loadCachedConfigurationWhenTimeOut
{
    NSString *documentDirectoryFilePath = [_columnConfiguration objectForKey: kSoapConfiguration_ApplicationDocumentDirectory];
    NSString *cachedConfigurationStringPath = [documentDirectoryFilePath stringByAppendingPathComponent: kSoapConfiguration_cachedConfiguration];
    
    NSString *cachedConfigurationString = [NSKeyedUnarchiver unarchiveObjectWithFile: cachedConfigurationStringPath];
    [_configurationData release];
    _configurationData = [cachedConfigurationString retain];
    [self parseConfiguration];
}

#pragma mark - Media contents

- (NSUInteger)countOfMediaPerTypeInHomeView
{
    return 3;
}

static id BoCPress_recursionSearchIdentitedObjectInDictionary(NSDictionary *dict, id tag);

static id BoCPress_recursionSearchIdentitedObjectInArray(NSArray *array, id tag)
{
    for (id<NSIdentifiedObject> iLooper in array)
    {        
        if ([iLooper respondsToSelector:@selector(identity)]
            && [[iLooper identity] isEqual: tag])
        {
            return iLooper;
        }
        if ([iLooper isKindOfClass: [NSDictionary class]])
        {
            id ret = BoCPress_recursionSearchIdentitedObjectInDictionary((NSDictionary*)iLooper, tag);
            if (ret) 
            {
                return ret;
            }
        }
        if ([iLooper isKindOfClass: [NSArray class]])
        {
            id ret = BoCPress_recursionSearchIdentitedObjectInArray((NSArray *)iLooper, tag);
            if (ret)
            {
                return ret;
            }
        }
    }
    return nil;
}

static id BoCPress_recursionSearchIdentitedObjectInDictionary(NSDictionary *dict, id tag)
{
    for (id<NSIdentifiedObject> iLooper in dict)
    {        
        id<NSIdentifiedObject> value = [dict objectForKey: iLooper];
        if ([value respondsToSelector:@selector(identity)]
            && [[value identity] isEqual: tag])
        {
            return value;
        }
        
        if ([value isKindOfClass: [NSDictionary class]])
        {
            id ret =  BoCPress_recursionSearchIdentitedObjectInDictionary((NSDictionary*)value, tag);
            if (ret)
            {
                return ret;
            }
        }
        if ([value isKindOfClass: [NSArray class]])
        {
            id ret = BoCPress_recursionSearchIdentitedObjectInArray((NSArray *)value, tag);
            if (ret)
            {
                return ret;
            }
        }
    }
    return nil;
}

- (id)queryIdentitedObjectWithID: (id)tag
{
    return BoCPress_recursionSearchIdentitedObjectInDictionary(_columnConfiguration, tag);
}

- (void)reloadColumnsWithTag: (id)tag 
                    callback: (id)callback
{
     if ([tag isEqualToString:kBoCPressConfiguration_NewsSuperColumns])
     {
         id subColumns = [self queryConfigurationWithTag:kBoCPressConfiguration_NewsSubColumns];
         
         id superColumns = [self queryConfigurationWithTag:kBoCPressConfiguration_NewsSuperColumns];
         
         NSDictionary *data = [[NSDictionary alloc]initWithObjectsAndKeys:subColumns, @"newsTags", superColumns, kBoCPress_Global_OrderedKeyArray, nil];
         
         [callback callbackForAction: kCallbackAction_reloadColumnsWithTag
                            withData: data];
         
         [data release];
         
     }else
     {
         NSArray* columns = [self queryConfigurationWithTag:tag];
         
         [callback callbackForAction: kCallbackAction_reloadColumnsWithTag
                            withData: columns];
     }
}

- (id)identity
{
    return BoCPressConfigurationServiceID;
}

@end

NSString * const BoCPressConfigurationServiceID = @"com.bocpress.coreservice.configuration";
