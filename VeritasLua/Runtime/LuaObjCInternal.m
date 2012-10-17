//
//  LuaObjCInternal.m
//  LuaIOS
//
//  Created by tearsofphoenix on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaObjCInternal.h"

#import <objc/runtime.h>

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
        
        //free(classIvarList);
        
        unsigned int classMethodCount = 0;
        Method *methodList = class_copyMethodList(theClass, &classMethodCount);
        printf("\tMethods:\n");
        for (int i=0; i<classMethodCount; ++i)
        {
            printf("\t\tname:%s encoding:%s\n", (const char*)method_getName(methodList[i]), method_getTypeEncoding(methodList[i]));
        }
        
        //free(methodList);
        
        unsigned int classPropertyCount = 0;
        objc_property_t *properties = class_copyPropertyList(theClass, &classPropertyCount);
        printf("\tProperties:\n");
        for (int i=0; i<classPropertyCount; ++i)
        {
            printf("\t\tname:%s attributes:%s\n", property_getName(properties[i]), property_getAttributes(properties[i]));
        }
        
        //free(properties);
    }
}

void stackDump (lua_State *L) 
{
    int nargs = lua_gettop(L);
    printf(" ----------------  Stack Dump ----------------\n" );
    
    int t = 0;

    for (int i = -1; i <= nargs; ++i)
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
                printf("%d: %p %s\n", i, lua_topointer(L, t), lua_typename(L, t));
                break;
            }
        }
    }
    
    printf("--------------- Stack Dump Finished ---------------\n" );
}

const char* LuaObjCInternal_jumpoverEncodingDecorator(const char* charLooper)
{
    if (charLooper)
    {
        switch (*charLooper)
        {
            case _C_CONST: //const
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

