#import <Foundation/Foundation.h>

#import "SQLStatement.h"

@protocol SQLDatabase <NSObject>

- (id<SQLStatement>)prepareStatementForSQL: (NSString *)sql;

@end
