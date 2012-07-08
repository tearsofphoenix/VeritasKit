#import "BoCPressNews.h"

#import "BoCPressAuthor.h"

#import "BoCPressNewsTag.h"

@implementation BoCPressNews

@synthesize newsTag = _newsTag;

- (id)initWithIdentity: (id)identity
                  name: (NSString *)name
              postTime: (NSDate *)postTime
       articleAbstract: (NSString *)articleAbstract
        articleContent: (id)articleContent
                author: (id<BoCPressAuthor>)author
{
    
    self = [super init];
    if (self)
    {
        _identity = [identity retain];
        _name = [name retain];
        _postTime = [postTime retain];
        _articleContent = [articleContent retain];
        _articleAbstract = [articleAbstract retain];
        _author = [author retain];
    }
    
    return self;
    
}

- (NSString *)articleAbstract
{
    return _articleAbstract;
}

- (void)dealloc
{
    
    
    [_articleAbstract release];
    [_identity release];
    [_name release];
    [_postTime release];
    [_articleContent release];
    [_author release];
    [_newsTag release];
    
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

- (NSDate *)postTime
{
    return _postTime;
}

- (id)articleContent
{
    return _articleContent;
}

- (id<BoCPressAuthor>)author
{
    return _author;
}
- (NSString *)authorBriefIntroduction
{
    return [_author authorBriefIntroduction];
}

- (BOOL) isEqual:(id)object
{
    if ([object conformsToProtocol:@protocol(BoCPressNews)]) 
    {
        return [[self identity] isEqual: [(id<BoCPressNews>)object identity]];
    }else
    {
        return NO;
    }
}

#pragma mark - NSCoding
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        _identity = [[aDecoder decodeObjectForKey:@"_identity"] retain];
        _name = [[aDecoder decodeObjectForKey:@"_name"] retain];
        _postTime = [[aDecoder decodeObjectForKey:@"_postTime"] retain];
        _articleContent = [[aDecoder decodeObjectForKey:@"_articleContent"] retain];
        _articleAbstract = [[aDecoder decodeObjectForKey:@"_articleAbstract"] retain];
        _author = [[aDecoder decodeObjectForKey:@"_author"] retain];

    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    
    [aCoder encodeObject:_identity forKey:@"_identity"];
    [aCoder encodeObject:_name forKey:@"_name"];
    [aCoder encodeObject:_postTime forKey:@"_postTime"];
    [aCoder encodeObject:_articleContent forKey:@"_articleContent"];
    [aCoder encodeObject:_articleAbstract forKey:@"_articleAbstract"];
    [aCoder encodeObject:_author forKey:@"_author"];
}

- (CGFloat)perferHeight
{
    CGSize size = [_name sizeWithFont: [UIFont fontWithName: @"Helvetica" size: 16]];
//    static const CGFloat extra =  25;
    if (size.width > 280)
    {
        return 70;
//        return size.height * 2 + extra;
    }else 
    {
        return 50;
//        return size.height + extra;
    }
}

@end
