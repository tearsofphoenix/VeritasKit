//
//  VeritasParser.h
//  VeritasParser
//
//  Created by Mac003 on 14/11/10.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import <PEGKit/PEGKit.h>

typedef enum : NSUInteger
{
    VPTokenTypeOpenParen = 14, //(
    VPTokenTypeCloseParen, // )
    VPTokenTypeOpenBracket, //[
    VPTokenTypeCloseBracket, //]
    VPTokenTypeOpenBrace,    //{
    VPTokenTypeCloseBrace,   //}
    VPTokenTypeSemicolon,    //;
    VPTokenTypeComma,        //,
    VPTokenTypeMinus,   // -
    VPTokenTypePlus,    // +
    VPTokenTypeStar,    // *
    VPTokenTypeDivide,  // /
    VPTokenTypeCaret,   // ^
    VPTokenTypePercent, // %
    VPTokenTypeConcat,  // ..
    VPTokenTypeLessThan, // <
    VPTokenTypeLessEqual,// <=
    VPTokenTypeGreater,  // >
    VPTokenTypeGreaterThan, // >=
    VPTokenTypeEqual,    // ==
    VPTokenTypeNotEqual, // ~=
    VPTokenTypeAnd,      // and
    VPTokenTypeOr,       // or
    VPTokenTypeNot,      // not
} VPTokenType;

@interface VeritasParser : PKParser

@end
