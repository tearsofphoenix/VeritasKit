//
//  LuaObjCIMP.m
//  LuaIOS
//
//  Created by tearsofphoenix on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import "LuaObjCBlock.h"

#import "LuaObjCClass.h"

#import "LuaObjCInternal.h"

#import "LuaCGGeometry.h"

#import "LuaObjCAuxiliary.h"

#import "lauxlib.h"

#import "LuaObjCTypeEncoding.h"

#import <objc/runtime.h>

static void __luaClass_IMP_preprocess(lua_State **returnedLuaState, id obj, SEL sel, va_list ap)
{
    Class theClass = object_getClass(obj);
    bool isClassMethod = (theClass == obj);

    LuaClosureType clouserID = luaObjC_getClosureIDOfSelector(theClass, sel, isClassMethod);
    lua_State *luaState = luaObjC_getLuaStateOfClass(theClass);
    
    if (clouserID != LuaObjCInvalidClouserID)
    {
        //preprare arguments
        //
        if (returnedLuaState)
        {
            *returnedLuaState = luaState;
        }
        
        //lua_settop(luaState, 0);
        
        //push lua function into stack
        //
        lua_rawgeti(luaState, LUA_REGISTRYINDEX, clouserID);
        
        NSUInteger numberOfArgument = LuaObjCInternal_argumentCountOfSelector(sel);
        
        const char* methodTypeEncoding = method_getTypeEncoding(class_getInstanceMethod(theClass, sel));
        
        //jump over return type, id, SEL
        //
        const char* typeLooper = methodTypeEncoding + 1 + 1;
        
        
        //push 'self' argument first
        //
        luaObjC_pushNSObject(luaState, obj);
        
        //push '_cmd' argument next
        //
        luaObjC_pushSelector(luaState, sel);
        
        //push real arguments
        //
        for (NSUInteger iLooper = 0; iLooper < numberOfArgument; ++iLooper)
        {
            ++typeLooper;
            switch (*typeLooper)
            {
                case _C_CHR:
                case _C_INT:
                case _C_SHT:
                case _C_LNG:
                case _C_LNG_LNG:
                case _C_UCHR:
                case _C_UINT:
                case _C_USHT:
                case _C_ULNG:
                case _C_ULNG_LNG:
                case _C_BOOL:
                {
                    NSInteger integerPara = va_arg(ap, NSInteger);
                    lua_pushinteger(luaState, integerPara);
                    break;
                }
                case _C_FLT:
                case _C_DBL:
                {
                    CGFloat doublePara = (CGFloat)va_arg(ap, double);
                    lua_pushnumber(luaState, doublePara);
                    break;
                }
                case _C_CHARPTR:
                {
                    const char *str = va_arg(ap, const char*);
                    lua_pushstring(luaState, str);
                    break;
                }
                case _C_ID:
                {
                    id argLooper = va_arg(ap,  id);
                    luaObjC_pushNSObject(luaState, argLooper);
                    break;
                }
                case _C_SEL:
                {
                    SEL sel = va_arg(ap, SEL);
                    luaObjC_pushSelector(luaState, sel);
                    break;
                }
                case _C_STRUCT_B:
                {
                    if (!strncmp(typeLooper, @encode(CGRect), strlen(@encode(CGRect))))
                    {
                        lua_pushCGRect(luaState, va_arg(ap, CGRect));
                        
                    }else if (!strncmp(typeLooper, @encode(CGPoint), strlen(@encode(CGPoint))))
                    {
                        lua_pushCGPoint(luaState, va_arg(ap, CGPoint));
                        
                    }else if (!strncmp(typeLooper, @encode(CGSize), strlen(@encode(CGSize))))
                    {
                        lua_pushCGSize(luaState, va_arg(ap, CGSize));
                    }
                    break;
                }
                case _C_PTR:
                case _C_ARY_B:
                {
                    void *p = va_arg(ap, void*);
                    lua_pushlightuserdata(luaState, p);
                    break;
                }
                default:
                {
                    break;
                }
            }
        }
        
        //why +1 +1 ? we have an implicit 'self' argument and '_cmd' arguemnt for method
        //
        int status = lua_pcall(luaState, (int)numberOfArgument + 1 + 1, 1, 0);
        if (status != LUA_OK)
        {
            luaObjC_throwExceptionIfError(luaState);
        }
        
        return ;
    }
    /*if is property*/
    IMP imp = class_getMethodImplementation(theClass, sel);
    if (imp)
    {
        luaObjC_pushNSObject(luaState, imp(obj, sel, luaObjC_checkNSObject(luaState, 1)));
        
    }else
    {
        NSLog(@"call stack:%@", [NSThread callStackSymbols]);
        [obj doesNotRecognizeSelector: sel];
    }
}

#define __LuaClassPreprocess(obj, sel, state)     va_list ap;\
                                                  va_start(ap, sel);\
                                                  lua_State *state = NULL;\
                                                  __luaClass_IMP_preprocess(&state, obj, sel, ap);\
                                                  va_end(ap);

static NSInteger __luaClass_IMP_integer_return(id obj, SEL sel, ...)
{
    __LuaClassPreprocess(obj, sel, L);
    
    NSInteger ret = 0;
    int returnIndexOfLuaFunction = -1;
    switch (lua_type(L, returnIndexOfLuaFunction))
    {
        case LUA_TNUMBER:
        {
            ret = lua_tonumber(L, returnIndexOfLuaFunction);
            break;
        }
        case LUA_TBOOLEAN:
        {
            ret = lua_toboolean(L, returnIndexOfLuaFunction);
            break;
        }
        default:
        {
            //TODO
            //bad-cast here, so should throw an error
            //
            break;
        }
    }
    return ret;
    
}

static CGFloat __luaClass_IMP_float_return(id obj, SEL sel, ...)
{
    __LuaClassPreprocess(obj, sel, L);
    
    return lua_tonumber(L, -1);
}

static void __luaClass_IMP_struct_return(id obj, SEL sel, ...)
{
    __LuaClassPreprocess(obj, sel, L);
    
    //store struct type as userdata type
    //
    //void *returnData = lua_touserdata(L, -1);
    
    Class objClass = object_getClass(obj);
    Method method = NULL;
    
    if (objClass == obj)
    {
        method = class_getClassMethod(objClass, sel);
        
    }else
    {
        method = class_getInstanceMethod(objClass, sel);
    }
    
    char* returnType = method_copyReturnType(method);
    
    NSUInteger size;
    NSGetSizeAndAlignment(returnType, &size, NULL);
    
    //free(returnType);
        
    //return returnData;
    lua_pushvalue(L, -1);
}

static id __luaClass_IMP_gerneral(id obj, SEL sel, ...)
{
    __LuaClassPreprocess(obj, sel, L);
    
    return luaObjC_checkNSObject(L, -1);
}

#undef __LuaClassPreprocess

static int luaObjC_class_addMethod(lua_State *L, BOOL isObjectMethod)
{
    int argCount = lua_gettop(L);

    const char * className = lua_tostring(L, 1);
    const char* selectorName = luaObjC_checkString(L, 2);

    NSMutableString *typeEncoding = [[NSMutableString alloc] init];
    
    //printf("add method: %s\n", selectorName);
    //return type
    //
    const char* typeLooper = luaObjC_checkString(L, 3);
    const char* returnType = LuaObjCTypeEncodingOfType(typeLooper);
    
    [typeEncoding appendFormat: @"%s", LuaObjCTypeEncodingOfType(typeLooper)];
    
    //id && selector
    //
    [typeEncoding appendString: @"@:"];
    
    for (int iLooper = 4; iLooper < argCount; ++iLooper)
    {
        typeLooper = luaObjC_checkString(L, iLooper);
        
        [typeEncoding appendFormat: @"%s", LuaObjCTypeEncodingOfType(typeLooper)];
    }
    
    
    SEL sel = sel_registerName(selectorName);

    Class theClass = luaObjC_getClass(className);
    Class classToAddClosure = theClass;
    
    if (!isObjectMethod)
    {
        theClass = objc_getMetaClass(className);
    }
        
    const char* typeEncodingCString = [typeEncoding UTF8String];
    
    IMP imp = NULL;
    
    switch (*returnType)
    {
        case _C_CHR:
        case _C_INT:
        case _C_SHT:
        case _C_LNG:
        case _C_LNG_LNG:
        case _C_UCHR:
        case _C_UINT:
        case _C_USHT:
        case _C_ULNG:
        case _C_ULNG_LNG:
        case _C_BOOL:
        {
            imp = (IMP)__luaClass_IMP_integer_return;
            break;
        }
        case _C_FLT:
        case _C_DBL:
        {
            imp = (IMP)__luaClass_IMP_float_return;
            break;
        }
        case _C_STRUCT_B:
        {
            imp = (IMP)__luaClass_IMP_struct_return;
            break;
        }
        default:
        {
            imp = __luaClass_IMP_gerneral;
            break;
        }
            
    }
    
    if(!class_addMethod(theClass, sel, imp, typeEncodingCString))
    {
        Method existsMethod = NULL;
        if (!isObjectMethod)
        {
            existsMethod = class_getClassMethod(theClass, sel);
            
        }else
        {
            existsMethod = class_getInstanceMethod(theClass, sel);
        }

        if (existsMethod)
        {
            method_setImplementation(existsMethod, imp);
            
        }else
        {
            printf("Fail to class:%s registered method:%s typeencoding:%s return type:%s\n", className, (const char*)sel, typeEncodingCString, returnType);
        }
    }

    luaObjC_addClosureIDForSelector(classToAddClosure, luaL_ref(L, LUA_REGISTRYINDEX), selectorName, !isObjectMethod);
    
    [typeEncoding release];
    
    return 0;
}


int LuaIMPAddInstanceMethod(lua_State *L)
{
    return luaObjC_class_addMethod(L, YES);
}

int LuaIMPAddClassMethod(lua_State *L)
{
    return luaObjC_class_addMethod(L, NO);
}
