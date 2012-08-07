//
//  LuaObjCAccelerator.m
//  LuaIOS
//
//  Created by tearsofphoenix on 3/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaObjCAccelerator.h"

#import "LuaObjCStructs.h"

#import "LuaObjCClass.h"

#import "LuaObjCAuxiliary.h"

#import "LuaObjCInternal.h"
#import "lua.h"
#import <objc/message.h>

int LuaObjCAcceleratorForNoArgument(lua_State *L, const char* returnType, 
                                                       IMP impRef, id obj, SEL selector)
{
    returnType = _luaObjCInternal_jumpoverEncodingDecorator(returnType);
    switch (*returnType) 
    {
        case 'c':
        case 'i':
        case 's':
        case 'l':
        case 'q':
        case 'C':
        case 'I':
        case 'S':
        case 'L':
        case 'Q':
        case 'B':
        {
            typedef NSInteger (* _IMP_T)(id, SEL);
            lua_pushinteger(L, ((_IMP_T)impRef)(obj, selector));
            return 1;
        }
        case 'f':
        case 'd':
        {
            typedef float (* _IMP_T)(id, SEL);
            lua_pushnumber(L, ((_IMP_T)impRef)(obj, selector));
            return 1;
        }
        case '*':
        {
            typedef const char* (* _IMP_T)(id, SEL);
            lua_pushstring(L, ((_IMP_T)impRef)(obj, selector));
            return 1;
        }
        case '#':
        case '@':
        {
            luaObjC_pushNSObject(L, impRef(obj, selector));
            return 1;
        }
        case ':':
        {
            typedef SEL (* _IMP_T)(id, SEL);
            luaObjC_pushSelector(L, ((_IMP_T)impRef)(obj, selector));
            return 1;
        }
        case '{':
        {
            if (!strcmp(returnType, @encode(CGRect)))
            {
                typedef CGRect (* _IMP_T)(id, SEL);
                lua_pushCGRect(L, ((_IMP_T)impRef)(obj, selector));
                
            }else if (!strcmp(returnType, @encode(CGPoint)))
            {
                typedef CGPoint (* _IMP_T)(id, SEL);
                lua_pushCGPoint(L, ((_IMP_T)impRef)(obj, selector));
                
            }else if (!strcmp(returnType, @encode(CGSize)))
            {
                typedef CGSize (* _IMP_T)(id, SEL);
                lua_pushCGSize(L, ((_IMP_T)impRef)(obj, selector));
                
            }else if (!strcmp(returnType, @encode(NSRange)))
            {
                typedef NSRange (* _IMP_T)(id, SEL);
                lua_pushNSRange(L, ((_IMP_T)impRef)(obj, selector));
                
            }else if (!strcmp(returnType, @encode(CATransform3D)))
            {
                typedef CATransform3D (* _IMP_T)(id, SEL);
                lua_pushCATransform3D(L, ((_IMP_T)impRef)(obj, selector));
                
            }else if (!strcmp(returnType, @encode(CGAffineTransform)))
            {
                typedef CGAffineTransform (* _IMP_T)(id, SEL);
                lua_pushCGAffineTransform(L, ((_IMP_T)impRef)(obj, selector));
            }
            return 1;
        }
        case '^':
        case '[':
        {
            typedef void* (* _IMP_T)(id, SEL);
            void *p = ((_IMP_T)impRef)(obj, selector);
            lua_pushlightuserdata(L, p);
            return 1;
        }
        case 'v':
        {
            typedef void (* _IMP_T)(id, SEL);
            ((_IMP_T)impRef)(obj, selector);
            return 1;
        }
        case 'V': //"Vv"
        {
            [obj release];
            return 0;
        }
        default:
        {
            return 0;
        }
    }
}


int LuaObjCAcceleratorForOneArgument(lua_State *L, 
                                                        const char* argType,
                                                        const char* returnType, 
                                                        IMP impRef, 
                                                        id obj, 
                                                        SEL selector)
{  
    returnType = _luaObjCInternal_jumpoverEncodingDecorator(returnType);

    switch (*returnType) 
    {
            
        case 'c':
        case 'i':
        case 's':
        case 'l':
        case 'q':
        case 'C':
        case 'I':
        case 'S':
        case 'L':
        case 'Q':
        case 'B':
        {
            argType = _luaObjCInternal_jumpoverEncodingDecorator(argType);
            switch (*argType)
            {
                case 'c':
                case 'i':
                case 's':
                case 'l':
                case 'q':
                case 'C':
                case 'I':
                case 'S':
                case 'L':
                case 'Q':
                case 'B':
                {
                    typedef NSInteger (* _IMP_T)(id, SEL, NSInteger);
                    lua_pushinteger(L, ((_IMP_T)impRef)(obj, selector, luaObjC_checkInteger(L, LuaObjCArgumentStart)));
                    return 1;
                }
                case 'f':
                case 'd':
                {
                    typedef NSInteger (* _IMP_T)(id, SEL, CGFloat);
                    lua_pushinteger(L, ((_IMP_T)impRef)(obj, selector, lua_tonumber(L, LuaObjCArgumentStart)));
                    return 1;
                }
                case '*':
                {
                    typedef NSInteger (* _IMP_T)(id, SEL, const char*);
                    lua_pushinteger(L, ((_IMP_T)impRef)(obj, selector, lua_tostring(L, LuaObjCArgumentStart)));
                    return 1;
                }
                case '#':
                case '@':
                {
                    typedef NSInteger (* _IMP_T)(id, SEL, id);
                    lua_pushinteger(L, ((_IMP_T)impRef)(obj, selector, luaObjC_checkNSObject(L, LuaObjCArgumentStart)));
                    return 1;
                }
                case ':':
                {
                    typedef NSInteger (* _IMP_T)(id, SEL, SEL);
                    SEL sel = NSSelectorFromString([NSString stringWithCString: luaObjC_checkString(L, LuaObjCArgumentStart)
                                                                      encoding: NSUTF8StringEncoding]);
                    lua_pushinteger(L, ((_IMP_T)impRef)(obj, selector, sel));
                    return 1;
                }
                case '{':
                {
                    if (!strcmp(argType, @encode(CGRect)))
                    {
                        CGRect *rect = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef NSInteger (* _IMP_T)(id, SEL, CGRect);
                        lua_pushinteger(L, ((_IMP_T)impRef)(obj, selector, *rect) );
                        
                    }else if (!strcmp(argType, @encode(CGPoint)))
                    {
                        CGPoint *point = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef NSInteger (* _IMP_T)(id, SEL, CGPoint);
                        lua_pushinteger(L, ((_IMP_T)impRef)(obj, selector, *point));
                        
                    }else if (!strcmp(argType, @encode(CGSize)))
                    {
                        CGSize *size = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef NSInteger (* _IMP_T)(id, SEL, CGSize);
                        lua_pushinteger(L, ((_IMP_T)impRef)(obj, selector, *size));
                        
                    }else if (!strcmp(returnType, @encode(NSRange)))
                    {
                        NSRange *r = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef NSInteger (* _IMP_T)(id, SEL, NSRange);
                        lua_pushinteger(L, ((_IMP_T)impRef)(obj, selector, *r));
                        
                    }else if (!strcmp(returnType, @encode(CATransform3D)))
                    {
                        CATransform3D *t = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef NSInteger (* _IMP_T)(id, SEL, CATransform3D);
                        lua_pushinteger(L, ((_IMP_T)impRef)(obj, selector, *t));
                        
                    }else if (!strcmp(returnType, @encode(CGAffineTransform)))
                    {
                        CGAffineTransform *t = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef NSInteger (* _IMP_T)(id, SEL, CGAffineTransform);
                        lua_pushinteger(L, ((_IMP_T)impRef)(obj, selector, *t));
                    }
                    
                    return 1;
                }
                case '^':
                case '[':
                {
                    typedef NSInteger (* _IMP_T)(id, SEL, void*);
                    lua_pushinteger(L, ((_IMP_T)impRef)(obj, selector, lua_touserdata(L, LuaObjCArgumentStart)));
                    return 1;
                }
                default:
                {
                    return 0;
                }
            }
        }
        case 'f':
        case 'd':
        {
            argType = _luaObjCInternal_jumpoverEncodingDecorator(argType);

            switch (*argType)
            {
                case 'c':
                case 'i':
                case 's':
                case 'l':
                case 'q':
                case 'C':
                case 'I':
                case 'S':
                case 'L':
                case 'Q':
                case 'B':
                {
                    typedef CGFloat (* _IMP_T)(id, SEL, NSInteger);
                    lua_pushnumber(L, ((_IMP_T)impRef)(obj, selector, luaObjC_checkInteger(L, LuaObjCArgumentStart)));
                    return 1;
                }
                case 'f':
                case 'd':
                {
                    typedef CGFloat (* _IMP_T)(id, SEL, CGFloat);
                    lua_pushnumber(L, ((_IMP_T)impRef)(obj, selector, lua_tonumber(L, LuaObjCArgumentStart)));
                    return 1;
                }
                case '*':
                {
                    typedef CGFloat (* _IMP_T)(id, SEL, const char*);
                    lua_pushnumber(L, ((_IMP_T)impRef)(obj, selector, lua_tostring(L, LuaObjCArgumentStart)));
                    return 1;
                }
                case '#':
                case '@':
                {
                    typedef CGFloat (* _IMP_T)(id, SEL, id);
                    lua_pushnumber(L, ((_IMP_T)impRef)(obj, selector, luaObjC_checkNSObject(L, LuaObjCArgumentStart)));
                    return 1;
                }
                case ':':
                {
                    typedef CGFloat (* _IMP_T)(id, SEL, SEL);
                    SEL sel = NSSelectorFromString([NSString stringWithCString: luaObjC_checkString(L, LuaObjCArgumentStart)
                                                                      encoding: NSUTF8StringEncoding]);
                    lua_pushnumber(L, ((_IMP_T)impRef)(obj, selector, sel));
                    return 1;
                }
                case '{':
                {
                    if (!strcmp(argType, @encode(CGRect)))
                    {
                        CGRect *rect = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef CGFloat (* _IMP_T)(id, SEL, CGRect);
                        lua_pushnumber(L, ((_IMP_T)impRef)(obj, selector, *rect) );
                        
                    }else if (!strcmp(argType, @encode(CGPoint)))
                    {
                        CGPoint *point = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef CGFloat (* _IMP_T)(id, SEL, CGPoint);
                        lua_pushnumber(L, ((_IMP_T)impRef)(obj, selector, *point));
                        
                    }else if (!strcmp(argType, @encode(CGSize)))
                    {
                        CGSize *size = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef CGFloat (* _IMP_T)(id, SEL, CGSize);
                        lua_pushnumber(L, ((_IMP_T)impRef)(obj, selector, *size));
                        
                    }else if (!strcmp(returnType, @encode(NSRange)))
                    {
                        NSRange *r = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef CGFloat (* _IMP_T)(id, SEL, NSRange);
                        lua_pushnumber(L, ((_IMP_T)impRef)(obj, selector, *r));
                        
                    }else if (!strcmp(returnType, @encode(CATransform3D)))
                    {
                        CATransform3D *t = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef CGFloat (* _IMP_T)(id, SEL, CATransform3D);
                        lua_pushnumber(L, ((_IMP_T)impRef)(obj, selector, *t));
                        
                    }else if (!strcmp(returnType, @encode(CGAffineTransform)))
                    {
                        CGAffineTransform *t = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef CGFloat (* _IMP_T)(id, SEL, CGAffineTransform);
                        lua_pushnumber(L, ((_IMP_T)impRef)(obj, selector, *t));
                    }
                    return 1;
                }
                case '^':
                case '[':
                {
                    typedef CGFloat (* _IMP_T)(id, SEL, void*);
                    lua_pushnumber(L, ((_IMP_T)impRef)(obj, selector, lua_touserdata(L, LuaObjCArgumentStart)));
                    return 1;
                }
                default:
                {
                    return 0;
                }
            }
        }
        case '*':
        {
            argType = _luaObjCInternal_jumpoverEncodingDecorator(argType);

            switch (*argType)
            {
                case 'c':
                case 'i':
                case 's':
                case 'l':
                case 'q':
                case 'C':
                case 'I':
                case 'S':
                case 'L':
                case 'Q':
                case 'B':
                {
                    typedef const char* (* _IMP_T)(id, SEL, NSInteger);
                    lua_pushstring(L, ((_IMP_T)impRef)(obj, selector, luaObjC_checkInteger(L, LuaObjCArgumentStart)));
                    return 1;
                }
                case 'f':
                case 'd':
                {
                    typedef const char* (* _IMP_T)(id, SEL, CGFloat);
                    lua_pushstring(L, ((_IMP_T)impRef)(obj, selector, lua_tonumber(L, LuaObjCArgumentStart)));
                    return 1;
                }
                case '*':
                {
                    typedef const char* (* _IMP_T)(id, SEL, const char*);
                    lua_pushstring(L, ((_IMP_T)impRef)(obj, selector, lua_tostring(L, LuaObjCArgumentStart)));
                    return 1;
                }
                case '#':
                case '@':
                {
                    typedef const char* (* _IMP_T)(id, SEL, id);
                    lua_pushstring(L, ((_IMP_T)impRef)(obj, selector, luaObjC_checkNSObject(L, LuaObjCArgumentStart)));
                    return 1;
                }
                case ':':
                {
                    typedef const char* (* _IMP_T)(id, SEL, SEL);
                    SEL sel = sel_getUid(luaObjC_checkString(L, LuaObjCArgumentStart));

                    lua_pushstring(L, ((_IMP_T)impRef)(obj, selector, sel));
                    return 1;
                }
                case '{':
                {
                    if (!strcmp(argType, @encode(CGRect)))
                    {
                        CGRect *rect = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef const char* (* _IMP_T)(id, SEL, CGRect);
                        lua_pushstring(L, ((_IMP_T)impRef)(obj, selector, *rect) );
                        
                    }else if (!strcmp(argType, @encode(CGPoint)))
                    {
                        CGPoint *rect = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef const char* (* _IMP_T)(id, SEL, CGPoint);
                        lua_pushstring(L, ((_IMP_T)impRef)(obj, selector, *rect));
                        
                    }else if (!strcmp(argType, @encode(CGSize)))
                    {
                        CGSize *rect = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef const char* (* _IMP_T)(id, SEL, CGSize);
                        lua_pushstring(L, ((_IMP_T)impRef)(obj, selector, *rect));
                    }else if (!strcmp(returnType, @encode(NSRange)))
                    {
                        NSRange *r = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef const char * (* _IMP_T)(id, SEL, NSRange);
                        lua_pushstring(L, ((_IMP_T)impRef)(obj, selector, *r));
                        
                    }else if (!strcmp(returnType, @encode(CATransform3D)))
                    {
                        CATransform3D *t = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef const char * (* _IMP_T)(id, SEL, CATransform3D);
                        lua_pushstring(L, ((_IMP_T)impRef)(obj, selector, *t));
                        
                    }else if (!strcmp(returnType, @encode(CGAffineTransform)))
                    {
                        CGAffineTransform *t = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef const char * (* _IMP_T)(id, SEL, CGAffineTransform);
                        lua_pushstring(L, ((_IMP_T)impRef)(obj, selector, *t));
                    }
                    return 1;
                }
                case '^':
                case '[':
                {
                    typedef const char* (* _IMP_T)(id, SEL, void*);
                    lua_pushstring(L, ((_IMP_T)impRef)(obj, selector, lua_touserdata(L, LuaObjCArgumentStart)));
                    return 1;
                }
                default:
                {
                    return 0;
                }
            }
        }
        case '#':
        case '@':
        {
            argType = _luaObjCInternal_jumpoverEncodingDecorator(argType);

            switch (*argType)
            {
                case 'c':
                case 'i':
                case 's':
                case 'l':
                case 'q':
                case 'C':
                case 'I':
                case 'S':
                case 'L':
                case 'Q':
                case 'B':
                {
                    typedef id (* _IMP_T)(id, SEL, NSInteger);
                    luaObjC_pushNSObject(L, ((_IMP_T)impRef)(obj, selector, luaObjC_checkInteger(L, LuaObjCArgumentStart)));
                    return 1;
                }
                case 'f':
                case 'd':
                {
                    typedef id (* _IMP_T)(id, SEL, CGFloat);
                    luaObjC_pushNSObject(L, ((_IMP_T)impRef)(obj, selector, lua_tonumber(L, LuaObjCArgumentStart)));
                    return 1;
                }
                case '*':
                {
                    typedef id (* _IMP_T)(id, SEL, const char*);
                    luaObjC_pushNSObject(L, ((_IMP_T)impRef)(obj, selector, lua_tostring(L, LuaObjCArgumentStart)));
                    return 1;
                }
                case '#':
                case '@':
                {
                    typedef id (* _IMP_T)(id, SEL, id);
                    luaObjC_pushNSObject(L, ((_IMP_T)impRef)(obj, selector, luaObjC_checkNSObject(L, LuaObjCArgumentStart)));
                    return 1;
                }
                case ':':
                {
                    typedef id (* _IMP_T)(id, SEL, SEL);
                    SEL sel = NSSelectorFromString([NSString stringWithCString: luaObjC_checkString(L, LuaObjCArgumentStart)
                                                                      encoding: NSUTF8StringEncoding]);
                    luaObjC_pushNSObject(L, ((_IMP_T)impRef)(obj, selector, sel));
                    return 1;
                }
                case '{':
                {
                    if (!strcmp(argType, @encode(CGRect)))
                    {                        
                        CGRect *rect = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef id (* _IMP_T)(id, SEL, CGRect);
                        luaObjC_pushNSObject(L, ((_IMP_T)impRef)(obj, selector, *rect) );
                        
                    }else if (!strcmp(argType, @encode(CGPoint)))
                    {
                        CGPoint *rect = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef id (* _IMP_T)(id, SEL, CGPoint);
                        luaObjC_pushNSObject(L, ((_IMP_T)impRef)(obj, selector, *rect));
                        
                    }else if (!strcmp(argType, @encode(CGSize)))
                    {
                        CGSize *rect = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef id (* _IMP_T)(id, SEL, CGSize);
                        luaObjC_pushNSObject(L, ((_IMP_T)impRef)(obj, selector, *rect));
                    }else if (!strcmp(returnType, @encode(NSRange)))
                    {
                        NSRange *r = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef id (* _IMP_T)(id, SEL, NSRange);
                        luaObjC_pushNSObject(L, ((_IMP_T)impRef)(obj, selector, *r));
                        
                    }else if (!strcmp(returnType, @encode(CATransform3D)))
                    {
                        CATransform3D *t = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef id (* _IMP_T)(id, SEL, CATransform3D);
                        luaObjC_pushNSObject(L, ((_IMP_T)impRef)(obj, selector, *t));
                        
                    }else if (!strcmp(returnType, @encode(CGAffineTransform)))
                    {
                        CGAffineTransform *t = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef id (* _IMP_T)(id, SEL, CGAffineTransform);
                        luaObjC_pushNSObject(L, ((_IMP_T)impRef)(obj, selector, *t));
                    }
                    return 1;
                }
                case '^':
                case '[':
                {
                    typedef id (* _IMP_T)(id, SEL, void*);
                    luaObjC_pushNSObject(L, ((_IMP_T)impRef)(obj, selector, lua_touserdata(L, LuaObjCArgumentStart)));
                    return 1;
                }
                default:
                {
                    return 0;
                }
            }
        }
        case ':':
        {
            argType = _luaObjCInternal_jumpoverEncodingDecorator(argType);

            switch (*argType)
            {
                case 'c':
                case 'i':
                case 's':
                case 'l':
                case 'q':
                case 'C':
                case 'I':
                case 'S':
                case 'L':
                case 'Q':
                case 'B':
                {
                    typedef SEL (* _IMP_T)(id, SEL, NSInteger);
                    luaObjC_pushSelector(L, ((_IMP_T)impRef)(obj, selector, luaObjC_checkInteger(L, LuaObjCArgumentStart)));
                    return 1;
                }
                case '*':
                {
                    typedef SEL (* _IMP_T)(id, SEL, const char*);
                    luaObjC_pushSelector(L, ((_IMP_T)impRef)(obj, selector, lua_tostring(L, LuaObjCArgumentStart)) );
                    return 1;
                }
                case '#':
                case '@':
                {
                    typedef SEL (* _IMP_T)(id, SEL, id);
                    luaObjC_pushSelector(L, ((_IMP_T)impRef)(obj, selector, luaObjC_checkNSObject(L, LuaObjCArgumentStart)) );
                    return 1;
                }
                case '^':
                case '[':
                {
                    typedef SEL (* _IMP_T)(id, SEL, void*);
                    luaObjC_pushSelector(L, ((_IMP_T)impRef)(obj, selector, lua_touserdata(L, LuaObjCArgumentStart)) );
                    return 1;
                }
                default:
                {                        
                    return 0;
                }
            }
            
        }
        case '{':
        {
            
            if (!strcmp(returnType, @encode(CGRect)))
            {     
                argType = _luaObjCInternal_jumpoverEncodingDecorator(argType);

                switch (*argType)
                {
                    case 'c':
                    case 'i':
                    case 's':
                    case 'l':
                    case 'q':
                    case 'C':
                    case 'I':
                    case 'S':
                    case 'L':
                    case 'Q':
                    case 'B':
                    {
                        typedef CGRect (* _IMP_T)(id, SEL, NSInteger);
                        lua_pushCGRect(L, ((_IMP_T)impRef)(obj, selector, luaObjC_checkInteger(L, LuaObjCArgumentStart)));
                        return 1;
                    }
                    case 'f':
                    case 'd':
                    {
                        typedef CGRect (* _IMP_T)(id, SEL, CGFloat);
                        lua_pushCGRect(L, ((_IMP_T)impRef)(obj, selector, lua_tonumber(L, LuaObjCArgumentStart)));
                        return 1;
                    }
                    case '*':
                    {
                        typedef CGRect (* _IMP_T)(id, SEL, const char*);
                        lua_pushCGRect(L, ((_IMP_T)impRef)(obj, selector, lua_tostring(L, LuaObjCArgumentStart)));
                        return 1;
                    }
                    case '#':
                    case '@':
                    {
                        typedef CGRect (* _IMP_T)(id, SEL, id);
                        lua_pushCGRect(L, ((_IMP_T)impRef)(obj, selector, luaObjC_checkNSObject(L, LuaObjCArgumentStart)));
                        return 1;
                    }
                    case ':':
                    {
                        typedef CGRect (* _IMP_T)(id, SEL, SEL);
                        SEL sel = NSSelectorFromString([NSString stringWithCString: luaObjC_checkString(L, LuaObjCArgumentStart)
                                                                          encoding: NSUTF8StringEncoding]);
                        lua_pushCGRect(L, ((_IMP_T)impRef)(obj, selector, sel));
                        return 1;
                    }
                    case '{':
                    {
                        if (!strcmp(argType, @encode(CGRect)))
                        {
                            CGRect *rect = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef CGRect (* _IMP_T)(id, SEL, CGRect);
                            lua_pushCGRect(L, ((_IMP_T)impRef)(obj, selector, *rect));
                            
                        }else if (!strcmp(argType, @encode(CGPoint)))
                        {
                            CGPoint *rect = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef CGRect (* _IMP_T)(id, SEL, CGPoint);
                            lua_pushCGRect(L, ((_IMP_T)impRef)(obj, selector, *rect));
                            
                        }else if (!strcmp(argType, @encode(CGSize)))
                        {
                            CGSize *rect = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef CGRect (* _IMP_T)(id, SEL, CGSize);
                            lua_pushCGRect(L, ((_IMP_T)impRef)(obj, selector, *rect));
                            
                        }else if (!strcmp(returnType, @encode(NSRange)))
                        {
                            NSRange *r = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef CGRect (* _IMP_T)(id, SEL, NSRange);
                            lua_pushCGRect(L, ((_IMP_T)impRef)(obj, selector, *r));
                            
                        }else if (!strcmp(returnType, @encode(CATransform3D)))
                        {
                            CATransform3D *t = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef CGRect (* _IMP_T)(id, SEL, CATransform3D);
                            lua_pushCGRect(L, ((_IMP_T)impRef)(obj, selector, *t));
                            
                        }else if (!strcmp(returnType, @encode(CGAffineTransform)))
                        {
                            CGAffineTransform *t = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef CGRect (* _IMP_T)(id, SEL, CGAffineTransform);
                            lua_pushCGRect(L, ((_IMP_T)impRef)(obj, selector, *t));
                        }
                        return 1;
                    }
                    case '^':
                    case '[':
                    {
                        typedef CGRect (* _IMP_T)(id, SEL, void*);
                        lua_pushCGRect(L, ((_IMP_T)impRef)(obj, selector, lua_touserdata(L, LuaObjCArgumentStart)));
                        return 1;
                    }
                    default:
                    {
                        return 0;
                    }
                }
                
            }else if (!strcmp(returnType, @encode(CGPoint)))
            {
                argType = _luaObjCInternal_jumpoverEncodingDecorator(argType);

                switch (*argType)
                {
                    case 'c':
                    case 'i':
                    case 's':
                    case 'l':
                    case 'q':
                    case 'C':
                    case 'I':
                    case 'S':
                    case 'L':
                    case 'Q':
                    case 'B':
                    {
                        typedef CGPoint (* _IMP_T)(id, SEL, NSInteger);
                        lua_pushCGPoint(L, ((_IMP_T)impRef)(obj, selector, luaObjC_checkInteger(L, LuaObjCArgumentStart)));
                        return 1;
                    }
                    case 'f':
                    case 'd':
                    {
                        typedef CGPoint (* _IMP_T)(id, SEL, CGFloat);
                        lua_pushCGPoint(L,  ((_IMP_T)impRef)(obj, selector, lua_tonumber(L, LuaObjCArgumentStart)));
                        return 1;
                    }
                    case '*':
                    {
                        typedef CGPoint (* _IMP_T)(id, SEL, const char*);
                        lua_pushCGPoint(L,  ((_IMP_T)impRef)(obj, selector, lua_tostring(L, LuaObjCArgumentStart)));
                        return 1;
                    }
                    case '#':
                    case '@':
                    {
                        typedef CGPoint (* _IMP_T)(id, SEL, id);
                        lua_pushCGPoint(L,  ((_IMP_T)impRef)(obj, selector, luaObjC_checkNSObject(L, LuaObjCArgumentStart)));
                        return 1;
                    }
                    case ':':
                    {
                        typedef CGPoint (* _IMP_T)(id, SEL, SEL);
                        SEL sel = NSSelectorFromString([NSString stringWithCString: luaObjC_checkString(L, LuaObjCArgumentStart)
                                                                          encoding: NSUTF8StringEncoding]);
                        lua_pushCGPoint(L,  ((_IMP_T)impRef)(obj, selector, sel));
                        return 1;
                    }
                    case '{':
                    {
                        if (!strcmp(argType, @encode(CGRect)))
                        {
                            CGRect *rect = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef CGPoint (* _IMP_T)(id, SEL, CGRect);
                            lua_pushCGPoint(L,  ((_IMP_T)impRef)(obj, selector, *rect) );
                            
                        }else if (!strcmp(argType, @encode(CGPoint)))
                        {
                            CGPoint *rect = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef CGPoint (* _IMP_T)(id, SEL, CGPoint);
                            lua_pushCGPoint(L,  ((_IMP_T)impRef)(obj, selector, *rect) );
                            
                        }else if (!strcmp(argType, @encode(CGSize)))
                        {
                            CGSize *rect = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef CGPoint (* _IMP_T)(id, SEL, CGSize);
                            lua_pushCGPoint(L,  ((_IMP_T)impRef)(obj, selector, *rect) );
                            
                        }else if (!strcmp(returnType, @encode(NSRange)))
                        {
                            NSRange *r = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef CGPoint (* _IMP_T)(id, SEL, NSRange);
                            lua_pushCGPoint(L, ((_IMP_T)impRef)(obj, selector, *r));
                            
                        }else if (!strcmp(returnType, @encode(CATransform3D)))
                        {
                            CATransform3D *t = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef CGPoint (* _IMP_T)(id, SEL, CATransform3D);
                            lua_pushCGPoint(L, ((_IMP_T)impRef)(obj, selector, *t));
                            
                        }else if (!strcmp(returnType, @encode(CGAffineTransform)))
                        {
                            CGAffineTransform *t = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef CGPoint (* _IMP_T)(id, SEL, CGAffineTransform);
                            lua_pushCGPoint(L, ((_IMP_T)impRef)(obj, selector, *t));
                        }
                        return 1;
                    }
                    case '^':
                    case '[':
                    {
                        typedef CGPoint (* _IMP_T)(id, SEL, void*);
                        lua_pushCGPoint(L,  ((_IMP_T)impRef)(obj, selector, lua_touserdata(L, LuaObjCArgumentStart)) );
                        return 1;
                    }
                    default:
                    {
                        return 0;
                    }
                }
                
            }else if (!strcmp(returnType, @encode(CGSize)))
            {
                argType = _luaObjCInternal_jumpoverEncodingDecorator(argType);

                switch (*argType)
                {
                    case 'c':
                    case 'i':
                    case 's':
                    case 'l':
                    case 'q':
                    case 'C':
                    case 'I':
                    case 'S':
                    case 'L':
                    case 'Q':
                    case 'B':
                    {
                        typedef CGSize (* _IMP_T)(id, SEL, NSInteger);
                        lua_pushCGSize(L, ((_IMP_T)impRef)(obj, selector, luaObjC_checkInteger(L, LuaObjCArgumentStart)));
                        return 1;
                    }
                    case 'f':
                    case 'd':
                    {
                        typedef CGSize (* _IMP_T)(id, SEL, CGFloat);
                        lua_pushCGSize(L,  ((_IMP_T)impRef)(obj, selector, lua_tonumber(L, LuaObjCArgumentStart)));
                        return 1;
                    }
                    case '*':
                    {
                        typedef CGSize (* _IMP_T)(id, SEL, const char*);
                        lua_pushCGSize(L,  ((_IMP_T)impRef)(obj, selector, lua_tostring(L, LuaObjCArgumentStart)));
                        return 1;
                    }
                    case '#':
                    case '@':
                    {
                        typedef CGSize (* _IMP_T)(id, SEL, id);
                        lua_pushCGSize(L,  ((_IMP_T)impRef)(obj, selector, luaObjC_checkNSObject(L, LuaObjCArgumentStart)));
                        return 1;
                    }
                    case ':':
                    {
                        typedef CGSize (* _IMP_T)(id, SEL, SEL);
                        SEL sel = NSSelectorFromString([NSString stringWithCString: luaObjC_checkString(L, LuaObjCArgumentStart)
                                                                          encoding: NSUTF8StringEncoding]);
                        lua_pushCGSize(L,  ((_IMP_T)impRef)(obj, selector, sel));
                        return 1;
                    }
                    case '{':
                    {
                        if (!strcmp(argType, @encode(CGRect)))
                        {
                            CGRect *rect = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef CGSize (* _IMP_T)(id, SEL, CGRect);
                            lua_pushCGSize(L,  ((_IMP_T)impRef)(obj, selector, *rect) );
                            
                        }else if (!strcmp(argType, @encode(CGPoint)))
                        {
                            CGPoint *rect = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef CGSize (* _IMP_T)(id, SEL, CGPoint);
                            lua_pushCGSize(L,  ((_IMP_T)impRef)(obj, selector, *rect) );
                            
                        }else if (!strcmp(argType, @encode(CGSize)))
                        {
                            CGSize *rect = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef CGSize (* _IMP_T)(id, SEL, CGSize);
                            lua_pushCGSize(L,  ((_IMP_T)impRef)(obj, selector, *rect) );
                            
                        }else if (!strcmp(returnType, @encode(NSRange)))
                        {
                            NSRange *r = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef CGSize (* _IMP_T)(id, SEL, NSRange);
                            lua_pushCGSize(L, ((_IMP_T)impRef)(obj, selector, *r));
                            
                        }else if (!strcmp(returnType, @encode(CATransform3D)))
                        {
                            CATransform3D *t = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef CGSize (* _IMP_T)(id, SEL, CATransform3D);
                            lua_pushCGSize(L, ((_IMP_T)impRef)(obj, selector, *t));
                            
                        }else if (!strcmp(returnType, @encode(CGAffineTransform)))
                        {
                            CGAffineTransform *t = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef CGSize (* _IMP_T)(id, SEL, CGAffineTransform);
                            lua_pushCGSize(L, ((_IMP_T)impRef)(obj, selector, *t));
                        }
                        return 1;
                    }
                    case '^':
                    case '[':
                    {
                        typedef CGSize (* _IMP_T)(id, SEL, void*);
                        lua_pushCGSize(L,  ((_IMP_T)impRef)(obj, selector, lua_touserdata(L, LuaObjCArgumentStart)) );
                        return 1;
                    }
                    default:
                    {
                        return 0;
                    }
                }
            }
            else if (!strcmp(returnType, @encode(NSRange)))
            {
                argType = _luaObjCInternal_jumpoverEncodingDecorator(argType);
                
                switch (*argType)
                {
                    case 'c':
                    case 'i':
                    case 's':
                    case 'l':
                    case 'q':
                    case 'C':
                    case 'I':
                    case 'S':
                    case 'L':
                    case 'Q':
                    case 'B':
                    {
                        typedef NSRange (* _IMP_T)(id, SEL, NSInteger);
                        lua_pushNSRange(L, ((_IMP_T)impRef)(obj, selector, luaObjC_checkInteger(L, LuaObjCArgumentStart)));
                        return 1;
                    }
                    case 'f':
                    case 'd':
                    {
                        typedef NSRange (* _IMP_T)(id, SEL, CGFloat);
                        lua_pushNSRange(L,  ((_IMP_T)impRef)(obj, selector, lua_tonumber(L, LuaObjCArgumentStart)));
                        return 1;
                    }
                    case '*':
                    {
                        typedef NSRange (* _IMP_T)(id, SEL, const char*);
                        lua_pushNSRange(L,  ((_IMP_T)impRef)(obj, selector, lua_tostring(L, LuaObjCArgumentStart)));
                        return 1;
                    }
                    case '#':
                    case '@':
                    {
                        typedef NSRange (* _IMP_T)(id, SEL, id);
                        lua_pushNSRange(L,  ((_IMP_T)impRef)(obj, selector, luaObjC_checkNSObject(L, LuaObjCArgumentStart)));
                        return 1;
                    }
                    case ':':
                    {
                        typedef NSRange (* _IMP_T)(id, SEL, SEL);
                        SEL sel = NSSelectorFromString([NSString stringWithCString: luaObjC_checkString(L, LuaObjCArgumentStart)
                                                                          encoding: NSUTF8StringEncoding]);
                        lua_pushNSRange(L,  ((_IMP_T)impRef)(obj, selector, sel));
                        return 1;
                    }
                    case '{':
                    {
                        if (!strcmp(argType, @encode(CGRect)))
                        {
                            CGRect *rect = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef NSRange (* _IMP_T)(id, SEL, CGRect);
                            lua_pushNSRange(L,  ((_IMP_T)impRef)(obj, selector, *rect) );
                            
                        }else if (!strcmp(argType, @encode(CGPoint)))
                        {
                            CGPoint *rect = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef NSRange (* _IMP_T)(id, SEL, CGPoint);
                            lua_pushNSRange(L,  ((_IMP_T)impRef)(obj, selector, *rect) );
                            
                        }else if (!strcmp(argType, @encode(CGSize)))
                        {
                            CGSize *rect = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef NSRange (* _IMP_T)(id, SEL, CGSize);
                            lua_pushNSRange(L,  ((_IMP_T)impRef)(obj, selector, *rect) );
                            
                        }else if (!strcmp(returnType, @encode(NSRange)))
                        {
                            NSRange *r = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef NSRange (* _IMP_T)(id, SEL, NSRange);
                            lua_pushNSRange(L, ((_IMP_T)impRef)(obj, selector, *r));
                            
                        }else if (!strcmp(returnType, @encode(CATransform3D)))
                        {
                            CATransform3D *t = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef NSRange (* _IMP_T)(id, SEL, CATransform3D);
                            lua_pushNSRange(L, ((_IMP_T)impRef)(obj, selector, *t));
                            
                        }else if (!strcmp(returnType, @encode(CGAffineTransform)))
                        {
                            CGAffineTransform *t = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef NSRange (* _IMP_T)(id, SEL, CGAffineTransform);
                            lua_pushNSRange(L, ((_IMP_T)impRef)(obj, selector, *t));
                        }
                        return 1;
                    }
                    case '^':
                    case '[':
                    {
                        typedef NSRange (* _IMP_T)(id, SEL, void*);
                        lua_pushNSRange(L,  ((_IMP_T)impRef)(obj, selector, lua_touserdata(L, LuaObjCArgumentStart)) );
                        return 1;
                    }
                    default:
                    {
                        return 0;
                    }
                }
            }else if (!strcmp(returnType, @encode(CATransform3D)))
            {
                argType = _luaObjCInternal_jumpoverEncodingDecorator(argType);
                
                switch (*argType)
                {
                    case 'c':
                    case 'i':
                    case 's':
                    case 'l':
                    case 'q':
                    case 'C':
                    case 'I':
                    case 'S':
                    case 'L':
                    case 'Q':
                    case 'B':
                    {
                        typedef CATransform3D (* _IMP_T)(id, SEL, NSInteger);
                        lua_pushCATransform3D(L, ((_IMP_T)impRef)(obj, selector, luaObjC_checkInteger(L, LuaObjCArgumentStart)));
                        return 1;
                    }
                    case 'f':
                    case 'd':
                    {
                        typedef CATransform3D (* _IMP_T)(id, SEL, CGFloat);
                        lua_pushCATransform3D(L,  ((_IMP_T)impRef)(obj, selector, lua_tonumber(L, LuaObjCArgumentStart)));
                        return 1;
                    }
                    case '*':
                    {
                        typedef CATransform3D (* _IMP_T)(id, SEL, const char*);
                        lua_pushCATransform3D(L,  ((_IMP_T)impRef)(obj, selector, lua_tostring(L, LuaObjCArgumentStart)));
                        return 1;
                    }
                    case '#':
                    case '@':
                    {
                        typedef CATransform3D (* _IMP_T)(id, SEL, id);
                        lua_pushCATransform3D(L,  ((_IMP_T)impRef)(obj, selector, luaObjC_checkNSObject(L, LuaObjCArgumentStart)));
                        return 1;
                    }
                    case ':':
                    {
                        typedef CATransform3D (* _IMP_T)(id, SEL, SEL);
                        SEL sel = NSSelectorFromString([NSString stringWithCString: luaObjC_checkString(L, LuaObjCArgumentStart)
                                                                          encoding: NSUTF8StringEncoding]);
                        lua_pushCATransform3D(L,  ((_IMP_T)impRef)(obj, selector, sel));
                        return 1;
                    }
                    case '{':
                    {
                        if (!strcmp(argType, @encode(CGRect)))
                        {
                            CGRect *rect = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef CATransform3D (* _IMP_T)(id, SEL, CGRect);
                            lua_pushCATransform3D(L,  ((_IMP_T)impRef)(obj, selector, *rect) );
                            
                        }else if (!strcmp(argType, @encode(CGPoint)))
                        {
                            CGPoint *rect = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef CATransform3D (* _IMP_T)(id, SEL, CGPoint);
                            lua_pushCATransform3D(L,  ((_IMP_T)impRef)(obj, selector, *rect) );
                            
                        }else if (!strcmp(argType, @encode(CGSize)))
                        {
                            CGSize *rect = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef CATransform3D (* _IMP_T)(id, SEL, CGSize);
                            lua_pushCATransform3D(L,  ((_IMP_T)impRef)(obj, selector, *rect) );
                            
                        }else if (!strcmp(returnType, @encode(NSRange)))
                        {
                            NSRange *r = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef CATransform3D (* _IMP_T)(id, SEL, NSRange);
                            lua_pushCATransform3D(L, ((_IMP_T)impRef)(obj, selector, *r));
                            
                        }else if (!strcmp(returnType, @encode(CATransform3D)))
                        {
                            CATransform3D *t = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef CATransform3D (* _IMP_T)(id, SEL, CATransform3D);
                            lua_pushCATransform3D(L, ((_IMP_T)impRef)(obj, selector, *t));
                            
                        }else if (!strcmp(returnType, @encode(CGAffineTransform)))
                        {
                            CGAffineTransform *t = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef CATransform3D (* _IMP_T)(id, SEL, CGAffineTransform);
                            lua_pushCATransform3D(L, ((_IMP_T)impRef)(obj, selector, *t));
                        }
                        return 1;
                    }
                    case '^':
                    case '[':
                    {
                        typedef CATransform3D (* _IMP_T)(id, SEL, void*);
                        lua_pushCATransform3D(L,  ((_IMP_T)impRef)(obj, selector, lua_touserdata(L, LuaObjCArgumentStart)) );
                        return 1;
                    }
                    default:
                    {
                        return 0;
                    }
                }
            }else if (!strcmp(returnType, @encode(CGAffineTransform)))
            {
                argType = _luaObjCInternal_jumpoverEncodingDecorator(argType);
                
                switch (*argType)
                {
                    case 'c':
                    case 'i':
                    case 's':
                    case 'l':
                    case 'q':
                    case 'C':
                    case 'I':
                    case 'S':
                    case 'L':
                    case 'Q':
                    case 'B':
                    {
                        typedef CGAffineTransform (* _IMP_T)(id, SEL, NSInteger);
                        lua_pushCGAffineTransform(L, ((_IMP_T)impRef)(obj, selector, luaObjC_checkInteger(L, LuaObjCArgumentStart)));
                        return 1;
                    }
                    case 'f':
                    case 'd':
                    {
                        typedef CGAffineTransform (* _IMP_T)(id, SEL, CGFloat);
                        lua_pushCGAffineTransform(L,  ((_IMP_T)impRef)(obj, selector, lua_tonumber(L, LuaObjCArgumentStart)));
                        return 1;
                    }
                    case '*':
                    {
                        typedef CGAffineTransform (* _IMP_T)(id, SEL, const char*);
                        lua_pushCGAffineTransform(L,  ((_IMP_T)impRef)(obj, selector, lua_tostring(L, LuaObjCArgumentStart)));
                        return 1;
                    }
                    case '#':
                    case '@':
                    {
                        typedef CGAffineTransform (* _IMP_T)(id, SEL, id);
                        lua_pushCGAffineTransform(L,  ((_IMP_T)impRef)(obj, selector, luaObjC_checkNSObject(L, LuaObjCArgumentStart)));
                        return 1;
                    }
                    case ':':
                    {
                        typedef CGAffineTransform (* _IMP_T)(id, SEL, SEL);
                        SEL sel = NSSelectorFromString([NSString stringWithCString: luaObjC_checkString(L, LuaObjCArgumentStart)
                                                                          encoding: NSUTF8StringEncoding]);
                        lua_pushCGAffineTransform(L,  ((_IMP_T)impRef)(obj, selector, sel));
                        return 1;
                    }
                    case '{':
                    {
                        if (!strcmp(argType, @encode(CGRect)))
                        {
                            CGRect *rect = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef CGAffineTransform (* _IMP_T)(id, SEL, CGRect);
                            lua_pushCGAffineTransform(L,  ((_IMP_T)impRef)(obj, selector, *rect) );
                            
                        }else if (!strcmp(argType, @encode(CGPoint)))
                        {
                            CGPoint *rect = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef CGAffineTransform (* _IMP_T)(id, SEL, CGPoint);
                            lua_pushCGAffineTransform(L,  ((_IMP_T)impRef)(obj, selector, *rect) );
                            
                        }else if (!strcmp(argType, @encode(CGSize)))
                        {
                            CGSize *rect = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef CGAffineTransform (* _IMP_T)(id, SEL, CGSize);
                            lua_pushCGAffineTransform(L,  ((_IMP_T)impRef)(obj, selector, *rect) );
                            
                        }else if (!strcmp(returnType, @encode(NSRange)))
                        {
                            NSRange *r = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef CGAffineTransform (* _IMP_T)(id, SEL, NSRange);
                            lua_pushCGAffineTransform(L, ((_IMP_T)impRef)(obj, selector, *r));
                            
                        }else if (!strcmp(returnType, @encode(CATransform3D)))
                        {
                            CATransform3D *t = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef CGAffineTransform (* _IMP_T)(id, SEL, CATransform3D);
                            lua_pushCGAffineTransform(L, ((_IMP_T)impRef)(obj, selector, *t));
                            
                        }else if (!strcmp(returnType, @encode(CGAffineTransform)))
                        {
                            CGAffineTransform *t = lua_touserdata(L, LuaObjCArgumentStart);
                            typedef CGAffineTransform (* _IMP_T)(id, SEL, CGAffineTransform);
                            lua_pushCGAffineTransform(L, ((_IMP_T)impRef)(obj, selector, *t));
                        }
                        return 1;
                    }
                    case '^':
                    case '[':
                    {
                        typedef CGAffineTransform (* _IMP_T)(id, SEL, void*);
                        lua_pushCGAffineTransform(L,  ((_IMP_T)impRef)(obj, selector, lua_touserdata(L, LuaObjCArgumentStart)) );
                        return 1;
                    }
                    default:
                    {
                        return 0;
                    }
                }
            }
            return 1;
        }
        case '^':
        case '[':
        {
            argType = _luaObjCInternal_jumpoverEncodingDecorator(argType);

            switch (*argType)
            {
                case 'c':
                case 'i':
                case 's':
                case 'l':
                case 'q':
                case 'C':
                case 'I':
                case 'S':
                case 'L':
                case 'Q':
                case 'B':
                {
                    typedef void* (* _IMP_T)(id, SEL, NSInteger);
                    lua_pushlightuserdata(L, ((_IMP_T)impRef)(obj, selector, luaObjC_checkInteger(L, LuaObjCArgumentStart)));
                    return 1;
                }
                case 'f':
                case 'd':
                {
                    typedef void* (* _IMP_T)(id, SEL, CGFloat);
                    lua_pushlightuserdata(L, ((_IMP_T)impRef)(obj, selector, lua_tonumber(L, LuaObjCArgumentStart)));
                    return 1;
                }
                case '*':
                {
                    typedef void* (* _IMP_T)(id, SEL, const char*);
                    lua_pushlightuserdata(L, ((_IMP_T)impRef)(obj, selector, lua_tostring(L, LuaObjCArgumentStart)));
                    return 1;
                }
                case '#':
                case '@':
                {
                    typedef void* (* _IMP_T)(id, SEL, id);
                    lua_pushlightuserdata(L, ((_IMP_T)impRef)(obj, selector, luaObjC_checkNSObject(L, LuaObjCArgumentStart)));
                    return 1;
                }
                case ':':
                {
                    typedef void* (* _IMP_T)(id, SEL, SEL);
                    SEL sel = NSSelectorFromString([NSString stringWithCString: luaObjC_checkString(L, LuaObjCArgumentStart)
                                                                      encoding: NSUTF8StringEncoding]);
                    lua_pushlightuserdata(L, ((_IMP_T)impRef)(obj, selector, sel));
                    return 1;
                }
                case '{':
                {
                    if (!strcmp(argType, @encode(CGRect)))
                    {
                        CGRect *rect = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef void* (* _IMP_T)(id, SEL, CGRect);
                        lua_pushlightuserdata(L, ((_IMP_T)impRef)(obj, selector, *rect) );
                        
                    }else if (!strcmp(argType, @encode(CGPoint)))
                    {
                        CGPoint *rect = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef void* (* _IMP_T)(id, SEL, CGPoint);
                        lua_pushlightuserdata(L, ((_IMP_T)impRef)(obj, selector, *rect));
                        
                    }else if (!strcmp(argType, @encode(CGSize)))
                    {
                        CGSize *rect = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef void* (* _IMP_T)(id, SEL, CGSize);
                        lua_pushlightuserdata(L, ((_IMP_T)impRef)(obj, selector, *rect));
                    }else if (!strcmp(returnType, @encode(NSRange)))
                    {
                        NSRange *r = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef void* (* _IMP_T)(id, SEL, NSRange);
                        lua_pushlightuserdata(L, ((_IMP_T)impRef)(obj, selector, *r));
                        
                    }else if (!strcmp(returnType, @encode(CATransform3D)))
                    {
                        CATransform3D *t = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef void * (* _IMP_T)(id, SEL, CATransform3D);
                        lua_pushlightuserdata(L, ((_IMP_T)impRef)(obj, selector, *t));
                        
                    }else if (!strcmp(returnType, @encode(CGAffineTransform)))
                    {
                        CGAffineTransform *t = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef void * (* _IMP_T)(id, SEL, CGAffineTransform);
                        lua_pushlightuserdata(L, ((_IMP_T)impRef)(obj, selector, *t));
                    }
                    return 1;
                }
                case '^':
                case '[':
                {
                    typedef void* (* _IMP_T)(id, SEL, void*);
                    lua_pushlightuserdata(L, ((_IMP_T)impRef)(obj, selector, lua_touserdata(L, LuaObjCArgumentStart)));
                    return 1;
                }
                default:
                {
                    return 0;
                }
            }
        }
        case 'v':
        {
            argType = _luaObjCInternal_jumpoverEncodingDecorator(argType);

            switch (*argType)
            {
                case 'c':
                case 'i':
                case 's':
                case 'l':
                case 'q':
                case 'C':
                case 'I':
                case 'S':
                case 'L':
                case 'Q':
                case 'B':
                {
                    typedef void (* _IMP_T)(id, SEL, NSInteger);
                    ((_IMP_T)impRef)(obj, selector, luaObjC_checkInteger(L, LuaObjCArgumentStart));
                    return 0;
                }
                case 'f':
                case 'd':
                {
                    typedef void (* _IMP_T)(id, SEL, float);
                    float doubleArg = lua_tonumber(L, LuaObjCArgumentStart);
                    ((_IMP_T)impRef)(obj, selector, doubleArg);
                    return 0;
                }
                case '*':
                {
                    typedef void (* _IMP_T)(id, SEL, const char*);
                    ((_IMP_T)impRef)(obj, selector, lua_tostring(L, LuaObjCArgumentStart));
                    return 0;
                }
                case '#':
                case '@':
                {
                    typedef void (* _IMP_T)(id, SEL, id);
                    id objArg = luaObjC_checkNSObject(L, LuaObjCArgumentStart);
                    ((_IMP_T)impRef)(obj, selector, objArg);
                    return 0;
                }
                case ':':
                {
                    typedef void (* _IMP_T)(id, SEL, SEL);
                    SEL sel = NSSelectorFromString([NSString stringWithCString: luaObjC_checkString(L, LuaObjCArgumentStart)
                                                                      encoding: NSUTF8StringEncoding]);
                    ((_IMP_T)impRef)(obj, selector, sel);
                    return 0;
                }
                case '{':
                {
                    if (!strcmp(argType, @encode(CGRect)))
                    {
                        CGRect *rect = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef void (* _IMP_T)(id, SEL, CGRect);
                        objc_msgSend(obj, selector, *rect);
                        
                    }else if (!strcmp(argType, @encode(CGPoint)))
                    {
                        CGPoint *rect = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef void (* _IMP_T)(id, SEL, CGPoint);
                        ((_IMP_T)impRef)(obj, selector, *rect);
                        
                    }else if (!strcmp(argType, @encode(CGSize)))
                    {
                        CGSize *rect = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef void (* _IMP_T)(id, SEL, CGSize);
                        ((_IMP_T)impRef)(obj, selector, *rect);
                    }else if (!strcmp(returnType, @encode(NSRange)))
                    {
                        NSRange *r = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef void (* _IMP_T)(id, SEL, NSRange);
                        ((_IMP_T)impRef)(obj, selector, *r);
                        
                    }else if (!strcmp(returnType, @encode(CATransform3D)))
                    {
                        CATransform3D *t = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef void (* _IMP_T)(id, SEL, CATransform3D);
                        ((_IMP_T)impRef)(obj, selector, *t);
                        
                    }else if (!strcmp(returnType, @encode(CGAffineTransform)))
                    {
                        CGAffineTransform *t = lua_touserdata(L, LuaObjCArgumentStart);
                        typedef void (* _IMP_T)(id, SEL, CGAffineTransform);
                        ((_IMP_T)impRef)(obj, selector, *t);
                    }
                    return 0;
                }
                case '^':
                case '[':
                {
                    typedef void (* _IMP_T)(id, SEL, void*);
                    ((_IMP_T)impRef)(obj, selector, lua_touserdata(L, LuaObjCArgumentStart));
                    return 0;
                }
                default:
                {
                    return 0;
                }
                    
            }
        }
        default:
        {
            return 0;
        }
    }
}

#pragma mark - source

static NSMutableDictionary *__preAccelerators = nil;

void LuaObjCAcceleratorRegister(SEL selector, LuaObjCAcceleratorIMP imp)
{
    if (!__preAccelerators)
    {
        LuaObjCAcceleratorInitialize();
    }
    
    [__preAccelerators setObject: [NSValue valueWithPointer: imp]
                          forKey: NSStringFromSelector(selector)];
}

LuaObjCAcceleratorIMP LuaObjCAcceleratorGetIMPBySelector(SEL selector)
{
    return [[__preAccelerators objectForKey: NSStringFromSelector(selector)] pointerValue];
}

void LuaObjCAcceleratorInitialize(void)
{
    if (!__preAccelerators)
    {
        __preAccelerators = [[NSMutableDictionary alloc] init];       
    }
}
