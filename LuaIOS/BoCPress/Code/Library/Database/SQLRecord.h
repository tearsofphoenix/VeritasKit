#import <Foundation/Foundation.h>

@protocol SQLRecord<NSObject>

- (NSObject *)objectValueAtColumn: (NSUInteger)columnIndex;
- (NSObject *)objectValueNamed: (NSString *)columnName;

- (NSString *)stringValueAtColumn: (NSUInteger)columnIndex;
- (NSString *)stringValueNamed: (NSString *)columnName;

- (long)integerValueAtColumn: (NSUInteger)columnIndex;
- (long)integerValueNamed: (NSString *)columnName;

- (double)floatValueAtColum: (NSUInteger)columnIndex;
- (double)floatValueNamed: (NSString *)columnName;

@end
