#import "SqliteSimpleStatement.h"

#include <sqlite3.h>

#import "SqliteStatement.h"


@implementation SqliteSimpleStatement

- (SqliteSimpleStatement *)initWithUTF8String: (const char *)string 
                                    managedBy: (SqliteStatement *)statement 
                                returningRest: (const char **)rest
{
    
    self = [super init];
    
    if (self)
    {
        
        _rawStatement = NULL;
        
        if (sqlite3_prepare_v2([statement rawConnection], string, -1, &_rawStatement, rest) == SQLITE_OK)
        {
            
        }
        
        _statement = statement;
        
        _executed = NO;
        
        _resultSet = nil;
        
    }
    
    return self;
    
}

- (BOOL)setStringParameter: (NSUInteger)index withString: (NSString *)value
{
    
    if (_executed)
    {
        return NO;
    }
    else if ((value > 0) && (index <= sqlite3_bind_parameter_count(_rawStatement)))
    {
        return sqlite3_bind_text(_rawStatement, index, [value UTF8String], -1, NULL) == SQLITE_OK;
    }
    else
    {
        return NO;
    }
    
}

- (BOOL)setStringParameter: (NSUInteger)index withFloat: (double)value
{
    
    if (_executed)
    {
        return NO;
    }
    else if ((value > 0) && (index <= sqlite3_bind_parameter_count(_rawStatement)))
    {
        NSString *string = [NSString stringWithFormat: @"%f", value];
        return sqlite3_bind_text(_rawStatement, index, [string UTF8String], -1, NULL) == SQLITE_OK;
    }
    else
    {
        return NO;
    }
    
}

- (BOOL)setStringParameter: (NSUInteger)index withInteger: (long long)value
{
    
    if (_executed)
    {
        return NO;
    }
    else if ((index > 0) && (index <= sqlite3_bind_parameter_count(_rawStatement)))
    {
        NSString *string = [NSString stringWithFormat: @"%d", value];
        return sqlite3_bind_text(_rawStatement, index, [string UTF8String], -1, NULL) == SQLITE_OK;
    }
    else
    {
        return NO;
    }
 
}

- (BOOL)setFloatParameter: (NSUInteger)index withString: (NSString *)value
{
    
    if (_executed)
    {
        return NO;
    }
    else if ((index > 0) && (index <= sqlite3_bind_parameter_count(_rawStatement)))
    {
        return sqlite3_bind_double(_rawStatement, index, [value doubleValue]) == SQLITE_OK;
    }
    else
    {
        return NO;
    }
    
}

- (BOOL)setFloatParameter: (NSUInteger)index withFloat: (double)value
{
    
    if (_executed)
    {
        return NO;
    }
    else if ((index > 0) && (index <= sqlite3_bind_parameter_count(_rawStatement)))
    {
        return sqlite3_bind_double(_rawStatement, index, value) == SQLITE_OK;
    }
    else
    {
        return NO;
    }
    
}

- (BOOL)setFloatParameter: (NSUInteger)index withInteger: (long long)value
{
    
    if (_executed)
    {
        return NO;
    }
    else if ((index > 0) && (index <= sqlite3_bind_parameter_count(_rawStatement)))
    {
        return sqlite3_bind_double(_rawStatement, index, value) == SQLITE_OK;
    }
    else
    {
        return NO;
    }
    
}

- (BOOL)setIntegerParameter: (NSUInteger)index withString: (NSString *)value
{

    if (_executed)
    {
        return NO;
    }
    else if ((index > 0) && (index <= sqlite3_bind_parameter_count(_rawStatement)))
    {
        return sqlite3_bind_int64(_rawStatement, index, [value longLongValue]) == SQLITE_OK;
    }
    else
    {
        return NO;
    }
    
}

- (BOOL)setIntegerParameter: (NSUInteger)index withFloat: (double)value
{
 
    if (_executed)
    {
        return NO;
    }
    else if ((index > 0) && (index <= sqlite3_bind_parameter_count(_rawStatement)))
    {
        return sqlite3_bind_int64(_rawStatement, index, (long long)value) == SQLITE_OK;
    }
    else
    {
        return NO;
    }
    
}

- (BOOL)setIntegerParameter: (NSUInteger)index withInteger: (long long)value
{
    
    if (_executed)
    {
        return NO;
    }
    else if ((index > 0) && (index <= sqlite3_bind_parameter_count(_rawStatement)))
    {
        return sqlite3_bind_int64(_rawStatement, index, value) == SQLITE_OK;
    }
    else
    {
        return NO;
    }
    
}

- (NSUInteger)parametersCount
{
    return sqlite3_bind_parameter_count(_rawStatement);
}

- (sqlite3_stmt *)rawStatement
{
    return _rawStatement;
}

- (BOOL)execute
{
    
    _executed = YES;
    
    if (sqlite3_column_count(_rawStatement) > 0)
    {
        _resultSet = [[[SqliteResultSet alloc] initWithSimpleStatement: self] autorelease];
    }
    else
    {
        sqlite3_step(_rawStatement);
    }
    
    return YES;
}

- (SqliteResultSet *)resultSet
{
    
    if (_executed)
    {
        return _resultSet;
    }
    else
    {
        return nil;
    }
    
}

- (void)dealloc
{
    
    if (_rawStatement)
    {
        sqlite3_finalize(_rawStatement);
    }

    [super dealloc];
    
}

@end
