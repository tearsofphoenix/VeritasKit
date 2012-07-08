#import <Foundation/Foundation.h>

//#import "XMLDocument.h"

#include <libxml/tree.h>

@interface XMLNode : NSObject 
{
    xmlNodePtr _rawNode;
}

@property (nonatomic, readonly) xmlNodePtr rawNode;

- (XMLNode *)initWithRawNode: (xmlNodePtr)rawNode;

- (NSString *)elementName;
- (NSString *)attributeWithName: (NSString *)name;
- (NSString *)attributeWithNamespace: (NSString *)theNamespace andName: (NSString *)name;

- (BOOL)isTheSameNode: (XMLNode *)node;

- (NSString *)theNamespace;
- (NSString *)namespacePrefix;

- (XMLNode *)firstChild;
- (XMLNode *)nextSibling;
- (XMLNode *)parentNode;

- (NSString *)nodeValue;
- (NSString *)textContent;

- (XMLNode *)childWithName: (NSString *)name;

- (NSString *) getTextContentWithChildNodeName: (NSString *)name;
@end
