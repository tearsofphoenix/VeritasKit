//
//  BoCPressRequestStringFormatService.m
//  BoCPress
//
//  Created by E-Reach Administrator on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressRequestStringFormatService.h"

#import "BoCPressSharedFunctions.h"

#import "BoCPressConstant.h"

#import "BoCPressUserInfoService.h"

#import "BoCPressConfigurationService.h"

#import "BoCPressNews.h"
#import "BoCPressChartImageConfiguration.h"

@implementation BoCPressRequestStringFormatService
- (id)initWithUserInfoService: (id<BoCPressUserInfoService>)userInfoService
         configurationService: (id<BoCPressConfigurationService>)configurationService
{
    if ((self = [super init]))
    {
        _userInfoService = [userInfoService retain];
        _configurationService = [configurationService retain];                                 
    }
    return self;
}

- (void)dealloc
{
    [_userInfoService release];
    [_configurationService release];
    
    [super dealloc];
}

- (NSString *)requestStringWithRequireType: (NSString *)requireType 
                         andArgumentString: (NSString *)argString
{
    
    NSString *email = [_userInfoService queryEmailAddress];
    
    NSString *userId = [_userInfoService queryUserID];
    
    NSString *status = [_userInfoService queryUserStatus];
    
    NSString *passwd = [_userInfoService queryPassword];
    
    NSString *contentString = [_configurationService queryConfigurationWithTag: kBoCPress_Configuration_SolidInfoString];
    
    contentString = [contentString stringByAppendingString:formatXMLValueAndKey(email, @"email")];
    contentString = [contentString stringByAppendingString:formatXMLValueAndKey(userId, @"userId")];
    contentString = [contentString stringByAppendingString:formatXMLValueAndKey(status, @"status")];
    contentString = [contentString stringByAppendingString:formatXMLValueAndKey(passwd, @"passwd")];
    
    appendResolvedStringsToString(contentString, 2);
    
    NSString *templateString = [_configurationService queryConfigurationWithTag: kSoapConfiguration_SoapXMLTemplateString];
    
    NSString *applicationId = [_configurationService queryConfigurationWithTag: kViewState_currentTabIdentity];
    
    if (!argString)
    {
        argString = @"";
    }
    
    argString = [argString stringByAppendingString:formatXMLValueAndKey(applicationId, @"applicationId")];
    
    return [NSString stringWithFormat:templateString, requireType, contentString, argString, requireType];
}



- (NSString *)getPostListRequestStringWithBegin: (NSUInteger)begin 
                                       columnID: (id)columnID
                                            end: (NSUInteger)end
                                    requireType: (NSString *)requireType
{
    //    <begin>%i</begin><columnId>%@</columnId><end>%i</end>
    NSString *argString = formatXMLIntegerValueAndKey(begin, @"begin");
    argString = [argString stringByAppendingString: formatXMLValueAndKey(columnID, @"columnId")];
    argString = [argString stringByAppendingString: formatXMLIntegerValueAndKey(end, @"end")];
    
    return [self requestStringWithRequireType: requireType 
                            andArgumentString: argString];
}


- (NSString *)getPostRequestStringWithNews: (id<BoCPressNews>) news
                                   logInfo: (id)logInfo
{
    NSString *argString = formatXMLValueAndKey([news identity], @"postId");
    
    NSString *infoOfReadPage = [logInfo objectForKey:@"actionType"];
    if (infoOfReadPage)
    {
        argString = [argString stringByAppendingString:formatXMLValueAndKey(infoOfReadPage, @"actionType")];
    }
    
    return [self requestStringWithRequireType: kNetwork_GetPost
                            andArgumentString: argString ];
}
//
//- (NSString *)getChartImageRequestStringWithCongfiguration: (id<BoCPressChartImageConfiguration>)chartImageConfiguration
//                                               triggerFlag: (NSString *)flag
//{
//    
//    NSString *solidInfoString = [_configurationService queryConfigurationWithTag:kBoCPress_Configuration_SolidInfoString];
//    
//    solidInfoString = [solidInfoString stringByAppendingString:formatXMLValueAndKey([_userInfoService queryUserID], @"userId")];
//    solidInfoString = [solidInfoString stringByAppendingString:formatXMLValueAndKey([_userInfoService queryPassword], @"passwd")];
//    
//    appendResolvedStringsToString(solidInfoString, 2);
//    
//    NSString *templateString = [_configurationService queryConfigurationWithTag:kSoapConfiguration_SoapXMLTemplateString];    
//    NSString *argString = [chartImageConfiguration xmlFormattedString];
//    argString = [argString stringByAppendingString: formatXMLValueAndKey(flag, @"rsvdStr1")];
//    return [NSString stringWithFormat:templateString, kNetwork_getChart, solidInfoString, argString, kNetwork_getChart];
//}

- (NSString *)stringToChangePasswordWithOldPassword: (NSString *)oldPassword 
                                        newPassword: (NSString *)newPassword
{
    NSString *solidInfoString = [_configurationService queryConfigurationWithTag:kBoCPress_Configuration_SolidInfoString];
    
    solidInfoString = [solidInfoString stringByAppendingString:formatXMLValueAndKey([_userInfoService queryUserID], @"userId")];
    solidInfoString = [solidInfoString stringByAppendingString:formatXMLValueAndKey(oldPassword, @"passwd")];
    solidInfoString = [solidInfoString stringByAppendingString:formatXMLValueAndKey(newPassword, @"rsvd2")];
    
    appendResolvedStringsToString(solidInfoString, 3);
    
    NSString *templateString = [_configurationService queryConfigurationWithTag:kSoapConfiguration_SoapXMLTemplateString];    
    NSString *argString = @" ";
    
    return [NSString stringWithFormat:templateString, kNetwork_ChangeUserPassword, solidInfoString, argString, kNetwork_ChangeUserPassword];
    
}

- (id)identity
{
    return BoCPressRequestStringFormatServiceID;
}
@end

NSString * const BoCPressRequestStringFormatServiceID = @"com.bocpress.coreservice.requeststringformat";

