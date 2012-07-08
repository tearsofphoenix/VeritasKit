#import "BoCPressMedia.h"

#import "BoCPressMediaType.h"

@implementation BoCPressMedia

- (id)initWithIdentity: (id)identity
                  name: (NSString *)name
              postTime: (NSDate *)postTime
             mediaType: (id<BoCPressMediaType>)mediaType
  mediaPlayingDuration: (id)mediaPlayingDuration
          mediaContent: (id)mediaContent
     thumbnailImageURL: (id)anURL
{
    
    self = [super init];
    if (self)
    {
        _identity = [identity retain];
        _name = [name retain];
        _postTime = [postTime retain];
        _mediaType = [mediaType retain];
        _mediaPlayingDuration = [mediaPlayingDuration retain];
        _mediaContent = [mediaContent retain];
        
        _thumbnailImageURL = [anURL retain];
        //NSLog(@"media content:%@", )
    }
    
    return self;
    
}

- (void)dealloc
{
    
    [_identity release];
    [_name release];
    [_postTime release];
    [_mediaType release];
    [_mediaContent release];
    [_mediaPlayingDuration release];
    [_thumbnailImageURL release];
    
    [super dealloc];
    
}

- (id<BoCPressMediaType>)mediaType
{
    return _mediaType;
}

- (id)mediaPlayingDuration
{
    return _mediaPlayingDuration;
}
- (id)thumbnailImageURL
{
    return _thumbnailImageURL;
}
- (id)mediaContent
{
    return _mediaContent;
}

- (id)identity
{
    return _identity;
}

- (NSString *)name
{
    return _name;
}

- (NSDate *)postTime
{
    return _postTime;
}

- (BOOL)isEqual: (id)object
{
    
    if ([object conformsToProtocol: @protocol(BoCPressMedia)])
    {
        return [[self identity] isEqual: [(id<BoCPressMedia>)object identity]];
    }
    else
    {
        return NO;
    }
    
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        _identity = [[aDecoder decodeObjectForKey:@"_identity"] retain];        
        _name = [[aDecoder decodeObjectForKey:@"_name"] retain];
        _postTime = [[aDecoder decodeObjectForKey:@"_postTime"] retain];
        _mediaType = [[aDecoder decodeObjectForKey:@"_mediaType"] retain];
        _mediaPlayingDuration = [[aDecoder decodeObjectForKey:@"_mediaPlayingDuration"] retain];
        _mediaContent = [[aDecoder decodeObjectForKey:@"_mediaContent"] retain];
        _thumbnailImageURL = [[aDecoder decodeObjectForKey:@"_thumbnailImageURL"] retain];

    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    
    [aCoder encodeObject:_identity forKey:@"_identity"];
    [aCoder encodeObject:_name forKey:@"_name"];
    [aCoder encodeObject:_postTime forKey:@"_postTime"];
    [aCoder encodeObject:_mediaType forKey:@"_mediaType"];
    [aCoder encodeObject:_mediaPlayingDuration forKey:@"_mediaPlayingDuration"];
    [aCoder encodeObject:_mediaContent forKey:@"_mediaContent"];
    [aCoder encodeObject:_thumbnailImageURL forKey:@"_thumbnailImageURL"];
}
@end
