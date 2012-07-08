#import "XMLNode.h"


@implementation XMLNode

@synthesize rawNode = _rawNode;

- (XMLNode *)initWithRawNode: (xmlNodePtr)rawNode
{
    
    self = [super init];
    if (self)
    {
        _rawNode = rawNode;
    }
    
    return self;
    
}

- (NSString *)elementName
{
    return [NSString stringWithUTF8String: (const char *)_rawNode->name];
}

- (NSString *)attributeWithName:(NSString *)name
{
    
    xmlAttrPtr attribute = _rawNode->properties;
    while (attribute)
    {
        
        if ((attribute->ns == NULL) && [[NSString stringWithUTF8String: (const char *)attribute->name] isEqualToString: name])
        {
            return [NSString stringWithUTF8String: (const char *)attribute->children->content];
        }
        
        attribute = attribute->next;
    }
    
    return nil;
    
}

- (NSString *)attributeWithNamespace: (NSString *)theNamespace andName: (NSString *)name
{
    
    xmlAttrPtr attribute = _rawNode->properties;
    while (attribute)
    {
        
        if ([[NSString stringWithUTF8String: (const char *)attribute->ns->href] isEqualToString: theNamespace] && [[NSString stringWithUTF8String: (const char *)attribute->name] isEqualToString: name])
        {
            return [NSString stringWithUTF8String: (const char *)attribute->children->content];
        }
        
        attribute = attribute->next;
    }
    
    return nil;
}

- (BOOL)isTheSameNode: (XMLNode *)node
{
    return [node rawNode] == _rawNode;
}

- (NSString *)theNamespace
{
    return [NSString stringWithUTF8String: (const char *)_rawNode->nsDef->href];
}

- (NSString *)namespacePrefix
{
    return [NSString stringWithUTF8String: (const char *)_rawNode->nsDef->prefix];
}

- (XMLNode *)firstChild
{
    
    if (_rawNode->children)
    {
        return [[[XMLNode alloc] initWithRawNode: _rawNode->children] autorelease];
    }
    else
    {
        return nil;
    }
    
}

- (XMLNode *)nextSibling
{
    
    if (_rawNode->next)
    {
        return [[[XMLNode alloc] initWithRawNode: _rawNode->next] autorelease];
    }
    else
    {
        return nil;
    }
    
}

- (XMLNode *)parentNode
{
    
    if (_rawNode->parent)
    {
        return [[[XMLNode alloc] initWithRawNode: _rawNode->parent] autorelease];
    }
    else
    {
        return nil;
    }
    
}

- (NSString *)nodeValue
{
    return [NSString stringWithUTF8String: (const char *)_rawNode->content];
}

- (NSString *)textContent
{
    if (_rawNode->children) 
    {
        return [NSString stringWithUTF8String: (const char *)_rawNode->children->content];
    }else
    {
        return nil;
    }
}

- (XMLNode *)childWithName: (NSString *)name
{
    
    XMLNode *childNode = [self firstChild];
    while (childNode && ![name isEqualToString: [childNode elementName]])
    {
        childNode = [childNode nextSibling];
    }
    
    return childNode;
    
}

- (NSString *) getTextContentWithChildNodeName: (NSString *)name
{
    return [[self childWithName:name] textContent];
}
@end
