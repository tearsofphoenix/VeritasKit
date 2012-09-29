#import "XMLPathProcessor.h"

#import <libxml/xpathInternals.h>

@implementation XMLPathProcessor

@synthesize rawXMLPathContext = _rawXMLPathContext;

- (XMLPathProcessor *)initWithNamespaces: (NSDictionary *)namespaces
                     inDocument: (XMLDocument *)document
{
    
    self = [super init];
    if (self)
    {
        
        _rawXMLPathContext = xmlXPathNewContext([document rawDocument]);     
        
        
        NSEnumerator *enumerator = [namespaces keyEnumerator];
        NSString *key;
        
        while ((key = (NSString *)[enumerator nextObject])) 
        {
            [self registerNamespace: [namespaces objectForKey: key] withPrefix: key];
        }
                
    }
    
    return self;
    
}

- (void)registerNamespace: (NSString *)theNamespace withPrefix:(NSString *)prefix
{
    xmlXPathRegisterNs(_rawXMLPathContext, (const xmlChar *)[prefix UTF8String], (const xmlChar *)[theNamespace UTF8String]);
}

- (NSArray *)evaluateExpression: (NSString *)expression
{
    
    xmlXPathObjectPtr xpathObject; 
        
    xpathObject = xmlXPathEvalExpression((xmlChar *)[expression UTF8String], _rawXMLPathContext);
	
	xmlNodeSetPtr nodes = xpathObject->nodesetval;
	
    NSMutableArray * results = nil;
    
    if (nodes)
    {
        
        results = [[[NSMutableArray alloc] init] autorelease];
        
        int looper = 0;
        while (looper < nodes->nodeNr)
        {
            
            XMLNode *node = [[[XMLNode alloc] initWithRawNode:nodes->nodeTab[looper]] autorelease];
            [results addObject: node];
            
            ++looper;
        }
        
    }
    
    xmlXPathFreeObject(xpathObject);
        
    return results;
}

@end