#import <Foundation/Foundation.h>

#import "SQLDatabase.h"
#import "SQLStatement.h"

#import "SqliteDatabase.h"

#include <sqlite3.h>
//#include "/usr/include/sqlite3.h"

@interface SqliteStatement : NSObject<SQLStatement>
{
    
    SqliteDatabase *_database;
    
    NSString *_sql;
    
    NSMutableArray *_statements;
    
    sqlite3 *_rawConnection;
    
    int _nextStatement;

}

- (SqliteStatement *)initWithSQLDatabase: (SqliteDatabase *)database forSQL: (NSString *)sql;

- (sqlite3 *)rawConnection;

@end
