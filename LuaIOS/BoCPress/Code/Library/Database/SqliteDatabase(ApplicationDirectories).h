#import <Foundation/Foundation.h>

#import "SqliteDatabase.h"

@interface SqliteDatabase(ApplicationDirectories)

- (SqliteDatabase *)initWithResourceNameInApplicationDirectoryInIOS: (NSString *)name;

- (SqliteDatabase *)initWithFilePathInDocumentDirectoryInIOS:(NSString *)filePath;

- (SqliteDatabase *)initWithFilePathInTempDirectoryInIOS:(NSString *)filePath;

@end
