//
//  BoCPressUserInfoService.m
//  BoCPress
//
//  Created by LeixSnake on 10/9/11.
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

#import "BoCPressUserInfoService.h"

#import "SqliteDatabase.h"
#import "SqliteDatabase(ApplicationDirectories).h"

#import "BoCPressConstant.h"

@implementation BoCPressUserInfoService

- (void)storeUserInfo:(id)userInfo
{
    id userID = [userInfo objectForKey:kBoCPress_Global_ObjectID];
    id passwordMD5 = [userInfo objectForKey:@"password"];
    id deadLine = [userInfo objectForKey:kUserInfo_PAY_END_DATE];
    
    if (userID && passwordMD5 && deadLine)
    {
        [self clearUserInfo];
    }else
    {
        NSLog(@"storeUserInfo error:%@", userInfo);
    }
    id<SQLDatabase> userInfoDatabase = [[SqliteDatabase alloc] initWithFilePathInDocumentDirectoryInIOS:kBoCPress_CacheDatabasePath];
    NSTimeInterval currentTimeInterval = [NSDate timeIntervalSinceReferenceDate];
    
    NSString*  sqlString = @"insert or replace into UserPrivateInfo(userID, password, DeadLine, TimeStamp) values(?, ?, ?, ?)";
    
    id<SQLStatement> queryStatement = [userInfoDatabase prepareStatementForSQL:sqlString];
    
    [queryStatement setStringParameter:1 withString: userID];
    [queryStatement setStringParameter:2 withString: passwordMD5];
    [queryStatement setStringParameter:3 withString:deadLine];
    [queryStatement setStringParameter:4 withFloat:currentTimeInterval];
    
    [queryStatement execute];
    [userInfoDatabase release];
    
    
}

- (NSString *)queryPassword
{
    NSString *sqlString = @"select password from UserPrivateInfo";
    
    
    id<SQLDatabase> userInfoDatabase = [[SqliteDatabase alloc] initWithFilePathInDocumentDirectoryInIOS:kBoCPress_CacheDatabasePath];
    id<SQLStatement> queryStatement = [userInfoDatabase prepareStatementForSQL:sqlString];
    
    [queryStatement execute];
    
    id<SQLResultSet> resultSet = [queryStatement currentResultSet];
    [resultSet moveCursorToNextRecord];
    
    id<SQLRecord> record = [resultSet currentRecord];
    
    NSString *password = [record stringValueNamed:@"password"];
    
    [userInfoDatabase release];
    
    if (!password)
    {
        password = @" ";
    }
    
    return password;
}

- (NSString *)queryUserID
{
    NSString *sqlString = @"select userID from UserPrivateInfo";
    
    id<SQLDatabase> userInfoDatabase = [[SqliteDatabase alloc] initWithFilePathInDocumentDirectoryInIOS:kBoCPress_CacheDatabasePath];
    id<SQLStatement> queryStatement = [userInfoDatabase prepareStatementForSQL:sqlString];
    
    [queryStatement execute];
    
    id<SQLResultSet> resultSet = [queryStatement currentResultSet];
    [resultSet moveCursorToNextRecord];
    
    id<SQLRecord> record = [resultSet currentRecord];
    
    NSString *userID = [record stringValueNamed:@"userID"];
    
    [userInfoDatabase release];
    if (!userID)
    {
        userID = @" ";
    }
    return userID;
}

- (void)clearUserInfo
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    id<SQLDatabase> userInfoDatabase = [[SqliteDatabase alloc] initWithFilePathInDocumentDirectoryInIOS:kBoCPress_CacheDatabasePath];
    
    id<SQLStatement> deleteStatement = [userInfoDatabase prepareStatementForSQL:@"delete from UserPrivateInfo "];
    
    [deleteStatement execute];
    
    [userInfoDatabase release];
    [pool release];    
}

- (id)userInfo
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    NSString *sqlString = @"select * from UserPrivateInfo";
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    id<SQLDatabase> userInfoDatabase = [[SqliteDatabase alloc] initWithFilePathInDocumentDirectoryInIOS:kBoCPress_CacheDatabasePath];
    id<SQLStatement> queryStatement = [userInfoDatabase prepareStatementForSQL:sqlString];
    
    [queryStatement execute];
    
    id<SQLResultSet> resultSet = [queryStatement currentResultSet];
    [resultSet moveCursorToNextRecord];
    
    id<SQLRecord> record = [resultSet currentRecord];
    
    NSString *userID = [record stringValueNamed:@"userID"];
    
    [userInfoDatabase release];
    
    NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
    
    if (userID)
    {
        [userInfo setObject:userID forKey:@"userID"];
    }else
    {
        [userInfo release];
        return nil;
    }
    
    NSString *passwordMD5 = [record stringValueNamed:@"password"];
    if (passwordMD5)
    {        
        [userInfo setObject:passwordMD5 forKey:@"password"];
    }
    
    NSString *dealLine = [record stringValueNamed:kUserInfo_PAY_END_DATE];
    
    if (dealLine)
    {
        
        [userInfo setObject:dealLine forKey:kUserInfo_PAY_END_DATE];
    }
    
    [pool release];
    return [userInfo autorelease];
}

- (void)changeUserPasswordToNewPassword:(NSString *)newPasswordMD5
{
    @autoreleasepool 
    {
        
        if(newPasswordMD5)
        {
            id<SQLDatabase> userInfoDatabase = [[SqliteDatabase alloc] initWithFilePathInDocumentDirectoryInIOS:kBoCPress_CacheDatabasePath];
            NSTimeInterval currentTimeInterval = [NSDate timeIntervalSinceReferenceDate];
            
            NSString*  sqlString = @"update UserPrivateInfo set password=?, TimeStamp=?";
            
            id<SQLStatement> queryStatement = [userInfoDatabase prepareStatementForSQL:sqlString];
            
            [queryStatement setStringParameter:1 withString: newPasswordMD5];
            [queryStatement setStringParameter:2 withFloat: currentTimeInterval];
            
            [queryStatement execute];
            [userInfoDatabase release];
        }else
        {
            //reset password
            //
            id<SQLDatabase> userInfoDatabase = [[SqliteDatabase alloc] initWithFilePathInDocumentDirectoryInIOS:kBoCPress_CacheDatabasePath];
            NSTimeInterval currentTimeInterval = [NSDate timeIntervalSinceReferenceDate];
            
            NSString*  sqlString = @"update UserPrivateInfo set password='?', TimeStamp=?";
            
            id<SQLStatement> queryStatement = [userInfoDatabase prepareStatementForSQL:sqlString];
            
            [queryStatement setStringParameter:1 withFloat: currentTimeInterval];
            
            [queryStatement execute];
            [userInfoDatabase release];
        }
        
    }
}

- (NSString *)queryEmailAddress
{
    return @" ";
}

- (NSString *)queryUserStatus
{
    return @" ";
}

- (id)identity
{
    return BoCPressUserInfoServiceID;
}

@end

NSString * const BoCPressUserInfoServiceID = @"com.bocpress.coreservice.userinfo";
