//
//  LuaObjCInternal.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaObjCInternal.h"

#import "LuaObjCClass.h"

#import "LuaObjCAuxiliary.h"
#import "lstate.h"
#import "lauxlib.h"
#import <objc/runtime.h>

static void luaObjC_loadClassList(lua_State *L, const char* classList[])
{
    if (classList)
    {

        NSUInteger iLooper = 0;
        const char* classNameLooper = classList[iLooper];
        Class classLooper = objc_getClass(classNameLooper);
        while (classNameLooper)
        {
            if (classLooper)
            {
                luaObjC_pushNSObject(L, classLooper);
                lua_setglobal(L, classNameLooper);
            }
            ++iLooper;
            classNameLooper = classList[iLooper];
            classLooper = objc_getClass(classNameLooper);
        }
    }
}

int luaObjC_preloadGlobalFunctions(lua_State *L, const luaL_Reg functions[], NSUInteger count)
{
    NSUInteger iLooper = 0;
    luaL_Reg reg;
    for (iLooper = 0; iLooper < count; ++iLooper) 
    {
        reg = functions[iLooper];
        if (reg.func && reg.name)
        {
            lua_pushcfunction(L, reg.func);
            lua_setglobal(L, reg.name);
        }
    }
    
    return 0;
}


void luaObjC_throwExceptionIfError(lua_State *L)
{
    const char *msg = lua_tostring(L, -1);
    NSString *errorReason = nil;
    if (msg)
    {
        errorReason = [NSString stringWithUTF8String: msg];
    }
    NSException *exception = [NSException exceptionWithName: @"#LuaError#"
                                                     reason: errorReason
                                                   userInfo: [NSDictionary dictionaryWithObjectsAndKeys: [NSValue valueWithPointer: L], @"LuaState", nil]
                              ];
    @throw exception; 
}


void objc_dumpClass(Class theClass)
{
    if (theClass)
    {
        printf("class:%s\n", class_getName(theClass));
        
        unsigned int classIvarCount = 0;
        Ivar *classIvarList = class_copyIvarList(theClass, &classIvarCount);
        printf("\tIvars:\n");
        for (int i=0; i<classIvarCount; ++i)
        {
            printf("\t\tname:%s encoding:%s\n", ivar_getName(classIvarList[i]), ivar_getTypeEncoding(classIvarList[i]));
        }
        
        free(classIvarList);
        
        unsigned int classMethodCount = 0;
        Method *methodList = class_copyMethodList(theClass, &classMethodCount);
        printf("\tMethods:\n");
        for (int i=0; i<classMethodCount; ++i)
        {
            printf("\t\tname:%s encoding:%s\n", (const char*)method_getName(methodList[i]), method_getTypeEncoding(methodList[i]));
        }
        free(methodList);
        
        unsigned int classPropertyCount = 0;
        objc_property_t *properties = class_copyPropertyList(theClass, &classPropertyCount);
        printf("\tProperties:\n");
        for (int i=0; i<classPropertyCount; ++i)
        {
            printf("\t\tname:%s attributes:%s\n", property_getName(properties[i]), property_getAttributes(properties[i]));
        }
        free(properties);
    }
}

void stackDump (lua_State *L) 
{
    int i=lua_gettop(L);
    printf(" ----------------  Stack Dump ----------------\n" );
    
    int t = 0;
    BOOL stop = NO;
    do
    {
        t = lua_type(L, i);
        switch (t) 
        {
            case LUA_TSTRING:
            {
                printf("%d:`%s'\n", i, lua_tostring(L, i));
                break;
            }
            case LUA_TBOOLEAN:
            {
                printf("%d: %s\n",i,lua_toboolean(L, i) ? "true" : "false");
                break;
            }
            case LUA_TNUMBER:
            {
                printf("%d: %g\n",  i, lua_tonumber(L, i));
                break;
            }
            case LUA_TNIL:
            {
                printf("%d: nil\n",  i);
                stop = YES;
                break;
            }
            default:
            {
                printf("%d: %s\n", i, lua_typename(L, t)); 
                break;
            }
        }
        --i;
    } while(i >= -20 && !stop);
    
    
    printf("--------------- Stack Dump Finished ---------------\n" );
}

const char* _luaObjCInternal_jumpoverEncodingDecorator(const char* charLooper)
{
    if (charLooper)
    {
        switch (*charLooper)
        {
            case 'r': //const
            case 'n': //in
            case 'N': //inout
            case 'o': //out
            case 'O': //bycopy
            case 'R': //byref
            case 'V': //oneway
            {
                return ++charLooper;
            }   
            default:
            {
                return charLooper;
            }
        } 
    }
    return charLooper;
}