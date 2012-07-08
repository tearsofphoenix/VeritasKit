#import <Foundation/Foundation.h>

#import "SQLResultSet.h"

#import "SqliteRecord.h"

@class SqliteSimpleStatement;

@interface SqliteResultSet : NSObject<SQLResultSet> 
{
    
    NSInteger _position;
    
    BOOL _fetched;
    
    BOOL _ended;
    
    SqliteRecord * _currentRecord;
    
    SqliteSimpleStatement *_statement;

}

- (SqliteResultSet *)initWithSimpleStatement: (id)statement;

@end
