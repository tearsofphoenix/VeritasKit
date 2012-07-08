#import "BoCPressNewsTagColumn.h"

@implementation BoCPressNewsTagColumn

- (id)initWithIdentity: (id)identity
                  name: (NSString *)name
            chargeFlag: (BOOL)chargeFlag
     currentChargeFlag: (BOOL) currentChargeFlag
{
    if ((self = [super initWithIdentity:identity name:name]))
    {
        _isChargeColumn = chargeFlag;
        _currentChargeFlag = currentChargeFlag;
    }
    
    return self;
}
- (BOOL)couldBeSelected
{
    return YES;
}

- (CGFloat)columnWidth
{
    return [[self name] sizeWithFont: [UIFont fontWithName: @"Helvetica" size: 15]].width;
}

- (id)identity
{
    return [super identity];
}

- (NSString *)name
{
    return [super name];
}

- (id)copyWithZone: (NSZone*) zone
{
    return [[[self class] alloc] initWithIdentity:[self identity] name:[self name]];
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

- (BOOL)isChargeColumn
{
    return _isChargeColumn;
}

- (BOOL)currentChargeFlag
{
    return _currentChargeFlag;
}

- (NSString *)description
{
    return [NSString stringWithFormat: @"<%@ isCharge:%s currentFlag:%s id:%@", 
            [self class], 
            _isChargeColumn ? "YES" : "NO",
            _currentChargeFlag ? "YES" : "NO", 
            _identity];
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        _isChargeColumn = [aDecoder decodeBoolForKey:@"_isChargeColumn"];
        _currentChargeFlag = [aDecoder decodeBoolForKey:@"_currentChargeFlag"];
    }
    return  self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    
    [aCoder encodeBool:_isChargeColumn forKey:@"_isChargeColumn"];
    [aCoder encodeBool:_currentChargeFlag forKey:@"_currentChargeFlag"];
}

@end
