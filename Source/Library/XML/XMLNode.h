
#ifndef __VMK_VMKXMLNODE__
#define __VMK_VMKXMLNODE__ 1

#include <libxml/tree.h>
#include <CoreFoundation/CFBase.h>

typedef struct __VMKXMLNode *VMKXMLNodeRef;

CFTypeID VMKXMLNodeGetTypeID(void);

VMKXMLNodeRef VMKXMLNodeCreate(xmlNodePtr rawNode);

const char *VMKXMLNodeGetElementName(VMKXMLNodeRef node);

const char *VMKXMLNodeGetAttributeWithName(VMKXMLNodeRef node, const char *name);

const char *VMKXMLNodeGetAttributeWithNamespace(VMKXMLNodeRef node, const char *theNamespace, const char *name);

Boolean VMKXMLNodeIsTheSameNode(VMKXMLNodeRef node, VMKXMLNodeRef node1);

const char *VMKXMLNodeGetNamespace(VMKXMLNodeRef node);

const char *XMKXMLNodeGetNamespacePrefix(VMKXMLNodeRef node);

VMKXMLNodeRef VMKXMLNodeGetFirstChild(VMKXMLNodeRef node);

VMKXMLNodeRef VMKXMLNodeGetNextSibling(VMKXMLNodeRef node);

VMKXMLNodeRef VMKXMLNodeGetParentNode(VMKXMLNodeRef node);

const char *VMKXMLNodeGetValue(VMKXMLNodeRef node);

const char *VMKXMLNodeGetTextContent(VMKXMLNodeRef node);

VMKXMLNodeRef VMKXMLNodeGetChildWithName(VMKXMLNodeRef node, const char *name);

const char *VMKXMLNodeGetTextContentWithChildNodeName(VMKXMLNodeRef node, const char *name);

#endif
