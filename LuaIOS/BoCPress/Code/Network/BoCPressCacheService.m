//
//  BoCPressCacheService.m
//  BoCPress
//
//  Created by E-Reach Administrator on 9/23/11.
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

#import "BoCPressCacheService.h"

#import "BoCPressConstant.h"

#import "SqliteDatabase.h"
#import "SqliteDatabase(ApplicationDirectories).h"

#import "BoCPressSoapXMLParser.h"

@implementation BoCPressCacheService

@synthesize invalidTimeInterval = _invalidTimeInterval;

#pragma mark - save && load object 

static void saveObjectToFileSystem(id object, NSString *filePath)
{
    [NSKeyedArchiver archiveRootObject:object toFile:filePath];
}

static id loadObjectFromFileSystem(NSString *filePath)
{
    
    return [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
}

static void scheduleCache(NSString* dataBaseName, NSString *tableName)
{
    NSLog(@"schdule!");
    
    @autoreleasepool 
    {
        
        NSString *sqlString = [NSString stringWithFormat:@"select FilePath from %@ where TimeStamp < ?", tableName];
        
        id<SQLDatabase> cacheDatabase = [[SqliteDatabase alloc] initWithFilePathInDocumentDirectoryInIOS:dataBaseName];
        
        id<SQLStatement> queryStatement = [cacheDatabase prepareStatementForSQL: sqlString];
        
        NSTimeInterval timeIntervalSinceReferencedDate = [NSDate timeIntervalSinceReferenceDate];
        
        [queryStatement setFloatParameter:1 withFloat: timeIntervalSinceReferencedDate - kSecondsCountOfSevenDays];
        [queryStatement execute];
        
        id<SQLResultSet> resultSet = [queryStatement currentResultSet];
        
        id<SQLRecord> recordLooper = nil;
        NSString *avatarURLCacheFileLooper = nil;
        
        NSFileManager *defaultFileManager = [NSFileManager defaultManager];
        NSError *error = nil;
        
        while ([resultSet moveCursorToNextRecord])
        {
            recordLooper = [resultSet currentRecord];
            avatarURLCacheFileLooper = [recordLooper stringValueNamed: @"FilePath"];
            [defaultFileManager removeItemAtPath: avatarURLCacheFileLooper 
                                           error: &error];
        }
                
        sqlString = [NSString stringWithFormat:@"delete from %@ where imageTimeStamp < ?", tableName];
        id<SQLStatement> deleteStatement = [cacheDatabase prepareStatementForSQL:sqlString];
        
        [deleteStatement setFloatParameter:1 withFloat: timeIntervalSinceReferencedDate - kSecondsCountOfSevenDays];
        
        [deleteStatement execute];
        
        [cacheDatabase release];
        
    }
}

#pragma mark - store and get cached object
static void storeSingleIdentifiedObject(NSString *documentsDirectory, 
                                        id objectIdentity,
                                        id object,
                                        id callbackAction)
{
    id<SQLDatabase> cacheDatabase = [[SqliteDatabase alloc] initWithFilePathInDocumentDirectoryInIOS:kBoCPress_CacheDatabasePath];
    NSTimeInterval currentTimeInterval = [NSDate timeIntervalSinceReferenceDate];
    
    if (objectIdentity)
    {
        NSString*  sqlString = @"insert or replace into CacheSingleIdentitedObjectPool(TimeStamp, FilePath, CallbackAction, Identity) values(?, ?, ?, ?)";
        
        id<SQLStatement> queryStatement = [cacheDatabase prepareStatementForSQL:sqlString];
        
        NSString *fileName = [NSString stringWithFormat:@"%@_%@", callbackAction, objectIdentity];
        
        NSString *filePath = [documentsDirectory stringByAppendingPathComponent:fileName];
        
        [queryStatement setStringParameter:1 withFloat:currentTimeInterval];
        [queryStatement setStringParameter:2 withString: filePath];
        [queryStatement setStringParameter:3 withString:callbackAction];
        [queryStatement setStringParameter:4 withString:objectIdentity];
        
        [queryStatement execute];
        [cacheDatabase release];
        
        saveObjectToFileSystem(object, filePath);
        
    }else
    {
        NSString*  sqlString = @"insert or replace into CacheSingleIdentitedObjectPool(TimeStamp, FilePath, CallbackAction) values(?, ?, ?)";
        
        id<SQLStatement> queryStatement = [cacheDatabase prepareStatementForSQL:sqlString];
        
        NSString *fileName = [NSString stringWithFormat:@"%@_%@", callbackAction, objectIdentity];
        
        NSString *filePath = [documentsDirectory stringByAppendingPathComponent:fileName];
        
        [queryStatement setStringParameter:1 withFloat:currentTimeInterval];
        [queryStatement setStringParameter:2 withString: filePath];
        [queryStatement setStringParameter:3 withString:callbackAction];
        
        [queryStatement execute];
        [cacheDatabase release];
        
        saveObjectToFileSystem(object, filePath);
    }
}

static void storeRangedIdentifiedObject(NSString *documentsDirectory,
                                        id objectIdentity,
                                        id object,
                                        id callbackAction,
                                        id info)
{
    id<SQLDatabase> cacheDatabase = [[SqliteDatabase alloc] initWithFilePathInDocumentDirectoryInIOS:kBoCPress_CacheDatabasePath];
    NSTimeInterval currentTimeInterval = [NSDate timeIntervalSinceReferenceDate];
    NSUInteger rangeFrom = [[info objectForKey:kNetwork_RangeFrom] intValue];
    NSUInteger rangeTo = [[info objectForKey:kNetwork_RangeTo] intValue];
    
    if (objectIdentity)
    {
        NSString*  sqlString = @"insert or replace into CacheRangedIdentitedObjectPool(TimeStamp, FilePath, CallbackAction, Identity, RangeFrom, RangeTo) values(?, ?, ?, ?, ?, ?)";
        
        id<SQLStatement> queryStatement = [cacheDatabase prepareStatementForSQL:sqlString];
        
        NSString *fileName = [NSString stringWithFormat:@"%@_%@_%d_%d", callbackAction, objectIdentity, rangeFrom, rangeTo];
        
        NSString *filePath = [documentsDirectory stringByAppendingPathComponent:fileName];
        
        [queryStatement setStringParameter:1 withFloat:currentTimeInterval];
        [queryStatement setStringParameter:2 withString: filePath];
        [queryStatement setStringParameter:3 withString:callbackAction];
        [queryStatement setStringParameter:4 withString:objectIdentity];
        [queryStatement setIntegerParameter:5 withInteger:rangeFrom];
        [queryStatement setIntegerParameter:6 withInteger:rangeTo];
        
        [queryStatement execute];
        [cacheDatabase release];
        
        saveObjectToFileSystem(object, filePath);
    }else
    {
        NSString*  sqlString = @"insert or replace into CacheRangedIdentitedObjectPool(TimeStamp, FilePath, CallbackAction, RangeFrom, RangeTo) values(?, ?, ?, ?, ?)";
        
        id<SQLStatement> queryStatement = [cacheDatabase prepareStatementForSQL:sqlString];
        
        NSString *fileName = [NSString stringWithFormat:@"%@_%d_%d", callbackAction, rangeFrom, rangeTo];
        
        NSString *filePath = [documentsDirectory stringByAppendingPathComponent:fileName];
        
        [queryStatement setStringParameter:1 withFloat:currentTimeInterval];
        [queryStatement setStringParameter:2 withString: filePath];
        [queryStatement setStringParameter:3 withString:callbackAction];
        [queryStatement setIntegerParameter:4 withInteger:rangeFrom];
        [queryStatement setIntegerParameter:5 withInteger:rangeTo];
        
        [queryStatement execute];
        [cacheDatabase release];
        
        saveObjectToFileSystem(object, filePath);
    }
}

- (void)storeObject: (id)object 
           withInfo: (id)info
{
    //run schedule
    scheduleCache(kBoCPress_CacheDatabasePath, @"CacheRangedIdentitedObjectPool");
    
    
    id cachedObjectType = [info objectForKey:kNetwork_FileType];
    id callbackAction = [info objectForKey:kNetwork_CallbackAction];
    id objectIdentity = [info objectForKey:kBoCPress_Global_ObjectID];
    
    NSArray*    paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    
    if ([cachedObjectType isEqual:kNetwork_SingleIdentifiedObject])
    {
        storeSingleIdentifiedObject(documentsDirectory, objectIdentity, object, callbackAction);
        
    }else if([cachedObjectType isEqual:kNetwork_RangedIdentifiedObject])
    {
        storeRangedIdentifiedObject(documentsDirectory, objectIdentity, object, callbackAction, info);
    }else
    {
        NSLog(@"Unknow type in callbackAction:%@", callbackAction);
    }
    
}
static void deleteRecordInDatabaseWithArguments(NSString *tableName, NSString *columnName, NSString *columnValue)
{
    NSString *sqlString = [NSString stringWithFormat: @"delete from %@ where %@ = %@", tableName, columnName, columnValue];
    
    id<SQLDatabase> cacheDatabase = [[SqliteDatabase alloc] initWithFilePathInDocumentDirectoryInIOS:kBoCPress_CacheDatabasePath];
    id<SQLStatement> deleteStatement = [cacheDatabase prepareStatementForSQL:sqlString];
    
    if(![deleteStatement execute])
    {
        NSLog(@"fail to delete %@ = %@ in table:%@", columnName, columnValue, tableName);
    }
    
    [cacheDatabase release];
    
}

static id findSingleIdentifiedObjectInDatabase(id callbackAction, id identity)
{
    NSString *sqlString = @"select FilePath from CacheSingleIdentitedObjectPool where CallbackAction=?";
    
    if (identity)
    {
        sqlString = @"select FilePath from CacheSingleIdentitedObjectPool where CallbackAction=? and Identity=?";
    }
    
    id<SQLDatabase> cacheDatabase = [[SqliteDatabase alloc] initWithFilePathInDocumentDirectoryInIOS:kBoCPress_CacheDatabasePath];
    
    id<SQLStatement> queryStatement = [cacheDatabase prepareStatementForSQL:sqlString];
    
    [queryStatement setStringParameter:1 withString: callbackAction];
    
    if (identity)
    {
        [queryStatement setStringParameter:2 withString: identity];
    }
    
    [queryStatement execute];
    
    id<SQLResultSet> resultSet = [queryStatement currentResultSet];
    [resultSet moveCursorToNextRecord];
    id<SQLRecord> record = [resultSet currentRecord];
    
    NSString *filePath = [record stringValueNamed:@"FilePath"];
    
    //    NSLog(@"found filePath: %@", filePath);
    
    
    [cacheDatabase release];
    
    //No record
    if (filePath)
    {        
        id object = loadObjectFromFileSystem(filePath);
        if (object)
        {
            return object;
        }else
        {
            //Filepath was invalid, so delete the record;
            deleteRecordInDatabaseWithArguments(@"CacheSingleIdentitedObjectPool", @"FilePath", filePath);
            return nil;
        }
    }else
    {
        return nil;
    }
    
}

static id findRangedIdentifiedObjectInDatabase(id callbackAction,
                                               id identity,
                                               NSInteger rangeFrom,
                                               NSInteger rangeTo)
{
    NSString *sqlString = @"select FilePath from CacheRangedIdentitedObjectPool where CallbackAction=? and RangeFrom=? and RangeTo=?";
    if(identity)
    {
        sqlString = @"select FilePath from CacheRangedIdentitedObjectPool where CallbackAction=? and RangeFrom=? and RangeTo=? and Identity=?";
    }
    
    
    id<SQLDatabase> cacheDatabase = [[SqliteDatabase alloc] initWithFilePathInDocumentDirectoryInIOS:kBoCPress_CacheDatabasePath];
    id<SQLStatement> queryStatement = [cacheDatabase prepareStatementForSQL:sqlString];
    
    [queryStatement setStringParameter:1 withString:callbackAction];
    [queryStatement setIntegerParameter:2 withInteger:rangeFrom];
    [queryStatement setIntegerParameter:3 withInteger:rangeTo];
    
    if (identity)
    {
        [queryStatement setStringParameter:4 withString:identity];
    }
    
    [queryStatement execute];
    id<SQLResultSet> resultSet = [queryStatement currentResultSet];
    [resultSet moveCursorToNextRecord];
    id<SQLRecord> record = [resultSet currentRecord];
    
    NSString *filePath = [record stringValueNamed:@"FilePath"];
    
    //    NSLog(@"found filePath: %@", filePath);
    
    
    [cacheDatabase release];
    
    //No record
    if (filePath)
    {        
        id object = loadObjectFromFileSystem(filePath);
        if (object)
        {
            return object;
        }else
        {
            //Filepath was invalid, so delete the record;
            deleteRecordInDatabaseWithArguments(@"CacheRangedIdentitedObjectPool", @"FilePath", filePath);
            return nil;
        }
    }else
    {
        return nil;
    }
    
}


- (id)cachedObjectWithCallbackInfo: (id)callbackInfo
{
    if (!callbackInfo)
    {
        return nil;
    }
    //    NSString *requestString = [_requestStrings objectForKey:callbackAction];
    id cachedObjectType = [callbackInfo objectForKey:kNetwork_FileType];
    id callbackAction = [callbackInfo objectForKey:kNetwork_CallbackAction];
    id objectIdentity = [callbackInfo objectForKey:kBoCPress_Global_ObjectID];
    
    if ([cachedObjectType isEqual:kNetwork_SingleIdentifiedObject])
    {
        return findSingleIdentifiedObjectInDatabase(callbackAction, objectIdentity);
        
    }else if([cachedObjectType isEqual:kNetwork_RangedIdentifiedObject])
    {
        NSInteger rangeFrom = [[callbackInfo objectForKey:kNetwork_RangeFrom] integerValue];
        NSInteger rangeTo = [[callbackInfo objectForKey:kNetwork_RangeTo] integerValue];
        
        return findRangedIdentifiedObjectInDatabase(callbackAction, objectIdentity, rangeFrom, rangeTo);
    }
    
    NSLog(@"unkwon file type of callbackAction:%@", callbackAction);
    
    return nil;
    
}

- (id)identity
{
    return BoCPressCacheServiceID;
}

@end

NSString * const BoCPressCacheServiceID = @"com.bocpress.coreservice.cache";
