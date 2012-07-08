//
//  BoCPressRequestStringFormatService.h
//  BoCPress
//
//  Created by E-Reach Administrator on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSIdentifiedObject.h"

@protocol BoCPressUserInfoService;
@protocol BoCPressConfigurationService;
@protocol BoCPressNews;

@protocol BoCPressRequestStringFormatService<NSIdentifiedObject>

@required
- (NSString *)requestStringWithRequireType: (NSString *)requireType 
                         andArgumentString: (NSString *)argString;

- (NSString *)getPostListRequestStringWithBegin: (NSUInteger)begin 
                                       columnID: (id)columnID
                                            end: (NSUInteger)end
                                    requireType: (NSString *)requireType;

- (NSString *)getPostRequestStringWithNews: (id<BoCPressNews>) news
                                   logInfo: (id)logInfo;

- (NSString *)stringToChangePasswordWithOldPassword: (NSString *)oldPassword 
                                        newPassword: (NSString *)newPassword;

@end

@interface BoCPressRequestStringFormatService : NSObject<BoCPressRequestStringFormatService>
{
@private
    id<BoCPressUserInfoService> _userInfoService;
    id<BoCPressConfigurationService> _configurationService;
}

- (id)initWithUserInfoService: (id<BoCPressUserInfoService>)userInfoService
         configurationService: (id<BoCPressConfigurationService>)configurationService;
@end

extern NSString * const BoCPressRequestStringFormatServiceID;