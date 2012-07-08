#import "SqliteDatabase.h"

#import "SQLStatement.h"

#import "SqliteStatement.h"

@implementation SqliteDatabase

@synthesize filePath = _filePath;

- (SqliteDatabase *)initWithFilePath: (NSString *)filePath
{
    
    self = [super init];
    if (self)
    {
        _filePath = filePath;
    }
    
    return self;
    
}

- (id<SQLStatement>)prepareStatementForSQL: (NSString *)sql
{
    
    SqliteStatement *statement = [[[SqliteStatement alloc] initWithSQLDatabase: self forSQL: sql] autorelease];
    
    return statement;
    
}

@end
