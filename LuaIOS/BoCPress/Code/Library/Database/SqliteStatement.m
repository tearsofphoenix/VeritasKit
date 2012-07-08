#import "SQLStatement.h"

#import "SqliteDatabase.h"
#import "SqliteStatement.h"

#import "SqliteSimpleStatement.h"

#include <sqlite3.h>

@implementation SqliteStatement

- (SqliteStatement *)initWithSQLDatabase: (SqliteDatabase *)database forSQL: (NSString *)sql
{
    
    self = [super init];
    if (self)
    {
        
        _database = database;
        
        _sql = sql;
        
        _nextStatement = 0;
        
        _rawConnection = NULL;
        
        int status = sqlite3_open([[_database filePath] UTF8String], &_rawConnection);
        while (status == SQLITE_BUSY)
        {
            
            sqlite3_close(_rawConnection);        
            
            [NSThread sleepForTimeInterval:0.001];
            
            status = sqlite3_open([[_database filePath] UTF8String], &_rawConnection);
            
        }
        
        if(status != SQLITE_OK)
        {
            sqlite3_close(_rawConnection);        
        }
        
        const char *sqlStatements = [sql UTF8String];
        const char *previousStatements = NULL;
        _statements = [[NSMutableArray alloc] init];
        
        // TODO Infinite looping
        while (sqlStatements && (*sqlStatements) && (previousStatements != sqlStatements))
        {
            
            previousStatements = sqlStatements;
            
            SqliteSimpleStatement *statement = 
                [[SqliteSimpleStatement alloc] initWithUTF8String: sqlStatements 
                                                        managedBy: self 
                                                    returningRest: &sqlStatements];
            [_statements addObject: statement];
            
            [statement release];
        }
        
    }

    return self;
    
}

- (sqlite3 *)rawConnection
{
    return _rawConnection;
}

- (NSUInteger)parametersCount
{
    
    int count = 0;
    
    int looper = 0;
    while (looper < [_statements count])
    {
        
        SqliteSimpleStatement *statement = (SqliteSimpleStatement *)[_statements objectAtIndex: looper];
        
        count += [statement parametersCount];
        
        ++looper;
    }
    
    return count;
}

- (BOOL)setStringParameter: (NSUInteger)index withString: (NSString *)value
{
    
    int looper = 0;
    
    if (looper < [_statements count])
    {
        
        SqliteStatement *statement = (SqliteStatement *)[_statements objectAtIndex:looper];
        while ((looper < [_statements count]) && 
            (index > [statement parametersCount]))
        {
            
            index -= [statement parametersCount];
            
            ++looper;
        }
        
        if (looper < [_statements count])
        {
            
            [statement setStringParameter: index withString: value];
            
            return YES;
        }
        else
        {
            return NO;
        }
        
    }
    else
    {
        return NO;
    }
    
}

- (BOOL)setStringParameter: (NSUInteger)index withFloat: (double)value
{
    
    int looper = 0;
    
    if (looper < [_statements count])
    {
        
        SqliteStatement *statement = (SqliteStatement *)[_statements objectAtIndex:looper];
        while ((looper < [_statements count]) && 
               (index > [statement parametersCount]))
        {
            
            index -= [statement parametersCount];
            
            ++looper;
        }
        
        if (looper < [_statements count])
        {
            
            [statement setStringParameter: index withFloat: value];
            
            return YES;
        }
        else
        {
            return NO;
        }
        
    }
    else
    {
        return NO;
    }
    
}

- (BOOL)setStringParameter: (NSUInteger)index withInteger: (long long)value
{
    
    int looper = 0;
    
    if (looper < [_statements count])
    {
        
        SqliteStatement *statement = (SqliteStatement *)[_statements objectAtIndex:looper];
        while ((looper < [_statements count]) && 
               (index > [statement parametersCount]))
        {
            
            index -= [statement parametersCount];
            
            ++looper;
        }
        
        if (looper < [_statements count])
        {
            
            [statement setStringParameter: index withInteger: value];
            
            return YES;
        }
        else
        {
            return NO;
        }
        
    }
    else
    {
        return NO;
    }
    
}

- (BOOL)setFloatParameter: (NSUInteger)index withString: (NSString *)value
{
    
    int looper = 0;
    
    if (looper < [_statements count])
    {
        
        SqliteStatement *statement = (SqliteStatement *)[_statements objectAtIndex:looper];
        while ((looper < [_statements count]) && 
               (index > [statement parametersCount]))
        {
            
            index -= [statement parametersCount];
            
            ++looper;
        }
        
        if (looper < [_statements count])
        {
            
            [statement setFloatParameter: index withString: value];
            
            return YES;
        }
        else
        {
            return NO;
        }
        
    }
    else
    {
        return NO;
    }
    
}

- (BOOL)setFloatParameter: (NSUInteger)index withFloat: (double)value
{
    
    int looper = 0;
    
    if (looper < [_statements count])
    {
        
        SqliteStatement *statement = (SqliteStatement *)[_statements objectAtIndex:looper];
        while ((looper < [_statements count]) && 
               (index > [statement parametersCount]))
        {
            
            index -= [statement parametersCount];
            
            ++looper;
        }
        
        if (looper < [_statements count])
        {
            
            [statement setFloatParameter: index withFloat: value];
            
            return YES;
        }
        else
        {
            return NO;
        }
        
    }
    else
    {
        return NO;
    }
    
}

- (BOOL)setFloatParameter: (NSUInteger)index withInteger: (long long)value
{
    
    int looper = 0;
    
    if (looper < [_statements count])
    {
        
        SqliteStatement *statement = (SqliteStatement *)[_statements objectAtIndex:looper];
        while ((looper < [_statements count]) && 
               (index > [statement parametersCount]))
        {
            
            index -= [statement parametersCount];
            
            ++looper;
        }
        
        if (looper < [_statements count])
        {
            
            [statement setFloatParameter: index withInteger: value];
            
            return YES;
        }
        else
        {
            return NO;
        }
        
    }
    else
    {
        return NO;
    }
    
}

- (BOOL)setIntegerParameter: (NSUInteger)index withString: (NSString *)value
{
    
    int looper = 0;
    
    if (looper < [_statements count])
    {
        
        SqliteStatement *statement = (SqliteStatement *)[_statements objectAtIndex:looper];
        while ((looper < [_statements count]) && 
               (index > [statement parametersCount]))
        {
            
            index -= [statement parametersCount];
            
            ++looper;
        }
        
        if (looper < [_statements count])
        {
            
            [statement setIntegerParameter: index withString: value];
            
            return YES;
        }
        else
        {
            return NO;
        }
        
    }
    else
    {
        return NO;
    }
    
}

- (BOOL)setIntegerParameter: (NSUInteger)index withFloat: (double)value
{
    
    int looper = 0;
    
    if (looper < [_statements count])
    {
        
        SqliteStatement *statement = (SqliteStatement *)[_statements objectAtIndex:looper];
        while ((looper < [_statements count]) && 
               (index > [statement parametersCount]))
        {
            
            index -= [statement parametersCount];
            
            ++looper;
        }
        
        if (looper < [_statements count])
        {
            
            [statement setIntegerParameter: index withFloat: value];
            
            return YES;
        }
        else
        {
            return NO;
        }
        
    }
    else
    {
        return NO;
    }
    
}

- (BOOL)setIntegerParameter: (NSUInteger)index withInteger: (long long)value
{
    
    int looper = 0;
    
    if (looper < [_statements count])
    {
        
        SqliteStatement *statement = (SqliteStatement *)[_statements objectAtIndex:looper];
        while ((looper < [_statements count]) && 
               (index > [statement parametersCount]))
        {
            
            index -= [statement parametersCount];
            
            ++looper;
        }
        
        if (looper < [_statements count])
        {
            
            [statement setIntegerParameter: index withInteger: value];
            
            return YES;
        }
        else
        {
            return NO;
        }
        
    }
    else
    {
        return NO;
    }
    
}

- (BOOL)execute
{
    
    if (_nextStatement == 0)
    {
        return [self continueExecution];
    }
    else
    {
        return NO;
    }
    
}

- (id<SQLResultSet>)currentResultSet
{
    
    if ((_nextStatement > 0) && (_nextStatement <= [_statements count]))
    {
        
        SqliteSimpleStatement *statement = [_statements objectAtIndex: _nextStatement - 1];
        
        return [statement resultSet];
        
    }
    else
    {
        return nil;
    }
    
}

- (BOOL)continueExecution
{
    
    if (_nextStatement < [_statements count])
    {
        
        SqliteSimpleStatement * currentStatement2 = [_statements objectAtIndex: _nextStatement];
        
        ++_nextStatement;
        
        return [currentStatement2 execute];
        
    }
    else
    {
        return NO;
    }

}

- (void)dealloc
{
//    while ([_statements count] > 0)
//    {
//        
//        SqliteSimpleStatement *simpleStatement = [_statements objectAtIndex: 0];
//        [_statements removeObjectAtIndex: 0];
//        
//        [simpleStatement release];
//        
//    }
    
    [_statements release];

    if (_rawConnection)
    {
        sqlite3_close(_rawConnection);    
    }

    [super dealloc];
    
}

@end
