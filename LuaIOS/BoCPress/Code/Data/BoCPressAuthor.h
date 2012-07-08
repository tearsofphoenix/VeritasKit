#import <Foundation/Foundation.h>

#import "NSIdentifiedObject.h"

#import "NSNamedObject.h"

#import "BoCPressImageView.h"

#import "NSSuperHandler.h"

@protocol NSSuperHandler;

@protocol BoCPressAuthor <NSIdentifiedObject, NSNamedObject, NSCoding>


#pragma mark - Author parameters

@optional

//- (UIImage *)authorAvatar;

- (UIImageView *) authorAvatar;

- (NSString *)authorBriefIntroduction;

- (void)updateAvatarImageWithData: (id)data;

- (NSURL *)authorAvatarImageURL;
@end

@class BoCPressAuthorPrivateHandler;

@interface BoCPressAuthor: NSObject<BoCPressAuthor, NSSuperHandler> 
{

@private
    
    //BoCPressImageView *_authorAvatar;
    UIImageView* _authorAvatar;
    //UIImage *_authorAvatarImage;
    
    NSString *_authorBriefIntroduction;
    
    id _identity;
    
    NSString *_name;
    
    BoCPressAuthorPrivateHandler *_handler;
    
    NSURL *_avatarURL;
    
    id<NSSuperHandler> _superHandler;
    
}

- (id)initWithIdentity: (id)identity
                  name: (NSString *)name
          authorAvatar: (BoCPressImageView *)avatar
     briefIntroduction: (NSString *)briefIntroduction;

- (NSURL *)authorAvatarImageURL;

- (void)setSuperHandler: (id<NSSuperHandler>)superHandler;
@end
