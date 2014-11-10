//
//  VeritasParser.m
//  VeritasParser
//
//  Created by Mac003 on 14/11/10.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "VeritasParser.h"

@interface VeritasParser ()<PKTokenizerDelegate>

@end

@implementation VeritasParser

- (id)initWithDelegate: (id)d
{
    if ((self = [super initWithDelegate: d]))
    {
        self.tokenKindTab[@"("] = @(VPTokenTypeOpenParen);
        self.tokenKindTab[@")"] = @(VPTokenTypeCloseParen);
        self.tokenKindTab[@"["] = @(VPTokenTypeOpenBracket);
        self.tokenKindTab[@"]"] = @(VPTokenTypeCloseBracket);
        self.tokenKindTab[@"{"] = @(VPTokenTypeOpenBrace);
        self.tokenKindTab[@"}"] = @(VPTokenTypeCloseBrace);
        self.tokenKindTab[@";"] = @(VPTokenTypeSemicolon);
        self.tokenKindTab[@","] = @(VPTokenTypeComma);
        self.tokenKindTab[@"-"] = @(VPTokenTypeMinus);
        self.tokenKindTab[@"+"] = @(VPTokenTypePlus);
        self.tokenKindTab[@"*"] = @(VPTokenTypeStar);
        self.tokenKindTab[@"/"] = @(VPTokenTypeDivide);
        self.tokenKindTab[@"^"] = @(VPTokenTypeCaret);
        self.tokenKindTab[@"%"] = @(VPTokenTypePercent);
        self.tokenKindTab[@".."] = @(VPTokenTypeConcat);
        self.tokenKindTab[@"<"] = @(VPTokenTypeLessThan);
        self.tokenKindTab[@"<="] = @(VPTokenTypeLessEqual);
        self.tokenKindTab[@">"] = @(VPTokenTypeGreater);
        self.tokenKindTab[@">="] = @(VPTokenTypeGreaterThan);
        self.tokenKindTab[@"=="] = @(VPTokenTypeEqual);
        self.tokenKindTab[@"~="] = @(VPTokenTypeNotEqual);
        self.tokenKindTab[@"and"] = @(VPTokenTypeAnd);
        self.tokenKindTab[@"or"] = @(VPTokenTypeOr);
        self.tokenKindTab[@"not"] = @(VPTokenTypeNot);
        
        self.tokenKindNameTab[VPTokenTypeOpenParen] = @"(";
        self.tokenKindNameTab[VPTokenTypeCloseParen] = @"(";
        self.tokenKindNameTab[VPTokenTypeOpenBracket] = @"[";
        self.tokenKindNameTab[VPTokenTypeCloseBracket] = @"]";
        self.tokenKindNameTab[VPTokenTypeOpenBrace] = @"{";
        self.tokenKindNameTab[VPTokenTypeCloseBrace] = @"}";
        self.tokenKindNameTab[VPTokenTypeSemicolon] = @";";
        self.tokenKindNameTab[VPTokenTypeComma] = @",";
        self.tokenKindNameTab[VPTokenTypeMinus] = @"-";
        self.tokenKindNameTab[VPTokenTypePlus] = @"+";
        self.tokenKindNameTab[VPTokenTypeStar] = @"*";
        self.tokenKindNameTab[VPTokenTypeDivide] = @"/";
        self.tokenKindNameTab[VPTokenTypeCaret] = @"^";
        self.tokenKindNameTab[VPTokenTypePercent] = @"%";
        self.tokenKindNameTab[VPTokenTypeConcat] = @"..";
        self.tokenKindNameTab[VPTokenTypeLessThan] = @"<";
        self.tokenKindNameTab[VPTokenTypeLessEqual] = @"<=";
        self.tokenKindNameTab[VPTokenTypeGreater] = @">";
        self.tokenKindNameTab[VPTokenTypeGreaterThan] = @">=";
        self.tokenKindNameTab[VPTokenTypeEqual] = @"==";
        self.tokenKindNameTab[VPTokenTypeNotEqual] = @"~=";
        self.tokenKindNameTab[VPTokenTypeAnd] = @"and";
        self.tokenKindNameTab[VPTokenTypeOr] = @"or";
        self.tokenKindNameTab[VPTokenTypeNot] = @"not";
    }
    
    return self;
}

- (void)start
{
    [self _chunk];
    [self matchEOF: YES];
}

- (void)_chunk
{
    [self _block];
}

- (void)_block
{
    [self _stat];
    [self speculate: (^
                      {
                          [self _retstat];
                      })];
}

- (void)_stat
{
}

- (void)_retstat
{
    
}

- (void)_label
{
    
}

- (void)_funcname
{
    
}

- (void)_varlist
{
    
}

- (void)_var
{
    
}

- (void)_namelist
{
    
}

- (void)_explist
{
    
}

- (void)_exp
{
    
}

- (void)_prefixexp
{
    
}

- (void)_functioncall
{
    
}

- (void)_args
{
    
}

- (void)_functiondef
{
    
}

- (void)_funcbody
{
    
}

- (void)_parlist
{
    
}

- (void)_tableconstructor
{
    
}

- (void)_fieldlist
{
    
}

- (void)_field
{
    
}

- (void)_fieldsep
{
    
}

- (void)_binop
{
    
}

- (void)_unop
{
    if ([self predicts: VPTokenTypeMinus, VPTokenTypeNot, TOKEN_KIND_BUILTIN_HASHTAG, 0])
    {
        
    }else
    {
        [self raise: @"No viable alternative found in rule 'unop'."];
    }
}

@end
