
#ifndef __VMK_VMKXMLPATHPROCESSOR__
#define __VMK_VMKXMLPATHPROCESSOR__ 1

#include "XMLDocument.h"

#include <libxml/xpath.h>

typedef struct __VMKXMLPathProcessor *VMKXMLPathProcessorRef;

CFTypeID VMKXMLPathProcessorGetTypeID(void);


xmlXPathContextPtr VMKXMLPathProcessorGetRawXMLPathContext(VMKXMLPathProcessorRef processor);

VMKXMLPathProcessorRef VMKXMLPathProcessorCreate(CFDictionaryRef namespaces, VMKXMLDocumentRef document);

void VMKXMLPathProcessorRegisterNamespace(VMKXMLPathProcessorRef processord,
                                          const char *theNamespace,
                                          const char *prefix);

CFArrayRef VMKXMLPathProcessorEvaluateExpression(VMKXMLPathProcessorRef processor, const char *expression);

#endif
