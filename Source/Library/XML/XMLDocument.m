#import "XMLDocument.h"

#import <libxml/parser.h>

#import "XMLPathProcessor.h"

@implementation XMLDocument

@synthesize rawDocument = _rawDocument;

- (XMLDocument *)initWithData: (NSData *)data
{
    
    self = [super init];
    if (self)
    {
        _rawDocument = xmlReadMemory([data bytes], (int)[data length], "", NULL, XML_PARSE_RECOVER | XML_PARSE_NOBLANKS);
    }
    
    return self;
    
}

- (BOOL)isTheSameDocument: (XMLDocument *)document
{
    return [document rawDocument] == _rawDocument;
}

- (XMLNode *)rootNode
{
    return [[[XMLNode alloc] initWithRawNode: xmlDocGetRootElement(_rawDocument)] autorelease];
}

- (NSArray *)evaluateXPathExpression: (NSString *)expression 
                    withNamespaces: (NSDictionary *)namespaces
{
    
    XMLPathProcessor *processor = [[[XMLPathProcessor alloc] initWithNamespaces:namespaces inDocument: self] autorelease];
    return [processor  evaluateExpression: expression];
    
}

- (void)dealloc
{
    
    xmlFreeDoc(_rawDocument);
    
    [super dealloc];
    
}

@end
