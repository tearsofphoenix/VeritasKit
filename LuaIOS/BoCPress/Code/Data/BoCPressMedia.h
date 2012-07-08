#import <Foundation/Foundation.h>

#import "ESObjectSystem.h"

#import "BoCPressPost.h"

#import "NSTaggedObject.h"

@protocol BoCPressMediaType;

@protocol BoCPressMedia<NSTaggedObject, NSIdentifiedObject, NSNamedObject, BoCPressPost>

#pragma mark - Media parameters

@required

- (id<BoCPressMediaType>)mediaType;

- (id)mediaPlayingDuration;

- (id)mediaContent;

- (id)thumbnailImageURL;

@end

@interface BoCPressMedia: NSTaggedObject<BoCPressMedia> 
{

@private
    
    id<BoCPressMediaType> _mediaType;
    id _mediaPlayingDuration;
    id _mediaContent;
    
    id _identity;
    NSString *_name;
    NSDate *_postTime;
    
    id _thumbnailImageURL;
        
}

- (id)initWithIdentity: (id)identity
                  name: (NSString *)name
              postTime: (NSDate *)postTime
             mediaType: (id<BoCPressMediaType>)mediaType
  mediaPlayingDuration: (id)mediaPlayingDuration
          mediaContent: (id)mediaContent
     thumbnailImageURL: (id)anURL;

- (id)thumbnailImageURL;

@end
