#import <Foundation/Foundation.h>

#import "SqliteStatement.h"

#import "SqliteResultSet.h"

@class SqliteStatement;

@interface SqliteSimpleStatement : NSObject 
{
    
    sqlite3_stmt *_rawStatement;
    BOOL _executed;
    SqliteResultSet *_resultSet;
    SqliteStatement *_statement;
 
}

- (SqliteSimpleStatement *)initWithUTF8String: (const char *)string 
                                    managedBy: (SqliteStatement *)statement 
                                returningRest: (const char **)rest;

- (sqlite3_stmt *)rawStatement;

- (BOOL)setStringParameter: (NSUInteger)index withString: (NSString *)value;
- (BOOL)setStringParameter: (NSUInteger)index withFloat: (double)value;
- (BOOL)setStringParameter: (NSUInteger)index withInteger: (long long)value;

- (BOOL)setFloatParameter: (NSUInteger)index withString: (NSString *)string;
- (BOOL)setFloatParameter: (NSUInteger)index withFloat: (double)value;
- (BOOL)setFloatParameter: (NSUInteger)index withInteger: (long long)value;

- (BOOL)setIntegerParameter: (NSUInteger)index withString: (NSString *)string;
- (BOOL)setIntegerParameter: (NSUInteger)index withFloat: (double)value;
- (BOOL)setIntegerParameter: (NSUInteger)index withInteger: (long long)value;

- (NSUInteger)parametersCount;

- (BOOL)execute;

- (SqliteResultSet *)resultSet;

@end
