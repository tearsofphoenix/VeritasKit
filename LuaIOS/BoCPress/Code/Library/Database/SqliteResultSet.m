#import "SqliteResultSet.h"

#import "SqliteSimpleStatement.h"
#import "SqliteRecord.h"

@implementation SqliteResultSet

- (SqliteResultSet *)initWithSimpleStatement: (id)statement
{
    
    self = [super init];
    
    if (self)
    {
        
        _statement = statement;
        
        _ended = NO;
        
    }
    
    return self;
}

- (NSInteger)recordCount
{
    return -1;
}

- (NSInteger)position
{
    return _position;
}

- (id<SQLRecord>)currentRecord
{
    return _currentRecord;
}

- (NSArray *)fetchRecords
{
    
    if (_fetched)
    {
        return nil;
    }
    else
    {
        
        NSMutableArray *result = [[[NSMutableArray alloc] init] autorelease];
        
        while ([self moveCursorToNextRecord])
        {
            [result addObject: _currentRecord];
        }
        
        return result;
    }
    
}

- (BOOL)moveCursorToNextRecord
{
    return [self moveCursorBy: 1];
}

- (BOOL)moveCursorBy: (NSUInteger)offset
{
    
    _fetched = YES;
    
    sqlite3_stmt * rawStatement = [_statement rawStatement];
    
    while (offset > 0)
    {
    
        int status = sqlite3_step(rawStatement);
        if (status != SQLITE_ROW) 
        {
            
            _ended = YES;
            
            return NO;
        }
        
        ++_position;
        
        --offset;
    }
    
    _currentRecord = [[[SqliteRecord alloc] init] autorelease];
    
    int columnCount = sqlite3_data_count(rawStatement);
    int looper = 0;
    while (looper < columnCount)
    {
        
        NSString *name = [NSString stringWithUTF8String: sqlite3_column_name(rawStatement, looper)];
        NSObject *value = nil;
        
        switch (sqlite3_column_type(rawStatement, looper))
        {
                
            case SQLITE_TEXT:
            {
                
                value = [NSString stringWithUTF8String: (const char*)sqlite3_column_text(rawStatement, looper)];
                
                break;
            }
                
            case SQLITE_INTEGER:
            {
                
                value = [NSNumber numberWithLongLong: sqlite3_column_int64(rawStatement, looper)];
                
                break;
            }
                
            case SQLITE_FLOAT:
            {
                
                value = [NSNumber numberWithDouble: sqlite3_column_double(rawStatement, looper)];
                
                break;
            }
                
            case SQLITE_BLOB:
            case SQLITE_NULL:
            default:
            {
                
                value = nil;
                
                break;
            }
                
        }
        
        [_currentRecord setValue: value atColumn: looper withName: name];
        
        ++looper;
    }
    
    return YES;
    
}

- (BOOL)atTheEndOfResultSet
{
    return _ended;
}

@end
