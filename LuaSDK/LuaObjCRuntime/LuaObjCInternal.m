//
//  LuaObjCInternal.m
//  LuaIOS
//
//  Created by tearsofphoenix on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaObjCInternal.h"

#import "LuaObjCClass.h"

#import "LuaObjCAuxiliary.h"
#import "lauxlib.h"
#import "LuaBridgeSupport.h"
#import <objc/runtime.h>

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
    int nargs = lua_gettop(L);
    printf(" ----------------  Stack Dump ----------------\n" );
    
    int t = 0;

    for (int i = 1; i < nargs + 1; ++i)
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
                printf("%d: %s\n", i, lua_toboolean(L, i) ? "true" : "false");
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
                break;
            }
            default:
            {
                printf("%d: %s\n", i, lua_typename(L, t)); 
                break;
            }
        }
    }
    
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

static const char *_luaObjCInternal_jumpOverToChar(const char *charLooper, char targetChar)
{
    if (charLooper)
    {
        while (*charLooper != targetChar)
        {
            ++charLooper;
        }
        
        //jumpover the '=' char
        //
        if (*charLooper)
        {
            ++charLooper;
        }
        return charLooper;
    }
    return NULL;
}


size_t _luaObjCInternal_sizeOfStructWithEncoding(const char *encoding)
{
    if (!encoding)
    {
        return 0;
    }
    const char *charLooper = encoding;
    
    size_t structFieldSizes[1024];
    int fieldLooper = 0;
    //jumpover the name of the struct
    //
    charLooper = _luaObjCInternal_jumpOverToChar(charLooper, '=');
    
    while (*charLooper) 
    {
       switch (*charLooper)
        {
            case '\'':
            {
                charLooper = _luaObjCInternal_jumpOverToChar(charLooper, '\'');
                break;
            }
            case 'c':
            {
                structFieldSizes[fieldLooper] = sizeof(char);
                ++fieldLooper;
                ++charLooper;
                break;
            }
            case 'i':
            {
                structFieldSizes[fieldLooper] = sizeof(int);
                ++fieldLooper;
                ++charLooper;
                break;
            }
            case 's':
            {
                structFieldSizes[fieldLooper] = sizeof(short);
                ++fieldLooper;
                ++charLooper;
                break;
            }
            case 'l':
            {
                structFieldSizes[fieldLooper] = sizeof(long);
                ++fieldLooper;
                ++charLooper;
                break;
            }
            case 'q':
            {
                structFieldSizes[fieldLooper] = sizeof(long double);
                ++fieldLooper;
                ++charLooper;
                break;
            }
            case 'C':
            {
                structFieldSizes[fieldLooper] = sizeof(unsigned char);
                ++fieldLooper;
                ++charLooper;
                break;
            }
            case 'I':
            {
                structFieldSizes[fieldLooper] = sizeof(unsigned int);
                ++fieldLooper;
                ++charLooper;
                break;
            }
            case 'S':
            {
                structFieldSizes[fieldLooper] = sizeof(unsigned short);
                ++fieldLooper;
                ++charLooper;
                break;
            }
            case 'L':
            {
                structFieldSizes[fieldLooper] = sizeof(unsigned long);
                ++fieldLooper;
                ++charLooper;
                break;
            }
            case 'Q':
            {
                //Notice here, but this will be rarely used
                //
                structFieldSizes[fieldLooper] = sizeof(long double);
                ++fieldLooper;
                ++charLooper;
                break;
            }
            case 'B':
            {
                structFieldSizes[fieldLooper] = sizeof(char);
                ++fieldLooper;
                ++charLooper;
                break;
            }
            case 'f':
            {
                structFieldSizes[fieldLooper] = sizeof(float);
                ++fieldLooper;
                ++charLooper;
                break;
            }
            case 'd':
            {
                structFieldSizes[fieldLooper] = sizeof(double);
                ++fieldLooper;
                ++charLooper;
                break;
            }
            case '*':
            case '#':
            case '@':
            case ':':
            case '^':
            case '[':
            {
                structFieldSizes[fieldLooper] = sizeof(void *);
                ++fieldLooper;
                ++charLooper;
                break;
            }
            case '{':
            {
                //TODO
                //
                charLooper = _luaObjCInternal_jumpOverToChar(charLooper, '=');                
                break;
            }
            default:
            {
                ++charLooper;
                break;
            }
        }
    }
    
    size_t structSize = 0;
    size_t currentSlotSize = 0;
    for (int iLooper = 0; iLooper < fieldLooper; ++iLooper)
    {
        currentSlotSize += structFieldSizes[iLooper];
        if (currentSlotSize > LUAOBJC_TARGET_ALIGMENT)
        {
            currentSlotSize -= structFieldSizes[iLooper];
            structSize += LUAOBJC_TARGET_ALIGMENT;
            currentSlotSize = structFieldSizes[iLooper];
            if (iLooper == fieldLooper - 1)
            {
                structSize += MAX(structSize, LUAOBJC_TARGET_ALIGMENT);
            }
        }else if (currentSlotSize < LUAOBJC_TARGET_ALIGMENT)
        {
            
        }else
        {
            structSize += currentSlotSize;
            currentSlotSize = 0;
        }
    }
    
    return structSize;
}

void luaObjCInternal_createmeta(lua_State *L, const char *name, const luaL_Reg methods[])
{
    luaL_newmetatable(L, name);
    lua_pushvalue(L, -1);  /* push metatable */
    lua_setfield(L, -2, "__index");  /* metatable.__index = metatable */
    luaL_setfuncs(L, methods, 0);  /* add file methods to new metatable */
    lua_pop(L, 1);  /* pop new metatable */
}