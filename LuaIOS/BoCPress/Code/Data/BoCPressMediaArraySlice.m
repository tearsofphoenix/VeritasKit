#import "BoCPressMediaArraySlice.h"
#import "BoCPressMediaTagColumn.h"

@implementation BoCPressMediaArraySlice

+ (id)mediaArraySliceWithArray: (NSArray *)array 
                        offset: (NSUInteger)offset 
                         count: (NSUInteger)count
                  forMediaType: (id<BoCPressMediaType>)mediaType
{
    return [[[BoCPressMediaArraySlice alloc] initWithArray: array 
                                                    offset: offset
                                                     count: count
                                              forMediaType: mediaType] autorelease];
}

- (id)initWithArray: (NSArray *)array 
             offset: (NSUInteger)offset 
              count: (NSUInteger)count
       forMediaType: (id<BoCPressMediaType>)mediaType
{
    
    self = [super initWithArray: array 
                         offset: offset
                          count: count];
    if (self)
    {
        _mediaType = mediaType;
        
        _userInfo = nil;
        
    }
    
    return self;
    
}
- (void)dealloc
{
    [_userInfo release];
    
    [super dealloc];
    
}

- (id<BoCPressMediaType>)mediaType
{
    return _mediaType;
}

+ (id)mediaArraySliceWithArray: (NSArray *)array 
                        offset: (NSUInteger)offset 
                         count: (NSUInteger)count
                   forMediaTag: (BoCPressMediaTagColumn* )mediaTag
{
    return [[[BoCPressMediaArraySlice alloc] initWithArray: array 
                                                    offset: offset
                                                     count: count
                                               forMediaTag: mediaTag] autorelease];
}

- (id)initWithArray: (NSArray *)array 
             offset: (NSUInteger)offset 
              count: (NSUInteger)count
        forMediaTag: (BoCPressMediaTagColumn* )mediaTag
{
    
    self = [super initWithArray: array 
                         offset: offset
                          count: count];
    if (self)
    {
        _mediaType = [mediaTag mediaType];
        _mediaTag = mediaTag;
        _userInfo = nil;
    }
    
    return self;
    
}

- (BoCPressMediaTagColumn* )mediaTag
{
    return _mediaTag;
}

- (void)setUserInfo: (id)userInfo
{
//    if (userInfo)
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
        _mediaType = [[aDecoder decodeObjectForKey:@"_mediaType"] retain];
        _mediaTag = [[aDecoder decodeObjectForKey:@"_mediaTag"]  retain];
        _userInfo = [[aDecoder decodeObjectForKey:@"_userInfo"] retain];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    
    [aCoder encodeObject:_mediaType forKey:@"_mediaType"];
    [aCoder encodeObject:_mediaTag forKey:@"_mediaTag"];
    [aCoder encodeObject:_userInfo forKey:@"_userInfo"];
}
@end
