#include "XMLDocument.h"
#include <libxml/parser.h>
#include "XMLPathProcessor.h"
#include "CFRuntime.h"
#include "VMKInternal.h"
#include <CoreFoundation/CFString.h>
#include <assert.h>

struct __VMKXMLDocument
{
    CFRuntimeBase base;
    xmlDocPtr _rawDocument;
};

#pragma mark - CoreFoundation

static CFStringRef _VMKXMLDocumentCFCopyDebugDescription(CFTypeRef cf)
{
    return CFStringCreateWithFormat(CFGetAllocator(cf), NULL, CFSTR("<VMKXMLDocument %p>"), cf);
}
static CFStringRef _VMKXMLDocumentCFCopyFormatDescription(CFTypeRef cf, CFDictionaryRef formatOptions)
{
    return CFStringCreateWithFormat(CFGetAllocator(cf), formatOptions, CFSTR("<VMKXMLDocument %p>"), cf);
}
static Boolean _VMKXMLDocumentCFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
    return cf1 == cf2;
}
static void _VMKXMLDocumentCFFinalize(CFTypeRef cf)
{
    //Done
    VMKXMLDocumentRef document = (VMKXMLDocumentRef)cf;
    
    xmlFreeDoc(document->_rawDocument);
    document->_rawDocument = NULL;
    
}

static CFHashCode _VMKXMLDocumentCFHash(CFTypeRef cf)
{
    return (CFHashCode)cf;
}
static void _VMKXMLDocumentCFInit(CFTypeRef cf)
{
    
}
static CFRuntimeClass kVMKXMLDocumentContextClass =
{
    .version = 0,
    .className = "VMKXMLDocument",
    .init = _VMKXMLDocumentCFInit,
    .copy = NULL,
    .finalize = _VMKXMLDocumentCFFinalize,
    .equal = _VMKXMLDocumentCFEqual,
    .hash = _VMKXMLDocumentCFHash,
    .copyFormattingDesc = _VMKXMLDocumentCFCopyFormatDescription,
    .copyDebugDesc = _VMKXMLDocumentCFCopyDebugDescription,
    
};
CFTypeID VMKXMLDocumentGetTypeID(void)
{
    _VMKGetTypeID(kVMKXMLDocumentContextClass);
}

VMKXMLDocumentRef VMKXMLDocumentCreateWithData(CFDataRef data)
{
    VMKXMLDocumentRef document = _VMKCreateInstance2(VMKXMLDocumentGetTypeID(), document);
    
    document->_rawDocument = xmlReadMemory((const char*)CFDataGetBytePtr(data), (int)CFDataGetLength(data), "", NULL, XML_PARSE_RECOVER | XML_PARSE_NOBLANKS);
    
    return document;
}

xmlDocPtr VMKXMLDocumentGetRawDocument(VMKXMLDocumentRef document)
{
    assert(document);
    return document->_rawDocument;
}

VMKXMLNodeRef VMKXMLDocumentGetRootNode(VMKXMLDocumentRef document)
{
    assert(document);
    
    VMKXMLNodeRef rootNode = VMKXMLNodeCreate(xmlDocGetRootElement(document->_rawDocument));
    
    CFMakeCollectable(rootNode);
    
    return rootNode;
}

CFArrayRef VMKXMLDocumentEvaluateXPathExpression(VMKXMLDocumentRef document,
                                                 const char *expression,
                                                 CFDictionaryRef namespaces)
{
    VMKXMLPathProcessorRef processor = VMKXMLPathProcessorCreate(namespaces, document);
    CFMakeCollectable(processor);
    
    return VMKXMLPathProcessorEvaluateExpression(processor, expression);
}
