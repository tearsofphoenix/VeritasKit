#import <Foundation/Foundation.h>

#import "SQLResultSet.h"

@protocol SQLStatement <NSObject>

- (BOOL)setStringParameter: (NSUInteger)index withString: (NSString *)value;
- (BOOL)setStringParameter: (NSUInteger)index withFloat: (double)value;
- (BOOL)setStringParameter: (NSUInteger)index withInteger: (long long)value;

- (BOOL)setFloatParameter: (NSUInteger)index withString: (NSString *)value;
- (BOOL)setFloatParameter: (NSUInteger)index withFloat: (double)value;
- (BOOL)setFloatParameter: (NSUInteger)index withInteger: (long long)value;

- (BOOL)setIntegerParameter: (NSUInteger)index withString: (NSString *)value;
- (BOOL)setIntegerParameter: (NSUInteger)index withFloat: (double)value;
- (BOOL)setIntegerParameter: (NSUInteger)index withInteger: (long long)value;

- (NSUInteger)parametersCount;

- (BOOL)execute;

- (id<SQLResultSet>)currentResultSet;

- (BOOL)continueExecution;

@end
