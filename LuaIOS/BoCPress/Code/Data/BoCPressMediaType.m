#import "BoCPressMediaType.h"

@implementation BoCPressMediaType

- (id)initWithIdentity: (NSString *)identity 
                  name: (NSString *)name
            chargeFlag: (BOOL)chargeFlag
         currentChargeFlag: (BOOL)currentChargeFlag
{
    
    self = [super init];
    if (self)
    {
        _identity = [identity retain];
        _name = [name retain];
        
        _isChargeColumn = chargeFlag;
        _currentChargeFlag = currentChargeFlag;
    }
    
    return self;
    
}
- (void)dealloc
{
    [_identity release];
    [_name release];
    
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

- (BOOL)isEqual:(id)object
{
    if ([object conformsToProtocol: @protocol(BoCPressMediaType)])
    {
        return [[self identity] isEqual: [(id<BoCPressMediaType>)object identity]];
    }
    else
    {
        return NO;
    }
}

- (BOOL)isChargeColumn
{
    return _isChargeColumn;
}

- (BOOL)currentChargeFlag
{
    return _currentChargeFlag;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super init]))
    {
        _identity = [[aDecoder decodeObjectForKey:@"_identity"] retain];
        _name = [[aDecoder decodeObjectForKey:@"_name"] retain];
        
        _isChargeColumn = [aDecoder decodeBoolForKey:@"_isChargeColumn"] ;
        _currentChargeFlag = [aDecoder decodeBoolForKey:@"_currentChargeFlag"];

    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_identity forKey:@"_identity"];
    [aCoder encodeObject:_name forKey:@"_name"];
    [aCoder encodeBool:_isChargeColumn forKey:@"_isChargeColumn"];
    [aCoder encodeBool:_currentChargeFlag forKey:@"_currentChargeFlag"];
}
@end
