#import <Foundation/Foundation.h>

@protocol BoCPressAuthor;

@protocol BoCPressArticle <NSIdentifiedObject, NSNamedObject>

#pragma mark - Article parameters

@required

- (id)articleContent;

- (id<BoCPressAuthor>)author;

- (NSString *)articleAbstract;

@end
