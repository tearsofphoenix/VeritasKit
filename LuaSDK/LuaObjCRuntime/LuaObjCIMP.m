//
//  LuaObjCIMP.m
//  LuaIOS
//
//  Created by tearsofphoenix on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaObjCIMP.h"

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
    Class theClass = [obj class];
    
    LuaClosureType clouserID = LuaClassGetClosureIDOfSelector(theClass, sel);
    lua_State *luaState = LuaClassGetLuaState(theClass);
    
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
        
        const char* methodTypeEncoding = method_getTypeEncoding(class_getInstanceMethod([obj class], sel));
        
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

#define __LuaClassPreprocess(obj, sel)     va_list ap;\
                                           va_start(ap, sel);\
                                           lua_State *L;\
                                           __luaClass_IMP_preprocess(&L, obj, sel, ap);\
                                           va_end(ap);

static NSInteger __luaClass_IMP_integer_return(id obj, SEL sel, ...)
{
    __LuaClassPreprocess(obj, sel);
    
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
    __LuaClassPreprocess(obj, sel);
    
    return lua_tonumber(L, -1);
}

static void __luaClass_IMP_struct_return(id obj, SEL sel, ...)
{
    __LuaClassPreprocess(obj, sel);
    
    //store struct type as userdata type
    //
    //void *returnData = lua_touserdata(L, -1);
    
    Class objClass = [obj class];
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
    __LuaClassPreprocess(obj, sel);
    
    return luaObjC_checkNSObject(L, -1);
}

#undef __LuaClassPreprocess

static int luaObjC_class_addMethod(lua_State *L, BOOL isObjectMethod)
{
    int argCount = lua_gettop(L);

    NSString * className = [NSString stringWithUTF8String: lua_tostring(L, 1)];
    const char* selectorName = luaObjC_checkString(L, 2);

    NSMutableString *typeEncoding = [[NSMutableString alloc] init];
    
    //printf("add method: %s\n", selectorName);
    //return type
    //
    const char* typeLooper = luaObjC_checkString(L, 3);
    const char* returnType = [LuaObjCTypeEncodingOfType(typeLooper) UTF8String];
    
    [typeEncoding appendString: LuaObjCTypeEncodingOfType(typeLooper)];
    
    //id && selector
    //
    [typeEncoding appendString: @"@:"];
    
    for (int iLooper = 4; iLooper < argCount; ++iLooper)
    {
        typeLooper = luaObjC_checkString(L, iLooper);
        
        [typeEncoding appendString: LuaObjCTypeEncodingOfType(typeLooper)];
    }
    
    
    SEL sel = sel_registerName(selectorName);

    Class theClass = LuaClassGetRegisteredClassByName(className);

    if (!isObjectMethod)
    {
        theClass = objc_getMetaClass(class_getName(theClass));
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
        printf("Fail to class:%s registered method:%s typeencoding:%s return type:%s\n", [className UTF8String], (const char*)sel, typeEncodingCString, returnType);
    }

    LuaClassAddClosureIDForSelector(theClass, luaL_ref(L, LUA_REGISTRYINDEX), selectorName);
    
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
