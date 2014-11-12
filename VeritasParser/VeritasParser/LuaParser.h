#import <PEGKit/PKParser.h>

enum
{
    LuaTokenKind_NE = 14,
    LuaTokenKind_OPENPAREN,
    LuaTokenKind_CLOSECURLY,
    LuaTokenKind_RETURN,
    LuaTokenKind_TILDE,
    LuaTokenKind_CLOSEPAREN,
    LuaTokenKind_TIMES,

    LuaTokenKind_PLUS,

    LuaTokenKind_COMMA,

    LuaTokenKind_IF,
    LuaTokenKind_MINUS,
    LuaTokenKind_Nil,
    LuaTokenKind_FALSE,
    LuaTokenKind_DOT,

    LuaTokenKind_DIV,

    LuaTokenKind_LE,

    LuaTokenKind_OPENBRACKET,

    LuaTokenKind_OR,
    LuaTokenKind_FUNCTION,
    LuaTokenKind_CLOSEBRACKET,
    LuaTokenKind_CARET,
    LuaTokenKind_EQ,
    LuaTokenKind_CONTINUE,
    LuaTokenKind_BREAK,

    LuaTokenKind_GE,
    LuaTokenKind_COLON,
    LuaTokenKind_IN,
    LuaTokenKind_SEMI,
    LuaTokenKind_FOR,

    LuaTokenKind_LT,

    LuaTokenKind_EQUALS,
    LuaTokenKind_GT,

    LuaTokenKind_QUESTION,
    LuaTokenKind_WHILE,

    LuaTokenKind_ELSE,

    LuaTokenKind_AND,
    kLuaTokenKindLocal,

    LuaTokenKind_MINUSMINUS,
    LuaTokenKind_NOT,

    LuaTokenKind_TRUE,
    LuaTokenKind_THIS,
    LuaTokenKind_WITH,
    LuaTokenKind_MOD,

    LuaTokenKind_OPENCURLY,
};

@interface LuaParser : PKParser
        
@property (nonatomic, assign) BOOL preserveWhitespace;

@end

@interface NSObject (LuaParserDelegate)

- (void)parser:(PKParser *)p didMatchVar: (PKAssembly *)a;
- (void)parser:(PKParser *)p didMatchIdentifier: (PKAssembly *)a;
- (void)parser:(PKParser *)p didMatchVariable: (PKAssembly *)a;
- (void)parser:(PKParser *)p didMatchVariables: (PKAssembly *)a;
- (void)parser:(PKParser *)p didMatchVarVariables: (PKAssembly *)a;
- (void)parser:(PKParser *)p didMatchVariablesOrExpr:(PKAssembly *)a;
- (void)parser:(PKParser *)p didMatchSemi:(PKAssembly *)a;
- (void)parser:(PKParser *)p didMatchVariablesOrExprStmt:(PKAssembly *)a;
- (void)parser:(PKParser *)p didMatchStmt:(PKAssembly *)a;
- (void)parser:(PKParser *)p didMatchFunction:(PKAssembly *)a;
- (void)parser:(PKParser *)p didMatchOpenParen:(PKAssembly *)a;
- (void)parser:(PKParser *)p didMatchCloseParen:(PKAssembly *)a;
- (void)parser:(PKParser *)p didMatchParamListOpt:(PKAssembly *)a;
- (void)parser:(PKParser *)p didMatchFunc:(PKAssembly *)a;
- (void)parser:(PKParser *)p didMatchElement:(PKAssembly *)a;
- (void)parser:(PKParser *)p didMatchProgram:(PKAssembly *)a;

- (void)parser:(PKParser *)p didFailToMatch:(PKAssembly *)a;

@end
