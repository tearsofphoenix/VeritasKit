--[[ Copyright (c) 2009 Peter "Corsix" Cawley

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE. --]]

local lpeg = require "lpeg"

local C, P, R, S, V = lpeg.C, lpeg.P, lpeg.R, lpeg.S, lpeg.V
local Carg, Cc, Cp, Ct = lpeg.Carg, lpeg.Cc, lpeg.Cp, lpeg.Ct

local obfuseMap = {};
local obfuseDefines = "";

local tokens = P { "tokens";

  -- Comment of form /* ... */
  comment = Ct(P"/*" * C((V"newline" + (1 - P"*/"))^0) * P"*/" * Cc"comment"),
  
  -- Single line comment
  line_comment = Ct(P"//" * C((1 - V"newline")^0)  * Cc"comment_line"),
  
  -- Single platform independant line break which increments line number
  newline = (P"\r\n" + P"\n\r" + S"\r\n") * (Cp() * Carg(1)) / function(pos, state)
    state.line = state.line + 1
    state.line_start = pos
  end,
  
  -- Line continuation
  line_extend = Ct(C(P[[\]] * V"newline") * Cc"line_extend"),
  
  -- Whitespace of any length (includes newlines)
  whitespace = Ct(C((S" \t" + V"newline")^1) * Cc"whitespace"),
  
  -- Special form of #include with filename followed in angled brackets (matches 3 tokens)
  include = Ct(C(P"#include" + P"#import") * Cc"preprocessor") *
            Ct(C(S" \t"^1) * Cc"whitespace") *
            Ct(C(P"<" * (1 - P">")^1 * P">") * Cc"string"),

  -- Preprocessor instruction
  preprocessor = V"include" +
                 Ct(C(P"#" * P" "^0 * ( P"define" + P"elif" + P"else" + P"endif" + P"#" +
                               P"error" + P"ifdef" + P"ifndef" + P"if" + P"import" +
                               P"include" + P"line" + P"pragma" + P"undef" + P"using"
                             ) * #S" \r\n\t") * Cc"preprocessor"),

  -- Identifier of form [a-zA-Z_][a-zA-Z0-9_]*
  identifier = Ct(C(R("az","AZ","__") * R("09","az","AZ","__")^0) * Cc"identifier"),
  
  -- Single character in a string
  string_char = R("az","AZ","09") + S"$%^&*()_-+={[}]:;@~#<,>.!?/ \t" + (P"\\" * S[[ntvbrfa\?'"0x]]),
  
  -- String literal
  string = Ct(C(P"'" * (V"string_char" + P'"')^0 * P"'" +
                P'"' * (V"string_char" + P"'")^0 * P'"') * Cc"string"),
  
  -- Operator
  operator = Ct(C(P">>=" + P"<<=" + P"..." +
                  P"::" + P"<<" + P">>" + P"<=" + P">=" + P"==" + P"!=" +
                  P"||" + P"&&" + P"++" + P"--" + P"->" + P"+=" + P"-=" +
                  P"*=" + P"/=" + P"|=" + P"&=" + P"^=" + S"+-*/=<>%^|&.?:!~,") * Cc"operator"),

  -- Misc. char (token type is the character itself)
  char = Ct(C(S"[]{}();") / function(x) return x, x end),
  
  -- Hex, octal or decimal number
  int = Ct(C((P"0x" * R("09","af","AF")^1) + (P"0" * R"07"^0) + R"09"^1) * Cc"integer"),
  
  -- Floating point number
  f_exponent = S"eE" + S"+-"^-1 * R"09"^1,
  f_terminator = S"fFlL",
  float = Ct(C(
            R"09"^1 * V"f_exponent" * V"f_terminator"^-1 +
            R"09"^0 * P"." * R"09"^1 * V"f_exponent"^-1 * V"f_terminator"^-1 +
            R"09"^1 * P"." * R"09"^0 * V"f_exponent"^-1 * V"f_terminator"^-1
          ) * Cc"float"),
          
    --[[      
	C_keywords = Ct(C(
	  P"break" + P"case" + P"char" + P"const" + P"continue"+ P"default"+ P"do"+ P"double",
  "else"+ P"enum"+ P"extern"+ P"float"+ P"for"+ P"goto"+ P"if"+ P"int"+ P"long",
  "register"+ P"return"+ P"short"+ P"signed"+ P"sizeof"+ P"static"+ P"struct",
  "switch"+ P"typedef"+ P"union"+ P"unsigned"+ P"void"+ P"volatile"+ P"while") * Cc"C_keywords"),
  --]]
  --ObjC features
  objc_Keywords = Ct(C(P"@" * (P"implementation" + P"end" + P"interface" + P"selector" 
  								+ P"protocol" + P"encode" + P"private" + P"protected" 
  								+ P"public" + P"try" + P"catch" + P"throw" + P"finally"
  								+ P"class" + P"synchronized")) * Cc"objc_Keywords"), 
  -- Any token
  token = V"comment" +
          V"line_comment" +
          --V"C_keywords" +
          V"objc_Keywords" +
          V"identifier" +
          V"whitespace" +
          V"line_extend" +
          V"preprocessor" +
          V"string" +
          V"char" +
          V"operator" +
          V"float" + 
          V"int",
  
  -- Error for when nothing else matches
  error = (Cp() * C(P(1) ^ -8) * Carg(1)) / function(pos, where, state)
    error(("Tokenising error on line %i, position %i, near '%s'")
      :format(state.line, pos - state.line_start + 1, where))
  end,
  
  -- Match end of input or throw error
  finish = -P(1) + V"error",
  
  -- Match stream of tokens into a table
  tokens = Ct(V"token" ^ 0) * V"finish",
}

function TokeniseC(str)
  return tokens:match(str, 1, {line = 1, line_start = 1})
end
local isCKeywords = function(token)
                        local C_keywords = {"break","case","char","const","continue","default","do","double",
                                            "else","enum","extern","float","for","goto","if","int","long",
                                            "register","return","short","signed","sizeof","static","struct",
                                            "switch","typedef","union","unsigned","void","volatile","while"}
                        for k, v in pairs(C_keywords) do
                            if v == token then
                                return true
                            end
                        end
                        return false
                 end

local RefactorHandlers = 
{
    comment = function(tok) 
                return '' 
              end,
    objc_Keywords = function(tok)
                        return tok[1] 
                    end,
    identifier = function(tok)
                    local tokenContent = tok[1]
                    if isCKeywords(tokenContent) then
                      return tokenContent
                    else
                        local newToken = obfuseMap[tokenContent]
                        if not newToken then
                            newToken = '__' .. objc_UUIDString()
                            obfuseMap[tokenContent] = newToken
                            obfuseDefines = obfuseDefines .. "#define " .. newToken .. " " .. tokenContent .. "\n"
                        end
                        return newToken

                    end
                  end,
    preprocessor = function(tok) 
                        return tok[1] 
                    end,
    string = function(tok) return tok[1] end,
    whitespace = function(tok) return ' ' end,
}

function translate(str)
  local tokens = TokeniseC(str)
  local result = {}
  for i, token in ipairs(tokens) do
    local processor = RefactorHandlers[token[2]]
    if processor then
        result[#result + 1] = processor(token)
    else
        result[#result + 1] = token[1]
    end
  end
  return obfuseDefines .. table.concat(result)
end