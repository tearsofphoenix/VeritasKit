#import <Foundation/Foundation.h>

#import "XMLDocument.h"

#include <libxml/xpath.h>

@interface XMLPathProcessor : NSObject 
{
    
}

@property (nonatomic, readonly) xmlXPathContextPtr rawXMLPathContext;

- (XMLPathProcessor *)initWithNamespaces: (NSDictionary *)namespaces
                              inDocument: (XMLDocument *)document;

- (void)registerNamespace: (NSString *)theNamespace withPrefix: (NSString *)prefix;

- (NSArray *)evaluateExpression: (NSString *)expression;

@end
