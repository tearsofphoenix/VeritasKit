#import "SqliteRecord.h"

@implementation SqliteRecord

- (SqliteRecord *)init
{
    
    self = [super init];
    if (self)
    {
        _valueDictionary = [[NSMutableDictionary alloc] init];
        _valueArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)setValue: (NSObject *)value atColumn: (NSUInteger)columnIndex withName: (NSString *)name
{
 
    while ([_valueArray count] <= columnIndex)
    {
        [_valueArray addObject: [NSNull null]];
    }

    if (!value)
    {
        value = [NSNull null];
    }
    [_valueDictionary setValue: value forKey: name];
    [_valueArray replaceObjectAtIndex: columnIndex withObject: value];
    
    
}

- (NSObject *)objectValueAtColumn: (NSUInteger)columnIndex
{

    if (columnIndex < [_valueArray count])
    {
        return [_valueArray objectAtIndex: columnIndex];
    }
    else
    {
        return nil;
    }
    
}

- (NSObject *)objectValueNamed: (NSString *)columnName
{
    return [_valueDictionary objectForKey: columnName];
}

- (NSString *)stringValueAtColumn: (NSUInteger)columnIndex
{
    
    NSObject *object = [self objectValueAtColumn: columnIndex];
    if ([object isKindOfClass: [NSString class]])
    {
        return (NSString *)object;
    }
    else
    {
        return nil;
    }
    
}

- (NSString *)stringValueNamed: (NSString *)columnName
{
    
    NSObject *object = [self objectValueNamed: columnName];
    if ([object isKindOfClass: [NSString class]])
    {
        return (NSString *)object;
    }
    else
    {
        return nil;
    }
    
}

- (long)integerValueAtColumn: (NSUInteger)columnIndex
{
    
    NSObject *object = [self objectValueAtColumn: columnIndex];
    if ([object isKindOfClass: [NSNumber class]])
    {
        return [(NSNumber *)object longLongValue];
    }
    else
    {
        return 0;
    }
    
}

- (long)integerValueNamed: (NSString *)columnName
{
    
    NSObject *object = [self objectValueNamed: columnName];
    if ([object isKindOfClass: [NSNumber class]])
    {
        return [(NSNumber *)object longLongValue];
    }
    else
    {
        return 0;
    }
    
}

- (double)floatValueAtColum: (NSUInteger)columnIndex
{
    
    NSObject *object = [self objectValueAtColumn: columnIndex];
    if ([object isKindOfClass: [NSNumber class]])
    {
        return [(NSNumber *)object doubleValue];
    }
    else
    {
        return 0;
    }

}

- (double)floatValueNamed: (NSString *)columnName
{
    
    NSObject *object = [self objectValueNamed: columnName];
    if ([object isKindOfClass: [NSNumber class]])
    {
        return [(NSNumber *)object doubleValue];
    }
    else
    {
        return 0;
    }
    
}

- (void)dealloc
{
    
    [_valueArray release];
    
    [_valueDictionary release];
    
    [super dealloc];
    
}


@end
