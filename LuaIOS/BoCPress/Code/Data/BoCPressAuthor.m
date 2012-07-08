
#import "BoCPressAuthor.h"

#import "BoCPressAuthorPrivateHandler.h"

#import "BoCPressConstant.h"

@implementation BoCPressAuthor

- (id)initWithIdentity: (id)identity
                  name: (NSString *)name
          authorAvatar: (BoCPressImageView *)avatar
     briefIntroduction: (NSString *)briefIntroduction
{
    
    self = [super init];
    if (self)
    {
        _handler = [[BoCPressAuthorPrivateHandler alloc] initWithAuthor:self];
        
        _identity = [identity retain];
        _name = [name retain];
        
        [avatar setCallback:_handler];
        
        _avatarURL = [[avatar imageURL] retain];
        
        _authorAvatar = [[UIImageView alloc] init];
        
        _authorBriefIntroduction = [briefIntroduction retain];
        
        _superHandler = nil;
    }
    
    return self;
    
}

- (void)dealloc
{
    [_handler cancelAllCallback];
    
    [_handler release];
    [_identity release];
    [_name release];
    
    [_avatarURL release];
    [_authorAvatar release];
    [_authorBriefIntroduction release];
    [_superHandler release];
    
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

- (UIImageView*)authorAvatar
{
    return _authorAvatar;
}

- (NSString *)authorBriefIntroduction
{
    return _authorBriefIntroduction;
}

- (void)updateAvatarImageWithData:(id)data
{
    UIImage *image = [UIImage imageWithData: [data objectForKey: @"data"]];
    if(image)
    {
        [_authorAvatar setImage: image];
        [_authorAvatar setNeedsDisplay];
        [self updateSuperStatementWithData: image];
    }
    
}

- (NSURL *)authorAvatarImageURL
{
    return _avatarURL;
}
- (void)setSuperHandler: (id<NSSuperHandler>)superHandler
{
    if (_superHandler != superHandler)
    {        
        [_superHandler release];        
        _superHandler = [superHandler retain];
    }
    
}

- (id<NSSuperHandler>)superHandler
{
    return _superHandler;
}

- (void)updateSuperStatementWithData:(id)data
{
    if (data)
    {
        [_superHandler  updateSuperStatementWithData:data];
    }
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super init]))
    {
        _identity = [[aDecoder decodeObjectForKey:@"_identity"] retain];
        _name = [[aDecoder decodeObjectForKey:@"_name"] retain];
        _avatarURL = [[aDecoder decodeObjectForKey:@"_avatarURL"] retain];

        _authorBriefIntroduction = [[aDecoder decodeObjectForKey:@"_authorBriefIntroduction"] retain];
        
        _handler = [[BoCPressAuthorPrivateHandler alloc] initWithAuthor:self];
        _superHandler = nil;
        
        _authorAvatar = [[UIImageView alloc] init];
        
        NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  _avatarURL, kBoCPress_Global_NSURLObject,
                                  kBoCPress_View_updateThumbnailImage, kNetwork_CallbackAction,
                                  _handler, kNetwork_CallbackObject,
                                  nil];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kSoapDataSource_notificationForGetImage
                                                            object:self
                                                          userInfo:userInfo];
        [userInfo release];
    }
    
    return self;

}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_identity forKey:@"_identity"];
    [aCoder encodeObject:_name forKey:@"_name"];
    [aCoder encodeObject:_avatarURL forKey:@"_avatarURL"];

    [aCoder encodeObject:_authorBriefIntroduction forKey:@"_authorBriefIntroduction"];
}
@end
