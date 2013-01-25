
#include "XMLNode.h"
#include "CFRuntime.h"
#include "VMKInternal.h"
#include <assert.h>
#include <string.h>
#include <CoreFoundation/CFString.h>

#define strequal(str1, str2) !strcmp((const char *)str1, (const char *)str2)

struct __VMKXMLNode
{
    CFRuntimeBase base;
    xmlNodePtr _rawNode;
};


static CFStringRef _VMKXMLNodeCFCopyDebugDescription(CFTypeRef cf)
{
    return CFStringCreateWithFormat(CFGetAllocator(cf), NULL, CFSTR("<VMKXMLNode %p>"), cf);
}
static CFStringRef _VMKXMLNodeCFCopyFormatDescription(CFTypeRef cf, CFDictionaryRef formatOptions)
{
    return CFStringCreateWithFormat(CFGetAllocator(cf), formatOptions, CFSTR("<VMKXMLNode %p>"), cf);
}
static Boolean _VMKXMLNodeCFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
    return cf1 == cf2;
}
static void _VMKXMLNodeCFFinalize(CFTypeRef cf)
{
    //Done
}

static CFHashCode _VMKXMLNodeCFHash(CFTypeRef cf)
{
    return (CFHashCode)cf;
}
static void _VMKXMLNodeCFInit(CFTypeRef cf)
{
    
}
static CFRuntimeClass kVMKXMLNodeContextClass =
{
    .version = 0,
    .className = "VMKXMLNode",
    .init = _VMKXMLNodeCFInit,
    .copy = NULL,
    .finalize = _VMKXMLNodeCFFinalize,
    .equal = _VMKXMLNodeCFEqual,
    .hash = _VMKXMLNodeCFHash,
    .copyFormattingDesc = _VMKXMLNodeCFCopyFormatDescription,
    .copyDebugDesc = _VMKXMLNodeCFCopyDebugDescription,
    
};
CFTypeID VMKXMLNodeGetTypeID(void)
{
    _VMKGetTypeID(kVMKXMLNodeContextClass);
}

VMKXMLNodeRef VMKXMLNodeCreate(xmlNodePtr rawNode)
{
    assert(rawNode);
    
    VMKXMLNodeRef node = _VMKCreateInstance2(VMKXMLNodeGetTypeID(), node);
    node->_rawNode = rawNode;
    
    return node;
}

const char *VMKXMLNodeGetElementName(VMKXMLNodeRef node)
{
    assert(node);
    return (const char *)node->_rawNode->name;
}

const char *VMKXMLNodeGetAttributeWithName(VMKXMLNodeRef node, const char *name)
{    
    assert(node);
    assert(name);
    
    xmlAttrPtr attribute = node->_rawNode->properties;
    while (attribute)
    {
        
        if ((attribute->ns == NULL) && strequal(attribute->name, name))
        {
            return (const char *)attribute->children->content;
        }
        
        attribute = attribute->next;
    }
    
    return nil;
    
}

const char *VMKXMLNodeGetAttributeWithNamespace(VMKXMLNodeRef node, const char *theNamespace, const char *name)
{
    assert(node);

    xmlAttrPtr attribute = node->_rawNode->properties;
    while (attribute)
    {
        
        if (strequal(attribute->ns->href, theNamespace)
            && strequal(attribute->name, name))
        {
            return (const char *)attribute->children->content;
        }
        
        attribute = attribute->next;
    }
    
    return NULL;
}

Boolean VMKXMLNodeIsTheSameNode(VMKXMLNodeRef node, VMKXMLNodeRef node1)
{
    assert(node);
    assert(node1);
    return node->_rawNode == node1->_rawNode;
}

const char *VMKXMLNodeGetNamespace(VMKXMLNodeRef node)
{
    assert(node);

    return (const char *)node->_rawNode->nsDef->href;
}

const char *XMKXMLNodeGetNamespacePrefix(VMKXMLNodeRef node)
{
    assert(node);

    return (const char *)node->_rawNode->nsDef->prefix;
}

VMKXMLNodeRef VMKXMLNodeGetFirstChild(VMKXMLNodeRef node)
{
    assert(node);
    if (node->_rawNode->children)
    {
        VMKXMLNodeRef child = VMKXMLNodeCreate(node->_rawNode->children);
        CFMakeCollectable(child);
        return child;
    }else
    {
        return nil;
    }
    
}

VMKXMLNodeRef VMKXMLNodeGetNextSibling(VMKXMLNodeRef node)
{
    assert(node);
    if (node->_rawNode->next)
    {
        VMKXMLNodeRef sibling = VMKXMLNodeCreate(node->_rawNode->next);
        CFMakeCollectable(sibling);
        return sibling;
        
    }else
    {
        return nil;
    }
    
}

VMKXMLNodeRef VMKXMLNodeGetParentNode(VMKXMLNodeRef node)
{
    
    if (node->_rawNode->parent)
    {
        VMKXMLNodeRef parentNode = VMKXMLNodeCreate(node->_rawNode->parent);
        CFMakeCollectable(parentNode);
        return parentNode;
    }
    else
    {
        return nil;
    }
    
}

const char *VMKXMLNodeGetValue(VMKXMLNodeRef node)
{
    assert(node);
    
    return  (const char *)node->_rawNode->content;
}

const char *VMKXMLNodeGetTextContent(VMKXMLNodeRef node)
{
    assert(node);
    
    if (node->_rawNode->children)
    {
        return  (const char *)node->_rawNode->children->content;
    }else
    {
        return NULL;
    }
}

VMKXMLNodeRef VMKXMLNodeGetChildWithName(VMKXMLNodeRef node, const char *name)
{
    VMKXMLNodeRef childNode = VMKXMLNodeGetFirstChild(node);

    while (childNode && !strequal(name, VMKXMLNodeGetElementName(childNode)))
    {
        childNode = VMKXMLNodeGetNextSibling(childNode);
    }
    
    return childNode;
    
}

const char *VMKXMLNodeGetTextContentWithChildNodeName(VMKXMLNodeRef node, const char *name)
{
    return VMKXMLNodeGetTextContent(VMKXMLNodeGetChildWithName(node, name));
}
