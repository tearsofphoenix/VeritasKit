
#include "XMLPathProcessor.h"
#include "CFRuntime.h"
#include "VMKInternal.h"
#include <CoreFoundation/CFString.h>
#include <libxml/xpathInternals.h>
#include <assert.h>

struct __VMKXMLPathProcessor
{
    CFRuntimeBase base;
    xmlXPathContextPtr _rawXMLPathContext;
};

#pragma mark - Core Foundation apis

static CFStringRef _VMKXMLPathProcessorCFCopyDebugDescription(CFTypeRef cf)
{
    return CFStringCreateWithFormat(CFGetAllocator(cf), NULL, CFSTR("<VMKXMLPathProcessor %p>"), cf);
}
static CFStringRef _VMKXMLPathProcessorCFCopyFormatDescription(CFTypeRef cf, CFDictionaryRef formatOptions)
{
    return CFStringCreateWithFormat(CFGetAllocator(cf), formatOptions, CFSTR("<VMKXMLPathProcessor %p>"), cf);
}
static Boolean _VMKXMLPathProcessorCFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
    return cf1 == cf2;
}
static void _VMKXMLPathProcessorCFFinalize(CFTypeRef cf)
{
    //Done
}

static CFHashCode _VMKXMLPathProcessorCFHash(CFTypeRef cf)
{
    return (CFHashCode)cf;
}
static void _VMKXMLPathProcessorCFInit(CFTypeRef cf)
{
    
}
static CFRuntimeClass kVMKXMLPathProcessorContextClass =
{
    .version = 0,
    .className = "VMKXMLPathProcessor",
    .init = _VMKXMLPathProcessorCFInit,
    .copy = NULL,
    .finalize = _VMKXMLPathProcessorCFFinalize,
    .equal = _VMKXMLPathProcessorCFEqual,
    .hash = _VMKXMLPathProcessorCFHash,
    .copyFormattingDesc = _VMKXMLPathProcessorCFCopyFormatDescription,
    .copyDebugDesc = _VMKXMLPathProcessorCFCopyDebugDescription,
    
};
CFTypeID VMKXMLPathProcessorGetTypeID(void)
{
    _VMKGetTypeID(kVMKXMLPathProcessorContextClass);
}

#pragma mark - public apis

xmlXPathContextPtr VMKXMLPathProcessorGetRawXMLPathContext(VMKXMLPathProcessorRef processor)
{
    assert(processor);
    return processor->_rawXMLPathContext;
}

static void __registerNamespace(const void *key, const void *value, void *context)
{
    VMKXMLPathProcessorRef processor = context;
    VMKXMLPathProcessorRegisterNamespace(processor, value, key);
}

VMKXMLPathProcessorRef VMKXMLPathProcessorCreate(CFDictionaryRef namespaces, VMKXMLDocumentRef document)
{
    VMKXMLPathProcessorRef processor = _VMKCreateInstance2(VMKXMLDocumentGetTypeID(), processor);
    
    processor->_rawXMLPathContext = xmlXPathNewContext(VMKXMLDocumentGetRawDocument(document));
    
    if (namespaces)
    {
        CFDictionaryApplyFunction(namespaces, __registerNamespace, processor);
    }

    return processor;
}

void VMKXMLPathProcessorRegisterNamespace(VMKXMLPathProcessorRef processor, const char *theNamespace, const char *prefix)
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
