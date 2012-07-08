#import "BoCPressNewsArraySlice.h"

#import "BoCPressNewsTag.h"

@implementation BoCPressNewsArraySlice

+ (id)newsArraySliceWithArray: (NSArray *)array 
                       offset: (NSUInteger)offset 
                        count: (NSUInteger)count
                   forNewsTag: (id<BoCPressNewsTag>)newsTag
{
    return [[[BoCPressNewsArraySlice alloc] initWithArray: array 
                                                   offset: offset
                                                    count: count
                                               forNewsTag: newsTag] autorelease];
}

- (id)initWithArray: (NSArray *)array 
             offset: (NSUInteger)offset 
              count: (NSUInteger)count
         forNewsTag: (id<BoCPressNewsTag>)newsTag
{
    
    self = [super initWithArray: array 
                         offset: offset
                          count: count];
    if (self)
    {
        _newsTag = [newsTag retain];
        _userInfo = nil;
    }
    
    return self;
    
}
- (void)dealloc
{
    [_newsTag release];
    [_userInfo release];
    
    [super dealloc];
}
- (id<BoCPressNewsTag>)newsTag
{
    return _newsTag;
}

- (void)setUserInfo: (id)userInfo
{
    if (userInfo)
    {
        [_userInfo release];
        
        _userInfo = [userInfo retain];
    }
}

- (id)userInfo
{
    return _userInfo;
}

#pragma mark - NSCoding
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        _newsTag = [[aDecoder decodeObjectForKey:@"_newsTag"] retain];
        _userInfo = [[aDecoder decodeObjectForKey:@"_userInfo"] retain];
    }
    return self;
}
- (void)encodeWithCoder: (NSCoder *)coder
{
    [super encodeWithCoder: coder];
    
    [coder encodeObject:_newsTag forKey:@"_newsTag"];
    [coder encodeObject:_userInfo forKey:@"_userInfo"];
}
@end
