#import <Foundation/Foundation.h>

#import "SQLRecord.h"

@interface SqliteRecord: NSObject<SQLRecord>
{
    
    NSMutableDictionary *_valueDictionary;
    NSMutableArray *_valueArray;

}

- (void)setValue: (NSObject *)value atColumn: (NSUInteger)columnIndex withName: (NSString *)name;

@end
