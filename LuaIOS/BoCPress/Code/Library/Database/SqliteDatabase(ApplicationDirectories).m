#import "SqliteDatabase(ApplicationDirectories).h"


@implementation SqliteDatabase(ApplicationDirectories)


- (SqliteDatabase *)initWithResourceNameInApplicationDirectoryInIOS: (NSString *)name
{
    
    NSString *filePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: name];
    
    return [self initWithFilePath: filePath];
}

- (SqliteDatabase *)initWithFilePathInDocumentDirectoryInIOS:(NSString *)filePath
{
    
    NSArray *arrayPaths = NSSearchPathForDirectoriesInDomains(
                                                              NSDocumentDirectory,
                                                              NSUserDomainMask,
                                                              YES);
    
	filePath = [[arrayPaths objectAtIndex:0] stringByAppendingPathComponent:filePath];
    
    return [self initWithFilePath: filePath];
}

- (SqliteDatabase *)initWithFilePathInTempDirectoryInIOS:(NSString *)filePath
{
    
	filePath = [NSTemporaryDirectory() stringByAppendingPathComponent:filePath];
    
    return [self initWithFilePath: filePath];
}

@end
