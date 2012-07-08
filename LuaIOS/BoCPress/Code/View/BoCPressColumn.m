#import "BoCPressColumn.h"

@implementation BoCPressColumn

- (id)initWithIdentity: (id)identity 
                  name: (NSString *)name
       couldBeSelected: (BOOL)couldBeSelected 
           columnWidth: (CGFloat)columnWidth
            chargeFlag: (BOOL)chargeFlag 
     currentChargeFlag: (BOOL)currentChargeFlag
{
    
    self = [super init];
    if (self)
    {
        
        _identity = [identity retain];
        _name = [name retain];
        _couldBeSelected = couldBeSelected;
        _isChargeColumn = chargeFlag;
        _currentChargeFlag = currentChargeFlag;
        
        if (columnWidth > 0)
        {
            _columnWidth = columnWidth;
        }
        else
        {
            _columnWidth = [name sizeWithFont: [UIFont fontWithName: @"Helvetica" size: 15]].width;
        }
        
        _subColumns = [[NSMutableArray alloc] init];
        _columnConfiguration = [[NSMutableDictionary alloc] init];
    }
    
    return self;
    
}

- (void) dealloc
{
    [_identity release];
    [_name release];
    
    [_subColumns release];
    [_columnConfiguration release];
    [super dealloc];
}

- (id)identity
{
    return _identity;
}

- (NSString *)name
{
    return _name;
}

- (BOOL)couldBeSelected
{
    return _couldBeSelected;
}

- (CGFloat)columnWidth
{
    return _columnWidth;
}

- (BOOL)isEqual:(id)object
{
    if ([object conformsToProtocol: @protocol(BoCPressColumn)])
    {
        return [[self identity] isEqual: [(id<BoCPressColumn>)object identity]];
    }
    else
    {
        return NO;
    }
}

- (void)addSubColumn:(id<BoCPressColumn>)subColumn
{
    [_subColumns addObject:subColumn];
}

- (void)storeConfiguration:(id)value forKey:(id)key
{
    [_columnConfiguration setObject:value forKey:key];
}

- (id)queryConfigurationWithKey:(id)key
{
    return [_columnConfiguration objectForKey:key];
}

- (BOOL)isChargeColumn
{
    return _isChargeColumn;
}

- (BOOL)currentChargeFlag
{
    return _currentChargeFlag;
}

- (NSUInteger)fetchSize
{
    id record = [_columnConfiguration objectForKey: @"fetchSize"];
    if (record)
    {
        return [record intValue];
    }else 
    {
        return 10;
    }
}

- (NSUInteger)fetchMoreSize
{
    id record = [_columnConfiguration objectForKey: @"fetchMoreSize"];
    if (record)
    {
        return [record intValue];
    }else 
    {
        return 10;
    }
}

- (id)copyWithZone: (NSZone *)zone
{
    BoCPressColumn *copy = [[[self class] allocWithZone: zone] initWithIdentity: [self identity]
                                                                           name: [self name]
                                                                couldBeSelected: [self couldBeSelected]
                                                                    columnWidth: [self columnWidth]
                                                                     chargeFlag: [self isChargeColumn]
                                                              currentChargeFlag: [self currentChargeFlag]
                                                                               ];
    return copy;
}

@end
