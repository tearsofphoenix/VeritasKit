#import <Foundation/Foundation.h>

#import "SQLDatabase.h"
#import "SQLStatement.h"

@interface SqliteDatabase : NSObject<SQLDatabase>
{
    
}

@property(nonatomic, readonly) NSString *filePath;

- (SqliteDatabase *)initWithFilePath: (NSString *)filePath;

@end
