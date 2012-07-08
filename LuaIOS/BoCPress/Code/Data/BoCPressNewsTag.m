#import "BoCPressNewsTag.h"

@implementation BoCPressNewsTag

- (id)initWithIdentity: (id)identity
                  name: (NSString *)name
{
    return [super initWithIdentity: identity
                                             name: name
                                  couldBeSelected: YES
                                      columnWidth: 0
                                       chargeFlag: NO
                                currentChargeFlag: NO];
}


- (id)copyWithZone: (NSZone*) zone
{
    BoCPressNewsTag *newsTagCopy = [[[self class] alloc] initWithIdentity:_identity 
                                                                        name:_name];
    
    return newsTagCopy;
}

#pragma mark - NSCoding
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super init]))
    {
        _identity = [[aDecoder decodeObjectForKey:@"_identity"] retain];
        _name = [[aDecoder decodeObjectForKey:@"_name"] retain];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_identity forKey:@"_identity"];
    [aCoder encodeObject:_name forKey:@"_name"];
    
}
@end
