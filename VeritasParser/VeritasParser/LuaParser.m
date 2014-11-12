#import "LuaParser.h"
#import <PEGKit/PEGKit.h>


@interface LuaParser ()

@end

@implementation LuaParser { }
    
- (void)setPreserveWhitespace:(BOOL)yn {
    _preserveWhitespace = yn;
    self.silentlyConsumesWhitespace = YES;
    self.tokenizer.whitespaceState.reportsWhitespaceTokens = YES;
    self.assembly.preservesWhitespaceTokens = YES;
}

- (instancetype)initWithDelegate:(id)d {
    self = [super initWithDelegate:d];
    if (self) {
        
        self.startRuleName = @"program";
        self.enableAutomaticErrorRecovery = YES;

        self.tokenKindTab[@"~="] = @(LuaTokenKind_NE);
        self.tokenKindTab[@"("] = @(LuaTokenKind_OPENPAREN);
        self.tokenKindTab[@"}"] = @(LuaTokenKind_CLOSECURLY);
        self.tokenKindTab[@"return"] = @(LuaTokenKind_RETURN);
        self.tokenKindTab[@"~"] = @(LuaTokenKind_TILDE);
        self.tokenKindTab[@")"] = @(LuaTokenKind_CLOSEPAREN);
        self.tokenKindTab[@"*"] = @(LuaTokenKind_TIMES);

        self.tokenKindTab[@"+"] = @(LuaTokenKind_PLUS);

        self.tokenKindTab[@","] = @(LuaTokenKind_COMMA);

        self.tokenKindTab[@"if"] = @(LuaTokenKind_IF);
        self.tokenKindTab[@"-"] = @(LuaTokenKind_MINUS);
        self.tokenKindTab[@"nil"] = @(LuaTokenKind_Nil);
        self.tokenKindTab[@"false"] = @(LuaTokenKind_FALSE);
        self.tokenKindTab[@"."] = @(LuaTokenKind_DOT);

        self.tokenKindTab[@"/"] = @(LuaTokenKind_DIV);
        
        self.tokenKindTab[@"<="] = @(LuaTokenKind_LE);

        self.tokenKindTab[@"["] = @(LuaTokenKind_OPENBRACKET);

        self.tokenKindTab[@"or"] = @(LuaTokenKind_OR);
        self.tokenKindTab[@"function"] = @(LuaTokenKind_FUNCTION);
        self.tokenKindTab[@"]"] = @(LuaTokenKind_CLOSEBRACKET);
        self.tokenKindTab[@"^"] = @(LuaTokenKind_CARET);
        self.tokenKindTab[@"=="] = @(LuaTokenKind_EQ);
        self.tokenKindTab[@"continue"] = @(LuaTokenKind_CONTINUE);
        self.tokenKindTab[@"break"] = @(LuaTokenKind_BREAK);

        self.tokenKindTab[@">="] = @(LuaTokenKind_GE);
        self.tokenKindTab[@":"] = @(LuaTokenKind_COLON);
        self.tokenKindTab[@"in"] = @(LuaTokenKind_IN);
        self.tokenKindTab[@";"] = @(LuaTokenKind_SEMI);
        self.tokenKindTab[@"for"] = @(LuaTokenKind_FOR);

        self.tokenKindTab[@"<"] = @(LuaTokenKind_LT);

        self.tokenKindTab[@"="] = @(LuaTokenKind_EQUALS);
        self.tokenKindTab[@">"] = @(LuaTokenKind_GT);

        self.tokenKindTab[@"?"] = @(LuaTokenKind_QUESTION);
        self.tokenKindTab[@"while"] = @(LuaTokenKind_WHILE);

        self.tokenKindTab[@"else"] = @(LuaTokenKind_ELSE);

        self.tokenKindTab[@"and"] = @(LuaTokenKind_AND);
        self.tokenKindTab[@"local"] = @(kLuaTokenKindLocal);

        self.tokenKindTab[@"--"] = @(LuaTokenKind_MINUSMINUS);
        self.tokenKindTab[@"not"] = @(LuaTokenKind_NOT);

        self.tokenKindTab[@"true"] = @(LuaTokenKind_TRUE);
        self.tokenKindTab[@"this"] = @(LuaTokenKind_THIS);
        self.tokenKindTab[@"with"] = @(LuaTokenKind_WITH);
        self.tokenKindTab[@"%"] = @(LuaTokenKind_MOD);

        self.tokenKindTab[@"{"] = @(LuaTokenKind_OPENCURLY);

        self.tokenKindNameTab[LuaTokenKind_NE] = @"!=";
        self.tokenKindNameTab[LuaTokenKind_OPENPAREN] = @"(";
        self.tokenKindNameTab[LuaTokenKind_CLOSECURLY] = @"}";
        self.tokenKindNameTab[LuaTokenKind_RETURN] = @"return";
        self.tokenKindNameTab[LuaTokenKind_TILDE] = @"~";
        self.tokenKindNameTab[LuaTokenKind_CLOSEPAREN] = @")";
        self.tokenKindNameTab[LuaTokenKind_TIMES] = @"*";

        self.tokenKindNameTab[LuaTokenKind_PLUS] = @"+";

        self.tokenKindNameTab[LuaTokenKind_COMMA] = @",";

        self.tokenKindNameTab[LuaTokenKind_IF] = @"if";
        self.tokenKindNameTab[LuaTokenKind_MINUS] = @"-";
        self.tokenKindNameTab[LuaTokenKind_Nil] = @"null";
        self.tokenKindNameTab[LuaTokenKind_FALSE] = @"false";
        self.tokenKindNameTab[LuaTokenKind_DOT] = @".";
        self.tokenKindNameTab[LuaTokenKind_DIV] = @"/";

        self.tokenKindNameTab[LuaTokenKind_LE] = @"<=";

        self.tokenKindNameTab[LuaTokenKind_OPENBRACKET] = @"[";

        self.tokenKindNameTab[LuaTokenKind_OR] = @"||";
        self.tokenKindNameTab[LuaTokenKind_FUNCTION] = @"function";
        self.tokenKindNameTab[LuaTokenKind_CLOSEBRACKET] = @"]";
        self.tokenKindNameTab[LuaTokenKind_CARET] = @"^";
        self.tokenKindNameTab[LuaTokenKind_EQ] = @"==";
        self.tokenKindNameTab[LuaTokenKind_CONTINUE] = @"continue";
        self.tokenKindNameTab[LuaTokenKind_BREAK] = @"break";

        self.tokenKindNameTab[LuaTokenKind_GE] = @">=";
        self.tokenKindNameTab[LuaTokenKind_COLON] = @":";
        self.tokenKindNameTab[LuaTokenKind_IN] = @"in";
        self.tokenKindNameTab[LuaTokenKind_SEMI] = @";";
        self.tokenKindNameTab[LuaTokenKind_FOR] = @"for";

        self.tokenKindNameTab[LuaTokenKind_LT] = @"<";

        self.tokenKindNameTab[LuaTokenKind_EQUALS] = @"=";
        self.tokenKindNameTab[LuaTokenKind_GT] = @">";

        self.tokenKindNameTab[LuaTokenKind_QUESTION] = @"?";
        self.tokenKindNameTab[LuaTokenKind_WHILE] = @"while";

        self.tokenKindNameTab[LuaTokenKind_ELSE] = @"else";

        self.tokenKindNameTab[LuaTokenKind_AND] = @"and";
        self.tokenKindNameTab[kLuaTokenKindLocal] = @"local";

        self.tokenKindNameTab[LuaTokenKind_MINUSMINUS] = @"--";

        self.tokenKindNameTab[LuaTokenKind_NOT] = @"not";

        self.tokenKindNameTab[LuaTokenKind_TRUE] = @"true";
        self.tokenKindNameTab[LuaTokenKind_THIS] = @"this";
        self.tokenKindNameTab[LuaTokenKind_WITH] = @"with";
        self.tokenKindNameTab[LuaTokenKind_MOD] = @"%";

        self.tokenKindNameTab[LuaTokenKind_OPENCURLY] = @"{";

    }
    return self;
}

- (void)start
{
    [self execute:^{
    
        PKTokenizer *t = self.tokenizer;

        [t.symbolState add:@"~="];
        [t.symbolState add:@"=="];
        [t.symbolState add:@"<="];
        [t.symbolState add:@">="];

        
        t.commentState.reportsCommentTokens = YES;
        
        [t setTokenizerState:t.commentState from:'/' to:'/'];
        [t.commentState addSingleLineStartMarker:@"--"];

    }];

    [self tryAndRecover: TOKEN_KIND_BUILTIN_EOF
                  block: ^{
        [self chunk_]; 
        [self matchEOF:YES]; 
    }
             completion: ^{
        [self matchEOF:YES];
    }];

}

- (void)chunk_ {
    
    [self block_];

    [self fireDelegateSelector:@selector(parser:didMatchProgram:)];
}

- (void)if_ {
    
    [self match:LuaTokenKind_IF discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchIf:)];
}

- (void)else_ {
    
    [self match:LuaTokenKind_ELSE discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchElse:)];
}

- (void)while_ {
    
    [self match:LuaTokenKind_WHILE discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchWhile:)];
}

- (void)for_ {
    
    [self match:LuaTokenKind_FOR discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchFor:)];
}

- (void)in_ {
    
    [self match:LuaTokenKind_IN discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchIn:)];
}

- (void)break_ {
    
    [self match:LuaTokenKind_BREAK discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchBreak:)];
}

- (void)continue_ {
    
    [self match:LuaTokenKind_CONTINUE discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchContinue:)];
}

- (void)with_ {
    
    [self match:LuaTokenKind_WITH discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchWith:)];
}

- (void)return_ {
    
    [self match:LuaTokenKind_RETURN discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchReturn:)];
}

- (void)local_ {
    
    [self match:kLuaTokenKindLocal discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchVar:)];
}

- (void)this_ {
    
    [self match:LuaTokenKind_THIS discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchThis:)];
}

- (void)false_ {
    
    [self match:LuaTokenKind_FALSE discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchFalse:)];
}

- (void)true_ {
    
    [self match:LuaTokenKind_TRUE discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchTrue:)];
}

- (void)nil_ {
    
    [self match:LuaTokenKind_Nil discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchNil:)];
}

- (void)function_ {
    
    [self match:LuaTokenKind_FUNCTION discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchFunction:)];
}

- (void)openCurly_ {
    
    [self match:LuaTokenKind_OPENCURLY discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchOpenCurly:)];
}

- (void)closeCurly_ {
    
    [self match:LuaTokenKind_CLOSECURLY discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchCloseCurly:)];
}

- (void)openParen_ {
    
    [self match:LuaTokenKind_OPENPAREN discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchOpenParen:)];
}

- (void)closeParen_ {
    
    [self match:LuaTokenKind_CLOSEPAREN discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchCloseParen:)];
}

- (void)openBracket_ {
    
    [self match:LuaTokenKind_OPENBRACKET discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchOpenBracket:)];
}

- (void)closeBracket_ {
    
    [self match:LuaTokenKind_CLOSEBRACKET discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchCloseBracket:)];
}

- (void)comma_ {
    
    [self match:LuaTokenKind_COMMA discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchComma:)];
}

- (void)dot_ {
    
    [self match:LuaTokenKind_DOT discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchDot:)];
}

- (void)semi_ {
    
    [self match:LuaTokenKind_SEMI discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchSemi:)];
}

- (void)colon_ {
    
    [self match:LuaTokenKind_COLON discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchColon:)];
}

- (void)equals_ {
    
    [self match:LuaTokenKind_EQUALS discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchEquals:)];
}

- (void)not_ {
    
    [self match:LuaTokenKind_NOT discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchNot:)];
}

- (void)lt_ {
    
    [self match:LuaTokenKind_LT discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchLt:)];
}

- (void)gt_ {
    
    [self match:LuaTokenKind_GT discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchGt:)];
}

- (void)caret_ {
    
    [self match:LuaTokenKind_CARET discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchCaret:)];
}

- (void)tilde_ {
    
    [self match:LuaTokenKind_TILDE discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchTilde:)];
}

- (void)question_ {
    
    [self match:LuaTokenKind_QUESTION discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchQuestion:)];
}

- (void)plus_ {
    
    [self match:LuaTokenKind_PLUS discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchPlus:)];
}

- (void)minus_ {
    
    [self match:LuaTokenKind_MINUS discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchMinus:)];
}

- (void)times_ {
    
    [self match:LuaTokenKind_TIMES discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchTimes:)];
}

- (void)div_ {
    
    [self match:LuaTokenKind_DIV discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchDiv:)];
}

- (void)mod_ {
    
    [self match:LuaTokenKind_MOD discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchMod:)];
}

- (void)or_ {
    
    [self match:LuaTokenKind_OR discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchOr:)];
}

- (void)and_ {
    
    [self match:LuaTokenKind_AND discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchAnd:)];
}

- (void)ne_ {
    
    [self match:LuaTokenKind_NE discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchNe:)];
}

- (void)eq_ {
    
    [self match:LuaTokenKind_EQ discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchEq:)];
}

- (void)le_ {
    
    [self match:LuaTokenKind_LE discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchLe:)];
}

- (void)ge_ {
    
    [self match:LuaTokenKind_GE discard:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchGe:)];
}

- (void)assignmentOperator_ {
    
    if ([self predicts:LuaTokenKind_EQUALS, 0]) {
        [self equals_]; 
    }else {
        [self raise:@"No viable alternative found in rule 'assignmentOperator'."];
    }

    [self fireDelegateSelector:@selector(parser:didMatchAssignmentOperator:)];
}

- (void)relationalOperator_ {
    
    if ([self predicts:LuaTokenKind_LT, 0]) {
        [self lt_]; 
    } else if ([self predicts:LuaTokenKind_GT, 0]) {
        [self gt_]; 
    } else if ([self predicts:LuaTokenKind_GE, 0]) {
        [self ge_]; 
    } else if ([self predicts:LuaTokenKind_LE, 0]) {
        [self le_]; 
    }else {
        [self raise:@"No viable alternative found in rule 'relationalOperator'."];
    }

    [self fireDelegateSelector:@selector(parser:didMatchRelationalOperator:)];
}

- (void)equalityOperator_ {
    
    if ([self predicts:LuaTokenKind_EQ, 0]) {
        [self eq_]; 
    } else if ([self predicts:LuaTokenKind_NE, 0]) {
        [self ne_]; 
    }else {
        [self raise:@"No viable alternative found in rule 'equalityOperator'."];
    }

    [self fireDelegateSelector:@selector(parser:didMatchEqualityOperator:)];
}

- (void)unaryOperator_ {
    
    if ([self predicts:LuaTokenKind_TILDE, 0]) {
        [self tilde_]; 
    }else {
        [self raise:@"No viable alternative found in rule 'unaryOperator'."];
    }

    [self fireDelegateSelector:@selector(parser:didMatchUnaryOperator:)];
}

- (void)multiplicativeOperator_ {
    
    if ([self predicts:LuaTokenKind_TIMES, 0]) {
        [self times_]; 
    } else if ([self predicts:LuaTokenKind_DIV, 0]) {
        [self div_]; 
    } else if ([self predicts:LuaTokenKind_MOD, 0]) {
        [self mod_]; 
    } else {
        [self raise:@"No viable alternative found in rule 'multiplicativeOperator'."];
    }

    [self fireDelegateSelector:@selector(parser:didMatchMultiplicativeOperator:)];
}

- (void)block_ {
    
    if ([self predicts:LuaTokenKind_FUNCTION, 0]) {
        [self func_]; 
    } else if ([self predicts:LuaTokenKind_BREAK, LuaTokenKind_CONTINUE, LuaTokenKind_FALSE, LuaTokenKind_FOR, LuaTokenKind_IF, LuaTokenKind_MINUS, LuaTokenKind_MINUSMINUS, LuaTokenKind_Nil, LuaTokenKind_OPENCURLY, LuaTokenKind_OPENPAREN, LuaTokenKind_RETURN, LuaTokenKind_SEMI, LuaTokenKind_THIS, LuaTokenKind_TILDE, LuaTokenKind_TRUE, kLuaTokenKindLocal, LuaTokenKind_WHILE, LuaTokenKind_WITH, TOKEN_KIND_BUILTIN_NUMBER, TOKEN_KIND_BUILTIN_QUOTEDSTRING, TOKEN_KIND_BUILTIN_WORD, 0]) {
        [self stmt_]; 
    }else if([self predicts: TOKEN_KIND_BUILTIN_COMMENT, 0])
    {
        
    }else {
        [self raise:@"No viable alternative found in rule 'element'."];
    }

    [self fireDelegateSelector:@selector(parser:didMatchElement:)];
}

- (void)func_ {
    
    [self function_]; 
    [self tryAndRecover:LuaTokenKind_OPENPAREN block:^{ 
        [self identifier_]; 
        [self openParen_]; 
    } completion:^{ 
        [self openParen_]; 
    }];
    [self tryAndRecover:LuaTokenKind_CLOSEPAREN block:^{ 
        [self paramListOpt_]; 
        [self closeParen_]; 
    } completion:^{ 
        [self closeParen_]; 
    }];
        [self compoundStmt_]; 

    [self fireDelegateSelector:@selector(parser:didMatchFunc:)];
}

- (void)paramListOpt_ {
    
    if ([self predicts:TOKEN_KIND_BUILTIN_WORD, 0]) {
        [self paramList_]; 
    }

    [self fireDelegateSelector:@selector(parser:didMatchParamListOpt:)];
}

- (void)paramList_ {
    
    [self identifier_]; 
    while ([self speculate:^{ [self commaIdentifier_]; }]) {
        [self commaIdentifier_]; 
    }

    [self fireDelegateSelector:@selector(parser:didMatchParamList:)];
}

- (void)commaIdentifier_ {
    
    [self comma_]; 
    [self identifier_]; 

    [self fireDelegateSelector:@selector(parser:didMatchCommaIdentifier:)];
}

- (void)compoundStmt_ {
    
    [self openCurly_]; 
    [self tryAndRecover:LuaTokenKind_CLOSECURLY block:^{ 
        [self stmts_]; 
        [self closeCurly_]; 
    } completion:^{ 
        [self closeCurly_]; 
    }];

    [self fireDelegateSelector:@selector(parser:didMatchCompoundStmt:)];
}

- (void)stmts_ {
    
    while ([self speculate:^{ [self stmt_]; }]) {
        [self stmt_]; 
    }

    [self fireDelegateSelector:@selector(parser:didMatchStmts:)];
}

- (void)stmt_ {
    
    if ([self speculate:^{ [self semi_]; }]) {
        [self semi_]; 
    } else if ([self speculate:^{ [self ifStmt_]; }]) {
        [self ifStmt_]; 
    } else if ([self speculate:^{ [self ifElseStmt_]; }]) {
        [self ifElseStmt_]; 
    } else if ([self speculate:^{ [self whileStmt_]; }]) {
        [self whileStmt_]; 
    } else if ([self speculate:^{ [self forParenStmt_]; }]) {
        [self forParenStmt_]; 
    } else if ([self speculate:^{ [self forBeginStmt_]; }]) {
        [self forBeginStmt_]; 
    } else if ([self speculate:^{ [self forInStmt_]; }]) {
        [self forInStmt_]; 
    } else if ([self speculate:^{ [self breakStmt_]; }]) {
        [self breakStmt_]; 
    } else if ([self speculate:^{ [self continueStmt_]; }]) {
        [self continueStmt_]; 
    } else if ([self speculate:^{ [self withStmt_]; }]) {
        [self withStmt_]; 
    } else if ([self speculate:^{ [self returnStmt_]; }]) {
        [self returnStmt_]; 
    } else if ([self speculate:^{ [self compoundStmt_]; }]) {
        [self compoundStmt_]; 
    } else if ([self speculate:^{ [self variablesOrExprStmt_]; }]) {
        [self variablesOrExprStmt_]; 
    } else {
        [self raise:@"No viable alternative found in rule 'stmt'."];
    }

    [self fireDelegateSelector:@selector(parser:didMatchStmt:)];
}

- (void)ifStmt_ {
    
    [self if_]; 
    [self condition_]; 
    [self stmt_]; 

    [self fireDelegateSelector:@selector(parser:didMatchIfStmt:)];
}

- (void)ifElseStmt_ {
    
    [self if_]; 
    [self tryAndRecover:LuaTokenKind_ELSE block:^{ 
        [self condition_]; 
        [self stmt_]; 
        [self else_]; 
    } completion:^{ 
        [self else_]; 
    }];
        [self stmt_]; 

    [self fireDelegateSelector:@selector(parser:didMatchIfElseStmt:)];
}

- (void)whileStmt_ {
    
    [self while_]; 
    [self condition_]; 
    [self stmt_]; 

    [self fireDelegateSelector:@selector(parser:didMatchWhileStmt:)];
}

- (void)forParenStmt_ {
    
    [self tryAndRecover:LuaTokenKind_SEMI block:^{ 
        [self forParen_]; 
        [self semi_]; 
    } completion:^{ 
        [self semi_]; 
    }];
    [self tryAndRecover:LuaTokenKind_SEMI block:^{ 
        [self exprOpt_]; 
        [self semi_]; 
    } completion:^{ 
        [self semi_]; 
    }];
    [self tryAndRecover:LuaTokenKind_CLOSEPAREN block:^{ 
        [self exprOpt_]; 
        [self closeParen_]; 
    } completion:^{ 
        [self closeParen_]; 
    }];
        [self stmt_]; 

    [self fireDelegateSelector:@selector(parser:didMatchForParenStmt:)];
}

- (void)forBeginStmt_ {
    
    [self tryAndRecover:LuaTokenKind_SEMI block:^{ 
        [self forBegin_]; 
        [self semi_]; 
    } completion:^{ 
        [self semi_]; 
    }];
    [self tryAndRecover:LuaTokenKind_SEMI block:^{ 
        [self exprOpt_]; 
        [self semi_]; 
    } completion:^{ 
        [self semi_]; 
    }];
    [self tryAndRecover:LuaTokenKind_CLOSEPAREN block:^{ 
        [self exprOpt_]; 
        [self closeParen_]; 
    } completion:^{ 
        [self closeParen_]; 
    }];
        [self stmt_]; 

    [self fireDelegateSelector:@selector(parser:didMatchForBeginStmt:)];
}

- (void)forInStmt_ {
    
    [self tryAndRecover:LuaTokenKind_IN block:^{ 
        [self forBegin_]; 
        [self in_]; 
    } completion:^{ 
        [self in_]; 
    }];
    [self tryAndRecover:LuaTokenKind_CLOSEPAREN block:^{ 
        [self expr_]; 
        [self closeParen_]; 
    } completion:^{ 
        [self closeParen_]; 
    }];
        [self stmt_]; 

    [self fireDelegateSelector:@selector(parser:didMatchForInStmt:)];
}

- (void)breakStmt_ {
    
    [self break_]; 
    [self tryAndRecover:LuaTokenKind_SEMI block:^{ 
        [self semi_]; 
    } completion:^{ 
        [self semi_]; 
    }];

    [self fireDelegateSelector:@selector(parser:didMatchBreakStmt:)];
}

- (void)continueStmt_ {
    
    [self continue_]; 
    [self tryAndRecover:LuaTokenKind_SEMI block:^{ 
        [self semi_]; 
    } completion:^{ 
        [self semi_]; 
    }];

    [self fireDelegateSelector:@selector(parser:didMatchContinueStmt:)];
}

- (void)withStmt_ {
    
    [self with_]; 
    [self tryAndRecover:LuaTokenKind_OPENPAREN block:^{ 
        [self openParen_]; 
    } completion:^{ 
        [self openParen_]; 
    }];
    [self tryAndRecover:LuaTokenKind_CLOSEPAREN block:^{ 
        [self expr_]; 
        [self closeParen_]; 
    } completion:^{ 
        [self closeParen_]; 
    }];
        [self stmt_]; 

    [self fireDelegateSelector:@selector(parser:didMatchWithStmt:)];
}

- (void)returnStmt_ {
    
    [self return_]; 
    [self tryAndRecover:LuaTokenKind_SEMI block:^{ 
        [self exprOpt_]; 
        [self semi_]; 
    } completion:^{ 
        [self semi_]; 
    }];

    [self fireDelegateSelector:@selector(parser:didMatchReturnStmt:)];
}

- (void)variablesOrExprStmt_ {
    
    [self tryAndRecover:LuaTokenKind_SEMI block:^{ 
        [self variablesOrExpr_]; 
        [self semi_]; 
    } completion:^{ 
        [self semi_]; 
    }];

    [self fireDelegateSelector:@selector(parser:didMatchVariablesOrExprStmt:)];
}

- (void)condition_ {
    
    [self openParen_]; 
    [self tryAndRecover:LuaTokenKind_CLOSEPAREN block:^{ 
        [self expr_]; 
        [self closeParen_]; 
    } completion:^{ 
        [self closeParen_]; 
    }];

    [self fireDelegateSelector:@selector(parser:didMatchCondition:)];
}

- (void)forParen_ {
    
    [self for_]; 
    [self tryAndRecover:LuaTokenKind_OPENPAREN block:^{ 
        [self openParen_]; 
    } completion:^{ 
        [self openParen_]; 
    }];

    [self fireDelegateSelector:@selector(parser:didMatchForParen:)];
}

- (void)forBegin_ {
    
    [self forParen_]; 
    [self variablesOrExpr_]; 

    [self fireDelegateSelector:@selector(parser:didMatchForBegin:)];
}

- (void)variablesOrExpr_ {
    
    if ([self predicts:kLuaTokenKindLocal, 0]) {
        [self varVariables_]; 
    } else if ([self predicts: LuaTokenKind_FALSE, LuaTokenKind_MINUS, LuaTokenKind_Nil, LuaTokenKind_OPENPAREN, LuaTokenKind_THIS, LuaTokenKind_TILDE, LuaTokenKind_TRUE, TOKEN_KIND_BUILTIN_NUMBER, TOKEN_KIND_BUILTIN_QUOTEDSTRING, TOKEN_KIND_BUILTIN_WORD, 0])
    {
        [self expr_]; 
    } else {
        [self raise:@"No viable alternative found in rule 'variablesOrExpr'."];
    }

    [self fireDelegateSelector:@selector(parser:didMatchVariablesOrExpr:)];
}

- (void)varVariables_ {
    
    [self local_]; 
    [self variables_]; 

    [self fireDelegateSelector:@selector(parser:didMatchVarVariables:)];
}

- (void)variables_ {
    
    [self variable_]; 
    while ([self speculate:^{ [self commaVariable_]; }]) {
        [self commaVariable_]; 
    }

    [self fireDelegateSelector:@selector(parser:didMatchVariables:)];
}

- (void)commaVariable_ {
    
    [self comma_]; 
    [self variable_]; 

    [self fireDelegateSelector:@selector(parser:didMatchCommaVariable:)];
}

- (void)variable_ {
    
    [self identifier_]; 
    if ([self speculate:^{ [self assignment_]; }]) {
        [self assignment_]; 
    }

    [self fireDelegateSelector:@selector(parser:didMatchVariable:)];
}

- (void)assignment_ {
    
    [self equals_]; 
    [self assignmentExpr_]; 

    [self fireDelegateSelector:@selector(parser:didMatchAssignment:)];
}

- (void)exprOpt_ {
    
    if ([self predicts: LuaTokenKind_FALSE, LuaTokenKind_MINUS, LuaTokenKind_MINUSMINUS, LuaTokenKind_Nil, LuaTokenKind_OPENPAREN, LuaTokenKind_THIS, LuaTokenKind_TILDE, LuaTokenKind_TRUE, TOKEN_KIND_BUILTIN_NUMBER, TOKEN_KIND_BUILTIN_QUOTEDSTRING, TOKEN_KIND_BUILTIN_WORD, 0]) {
        [self expr_]; 
    }

    [self fireDelegateSelector:@selector(parser:didMatchExprOpt:)];
}

- (void)expr_ {
    
    [self assignmentExpr_]; 
    if ([self speculate:^{ [self commaExpr_]; }]) {
        [self commaExpr_]; 
    }

    [self fireDelegateSelector:@selector(parser:didMatchExpr:)];
}

- (void)commaExpr_ {
    
    [self comma_]; 
    [self expr_]; 

    [self fireDelegateSelector:@selector(parser:didMatchCommaExpr:)];
}

- (void)assignmentExpr_ {
    
    [self conditionalExpr_]; 
    if ([self speculate:^{ [self extraAssignment_]; }]) {
        [self extraAssignment_]; 
    }

    [self fireDelegateSelector:@selector(parser:didMatchAssignmentExpr:)];
}

- (void)extraAssignment_ {
    
    [self assignmentOperator_]; 
    [self assignmentExpr_]; 

    [self fireDelegateSelector:@selector(parser:didMatchExtraAssignment:)];
}

- (void)conditionalExpr_ {
    
    [self orExpr_]; 
    if ([self speculate:^{ [self ternaryExpr_]; }]) {
        [self ternaryExpr_]; 
    }

    [self fireDelegateSelector:@selector(parser:didMatchConditionalExpr:)];
}

- (void)ternaryExpr_ {
    
    [self question_]; 
    [self tryAndRecover:LuaTokenKind_COLON block:^{ 
        [self assignmentExpr_]; 
        [self colon_]; 
    } completion:^{ 
        [self colon_]; 
    }];
        [self assignmentExpr_]; 

    [self fireDelegateSelector:@selector(parser:didMatchTernaryExpr:)];
}

- (void)orExpr_ {
    
    [self andExpr_]; 
    while ([self speculate:^{ [self orAndExpr_]; }]) {
        [self orAndExpr_]; 
    }

    [self fireDelegateSelector:@selector(parser:didMatchOrExpr:)];
}

- (void)orAndExpr_ {
    
    [self or_]; 
    [self andExpr_]; 

    [self fireDelegateSelector:@selector(parser:didMatchOrAndExpr:)];
}

- (void)andExpr_ {
    
    if ([self speculate:^{ [self andAndExpr_]; }]) {
        [self andAndExpr_]; 
    }

    [self fireDelegateSelector:@selector(parser:didMatchAndExpr:)];
}

- (void)andAndExpr_ {
    
    [self and_]; 
    [self andExpr_]; 

    [self fireDelegateSelector:@selector(parser:didMatchAndAndExpr:)];
}

- (void)equalityExpr_ {
    
    if ([self speculate:^{ [self equalityOpEqualityExpr_]; }]) {
        [self equalityOpEqualityExpr_]; 
    }

    [self fireDelegateSelector:@selector(parser:didMatchEqualityExpr:)];
}

- (void)equalityOpEqualityExpr_ {
    
    [self equalityOperator_]; 
    [self equalityExpr_]; 

    [self fireDelegateSelector:@selector(parser:didMatchEqualityOpEqualityExpr:)];
}

- (void)additiveExpr_ {
    
    [self multiplicativeExpr_]; 
    if ([self speculate:^{ [self plusOrMinusExpr_]; }]) {
        [self plusOrMinusExpr_]; 
    }

    [self fireDelegateSelector:@selector(parser:didMatchAdditiveExpr:)];
}

- (void)plusOrMinusExpr_ {
    
    if ([self predicts:LuaTokenKind_PLUS, 0]) {
        [self plusExpr_]; 
    } else if ([self predicts:LuaTokenKind_MINUS, 0]) {
        [self minusExpr_]; 
    } else {
        [self raise:@"No viable alternative found in rule 'plusOrMinusExpr'."];
    }

    [self fireDelegateSelector:@selector(parser:didMatchPlusOrMinusExpr:)];
}

- (void)plusExpr_ {
    
    [self plus_]; 
    [self additiveExpr_]; 

    [self fireDelegateSelector:@selector(parser:didMatchPlusExpr:)];
}

- (void)minusExpr_ {
    
    [self minus_]; 
    [self additiveExpr_]; 

    [self fireDelegateSelector:@selector(parser:didMatchMinusExpr:)];
}

- (void)multiplicativeExpr_ {
    
    [self unaryExpr_]; 
    if ([self speculate:^{ [self multiplicativeOperator_]; [self multiplicativeExpr_]; }]) {
        [self multiplicativeOperator_]; 
        [self multiplicativeExpr_]; 
    }

    [self fireDelegateSelector:@selector(parser:didMatchMultiplicativeExpr:)];
}

- (void)unaryExpr_ {
    
    if ([self speculate:^{ [self memberExpr_]; }]) {
        [self memberExpr_]; 
    } else if ([self speculate:^{ [self unaryExpr1_]; }]) {
        [self unaryExpr1_]; 
    } else if ([self speculate:^{ [self unaryExpr2_]; }]) {
        [self unaryExpr2_]; 
    }else {
        [self raise:@"No viable alternative found in rule 'unaryExpr'."];
    }

    [self fireDelegateSelector:@selector(parser:didMatchUnaryExpr:)];
}

- (void)unaryExpr1_ {
    
    [self unaryOperator_]; 
    [self unaryExpr_]; 

    [self fireDelegateSelector:@selector(parser:didMatchUnaryExpr1:)];
}

- (void)unaryExpr2_ {
    
    [self minus_]; 
    [self unaryExpr_]; 

    [self fireDelegateSelector:@selector(parser:didMatchUnaryExpr2:)];
}

- (void)constructor_ {
    
    if ([self speculate:^{ [self this_]; [self tryAndRecover:LuaTokenKind_DOT block:^{ [self dot_]; } completion:^{ [self dot_]; }];}]) {
        [self this_]; 
        [self tryAndRecover:LuaTokenKind_DOT block:^{ 
            [self dot_]; 
        } completion:^{ 
            [self dot_]; 
        }];
    }
    [self constructorCall_]; 

    [self fireDelegateSelector:@selector(parser:didMatchConstructor:)];
}

- (void)constructorCall_ {
    
    [self identifier_]; 
    if ([self speculate:^{ if ([self predicts:LuaTokenKind_OPENPAREN, 0]) {[self parenArgListParen_]; } else if ([self predicts:LuaTokenKind_DOT, 0]) {[self dot_]; [self constructorCall_]; } else {[self raise:@"No viable alternative found in rule 'constructorCall'."];}}]) {
        if ([self predicts:LuaTokenKind_OPENPAREN, 0]) {
            [self parenArgListParen_]; 
        } else if ([self predicts:LuaTokenKind_DOT, 0]) {
            [self dot_]; 
            [self constructorCall_]; 
        } else {
            [self raise:@"No viable alternative found in rule 'constructorCall'."];
        }
    }

    [self fireDelegateSelector:@selector(parser:didMatchConstructorCall:)];
}

- (void)parenArgListParen_ {
    
    [self openParen_]; 
    [self tryAndRecover:LuaTokenKind_CLOSEPAREN block:^{ 
        [self argListOpt_]; 
        [self closeParen_]; 
    } completion:^{ 
        [self closeParen_]; 
    }];

    [self fireDelegateSelector:@selector(parser:didMatchParenArgListParen:)];
}

- (void)memberExpr_ {
    
    [self primaryExpr_]; 
    if ([self speculate:^{ [self dotBracketOrParenExpr_]; }]) {
        [self dotBracketOrParenExpr_]; 
    }

    [self fireDelegateSelector:@selector(parser:didMatchMemberExpr:)];
}

- (void)dotBracketOrParenExpr_ {
    
    if ([self predicts:LuaTokenKind_DOT, 0]) {
        [self dotMemberExpr_]; 
    } else if ([self predicts:LuaTokenKind_OPENBRACKET, 0]) {
        [self bracketMemberExpr_]; 
    } else if ([self predicts:LuaTokenKind_OPENPAREN, 0]) {
        [self parenMemberExpr_]; 
    } else {
        [self raise:@"No viable alternative found in rule 'dotBracketOrParenExpr'."];
    }

    [self fireDelegateSelector:@selector(parser:didMatchDotBracketOrParenExpr:)];
}

- (void)dotMemberExpr_ {
    
    [self dot_]; 
    [self memberExpr_]; 

    [self fireDelegateSelector:@selector(parser:didMatchDotMemberExpr:)];
}

- (void)bracketMemberExpr_ {
    
    [self openBracket_]; 
    [self tryAndRecover:LuaTokenKind_CLOSEBRACKET block:^{ 
        [self expr_]; 
        [self closeBracket_]; 
    } completion:^{ 
        [self closeBracket_]; 
    }];

    [self fireDelegateSelector:@selector(parser:didMatchBracketMemberExpr:)];
}

- (void)parenMemberExpr_ {
    
    [self openParen_]; 
    [self tryAndRecover:LuaTokenKind_CLOSEPAREN block:^{ 
        [self argListOpt_]; 
        [self closeParen_]; 
    } completion:^{ 
        [self closeParen_]; 
    }];

    [self fireDelegateSelector:@selector(parser:didMatchParenMemberExpr:)];
}

- (void)argListOpt_ {
    
    if ([self speculate:^{ [self argList_]; }]) {
        [self argList_]; 
    }

    [self fireDelegateSelector:@selector(parser:didMatchArgListOpt:)];
}

- (void)argList_ {
    
    [self assignmentExpr_]; 
    while ([self speculate:^{ [self commaAssignmentExpr_]; }]) {
        [self commaAssignmentExpr_]; 
    }

    [self fireDelegateSelector:@selector(parser:didMatchArgList:)];
}

- (void)commaAssignmentExpr_ {
    
    [self comma_]; 
    [self assignmentExpr_]; 

    [self fireDelegateSelector:@selector(parser:didMatchCommaAssignmentExpr:)];
}

- (void)primaryExpr_ {
    
    if ([self predicts:LuaTokenKind_OPENPAREN, 0]) {
        [self parenExprParen_]; 
    } else if ([self predicts:TOKEN_KIND_BUILTIN_WORD, 0]) {
        [self identifier_]; 
    } else if ([self predicts:TOKEN_KIND_BUILTIN_NUMBER, 0]) {
        [self numLiteral_]; 
    } else if ([self predicts:TOKEN_KIND_BUILTIN_QUOTEDSTRING, 0]) {
        [self stringLiteral_]; 
    } else if ([self predicts:LuaTokenKind_FALSE, 0]) {
        [self false_]; 
    } else if ([self predicts:LuaTokenKind_TRUE, 0]) {
        [self true_]; 
    } else if ([self predicts:LuaTokenKind_Nil, 0]) {
        [self nil_]; 
    }else if ([self predicts:LuaTokenKind_THIS, 0]) {
        [self this_]; 
    } else {
        [self raise:@"No viable alternative found in rule 'primaryExpr'."];
    }

    [self fireDelegateSelector:@selector(parser:didMatchPrimaryExpr:)];
}

- (void)parenExprParen_ {
    
    [self openParen_]; 
    [self tryAndRecover:LuaTokenKind_CLOSEPAREN block:^{ 
        [self expr_]; 
        [self closeParen_]; 
    } completion:^{ 
        [self closeParen_]; 
    }];

    [self fireDelegateSelector:@selector(parser:didMatchParenExprParen:)];
}

- (void)identifier_ {
    
    [self matchWord:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchIdentifier:)];
}

- (void)numLiteral_ {
    
    [self matchNumber:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchNumLiteral:)];
}

- (void)stringLiteral_ {
    
    [self matchQuotedString:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchStringLiteral:)];
}

@end