#import "BoCPressSecurityFamily.h"

@implementation BoCPressSecurityFamily

- (id)initWithIdentity: (id)identity
                  name: (NSString *)name
            chargeFlag: (BOOL)chargeFlag
     currentChargeFlag: (BOOL)currentChargeFlag
{
    
    self = [super init];
    if (self)
    {
        
        _identity = [identity retain];
        _name = [name retain];
        
        _securityFamilyConfiguration = [[NSMutableDictionary alloc] init];
        _isChargeColumn = chargeFlag;
        _currentChargeFlag = currentChargeFlag;
    }
    
    return self;
    
}

- (void)dealloc
{
    [_identity release];
    [_name release];
    [_securityFamilyConfiguration release];
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

- (void)storeConfiguration: (id)value forKey: (id)key
{
    if (value && key)
    {
        [_securityFamilyConfiguration setObject:value forKey:key];
    }
}

- (id)queryConfigurationWithKey: (id)key
{
    return [_securityFamilyConfiguration objectForKey:key];
}

- (BOOL) isChargeColumn
{
    return _isChargeColumn;
}

- (BOOL) currentChargeFlag
{
    return _currentChargeFlag;
}

- (id)copyWithZone:(NSZone *)zone
{
    BoCPressSecurityFamily *copy = [[[self class] alloc] initWithIdentity: _identity
                                                                     name: _name
                                                               chargeFlag: _isChargeColumn
                                                        currentChargeFlag: _currentChargeFlag];
    return copy;    
}
@end
