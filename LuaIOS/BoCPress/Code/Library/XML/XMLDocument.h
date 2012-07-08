#import <Foundation/Foundation.h>

#import "XMLNode.h"

#include <libxml/tree.h>

@interface XMLDocument : NSObject 
{
}

@property (nonatomic, readonly) xmlDocPtr rawDocument;

- (XMLDocument *)initWithData: (NSData *)data;

- (XMLNode *)rootNode;

- (NSArray *)evaluateXPathExpression: (NSString *)expression 
                    withNamespaces: (NSDictionary *)namespaces;

@end
