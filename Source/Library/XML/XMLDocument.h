
#ifndef __VMK_VMKXMLDOCUMENT__
#define __VMK_VMKXMLDOCUMENT__ 1

#include "XMLNode.h"

#include <CoreFoundation/CFData.h>
#include <CoreFoundation/CFArray.h>
#include <CoreFoundation/CFDictionary.h>
#include <libxml/tree.h>

typedef struct __VMKXMLDocument *VMKXMLDocumentRef;

CFTypeID VMKXMLDocumentGetTypeID(void);

VMKXMLDocumentRef VMKXMLDocumentCreateWithData(CFDataRef data);

xmlDocPtr VMKXMLDocumentGetRawDocument(VMKXMLDocumentRef document);

VMKXMLNodeRef VMKXMLDocumentGetRootNode(VMKXMLDocumentRef document);

CFArrayRef VMKXMLDocumentEvaluateXPathExpression(VMKXMLDocumentRef document, const char *expression, CFDictionaryRef namespaces);

#endif
