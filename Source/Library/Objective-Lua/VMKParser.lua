
local unpack = table.unpack

local g_Engine

local lpeg = require 'lpeg'
local P, R, S, C, Cc, Ct = lpeg.P, lpeg.R, lpeg.S, lpeg.C, lpeg.Cc, lpeg.Ct

-- create a pattern which captures the lua value [id] and the input matching
-- [patt] in a table
local function token(id, patt) 
                return Ct(Cc(id) * C(patt)) 
               end

local digit = R('09')

-- range of valid characters after first character of identifier
local idsafe = R('AZ', 'az', '\127\255') + P '_'

-- operators
local operator = token('operator', P '==' + P '~=' + P '<=' + P '>=' + P '...' + P'!='
                       + P '..' + S '+-*/%^#=<>;:,.{}[]()')
-- identifiers
local ident = token('identifier', idsafe * (idsafe + digit + P '.') ^ 0)

-- keywords
local olua_keywords = P '@implementation' + P '@property' + P '@end'
                    + P '@selector' + P '@protocol' + P '@autoreleasepool' 
                    + P '@try' + P '@catch' + P '@throw' + P '@finally'
                    + P '#import' + P'@enumerate' + P'@typedef' + P '@class'
                    + P '@[' + P '@{' + P'YES' + P'NO'
                    

local keyword = token('keyword', (P 'and' + P 'break' + P 'do' + P 'elseif' +
                                  P 'else' + P 'end' + P 'false' + P 'for' + P 'function' + P 'if' +
                                  P 'in' + P 'local' + P 'nil' + P 'not' + P 'or' + P 'repeat' + P 'return' +
                                  P 'then' + P 'true' + P 'until' + P 'while' + olua_keywords ) * 
                      -(idsafe + digit))

-- numbers
local number_sign = S'+-'^-1
local number_decimal = digit ^ 1
local number_hexadecimal = P '0' * S 'xX' * R('09', 'AF', 'af') ^ 1
local number_float = (digit^1 * P'.' * digit^0 + P'.' * digit^1) * (S'eE' * number_sign * digit^1)^-1
local number_in_lua = number_hexadecimal + number_float + number_decimal
local olua_number = P '@' * number_in_lua
local number = token('number', number_in_lua + olua_number)

-- callback for [=[ long strings ]=]

local longstringpredicate = P(function(input, index)
                                    local level = input:match('^%[(=*)%[', index)
                                    if level then
                                        local _, stop = input:find(']' .. level .. ']', index, true)
                                        if stop then return stop + 1 end
                                    end
                              end)

local longstring = #(P'[' * P'='^1 * P'[') * longstringpredicate

-- strings
local single_utf8 = ((1 - S "'\r\n\f\\") + (P '\\' * 1))
local double_utf8 = ((1 - S '"\r\n\f\\') + (P '\\' * 1))
local singlequoted_string = P "'" * single_utf8 ^ 0 * "'"
local doublequoted_string = P '"' * double_utf8 ^ 0 * '"'
local olua_singlequoted_string = P "@'" * single_utf8 ^ 0 * "'"
local olua_doublequoted_string = P '@"' * double_utf8 ^ 0 * '"'
local lua_string = token('string', singlequoted_string + doublequoted_string + longstring + olua_singlequoted_string + olua_doublequoted_string)

-- comments
local singleline_comment = P '--' * (1 - S '\r\n\f') ^ 0
local multiline_comment = P '--' * (#(P'[' * P'='^0 * P'[') * longstringpredicate)
local olua_singleline_comment = P '//' * ( 1 - S '\r\n\f') ^ 0
local olua_multiline_comment = P '/*' * longstringpredicate * P '*/'
local comment = token('comment', multiline_comment + singleline_comment + olua_singleline_comment)

-- whitespace
local whitespace = token('whitespace', S('\r\n\f\t ')^1)

-- ordered choice of all tokens and last-resort error which consumes one character
local any_token = whitespace + number + keyword + ident +
lua_string + comment + operator + token('error', 1)

-- private interface
local table_of_tokens = Ct(any_token ^ 0)

-- increment [line] by the number of line-ends in [text]
local function sync(line, text)
                    local index, limit = 1, #text
                    while index <= limit do
                        local start, stop = text:find('\r\n', index, true)
                        if not start then
                            start, stop = text:find('[\r\n\f]', index)
                            if not start then break end
                        end
                        index = stop + 1
                        line = line + 1
                    end
                    return line
                end

-- we only need to synchronize the line-counter for these token types
local multiline_tokens = { comment = true, string = true, whitespace = true }

-- public interface
function getrawtokens(input)
                assert(type(input) == 'string', 'bad argument #1 (expected string)')
                local line = 1
                local tokens = lpeg.match(table_of_tokens, input)
                for i, token in pairs(tokens) do
                    token[3] = line
                    if multiline_tokens[token[1]] then 
                        line = sync(line, token[2]) 
                    end
                end
                return tokens
         end

function gettokens( input)
            local rawtokens = getrawtokens(input)
            local tokens = {}

            local lastrawtoken = nil

            local function pushtoken(rawtoken)
                                if lastrawtoken and (lastrawtoken[1] ~= 'whitespace') and
                                (lastrawtoken[1] ~= 'comment') then
                                    local t =
                                    {
                                        type = lastrawtoken[1],
                                        text = lastrawtoken[2],
                                        line = lastrawtoken[3],
                                        nlafter = false
                                    }
                                    --Deal olua_string* here, just remove the `@', 
                                    --treat it as normal lua string (`@' == 64)
                                    if (t.type == 'string') and (t.text:byte(1) == 64) then
                                        t.text = t.text:sub(2)
                                        t.type = 'NSConstantString';
                                    end
                                    if (t.type == 'number') and (t.text:byte(1) == 64) then
                                        t.text = t.text:sub(2)
                                        t.type = 'NSConstantNumber';
                                    end
                                    if (t.type == 'identifier') and (t.text == '__LINE__') then
                                        t.type = 'number'
                                        t.text = rawtoken[3]
                                    end
                                    if (t.type == 'keyword') then
                                        if (t.text == 'YES') then
                                            t.text = 'true'
                                        elseif (t.text == 'NO') then
                                            t.text = 'NO'
                                        end
                                    end

                                    if (t.type == 'operator') then
                                        if (t.text == '!=') then
                                            t.text = '~='
                                        end
                                    end

                                    if rawtoken and rawtoken[2]:find('\n') then
                                        t.nlafter = true
                                    end

                                    tokens[#tokens+1] = t
                                end

                                lastrawtoken = rawtoken
                            end

            for _, rawtoken in ipairs(rawtokens) do
                pushtoken(rawtoken)
            end
            
            pushtoken(nil)

            return tokens
        end

local function stringify(s)
                    if not s:find("'") then
                        return '"'..s..'"'
                    elseif not s:find("'") then
                        return "'"..s.."'"
                    end

                    local i = 0
                    while true do
                        local e = string.rep('=', i)
                        if not s:find("%["..e.."%]") then
                            return '['..e..'['..s..']'..e..']'
                        end
                        i = i + 1
                    end
                end

local function leaf(t)
                    return {type="leaf", value=t}
                end

local function identifierleaf(s)
                    return leaf({type='identifier', text=s})
               end

local function stringleaf(s)
                    return leaf({type='string', text=stringify(s)})
                end

function methodcall(ast)
            local object = ast.object
            local selector = ast.selector
            local args = ast.args

            if object then
                -- Normal method call.
                return 
                {
                    type="olua_method_inner_call",
                    object=object,
                    selector=stringify(selector),
                    args=
                    {
                        type='list',
                        unpack(args)
                    }
                }
            else
                -- super call.
                return 
                {
                    type="olua_method_super_call",
                    args=
                    {
                        type='list',
                        stringleaf(selector),
                        unpack(args)
                    }
                }
            end
        end

local function methoddefinition(ast, class, methodType)
            --implicit 'self' argument for class method
            local args = {leaf("self"), leaf("_cmd")}
            if ast.args then
                for _, v in ipairs(ast.args) do
                    args[#args+1] = v
                end
            end
            if ast.extraargs then
                for _, v in ipairs(ast.extraargs) do
                    args[#args+1] = v
                end
            end

            return
            {
                type="luaClass_addMethod",
                methodType=methodType,
                class= class,
                selector= stringify(ast.selector),
                argtypes= ast.argtypes,
                rettype=ast.rettype,
                imp=
                {
                    type="functiondef",
                    args=
                    {
                        type='list',
                        unpack(args)
                    },
                    chunk=ast.chunk
                }
            }
        end

function implementation(ast)
    local category = identifierleaf("nil")
    if ast.category then
        category = stringleaf(ast.category.text)
    end

    local newast = 
    {
        type="class_implementation",
        class=ast.class,
        chunk=
        {
            type="chunk"
        },
        classMethodsChunk=
        {
            type="chunk"
        },
    }

    -- Emit code to create the subclass, if necessary.

    if ast.superclass then
        newast.chunk[#newast.chunk+1] = {
            type="assignment",
            left=leaf(ast.class),
            right=
            {
                type="objc_allocateClassPair",
                args=
                {
                    type='list',
                    stringleaf(ast.class.text),
                    stringleaf(ast.superclass)
                }
            }
        }
    end

-- Collect the contents of the implementation chunk into local definitions,
-- object methods and class methods. Also construct the metadata table.

    local locals = {}
    local objectmethods = {}
    local classmethods = {}
    local metadata = {}
    for _, k in ipairs(ast) do
        if (k.type == "olua_methoddefinition") then
            local m = {}
            local s
            if k.classmethod then
                classmethods[#classmethods + 1] = k
                s = "+" .. k.selector
            else
                objectmethods[#objectmethods + 1] = k
                s = "-" .. k.selector
            end
            m.argtypes = k.argtypes
            m.rettype = k.rettype
            metadata[s] = m
        else
            locals[#locals + 1] = k
        end
    end

    if (#objectmethods == 0) and (#classmethods == 0) then
        return newast
    end

    -- Emit category template.

    local chunk = {type="chunk"}
    for _, k in ipairs(locals) do
        chunk[#chunk+1] = k
    end

    local classMethodsChunk = {type="chunk"}
    for _, k in ipairs(classmethods) do
        classMethodsChunk[#classMethodsChunk+1] = methoddefinition(k, ast.class, "classmethod")
    end

    newast.classMethodsChunk[#newast.classMethodsChunk+1] =     
    {   
        type="olua_class_method_implementation",
        chunk = classMethodsChunk,
    }

    for _, k in ipairs(objectmethods) do
        chunk[#chunk+1] = methoddefinition(k, ast.class, "objectmethod")
    end

    newast.chunk[#newast.chunk+1] =     
    {   
        type="olua_class_method_implementation",
        chunk = chunk,
    }
    return newast
end


local source
local tokens
local pos

local peek
local expect
local optionalexpect

local chunk
local stat
local laststat
local doend
local ifelseend
local whiledoend
local repeatuntil
local forend
local functiondef
local assignment
local localdef
local rvaluelist
local rvalue
local rvalue2
local rvalue3
local rvalue4
local rvalue5
local rvalue6
local rvalue7
local rvalue8
local rvalue9
local rvalueleaf
local lvaluelist
local lvalue
local lvalueleaf
local lvalueidentifier
local functioncall
local tableliteral

local olua_methodcall
local olua_implementation
local olua_typeannotation
local olua_methoddefinition
local olua_createSelector
local olua_getProtocol
local olua_import_file
local olua_throw
local olua_objc_blockObject
local olua_objc_enumerator
local olua_objc_classPredeclearation
local olua_objc_literalArray
local olua_objc_literalDictionary

function parseerror(message)
    local t = tokens[pos]
    local line = "unknown location"
    if t and t.line then
        line = t.line
    end

    error("Parse error at "..line.." of "..source..": "..message)
end

local expectederror = function(type, text)
                            local t = tokens[pos]
                            if not t then
                                t = {type="eof", text=""}
                            end

                            text = text or "(anything)"
                            parseerror("expected a "..type..", '"..text.."', but got a "..t.type..", '"..t.text.."'")
                        end

local unexpectederror = function(token)
                            parseerror("unexpected "..token.type..", '"..token.text.."'")
                        end

local statementerror = function(token)
                            parseerror("expected a statement, got a "..token.type..", '"..token.text.."'")
                        end

local internalerror = function()
                            parseerror("internal error")
                      end

peek = function(type, ...)
            local t = tokens[pos]
            if not t then
                return nil
            end

            if (t.type ~= type) then
                return false
            end

            local list = {...}
            if (#list == 0) then
            return true
            end

            for _, s in ipairs(list) do
                if (t.text == s) then
                    return true
                end
            end
            return false
        end

optionalexpect = function(type, ...)
                    local t = tokens[pos]
                    if not t then
                        return nil
                    end

                    local list = {...}
                    if (#list == 0) and (t.type == type) then
                        pos = pos + 1
                        return t
                    end

                    for _, s in ipairs(list) do
                        if (t.text == s) then
                            pos = pos + 1
                            return t
                        end
                    end

                    return nil
                end

expect = function(type, ...)
            local t = optionalexpect(type, ...)
            if not t then
                expectederror(type, ...)
            end
            return t
        end

--------------------------------------------------------------------------
--                              BNF PROPER                              --
--------------------------------------------------------------------------

local function isterminatorkeyword(s)
                    return (s == "end") or (s == "else") or
                    (s == "elseif") or (s == "until") or
                    (s == '@end') 
                end

chunk = function()
            local ast = {type="chunk"}

            while tokens[pos] do
                local t = tokens[pos]
                if (t.type == 'keyword') then
                    if isterminatorkeyword(t.text) then
                        break
                    end

                    if (t.text == "return") or (t.text == "break") then
                        local a = laststat()
                        ast[#ast+1] = a

                        optionalexpect('operator', ';')
                        break
                    end
                end

                local a = stat()
                ast[#ast+1] = a

                optionalexpect('operator', ';')
            end

            return ast
        end

stat = function()
            local t = tokens[pos]
            if (t.type == 'keyword') then
                if (t.text == "do") then
                    return doend()
                elseif (t.text == "while") then
                    return whiledoend()
                elseif (t.text == "repeat") then
                    return repeatuntil()
                elseif (t.text == "if") then
                    return ifelseend()
                elseif (t.text == "for") then
                    return forend()
                elseif (t.text == "function") then
                    return functiondef()
                elseif (t.text == "local") then
                    return localdef()
                elseif (t.text == "@implementation") then
                    return olua_implementation()
                elseif (t.text == "@autoreleasepool") then
                    return objc_autoreleasepool()
                elseif (t.text == "#import") then
                    pos = pos + 1
                    return olua_import_file()
                elseif (t.text == "@throw") then
                    pos = pos + 1
                    return olua_throw()
                elseif (t.text == "@try") then
                    pos = pos + 1
                    return olua_objc_trycatchfinally()
                elseif (t.text == "@enumerate") then
                    pos = pos + 1
                    return olua_objc_enumerator()
                elseif (t.text == "@class") then
                    pos = pos + 1
                    return olua_objc_classPredeclearation()
                else
                    statementerror(t)
                end
            else
                local e = rvalue()
                if peek('operator', ',') or peek('operator', '=') then
                    return assignment(e)
                else
                    return e
                end
            end
        end

laststat = function()
                local t = tokens[pos]
                if (t.type == 'keyword') then
                    if (t.text == "break") then
                        pos = pos + 1
                        return {type="break"}
                    elseif (t.text == "return") then
                        pos = pos + 1

                        local value
                        if (tokens[pos].type == 'keyword') and
                            isterminatorkeyword(tokens[pos].text) then
                        else
                            value = rvaluelist()
                        end

                        return {type="return", value=value}
                    end
                end
                statementerror(t)
            end

doend = function()
            expect('keyword', "do")
            local t = tokens[pos]
            local ast = {}
            if t.type == 'operator' and t.text == "{" then
                ast.chunk = olua_block()
                expect('keyword', "while")
                ast.condition = rvalue()                   
                ast.type="dowhile"
            else
                ast.type = "doend"
                ast.chunk =chunk()
                expect('keyword', "end")
            end
            return ast
        end

ifelseend = function()
                expect('keyword', "if")
                local ast = {type="ifelseend"}
                local hasBracketFlag = false
                while true do
                    local condition = rvalue()
                    local c
                    local t = tokens[pos]
                    if t.type == 'operator' and t.text == "{" then
                        hasBracketFlag = true
                        c = olua_block()
                    else
                        expect('keyword', "then")
                        c = chunk()
                    end

                    ast[#ast+1] = {condition=condition, chunk=c}

                    t = optionalexpect('keyword', "elseif", "else", "end")
                    if (t.text == "end") then
                        break
                    elseif (t.text == "else") then
                        t = tokens[pos]
                        if t.type == 'operator' and t.text == "{" then                            
                            hasBracketFlag = true
                            c = olua_block()                            
                        else
                            c = chunk()
                            expect('keyword', "end")
                        end
                        ast[#ast+1] = {chunk=c}
                        break
                    end
                end
                if hasBracketFlag then
                    pos = pos - 1
                end
                return ast
            end

whiledoend = function()
                expect('keyword', "while")
                local c = rvalue()
                
                local b
                local t = tokens[pos]
                if t.type == 'operator' and t.text == "{" then
                    b = olua_block()
                else
                    expect('keyword', "do")
                    b = chunk()
                    expect('keyword', "end")
                end
                return 
                {
                    type="whiledoend", 
                    condition=c, 
                    chunk=b
                }
            end

repeatuntil = function()
                    expect('keyword', "repeat")
                    local b = chunk()
                    expect('keyword', "until")
                    local c = rvalue()

                    return {type="repeatuntil", condition=c, chunk=b}
                end

forend = function()
            expect('keyword', "for")
            local ast = {}

            if peek('operator', '(') then
                pos = pos + 1
                ast.var = lvalue()
                ast.var = lvaluelist(ast.var)
                expect('keyword', "in")
                ast.iterator = rvalue()
                expect('operator', ')')
                ast.chunk = olua_block()
                ast.type = "olua_forinend"
            else

                ast.var = lvalue()
                if peek('operator', '=') then
                    pos = pos + 1
                    ast.type = "forend"

                    ast.low = rvalue()
                    expect('operator', ',')
                    ast.high = rvalue()
                    if peek('operator', ',') then
                        pos = pos + 1
                        ast.step = rvalue()
                    end
                else
                    ast.var = lvaluelist(ast.var)
                    expect('keyword', "in")
                    ast.type = "forinend"

                    ast.iterator = rvalue()
                end

                expect('keyword', "do")
                ast.chunk = chunk()
                expect('keyword', "end") 
            end
            return ast
        end

functiondef = function()
                expect('keyword', "function")
                local name
                if not peek('operator', '(') then
                    name = lvalue()
                end

                expect('operator', '(')
                local args = lvaluelist()
                expect('operator', ')')
                
                local c
                local t = tokens[pos]
                if t.type == 'operator' and t.text == "{" then
                    c = olua_block()
                else
                    c = chunk()                
                    expect('keyword', "end")
                end
                return 
                {
                    type="functiondef", 
                    name=name, 
                    args=args, 
                    chunk=c,
                }
            end

assignment = function(e)
                if not e or peek('operator', ',') then
                    e = lvaluelist(e)
                end
                expect('operator', '=')
                local a = rvaluelist()
                return {type="assignment", left=e, right=a}
            end

localdef = function()
                expect('keyword', "local")
                local ast
                if peek('keyword', "function") then
                    ast = functiondef()
                else
                    local e = lvaluelist()
                    local a = nil
                if peek('operator', '=') then
                    pos = pos + 1
                    a = rvaluelist()
                end
                    ast = 
                    {
                        type="assignment", 
                        left=e, 
                        right=a
                    }
                end

                return 
                {
                    type="local", 
                    value=ast
                }
           end

rvaluelist = function(e)
                local ast = {type='list'}
                if not e then
                    if peek('operator', ')') then
                        return ast
                    end
                    e = rvalue()
                end

                ast[#ast+1] = e
                while true do
                    if not peek('operator', ',') then
                        return ast
                    end
                    pos = pos + 1
                    ast[#ast+1] = rvalue()
                end
            end	

local function leftassocbinop(left, precedence, type, ...)
            local e = left()
            if peek(type, ...) then
                local t = tokens[pos]
                pos = pos + 1

                local ast = {type="binop", operator=t, precedence=precedence,
                    left=e, right=left()}
                while peek(type, ...) do
                    t = tokens[pos]
                    pos = pos + 1

                    ast = {type="binop", operator=t, precedence=precedence,
                        left=ast, right=left()}
                end
                return ast
            else
                return e
            end
        end

local function rightassocbinop(left, precedence, type, ...)
                    local e = left()
                    if peek(type, ...) then
                        local t = tokens[pos]
                        pos = pos + 1
                        return {type="binop", operator=t, precedence=precedence,
                            left=e, right=rvalue()}
                    else
                        return e
                    end
                end

-- or
rvalue = function()
            return leftassocbinop(rvalue2, 1, 'keyword', "or")
         end

-- and
rvalue2 = function()
                return leftassocbinop(rvalue3, 2, 'keyword', "and")
            end

-- < > <= >= ~= ==
rvalue3 = function()
            return leftassocbinop(rvalue4, 3, 'operator',
                                  "<", ">", "<=", ">=", "~=", "==", "!=")
            end

-- ..
rvalue4 = function()
            return rightassocbinop(rvalue5, 4, 'operator', "..")
          end

-- + -
rvalue5 = function()
                return leftassocbinop(rvalue6, 5, 'operator', "+", "-")
          end

-- * / %
rvalue6 = function()
             return leftassocbinop(rvalue7, 6, 'operator', "*", "/", "%")
          end

-- not # unary-
rvalue7 = function()
            if peek('operator', "-") or 
               peek('operator', "#") or
               peek('keyword', "not") then
                local t = tokens[pos]
                pos = pos + 1
                return {type="unop", precedence=7, operator=t.text, value=rvalue8()}
            end

            return rvalue8()
          end

-- ^
rvalue8 = function()
            return rightassocbinop(rvalue9, 8, 'operator', "^")
          end

-- . : [] functioncalls
rvalue9 = function()
            local e = rvalueleaf()
            while true do
                t = tokens[pos]
                if not t then
                    break
                end

                if (t.type == 'operator') then		
                    if (t.text == ".") or (t.text == ":") then
                        pos = pos + 1
                        rleaf = rvalueleaf()

                        e = 
                        {
                            type="binop", 
                            operator=t,
                            precedence=9, 
                            left=e, 
                            right=rleaf
                        }
                    elseif (t.text == '[') then
                    -- This might be either a dereference or the beginning of an
                    -- Objective Lua method call in the next statement; so we
                    -- need to disambiguate and potentially backtrack.
                    --
                    -- It is all right for rvalue() to bail with an error because
                    -- method calls start with an rvalue as well. It be nice to
                    -- avoid parsing the rvalue twice, but it does no harm.

                        local oldpos = pos
                        pos = pos + 1
                        local index = rvalue()
                        if optionalexpect('operator', ']') then
                            -- Dereference.
                            e = {type="deref", left=e, right=index}
                        else
                        -- Method call. Backtrack.
                            pos = oldpos
                            return e
                        end
                    elseif (t.text == '(') then
                        e = functioncall(e)
                    else
                        break
                    end
                elseif (t.type == 'string') then
                    e = functioncall(e)
                else
                    break
                end
            end

            return e
        end

local function leaf(t)
                    return {type="leaf", value=t}
                end

rvalueleaf = function()
                local t = tokens[pos]
                if (t.type == 'keyword') then
                    if (t.text == "nil") or (t.text == "true") or (t.text == "false") then
                        pos = pos + 1
                        return leaf(t)
                    elseif (t.text == "function") then
                        return functiondef()
                    elseif (t.text == "@selector") then
                        pos = pos + 1
                        return olua_createSelector()
                    elseif (t.text == "@protocol") then
                        pos = pos + 1
                        return olua_getProtocol()
                    elseif (t.text == "#import") then
                        pos = pos + 1
                        return olua_import_file()
                    elseif (t.text == "@enumerate") then
                        pos = pos + 1
                        return olua_objc_enumerator()
                    elseif (t.text == "@[") then
                        pos = pos + 1
                        return olua_objc_literalArray()
                    elseif (t.text == "@{") then
                        pos = pos + 1
                        return olua_objc_literalDictionary()
                    end                
                elseif (t.type == 'number') or (t.type == 'string') or (t.type == 'identifier') then
                    pos = pos + 1
                    return leaf(t)
                elseif (t.type == 'operator') then
                    if (t.text == '(') then
                        pos = pos + 1
                        local e = rvalue()
                        expect('operator', ')')
                        return e
                    elseif (t.text == "{") then
                        return tableliteral()
                    elseif (t.text == '[') then
                        return olua_methodcall()
                    elseif (t.text == "...") then
                        pos = pos + 1
                        return leaf(t)
                    elseif (t.text == "^") then
                        pos = pos + 1
                        return olua_objc_blockObject()
                    end
                elseif (t.type == 'NSConstantString') then
                    pos = pos + 1
                    return t
                elseif (t.type == "NSConstantNumber") then
                    pos = pos + 1
                    return t
                end
                unexpectederror(t)
            end

lvaluelist = function(e)
                local ast = {type='list'}
                if not e then
                    if peek('operator', ')') then
                        return ast
                    end
                    e = lvalue()
                end

                ast[#ast+1] = e
                while true do
                    if not peek('operator', ',') then
                        return ast
                    end
                    pos = pos + 1
                    ast[#ast+1] = lvalue()
                end
            end	

lvalue = function()
            local ast = lvalueleaf()
            while true do
                local t = tokens[pos]
                if (t.type == 'operator') then
                    if (t.text == ".") or (t.text == ":") then
                        local t = tokens[pos]
                        pos = pos + 1
                        ast = 
                        {
                            type="binop", 
                            operator=t.text, 
                            precedence=1,
                            left=ast, 
                            right=lvalueleaf()
                        }                    
                    elseif (t.text == '[') then
                        pos = pos + 1
                        local index = rvalue()
                        expect('operator', ']')
                        ast = 
                        {
                            type="deref", 
                            left=ast, 
                            right=index
                        }
                    else
                        break
                    end
                else
                    break
                end
            end
            return ast
        end

lvalueleaf = function()
                local t = tokens[pos]
                if (t.type == 'identifier') then
                    pos = pos + 1
                    return {type="leaf", value=t}
                elseif (t.type == 'operator') then
                    if (t.text == "...") then
                        pos = pos + 1
                        return leaf(t)
                    end
                end
                print("1055")
                unexpectederror(t)	
            end

lvalueidentifier = function()
                        local t = expect('identifier')
                        return leaf(t)
                    end

functioncall = function(value)
                    local args

                    if peek('string') or peek('operator', "{") then
                        args = rvalueleaf()
                    else
                        expect('operator', '(')
                        args = rvaluelist()
                        expect('operator', ')')
                    end
                    return {type="functioncall", value=value, args=args}
                end

tableliteral = function()
                    local ast = {type="tableliteral"}
                    expect('operator', "{")
                    while not peek('operator', '}') do 
                        local entry = {}
                        if (tokens[pos].type == 'identifier') and
                        (tokens[pos+1].type == 'operator') and
                        (tokens[pos+1].text == '=') then
                            entry.key = tokens[pos]
                            pos = pos + 2
                            entry.value = rvalue()
                        elseif (tokens[pos].type == 'operator') and
                        (tokens[pos].text == '[') then
                        -- Disambiguate [expr]=value from [expr selector].

                            local oldpos = pos
                            pos = pos + 1
                            entry.key = rvalue()
                            if not optionalexpect('operator', ']') then
                                -- This must be a method call. Backtrack.
                                pos = oldpos
                                entry.key = nil
                                entry.value = rvalue()
                            else
                                -- Key/value assignment. the `]' has been expected, so not expect it again
                                expect('operator', '=')
                                entry.value = rvalue()
                            end
                        else
                            entry.value = rvalue()
                        end

                        ast[#ast + 1] = entry
                        if not optionalexpect('operator', ',', ';') then
                            break
                        end
                    end
                    
                    expect('operator', '}')
                    return ast
                end

--------------------------------------------------------------------------
--                        OBJECTIVE LUA EXTENSIONS                      --
--------------------------------------------------------------------------

local function peekselel()
                    local t1 = tokens[pos+0]
                    local t2 = tokens[pos+1]

                    if not t1 or not t2 then
                        return false
                    end

                    local isselel = ((t1.type == 'identifier') or (t1.type == 'keyword')) 
                    				and (t2.type == 'operator') and (t2.text == ":")

                    return isselel, t1, t2
                end

local function getselel()
                    local b, t1, t2 = peekselel()
                    if b then
                        pos = pos + 2
                        return t1.text .. ":"
                    end
                    return nil
               end

    olua_block = function()
                    
                    local ast = {type="chunk"}
                    expect('operator', "{")
                    
                    while not peek('operator', '}') do 
                        local t = tokens[pos]
                        if (t.type == 'keyword') then
                            if isterminatorkeyword(t.text) then
                                break
                            end

                            if (t.text == "return") or (t.text == "break") then
                                local a = laststat()
                                ast[#ast+1] = a

                                optionalexpect('operator', ';')
                                break
                            end
                        end

                        local a = stat()
                        ast[#ast+1] = a

                        optionalexpect('operator', ';')
                    end
                    
                    expect('operator', '}')
                    return 
                    {
                        type="olua_block",
                        chunk=ast,                        
                    }
                end

olua_methodcall = function()
                        expect('operator', '[')
                        local object = nil
                        if not optionalexpect('identifier', "super") then
                            object = rvalue()
                        end
                        local selector = {}
                        local args = {}

                        if not peek('identifier') and not peek('keyword') then
                            expectederror("identifier or selector element")
                        end

                        if not peekselel() then
                            -- Single-element selector.
                            selector[#selector + 1] = tokens[pos].text
                            pos = pos + 1
                        else
                            while true do
                                t = getselel()
                                if not t then
                                    break
                                end

                                selector[#selector + 1] = t
                                args[#args + 1] = rvalue()
                            end
                        end

                        while optionalexpect('operator', ',') do
                            args[#args + 1] = rvalue()
                        end

                        expect('operator', ']')
                        return methodcall 
                        {
                            type="olua_methodcall",
                            object=object,
                            selector= table.concat(selector),
                            args=args
                        }
                 end
olua_throw = function()
                local obj = stat()
                optionalexpect('operator', ';')
                local ast = 
                {
                    type = "olua_throw",
                    value=obj,
                }
                return ast
             end
olua_implementation = function()
                            expect('keyword', "@implementation")

                            local class = expect('identifier')
                            local superclass = nil
                            local category = nil
                            if optionalexpect('operator', ":") then
                                superclass = rvalueleaf()
                            elseif optionalexpect('operator', '(') then
                                category = expect('identifier')
                                expect('operator', ')') 
                            end

                            local ast =
                            {
                                type="olua_implementation",
                                class=class,
                                superclass=superclass.value.text,
                                category=category,
                                chunk=c
                            }

                            while tokens[pos] do
                                local t = tokens[pos]
                                if (t.type == 'keyword') then
                                    if (t.text == '@end') then
                                        break
                                    end
                                end

                                local a = olua_implementation_stat(class)
                                ast[#ast+1] = a
                            end

                            expect('keyword', '@end')
                            
                            return implementation(ast)
                    end
olua_createSelector = function()
                         expect('operator', '(')
                         local sel = getselel()
                         expect('operator', ')')
                         return 
                         {
                            type="olua_createSelector",
                            sel=stringify(sel),
                        }
                      end
olua_getProtocol = function()
                         expect('operator', '(')
                         local protocol = expect('identifier')
                         expect('operator', ')')
                         return 
                         {
                            type="olua_getProtocol",
                            protocol=stringify(protocol.text),
                        }
                      end

olua_import_file = function()
                        local fileName
                        if optionalexpect('operator', '(') then
                            fileName = expect('string').text
                            compileTimeInteraction(g_Engine, 'import', fileName)
                            expect('operator', ')')
                        else
                            fileName = expect('string').text
                        end
                        return
                        {
                            type="olua_import_file",
                            fileName=fileName,
                        }
                   end
                   
local olua_getTypeName = function()
                            local typeContent = ''
                            expect('identifier')
                            local t = tokens[pos]
                            typeContent = t.text
                            while true do
                                if t.type == 'operator' then
                                    if t.text == "*" then
                                        result  = result .. t.text
                                    elseif t.text == '[' then
                                        expect('number')
                                        expect(']')
                                        result = result .. "*"
                                        return result
                                    else
                                        print(1392)
                                        unexpectederror(t)
                                    end
                                else
                                    print(1396)
                                    unexpectederror(t)
                                end                            
                                pos = pos + 1                                
                            end
                         end
                         
local olua_argumentListOfFunction = function()
                local ast = {}
                local argumentTypes = {type='list'}
                local argumentNames = {type='list'}
                ast.argumentTypes = argumentTypes
                ast.argumentNames = argumentNames

                if peek('operator', ')') then
                    return ast
                end
                if optionalexpect('identifier', "void") then
                    return ast
                end

                local typeLooper = lvalue()
                local nameLooper = lvalue()

                argumentTypes[#argumentTypes+1] = typeLooper
                argumentNames[#argumentNames+1] = nameLooper

                if peek('operator', ')') then
                    return ast
                end

                while true do
                    print(tokens[pos].text)
                    if not peek('operator', ',') then
                        return ast
                    end
                    pos = pos + 1
                    typeLooper = lvalue()
                    argumentTypes[#argumentTypes+1] = typeLooper
                    nameLooper = lvalue()
                    argumentNames[#argumentNames+1] = nameLooper
                end
                return ast
            end	
            
olua_objc_blockObject = function()
                            local blockBody
                            local args

                            --optional expect the return type, just ignore it
                            optionalexpect('identifier')

                            if peek('operator', "{") then
                                blockBody = olua_block()
                            else
                                expect('operator', '(')
                                args = olua_argumentListOfFunction()
                                expect('operator', ')')

                                blockBody = olua_block()
                            end
                            return 
                            {
                                type="olua_objc_blockObject", 
                                args=args, 
                                blockBody=blockBody,
                            }
                        end
olua_objc_enumerator = function()
                            return
                            {
                                type = "olua_objc_enumerator",
                                args = rvalue(),
                            }
                        end
olua_objc_classPredeclearation = function()
                            local classNames = lvaluelist()
                            if #classNames < 1 then
                                expectederror('identifier', "class names")
                            end
                            optionalexpect('operator', ';')
                            for k, v in ipairs(classNames) do
                                local ast = v.value
                                ast.type = 'string'
                                ast.text = stringify(ast.text)
                            end
                            return 
                            {
                                type = "olua_objc_classPredeclearation",
                                classNames = classNames,
                            }
                        end
local rtag_return_in_chunk = function(ch)
                        local typeLooper
                        for _, v in ipairs(ch) do
                            typeLooper = v.type
                            if (typeLooper == "chunk") then
                                for _, statLooper in ipairs(v) do
                                    rtag_return_in_chunk(statLooper)
                                end
                            elseif (typeLooper == "ifelseend") then
                                for i, condition in ipairs(ast) do
                                    if (i == 1) or condition.condition then
                                        rtag_return_in_chunk(condition.condition)
                                    end                                                            
                                    rtag_return_in_chunk(condition.chunk)
                                end
                            elseif (typeLooper == "forend") or (typeLooper == "forinend")
                                  or (typeLooper == "whiledoend") or (typeLooper == "repeatuntil")
                                  or (typeLooper == "doend") then
                                rtag_return_in_chunk(v.chunk)
                            elseif (typeLooper == "return") then
                                v.type = "returnFromAutoreleasePool"
                            end
                        end
                    end

objc_autoreleasepool = function()
                             expect('keyword', "@autoreleasepool")
                             local c = olua_block()

                             rtag_return_in_chunk(c.chunk)

                             return 
                             {
                                type="objc_autoreleasepool",
                                block=c,
                             }
                        end
                        
olua_objc_trycatchfinally = function()
                                local tryBlock = olua_block()
                                
                                expect('keyword', "@catch")
                                expect('operator', '(')
                                local throwedObject = expect('identifier')
                                expect('operator', ')')
                                local chunk = olua_block()

                                local catchBlock = { 
                                                        arg = throwedObject.text,
                                                        chunk = chunk,
                                                    }

                                local finallyBlock
                                if optionalexpect('keyword', "@finally") then
                                    finallyBlock = olua_block()
                                end
                                return 
                                {
                                    type="olua_objc_trycatchfinally",
                                    tryBlock=tryBlock,
                                    catchBlock=catchBlock,
                                    finallyBlock=finallyBlock,
                                }
                            end
olua_property_declearation = function()
                                local propertyAttribute = {}
                                
                               if optionalexpect('operator', '(') then                                
                                    while true do
                                        local t = tokens[pos]
                                        local text = t.text
                                        if (text == ',') then
                                            pos = pos + 1
                                        elseif (text == ')') then
                                            break
                                        elseif (text == "nonatomic") then
                                            if propertyAttribute.atomic then
                                                print(1531)
                                                unexpectederror(t)
                                            else
                                                propertyAttribute.atomic = "nonatomic"
                                                pos = pos + 1
                                            end
                                        elseif (text == "assign") or (text == "copy") or (text == "retain") then
                                            if propertyAttribute.ownership then
                                                print(1539)
                                                unexpectederror(t)
                                            else
                                                propertyAttribute.ownership = text
                                                pos = pos + 1
                                            end
                                        elseif (text == "getter") then
                                            if propertyAttribute.getter then
                                                unexpectederror(t)
                                            else
                                                pos = pos + 1
                                                expect('operator', '=')
                                                propertyAttribute.getter = expect('identifier').text
                                            end
                                        elseif (text == "setter") then
                                            if propertyAttribute.setter then
                                                unexpectederror(t)
                                            else
                                                pos = pos + 1
                                                expect('operator', '=')
                                                local setter = expect('identifier').text
                                                expect('operator',":")
                                                propertyAttribute.setter = setter .. ":"
                                            end
                                        end    
                                                                            
                                    end
                                    expect('operator', ')')
                                end
                                    
                                local type = expect('identifier').text
                                local name = expect('identifier').text
                                                                
                                propertyAttribute["type"] = type
                                propertyAttribute["name"] = name
                                propertyAttribute["internalName"] = name
                                
                                if optionalexpect('operator', '=') then
                                    propertyAttribute["internalName"] = expect('identifier').text
                                end
                                
                                
                                if not propertyAttribute.atomic then
                                    propertyAttribute.atomic = "atomic"
                                end
                                if not propertyAttribute.ownership then
                                    propertyAttribute.ownership = "assign"
                                end
                                if not propertyAttribute.getter then
                                    propertyAttribute.getter = name
                                end
                                if not propertyAttribute.setter then
                                    propertyAttribute.setter = "set" .. name:gsub("^%l", string.upper) .. ":"
                                end
                                optionalexpect('operator', ';')
                                return 
                                {
                                    type = "olua_property_declearation",
                                    attribute=propertyAttribute,
                                }
                             end
                             
olua_implementation_stat = function(class)
                                local t = tokens[pos]
                                if (t.type == 'keyword') then
                                    if (t.text == "@property") then
                                        pos = pos + 1
                                        local c = olua_property_declearation()

                                        return {
                                                class = class,
                                                type = "olua_property_declearation",
                                                attribute = c.attribute,
                                            }
                                    end
                                else
                                    if (t.type == 'operator') and
                                        ((t.text == "-") or (t.text == "+")) then
                                        return olua_methoddefinition()		
                                    end
                                end

                                statementerror(t)
                            end

olua_typeannotation = function()
                        expect('operator', '(')
                        local result = ''
                        while true do
                            local t = tokens[pos]
                            if (t.type == 'operator' and t.text == ')') then
                                pos = pos + 1
                                break
                            end                            
                            pos = pos + 1
                            result  = result .. t.text
                        end
                        return result
                    end


olua_methoddefinition = function()
                            local t = expect('operator', "-", "+")
                            local classmethod = (t.text == "+")

                            local selector = {}
                            local argtypes = {}
                            local rettype = ""
                            local args = {}
                            local extraargs = {}

                            if peek('operator', '(') then
                                rettype = olua_typeannotation()
                            end

                            if not peek('identifier') and not peek('keyword') then
                                expectederror("identifier or selector element")
                            end

                            if not peekselel() then
                                -- Single-element selector.
                                selector[#selector + 1] = tokens[pos].text
                                pos = pos + 1
                            else
                                while true do
                                    t = getselel()
                                    if not t then
                                    break
                                    end

                                    selector[#selector + 1] = t

                                    if peek('operator', '(') then
                                        argtypes[#argtypes + 1] = olua_typeannotation()
                                    else
                                        argtypes[#argtypes + 1] = {}
                                    end

                                    args[#args + 1] = lvalueidentifier()
                                end
                            end

                            if optionalexpect('operator', ',') then
                                extraargs = lvaluelist()
                            end

                            local c = olua_block()
                            
                            return {
                                type="olua_methoddefinition",
                                --class=class,
                                selector=table.concat(selector),
                                args=args,
                                argtypes=argtypes,
                                rettype=rettype,
                                extraargs=extraargs,
                                classmethod=classmethod,
                                chunk=c,
                            }
                        end

olua_objc_literalArray = function()
                            local args
                            print(1717)

                            if optionalexpect('operator', ']') then
                                print(1719)
                                optionalexpect('operator', ';')
                                args = {}
                                return
                                {
                                    type = "olua_objc_literalArray",
                                    args = args,
                                }
                            end
                            print(1727)
                            args = rvaluelist()
                            expect('operator', ']')
                            optionalexpect('operator', ';')
                            return
                            {
                                type = "olua_objc_literalArray",
                                args = args,
                            }
                        end
olua_objc_literalDictionary = function()
                                if optionalexpect('operator', '}') then
                                    optionalexpect('operator', ';')
                                    return
                                    {
                                        type = "olua_objc_literalDictionary",
                                        keys = {},
                                        values = {},
                                    }
                                end
                                local keys = {type='list'}
                                local values = {type='list'}
                                while true do
                                    keys[#keys + 1] = rvalue()
                                    expect('operator', '=')
                                    values[#values + 1] = rvalue()
                                    if peek('operator', '}') then
                                        pos = pos + 1
                                        optionalexpect('operator', ';')
                                        return
                                        {
                                            type = "olua_objc_literalDictionary",
                                            keys = keys,
                                            values = values,
                                        }
                                    end
                                    expect('operator', ',')
                                end
                            end

--------------------------------------------------------------------------

local parser = function(input, _source)
                    source = _source or "(unknown)"
                    tokens = gettokens(input)
                    pos = 1

                    local c = chunk()
                    if tokens[pos] then
                        unexpectederror(tokens[pos])
                    end
                    return c	
                end


local result
local recursivelyunparse
local recursivelyunparsebinop

local function emit(s)
                    result[#result + 1] = s
                end

local typetable =
{
	chunk = function(ast)
                for _, statement in ipairs(ast) do
                    recursivelyunparse(statement)
                end
            end,
        
    doend = function(ast)
		emit("\ndo\n")
		recursivelyunparse(ast.chunk)
		emit("\nend")
    end,
        
    ifelseend = function(ast)
		for i, condition in ipairs(ast) do
			if (i == 1) then
				emit("if")
				recursivelyunparse(condition.condition)
				emit("then")
            else
                if condition.condition then
                    emit("elseif")
                    recursivelyunparse(condition.condition)
                    emit("then")
                else
                    emit("else")
                end
            end
                            
            recursivelyunparse(condition.chunk)
        end
        emit("end")
    end,
                            
    forend = function(ast)
        emit("for")
        recursivelyunparse(ast.var)
        emit('=')
        recursivelyunparse(ast.low)
        emit(',')
        recursivelyunparse(ast.high)
        if ast.step then
            emit(',')
            recursivelyunparse(ast.step)
        end
        emit("do")
        recursivelyunparse(ast.chunk)
        emit("end")
    end,
                                
    forinend = function(ast)
        emit("for")
        recursivelyunparse(ast.var)
        emit("in")
        recursivelyunparse(ast.iterator)
        emit("do")
        recursivelyunparse(ast.chunk)
        emit("end")
    end,
    olua_forinend = function(ast)
        emit("for")
        recursivelyunparse(ast.var)
        emit(" in objc_NSFastEnumerate(")
        recursivelyunparse(ast.iterator)
        emit(")do")
        recursivelyunparse(ast.chunk)
        emit("end")
    end,
    whiledoend = function(ast)
        emit("while")
        recursivelyunparse(ast.condition)
        emit("do")
        recursivelyunparse(ast.chunk)
        emit("end")
    end,
                                    
    dowhile = function(ast)
        emit("repeat")
        recursivelyunparse(ast.chunk)
        emit("until not(")
        recursivelyunparse(ast.condition)
        emit(')')
    end,
    repeatuntil = function(ast)
        emit("repeat")
        recursivelyunparse(ast.chunk)
        emit("until(")
        recursivelyunparse(ast.condition)
        emit(')')
    end,
                                
    ["return"] = function(ast)
        emit(" return ")
        if ast.value then
            recursivelyunparse(ast.value)
        end
    end,
    
    returnFromAutoreleasePool = function(ast)
        emit(" return {'@pool',")
        if ast.value then
            recursivelyunparse(ast.value)
        else
            emit(" nil ")
        end
        emit('}')
    end,
    
    ["break"] = function(ast)
        emit("break")
    end,
                                    
    functioncall = function(ast)
        recursivelyunparse(ast.value)
        emit('(')
        recursivelyunparse(ast.args)
        emit(')')
    end,
                                    
    functiondef = function(ast)
        if not ast.name then
            emit('(')
        end
                                        
        emit("\nfunction ")
        if ast.name then
            recursivelyunparse(ast.name)
        end
        emit('(')
        recursivelyunparse(ast.args)
        emit(")\n")
        recursivelyunparse(ast.chunk)
        emit("\nend\n")
                                            
        if not ast.name then
            emit(')')
        end
    end,
                                                
    assignment = function(ast)
        recursivelyunparse(ast.left)
        if ast.right then
            emit('=')
            recursivelyunparse(ast.right)
        end
    end,
                                                    
    list = function(ast)
        for i = 1, #ast do
            local exp = ast[i]
            if (i > 1) then
                emit(',')
            end
            recursivelyunparse(exp)
        end
    end,
                                                            
    tableliteral = function(ast)
        emit("{")
        for i = 1, #ast do
            local entry = ast[i]
            if (i > 1) then
                emit(',')
            end
            if entry.key then
                if (entry.key.type == 'identifier') then
                    emit(entry.key)
                else
                    emit('[')
                    recursivelyunparse(entry.key)
                    emit(']')
                end
                    emit('=')
            end
            recursivelyunparse(entry.value)
        end
        emit('}')
    end,
    
    binop = function(ast)
        recursivelyunparsebinop(ast.left, ast.precedence)
        emit(ast.operator)
        recursivelyunparsebinop(ast.right, ast.precedence)
    end,
    
    unop = function(ast)
        emit(ast.operator)
        recursivelyunparsebinop(ast.value, ast.precedence)
    end,
    
    deref = function(ast)
        recursivelyunparse(ast.left)
        emit('[')
        recursivelyunparse(ast.right)
        emit(']')
    end,
    
    ["local"] = function(ast)
        emit("\nlocal ")
        recursivelyunparse(ast.value)
    end,
    
    leaf = function(ast)
        emit(ast.value)
    end,
                       
    objc_allocateClassPair = function(ast)
        emit("objc_allocateClassPair(")
        recursivelyunparse(ast.args)
        emit(')')
    end,
    
    olua_block = function(ast)
        recursivelyunparse(ast.chunk)
    end,
    
    olua_methodcall = function(ast)
        emit("[object=")
        recursivelyunparse(ast.object)
        emit(" selector=")
        emit(ast.selector)
        emit(" args={")
        for i = 1, #ast.args do
            if (i > 1) then
                emit(',')
            end
            recursivelyunparse(ast.args[i])
        end
        emit("}]")
    end,
            
    olua_method_inner_call = function(ast)
        emit(" objc_msgSend(")
        recursivelyunparse(ast.object)
        emit(',' .. ast.selector)
        if #ast.args > 0 then
            emit(',')
        end
        recursivelyunparse(ast.args)
        emit(')')
    end,
    
    olua_method_super_call = function(ast)
        emit(" objc_msgSendSuper(self,")
        recursivelyunparse(ast.args)
        emit(')')
    end,

    olua_class_method_implementation = function(ast)
		recursivelyunparse(ast.chunk)
    end,

    luaClass_addMethod = function(ast)
        if ast.methodType == "objectmethod" then
            emit("\nclass_addInstanceMethod('" .. ast.class.text .. "', ")
        else
            emit("\nclass_addClassMethod('" .. ast.class.text .. "', ")
        end
        emit(ast.selector)

        if ast.rettype then
            emit(",'" .. ast.rettype .. "'")
        else
            emit(",nil")
        end
        
        for i = 1,#ast.argtypes do
            emit(",'" .. ast.argtypes[i] .. "'")
        end
        emit(',')
        recursivelyunparse(ast.imp)
        emit(')')
    end,
         
    class_implementation = function(ast)
        emit("\ndo\n")
		recursivelyunparse(ast.chunk)
        emit(" objc_registerClassPair('" .. ast.class.text .. "')")
        recursivelyunparse(ast.classMethodsChunk)
		emit(" end\n")
    end,
    
    olua_property_declearation = function(ast)
        local className = ast.class.text
        local propertyAttribute = ast.attribute

        emit(" class_addProperty('" .. className .. "', '" .. propertyAttribute.atomic .. "','")
        emit(propertyAttribute.ownership .. "','" .. propertyAttribute.getter .. "','" .. propertyAttribute.setter .. "','")
        emit(propertyAttribute.type .. "','" .. propertyAttribute.name .. "','" .. propertyAttribute.internalName .. "')" )
    end,
    
    olua_createSelector = function(ast)
        local sel = ast.sel
        emit(" sel_registerName(" .. sel .. ')')
    end,
    
    olua_getProtocol = function(ast)
        local protocol = ast.protocol
        emit(" objc_getProtocol(" .. protocol .. ')')
    end,

    objc_autoreleasepool = function(ast)
        emit([==[
                do 
                    local __pool__ = objc_msgSend(objc_msgSend(NSAutoreleasePool,'alloc'), 'init')
                    local __func__=(function()
             ]==]
            )
        recursivelyunparse(ast.block)
        emit([==[ end)
            local __returnTable__ = __func__()
            if __returnTable__ then
                  local __ret__=__returnTable__[2]
                  objc_retainBeforeReturnFromAutoreleasePool(__ret__)
                  objc_msgSend(__pool__, 'release')
                  collectgarbage("collect")
                  return __ret__
            else
                  collectgarbage("collect")
                  objc_msgSend(__pool__, 'release')
            end
            end]==])
    end,
    
    olua_import_file = function(ast)
        emit(" objc_import_file(" .. ast.fileName .. ")\n")
    end,
    
    olua_throw = function(ast)
        emit(" objc_throw(")
        recursivelyunparse(ast.value)
        emit(')')
    end,
    olua_objc_enumerator = function(ast)
        emit(" objc_NSFastEnumerate(")
        recursivelyunparse(ast.args)
        emit(')')
    end,
    olua_objc_blockObject = function(ast)                            

                                emit(" objc_createBlockObject(")
                                local args = ast.args
                                if args then
                                    local argumentTypes = {}
                                    for _,i in ipairs(args.argumentTypes) do
                                        argumentTypes[#argumentTypes + 1] = stringleaf(i.value.text)
                                    end
                                        argumentTypes.type = 'list'
                                    if #argumentTypes > 1 then
                                        recursivelyunparse(argumentTypes)
                                        emit(',')
                                    end

                                    emit("function(")
                                        recursivelyunparse(args.argumentNames)
                                    emit(')')
                                        recursivelyunparse(ast.blockBody)
                                    emit("end)")
                                else 
                                    emit("function()")
                                    recursivelyunparse(ast.blockBody)
                                    emit("end)")
                                end
    end,
    
    olua_objc_trycatchfinally = function(ast)
                                             local tryFunctionName = '__tryBlock_func_' ..  objc_UUIDString()
                                             local catchFunctionName = '__catchBlock_func_' .. objc_UUIDString()
                                             local finallyFunctionName = '__finallyBlock_func_' .. objc_UUIDString()

                                             emit('do local ' .. tryFunctionName .. ' =function()')
                                             recursivelyunparse(ast.tryBlock)
                                             emit('\nend\n')

                                             emit(' local ' ..  catchFunctionName .. '=function(' .. ast.catchBlock.arg .. ')')
                                             recursivelyunparse(ast.catchBlock.chunk)
                                             emit('\nend')
                                             
                                             emit(' local ' .. finallyFunctionName)
                                             if ast.finallyBlock then
                                                emit('=function()')
                                                    recursivelyunparse(ast.finallyBlock)
                                                emit('\nend\n')
                                             end
                                             
                                             emit(' objc_tryCatchFinally(' .. tryFunctionName .. ',' .. catchFunctionName .. ',' .. finallyFunctionName .. ')')

                                 emit("\nend")
    end,    
    NSConstantString = function(ast)
                                emit(" __NSConstantString(" .. ast.text .. ')')
    end,
    NSConstantNumber = function(ast)
                                emit(" __NSConstantNumber(" .. ast.text .. ')')
    end,
    olua_objc_classPredeclearation = function(ast)
                                emit(" objc_classPredeclearation(")
                                recursivelyunparse(ast.classNames)
                                emit(')')
    end,
    olua_objc_literalArray = function(ast)
                                emit(" objc_createLiteralArray(")
                                print(2190)
                                if #ast.args > 0 then
                                    recursivelyunparse(ast.args)
                                end
                                emit(')')
    end,
    olua_objc_literalDictionary = function(ast)
                                    emit("objc_createLiteralDictionary(")
                                    if (#ast.keys > 0) then
                                        recursivelyunparse(ast.keys)
                                        emit(',')
                                        recursivelyunparse(ast.values)
                                    end
                                    emit(')')
    end,
}

recursivelyunparsebinop = function(ast, thisprecedence)
                            if (ast.type == "binop") and
                            (not ast.precedence or not thisprecedence or 
                             (ast.precedence < thisprecedence)) then
                                emit('(')
                                recursivelyunparse(ast)
                                emit(')')
                            else
                                recursivelyunparse(ast)
                                end
                            end

recursivelyunparse = function(ast)
                        local t = typetable[ast.type]
                        if not t then
                            for k, v in pairs(ast) do
                                print("k,v", k, v)
                            end
                            error("Unknown AST node type "..ast.type)
                        end

                        t(ast)
                      end

local needsspace =
{
	string = true,
	number = true,
	identifier = true,
	keyword = true
}

local unparser = function(ast)
                    result = {}
                    recursivelyunparse(ast)

                    local line = 1
                    local lasttype = nil
                    local s = {}
                    for _, t in ipairs(result) do
                        if type(t) == 'string' then
                            local isstring = t:find("^[%w_]*$")
                            if needsspace[lasttype] and isstring then
                                s[#s+1] = " "
                            end

                            s[#s+1] = t
                            if isstring then
                                lasttype = 'string'
                            else
                                lasttype = nil
                            end
                        else
                            if t.line then
                                while (line < t.line) do
                                    --s[#s+1] = "\n"
                                    line = line + 1
                                    lasttype = nil
                                end
                            end

                            if needsspace[lasttype] and needsspace[t.type] then
                                s[#s+1] = " "
                            end

                            s[#s+1] = t.text

                            lasttype = t.type
                        end
                    end

                    return table.concat(s)
                end


translate = function(intext, engine)
                g_Engine = engine
                local result = unparser(parser(intext, nil))
                return result
                --return string.gsub(result, "(\n+)", "\n")
            end
