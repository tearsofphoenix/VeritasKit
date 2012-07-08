#import "BoCPressMediaTagColumn.h"

#include "BoCPressMediaType.h"

@implementation BoCPressMediaTagColumn

- (id)initWithIdentity:(id)identity 
                  name:(NSString *)name 
             mediaType:(id<BoCPressMediaType>)mediaType
            chargeFlag: (BOOL)chargeFlag
     currentChargeFlag: (BOOL) currentChargeFlag
{
    if((self = [super initWithIdentity: identity
                                  name: name
                       couldBeSelected: YES
                           columnWidth: 0
                            chargeFlag: chargeFlag
                     currentChargeFlag: currentChargeFlag]))
    {
        _mediaType = [mediaType retain];
    }
    
    return self;
}

- (id<BoCPressMediaType>)mediaType
{
    return _mediaType;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super init]))
    {
        _identity = [[aDecoder decodeObjectForKey:@"_identity"] retain];
        _name = [[aDecoder decodeObjectForKey:@"_name"] retain];
        _mediaType = [[aDecoder decodeObjectForKey:@"_mediaType"] retain];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_identity forKey:@"_identity"];
    [aCoder encodeObject:_name forKey:@"_name"];
    [aCoder encodeObject:_mediaType forKey:@"_mediaType"];
}

@end
