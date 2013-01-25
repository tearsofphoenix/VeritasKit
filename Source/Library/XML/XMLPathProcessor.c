
#include "XMLPathProcessor.h"
#include "CFRuntime.h"
#include "VMKInternal.h"
#include <libxml/xpathInternals.h>
#include <assert.h>

struct __VMKXMLPathProcessor
{
    CFRuntimeBase base;
    xmlXPathContextPtr _rawXMLPathContext;
};


CFTypeID VMKXMLPathProcessorGetTypeID(void);

xmlXPathContextPtr VMKXMLPathProcessorGetRawXMLPathContext(VMKXMLPathProcessorRef processor)
{
    assert(processor);
    return processor->_rawXMLPathContext;
}

VMKXMLPathProcessorRef VMKXMLPathProcessorCreate(CFDictionaryRef namespaces, VMKXMLDocumentRef document)
{
    VMKXMLPathProcessorRef processor = _VMKCreateInstance2(VMKXMLDocumentGetTypeID(), processor);
    
    processor->_rawXMLPathContext = xmlXPathNewContext(VMKXMLDocumentGetRawDocument(document));
    
    
//    NSEnumerator *enumerator = [namespaces keyEnumerator];
//    NSString *key;
//    
//    while ((key = (NSString *)[enumerator nextObject]))
//    {
//        [self registerNamespace: [namespaces objectForKey: key] withPrefix: key];
//    }

    return processor;
}

void VMKXMLPathProcessorRegisterNamespace(VMKXMLPathProcessorRef processor,
                                          const char *theNamespace,
                                          const char *prefix)
{
    assert(processor);
    xmlXPathRegisterNs(processor->_rawXMLPathContext, (const xmlChar *)prefix, (const xmlChar *)theNamespace);
}

CFArrayRef VMKXMLPathProcessorEvaluateExpression(VMKXMLPathProcessorRef processor, const char *expression)
{
    assert(processor);
    
    xmlXPathObjectPtr xpathObject = xmlXPathEvalExpression((xmlChar *)expression, processor->_rawXMLPathContext);
	
	xmlNodeSetPtr nodes = xpathObject->nodesetval;
	
    CFMutableArrayRef results = NULL;
    
    if (nodes)
    {
        
        results = CFArrayCreateMutable(NULL, 0, &kCFTypeArrayCallBacks);
        
        int looper = 0;
        while (looper < nodes->nodeNr)
        {
            VMKXMLNodeRef node = VMKXMLNodeCreate(nodes->nodeTab[looper]);
            
            CFArrayAppendValue(results, node);
            
            CFRelease(node);
            
            ++looper;
        }
        
    }
    
    xmlXPathFreeObject(xpathObject);
    
    CFMakeCollectable(results);
    
    return results;
}
