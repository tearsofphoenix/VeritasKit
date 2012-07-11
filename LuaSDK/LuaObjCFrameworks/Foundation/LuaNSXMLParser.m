//
//  LuaNSXMLParser.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSXMLParser.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __LuaNSXMLParserConstants[] = 
{
    {"NSXMLParserInternalError", NSXMLParserInternalError},
    {"NSXMLParserOutOfMemoryError", NSXMLParserOutOfMemoryError},
    {"NSXMLParserDocumentStartError", NSXMLParserDocumentStartError},
    {"NSXMLParserEmptyDocumentError", NSXMLParserEmptyDocumentError},
    {"NSXMLParserPrematureDocumentEndError", NSXMLParserPrematureDocumentEndError},
    {"NSXMLParserInvalidHexCharacterRefError", NSXMLParserInvalidHexCharacterRefError},
    {"NSXMLParserInvalidDecimalCharacterRefError", NSXMLParserInvalidDecimalCharacterRefError},
    {"NSXMLParserInvalidCharacterRefError", NSXMLParserInvalidCharacterRefError},
    {"NSXMLParserInvalidCharacterError", NSXMLParserInvalidCharacterError},
    {"NSXMLParserCharacterRefAtEOFError", NSXMLParserCharacterRefAtEOFError},
    {"NSXMLParserCharacterRefInPrologError", NSXMLParserCharacterRefInPrologError},
    {"NSXMLParserCharacterRefInEpilogError", NSXMLParserCharacterRefInEpilogError},
    {"NSXMLParserCharacterRefInDTDError", NSXMLParserCharacterRefInDTDError},
    {"NSXMLParserEntityRefAtEOFError", NSXMLParserEntityRefAtEOFError},
    {"NSXMLParserEntityRefInPrologError", NSXMLParserEntityRefInPrologError},
    {"NSXMLParserEntityRefInEpilogError", NSXMLParserEntityRefInEpilogError},
    {"NSXMLParserEntityRefInDTDError", NSXMLParserEntityRefInDTDError},
    {"NSXMLParserParsedEntityRefAtEOFError", NSXMLParserParsedEntityRefAtEOFError},
    {"NSXMLParserParsedEntityRefInPrologError", NSXMLParserParsedEntityRefInPrologError},
    {"NSXMLParserParsedEntityRefInEpilogError", NSXMLParserParsedEntityRefInEpilogError},
    {"NSXMLParserParsedEntityRefInInternalSubsetError", NSXMLParserParsedEntityRefInInternalSubsetError},
    {"NSXMLParserEntityReferenceWithoutNameError", NSXMLParserEntityReferenceWithoutNameError},
    {"NSXMLParserEntityReferenceMissingSemiError", NSXMLParserEntityReferenceMissingSemiError},
    {"NSXMLParserParsedEntityRefNoNameError", NSXMLParserParsedEntityRefNoNameError},
    {"NSXMLParserParsedEntityRefMissingSemiError", NSXMLParserParsedEntityRefMissingSemiError},
    {"NSXMLParserUndeclaredEntityError", NSXMLParserUndeclaredEntityError},
    {"NSXMLParserUnparsedEntityError", NSXMLParserUnparsedEntityError},
    {"NSXMLParserEntityIsExternalError", NSXMLParserEntityIsExternalError},
    {"NSXMLParserEntityIsParameterError", NSXMLParserEntityIsParameterError},
    {"NSXMLParserUnknownEncodingError", NSXMLParserUnknownEncodingError},
    {"NSXMLParserEncodingNotSupportedError", NSXMLParserEncodingNotSupportedError},
    {"NSXMLParserStringNotStartedError", NSXMLParserStringNotStartedError},
    {"NSXMLParserStringNotClosedError", NSXMLParserStringNotClosedError},
    {"NSXMLParserNamespaceDeclarationError", NSXMLParserNamespaceDeclarationError},
    {"NSXMLParserEntityNotStartedError", NSXMLParserEntityNotStartedError},
    {"NSXMLParserEntityNotFinishedError", NSXMLParserEntityNotFinishedError},
    {"NSXMLParserLessThanSymbolInAttributeError", NSXMLParserLessThanSymbolInAttributeError},
    {"NSXMLParserAttributeNotStartedError", NSXMLParserAttributeNotStartedError},
    {"NSXMLParserAttributeNotFinishedError", NSXMLParserAttributeNotFinishedError},
    {"NSXMLParserAttributeHasNoValueError", NSXMLParserAttributeHasNoValueError},
    {"NSXMLParserAttributeRedefinedError", NSXMLParserAttributeRedefinedError},
    {"NSXMLParserLiteralNotStartedError", NSXMLParserLiteralNotStartedError},
    {"NSXMLParserLiteralNotFinishedError", NSXMLParserLiteralNotFinishedError},
    {"NSXMLParserCommentNotFinishedError", NSXMLParserCommentNotFinishedError},
    {"NSXMLParserProcessingInstructionNotStartedError", NSXMLParserProcessingInstructionNotStartedError},
    {"NSXMLParserProcessingInstructionNotFinishedError", NSXMLParserProcessingInstructionNotFinishedError},
    {"NSXMLParserNotationNotStartedError", NSXMLParserNotationNotStartedError},
    {"NSXMLParserNotationNotFinishedError", NSXMLParserNotationNotFinishedError},
    {"NSXMLParserAttributeListNotStartedError", NSXMLParserAttributeListNotStartedError},
    {"NSXMLParserAttributeListNotFinishedError", NSXMLParserAttributeListNotFinishedError},
    {"NSXMLParserMixedContentDeclNotStartedError", NSXMLParserMixedContentDeclNotStartedError},
    {"NSXMLParserMixedContentDeclNotFinishedError", NSXMLParserMixedContentDeclNotFinishedError},
    {"NSXMLParserElementContentDeclNotStartedError", NSXMLParserElementContentDeclNotStartedError},
    {"NSXMLParserElementContentDeclNotFinishedError", NSXMLParserElementContentDeclNotFinishedError},
    {"NSXMLParserXMLDeclNotStartedError", NSXMLParserXMLDeclNotStartedError},
    {"NSXMLParserXMLDeclNotFinishedError", NSXMLParserXMLDeclNotFinishedError},
    {"NSXMLParserConditionalSectionNotStartedError", NSXMLParserConditionalSectionNotStartedError},
    {"NSXMLParserConditionalSectionNotFinishedError", NSXMLParserConditionalSectionNotFinishedError},
    {"NSXMLParserExternalSubsetNotFinishedError", NSXMLParserExternalSubsetNotFinishedError},
    {"NSXMLParserDOCTYPEDeclNotFinishedError", NSXMLParserDOCTYPEDeclNotFinishedError},
    {"NSXMLParserMisplacedCDATAEndStringError", NSXMLParserMisplacedCDATAEndStringError},
    {"NSXMLParserCDATANotFinishedError", NSXMLParserCDATANotFinishedError},
    {"NSXMLParserMisplacedXMLDeclarationError", NSXMLParserMisplacedXMLDeclarationError},
    {"NSXMLParserSpaceRequiredError", NSXMLParserSpaceRequiredError},
    {"NSXMLParserSeparatorRequiredError", NSXMLParserSeparatorRequiredError},
    {"NSXMLParserNMTOKENRequiredError", NSXMLParserNMTOKENRequiredError},
    {"NSXMLParserNAMERequiredError", NSXMLParserNAMERequiredError},
    {"NSXMLParserPCDATARequiredError", NSXMLParserPCDATARequiredError},
    {"NSXMLParserURIRequiredError", NSXMLParserURIRequiredError},
    {"NSXMLParserPublicIdentifierRequiredError", NSXMLParserPublicIdentifierRequiredError},
    {"NSXMLParserLTRequiredError", NSXMLParserLTRequiredError},
    {"NSXMLParserGTRequiredError", NSXMLParserGTRequiredError},
    {"NSXMLParserLTSlashRequiredError", NSXMLParserLTSlashRequiredError},
    {"NSXMLParserEqualExpectedError", NSXMLParserEqualExpectedError},
    {"NSXMLParserTagNameMismatchError", NSXMLParserTagNameMismatchError},
    {"NSXMLParserUnfinishedTagError", NSXMLParserUnfinishedTagError},
    {"NSXMLParserStandaloneValueError", NSXMLParserStandaloneValueError},
    {"NSXMLParserInvalidEncodingNameError", NSXMLParserInvalidEncodingNameError},
    {"NSXMLParserCommentContainsDoubleHyphenError", NSXMLParserCommentContainsDoubleHyphenError},
    {"NSXMLParserInvalidEncodingError", NSXMLParserInvalidEncodingError},
    {"NSXMLParserExternalStandaloneEntityError", NSXMLParserExternalStandaloneEntityError},
    {"NSXMLParserInvalidConditionalSectionError", NSXMLParserInvalidConditionalSectionError},
    {"NSXMLParserEntityValueRequiredError", NSXMLParserEntityValueRequiredError},
    {"NSXMLParserNotWellBalancedError", NSXMLParserNotWellBalancedError},
    {"NSXMLParserExtraContentError", NSXMLParserExtraContentError},
    {"NSXMLParserInvalidCharacterInEntityError", NSXMLParserInvalidCharacterInEntityError},
    {"NSXMLParserParsedEntityRefInInternalError", NSXMLParserParsedEntityRefInInternalError},
    {"NSXMLParserEntityRefLoopError", NSXMLParserEntityRefLoopError},
    {"NSXMLParserEntityBoundaryError", NSXMLParserEntityBoundaryError},
    {"NSXMLParserInvalidURIError", NSXMLParserInvalidURIError},
    {"NSXMLParserURIFragmentError", NSXMLParserURIFragmentError},
    {"NSXMLParserNoDTDError", NSXMLParserNoDTDError},
    {"NSXMLParserDelegateAbortedParseError", NSXMLParserDelegateAbortedParseError},
    {NULL, 0},
};

int LuaOpenNSXMLParser(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __LuaNSXMLParserConstants);
    return 0;
}
