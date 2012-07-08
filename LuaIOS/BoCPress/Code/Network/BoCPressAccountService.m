//
//  BoCPressAccountService.m
//  BoCPress
//
//  Created by E-Reach Administrator on 4/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressAccountService.h"
#import "BoCPressConfigurationService.h"
#import "BoCPressNetworkService.h"
#import "BoCPressRequestStringFormatService.h"
#import "BoCPressSharedFunctions.h"
#import "BoCPressCacheService.h"
#import "BoCPressCallback.h"

#import "BoCPressConstant.h"

static void callbackAction_normalHandleOfCallback(NSDictionary *callbackInfo,
                                                  NSDictionary *returnedData,
                                                  id<BoCPressCacheService> _cacheManage)
{
    id<BoCPressCallback> callback = [callbackInfo objectForKey:kNetwork_CallbackObject];    
    id callbackAction = [callbackInfo objectForKey:kNetwork_CallbackAction];
    [callback callbackForAction: callbackAction
                       withData: returnedData];
}

static void callbackAction_handleGetUserInfo(NSDictionary *callbackInfo,
                                             NSDictionary *returnedData,
                                             id<BoCPressCacheService> _cacheService)
{
    id<BoCPressCallback> callback = [callbackInfo objectForKey:kNetwork_CallbackObject];    
    id callbackAction = [callbackInfo objectForKey:kNetwork_CallbackAction];
    
    NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                     returnedData, @"returnedData",nil];
    
    [userInfo addEntriesFromDictionary: callbackInfo];
    
    [callback callbackForAction: callbackAction
                       withData: userInfo];
    [userInfo release];
}

@implementation BoCPressAccountService
#pragma mark - network actions

- (void)initSoapCallbackFunctions
{
    [super initSoapCallbackFunctions];
    [_soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_normalHandleOfCallback)
                               forKey: kNetwork_userLoginResponse];
    [_soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_normalHandleOfCallback)
                               forKey: kNetwork_userLogoutResponse];
    [_soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_normalHandleOfCallback) 
                               forKey: kNetwork_NormalAccountRegisterResponse ];
    [_soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_handleGetUserInfo)
                               forKey: kNetwork_getUserInfoResponse];
    [_soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_normalHandleOfCallback) 
                               forKey: kNetwork_getPromptMsgResponse ];
    [_soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_normalHandleOfCallback) 
                               forKey: kNetwork_FindUserPasswordResponse ];
    [_soapCallbackFunctions setObject: storeCFunctionInNSValue(callbackAction_normalHandleOfCallback) 
                               forKey: kNetwork_ChangeUserPasswordResponse ];             
    
}

- (NSString *)stringToLoginWithUserName: (NSString *)userName 
                               password: (NSString *)password
{
    NSString *solidInfoString = [_configurationService queryConfigurationWithTag: kBoCPress_Configuration_SolidInfoString];
    solidInfoString = [solidInfoString stringByAppendingString: formatXMLValueAndKey(userName, @"email")];
    solidInfoString = [solidInfoString stringByAppendingString: formatXMLValueAndKey(password, @"passwd")];
    
    appendResolvedStringsToString(solidInfoString, 2);
    
    NSString *templateString = [_configurationService queryConfigurationWithTag: kSoapConfiguration_SoapXMLTemplateString];       
    
    NSString *argString = @" ";
    
    return [NSString stringWithFormat:templateString, kNetwork_userLoginRequest, solidInfoString, argString, kNetwork_userLoginRequest];
    
}

- (void)loginWithUserName:(NSString *)userName
                 password: (NSString *)password
                 callback:(id<BoCPressCallback>)callback
{
    NSString * stringToLogin = [self stringToLoginWithUserName: userName
                                                      password: password];
    
    id callbackAction = kCallbackAction_userLogin;
    
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  callback, kNetwork_CallbackObject, 
                                  callbackAction, kNetwork_CallbackAction,
                                  kNetwork_userLoginResponse, kNetwork_SoapResponseType, 
                                  nil];
    
    [_networkService postRequestString: stringToLogin
                       andCallbackInfo: callbackInfo
                        parserDelegate: self];
    
    [callbackInfo release];
}

- (void)wantToLogoutCurrentUserWithCallback: (id<BoCPressCallback>) callback
{
    NSString *stringToLogout = [_requestFormatService requestStringWithRequireType: kNetwork_userLogoutRequest
                                                                 andArgumentString: @" "];
    
    id callbackAction = kCallbackAction_userLogout;
    
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  callback, kNetwork_CallbackObject, 
                                  callbackAction, kNetwork_CallbackAction,
                                  kNetwork_userLogoutResponse, kNetwork_SoapResponseType, 
                                  nil];
    
    [_networkService postRequestString: stringToLogout
                       andCallbackInfo: callbackInfo
                        parserDelegate: self];
    [callbackInfo release];
}

- (void)getUserInfoFromServerWithInfo: (NSDictionary *)info 
                             callback: (id<BoCPressCallback>)callback
{
    NSString *stringToGetUserInfo = [_requestFormatService requestStringWithRequireType: kNetwork_getUserInfoRequest
                                                                      andArgumentString: @" "];
    
    id callbackAction = kCallbackAction_updateUserInfo;
    
    NSMutableDictionary *callbackInfo = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                         callback, kNetwork_CallbackObject,
                                         callbackAction, kNetwork_CallbackAction,
                                         kNetwork_getUserInfoResponse, kNetwork_SoapResponseType,
                                         nil];
    if (info)
    {
        [callbackInfo setObject: info 
                         forKey: @"info"];
    }
    
    [_networkService postRequestString: stringToGetUserInfo
                       andCallbackInfo: callbackInfo
                        parserDelegate: self];
    [callbackInfo release];
}

#pragma mark - register

- (NSString *)stringToRegisterWithEmail: (NSString *)email 
                               password: (NSString *)password
{
    NSString *solidInfoString = [_configurationService queryConfigurationWithTag:kBoCPress_Configuration_SolidInfoString];
    solidInfoString = [solidInfoString stringByAppendingString:formatXMLValueAndKey(email, @"email")];
    solidInfoString = [solidInfoString stringByAppendingString:formatXMLValueAndKey(password, @"passwd")];
    
    appendResolvedStringsToString(solidInfoString, 2);
    
    
    NSString *templateString = [_configurationService queryConfigurationWithTag:kSoapConfiguration_SoapXMLTemplateString];    
    NSString *argString = @" ";
    
    return [NSString stringWithFormat:templateString, kNetwork_NormalAccountRegister, solidInfoString, argString, kNetwork_NormalAccountRegister];
}

- (void)registerNormalAccountWithEmail: (NSString *)email
                              password: (NSString *)password 
                              callback: (id<BoCPressCallback>)callback
{
    NSString *stringToRegister = [self stringToRegisterWithEmail: email
                                                        password: password];
    
    id callbackAction = kCallbackAction_registerNormalAccount;
    
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  callback, kNetwork_CallbackObject, 
                                  callbackAction, kNetwork_CallbackAction,
                                  kNetwork_NormalAccountRegisterResponse, kNetwork_SoapResponseType, 
                                  nil];
    
    [_networkService postRequestString: stringToRegister
                       andCallbackInfo: callbackInfo
                        parserDelegate: self];
    [callbackInfo release];
    
}

- (NSString *)stringToGetPromptMessageWithArgument: (NSString *)argument
{
    NSString *argString = formatXMLValueAndKey(argument,  @"rsvdStr1");
    return [_requestFormatService requestStringWithRequireType: kNetwork_getPromptMsg
                                             andArgumentString: argString];
}

- (void)getProtocolContentWithCallback:(id<BoCPressCallback>)callback
{
    NSString *stringToGetProtocolContent = [self stringToGetPromptMessageWithArgument:@"boc_prompt_msg_register_agreement"];
    id callbackAction = kCallbackAction_getPromptMsg;
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  callback, kNetwork_CallbackObject, 
                                  callbackAction, kNetwork_CallbackAction,
                                  kNetwork_getPromptMsgResponse, kNetwork_SoapResponseType, 
                                  nil];
    
    [_networkService postRequestString: stringToGetProtocolContent
                       andCallbackInfo: callbackInfo
                        parserDelegate: self];
    [callbackInfo release];
}

#pragma mark -  find password


- (NSString *)stringToFindPasswordWithEmail: (NSString *)email
{
    NSString *solidInfoString = [_configurationService queryConfigurationWithTag:kBoCPress_Configuration_SolidInfoString];
    solidInfoString = [solidInfoString stringByAppendingString:formatXMLValueAndKey(email, @"email")];
    
    appendResolvedStringsToString(solidInfoString, 2);
    
    NSString *templateString = [_configurationService queryConfigurationWithTag:kSoapConfiguration_SoapXMLTemplateString];    
    NSString *argString = @" ";
    
    return [NSString stringWithFormat:templateString, kNetwork_FindUserPasswordRequest, solidInfoString, argString, kNetwork_FindUserPasswordRequest];
    
}

- (void)wantToResetPasswordWithEmail:(NSString *)email 
                            callback:(id<BoCPressCallback>)callback
{
    NSString *stringToFindPassword = [self stringToFindPasswordWithEmail:email];
    
    id callbackAction = kCallbackAction_findUserPassword;
    
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  callback, kNetwork_CallbackObject, 
                                  callbackAction, kNetwork_CallbackAction,
                                  kNetwork_FindUserPasswordResponse, kNetwork_SoapResponseType, 
                                  nil];
    
    [_networkService postRequestString: stringToFindPassword
                       andCallbackInfo: callbackInfo
                        parserDelegate: self];
    [callbackInfo release];
    
}

#pragma mark - change password

- (void)changeOldPassword:(NSString *)oldPassword 
            toNewPassword:(NSString *)newPassword
                 callback:(id<BoCPressCallback>)callback
{
    NSString *stringToChangePassword = [_requestFormatService stringToChangePasswordWithOldPassword: oldPassword
                                                                                        newPassword: newPassword];
    
    id callbackAction = kCallbackAction_changeUserPassword;
    
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  callback, kNetwork_CallbackObject, 
                                  callbackAction, kNetwork_CallbackAction,
                                  kNetwork_ChangeUserPasswordResponse, kNetwork_SoapResponseType, 
                                  nil];
    
    [_networkService postRequestString: stringToChangePassword
                       andCallbackInfo: callbackInfo
                        parserDelegate: self];
    [callbackInfo release];
}

- (void)getPromptMessageWithArgument: (NSString *)argument 
                            callback: (id<BoCPressCallback>)callback
{
    NSString *stringToGetPrompt = [self stringToGetPromptMessageWithArgument:argument];
    id callbackAction = kCallbackAction_getPromptMsg;
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  callback, kNetwork_CallbackObject, 
                                  callbackAction, kNetwork_CallbackAction,
                                  kNetwork_getPromptMsgResponse, kNetwork_SoapResponseType, 
                                  nil];
    
    [_networkService postRequestString: stringToGetPrompt
                       andCallbackInfo: callbackInfo
                        parserDelegate: self];
    [callbackInfo release];
    
}

- (id)identity
{
    return BoCPressAccountServiceID;
}

@end

NSString * const BoCPressAccountServiceID = @"com.bocpress.service.account";

