#import <Foundation/Foundation.h>

#import "ESObjectSystem.h"

#import "BoCPressPost.h"
#import "BoCPressArticle.h"

@protocol BoCPressNewsTag;

@protocol BoCPressNews<NSTaggedObject, NSIdentifiedObject, BoCPressPost, BoCPressArticle>

- (CGFloat)perferHeight;

@end

@interface BoCPressNews: NSTaggedObject<BoCPressNews> 
{
@private
    id _identity;
    NSString *_name;
    NSString *_articleAbstract;
    NSDate *_postTime;
    id _articleContent;
    id<BoCPressAuthor> _author;
    
}

@property (nonatomic, retain) id<BoCPressNewsTag> newsTag;
           
- (id)initWithIdentity: (id)identity
                  name: (NSString *)name
              postTime: (NSDate *)postTime
       articleAbstract: (NSString *)newsAbstract
        articleContent: (id)articleContent
                author: (id<BoCPressAuthor>)author;

- (NSString *)authorBriefIntroduction;

@end
