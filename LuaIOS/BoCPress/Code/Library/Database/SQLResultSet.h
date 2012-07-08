#import <Foundation/Foundation.h>

#import "SQLRecord.h"

@protocol SQLResultSet<NSObject>

- (NSInteger)recordCount;

- (NSInteger)position;

- (id<SQLRecord>)currentRecord;

- (NSArray *)fetchRecords;

- (BOOL)moveCursorToNextRecord;

- (BOOL)moveCursorBy: (NSUInteger)offset;

- (BOOL)atTheEndOfResultSet;

@end