//
//  LuaObjCRuntime.m
//  LuaIOS
//
//  Created by tearsofphoenix on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaObjCRuntime.h"

#import <objc/runtime.h>

#import "lauxlib.h"

#import "LuaObjCClass.h"

#import "LuaObjCInternal.h"

#import "LuaCGGeometry.h"

#import "LuaObjCAuxiliary.h"

#import "LuaObjCExtensions.h"

#import "LuaObjCProfile.h"

#import "LuaFoundation.h"

#import "LuaNSRange.h"

#import "LuaBridgeSupport.h"

#import "LuaBridgeFunctor.h"

#import "LuaObjCBlock.h"

#import "LuaObjCTypeEncoding.h"

#import "LuaObjCCacheTable.h"

#import "LuaNSObjectSupport.h"

static int luaObjC_createClassWithSuperClass(lua_State *L)
{
    const char *newClassName = lua_tostring(L, 1);
    const char *superClassName = lua_tostring(L, 2);
            
    //super Class must be registered in runtime
    //
    Class superClass = objc_getClass(superClassName);
    
    if (!superClass)
    {
        printf("Error: Unkown superclass:%s\n", superClassName);
        return 0;
    }
    
    Class registeredClass = LuaClassGetRegisteredClassByName(newClassName);
    //has registered, put it into state
    //
    if (registeredClass)
    {
        printf("Has Registerd:%s superClass:%s\n", newClassName, superClassName);
        luaObjC_pushNSObject(L, registeredClass);
        
    }else
    {
        Class theNewClass = objc_allocateClassPair(superClass, newClassName, 0); 
        
        LuaClassRegister(L, theNewClass, newClassName);
        luaObjC_pushNSObject(L, theNewClass);
    }
    return 1;
}


static int luaObjC_createNSSelector(lua_State *L)
{
    //deal SEL as c-string
    //
    const char *selectorName = lua_tostring(L, 1);
    lua_pushstring(L, selectorName);
    
    return 1;
}

static int luaObjC_getProtocol(lua_State *L)
{
    const char *protocolName = lua_tostring(L, 1);
    lua_pushlightuserdata(L, objc_getProtocol(protocolName));
    return 1;
}

static int luaObjC_retainBeforeReturnFromAutoreleasePool(lua_State *L)
{
    LuaObjectRef objRef = luaL_testudata(L, 1, LUA_NSOBJECT_METATABLENAME);
    if (objRef)
    {
        //is NSObject instance
        CFRetain(LuaObjectGetObject(objRef));
    }
    return 1;
}

typedef enum
{
    LuaObjCIntegerType,
    LuaObjCFloatType,
    LuaObjCBOOLType,
    LuaObjCPointerType,
    LuaObjCCGRectType,
    LuaObjCCGPointType,
    LuaObjCCGSizeType,
    LuaObjCNSRangeType,
}LuaObjCValueType;

static LuaObjCValueType luaObjCGetTypeOfTypeName(const char* typeName)
{
    if (strchr(typeName, '*'))
    {
        return LuaObjCPointerType;
    }
    if (!strcmp(typeName, "CGFloat")
        || !strcmp(typeName, "float")
        || !strcmp(typeName, "double")
        || !strcmp(typeName, "NSTimeInterval")
        )
    {
        return LuaObjCFloatType;
    }
    if (!strcmp(typeName, "BOOL"))
    {
        return LuaObjCBOOLType;
    }
    
    return LuaObjCIntegerType;
}

static int luaObjC_createBlockObject(lua_State *L)
{
    int argumentTypesCount = lua_gettop(L) - 1;
    LuaClosureType clouserID = luaL_ref(L, LUA_REGISTRYINDEX);
    const char** argumentTypes = NULL;
    
    if (argumentTypesCount > 0)
    {
        argumentTypes = malloc(argumentTypesCount * sizeof(char*));
        
        for (int iLooper = 0; iLooper < argumentTypesCount; ++iLooper)
        {
            argumentTypes[iLooper] = lua_tostring(L, iLooper + 1);
        }
        
    }
    void (^block)(id selfObject, ...) = ^(id selfObject, ...)
    {
        lua_rawgeti(L, LUA_REGISTRYINDEX, clouserID);
        
        if (argumentTypesCount > 0)
        {
            
            va_list ap;
            va_start(ap, selfObject);
            
            const char* argumentLooper = NULL;
            
            for (NSUInteger iLooper = 0; iLooper < argumentTypesCount; ++iLooper)
            {
                argumentLooper = argumentTypes[iLooper];
                switch (luaObjCGetTypeOfTypeName(argumentLooper))
                {
                    case LuaObjCBOOLType:
                    {
                        BOOL boolArg = va_arg(ap, int);
                        lua_pushboolean(L, boolArg);
                        break;
                    }
                    case LuaObjCFloatType:
                    {
                        CGFloat floatArg = va_arg(ap, double);
                        lua_pushnumber(L, floatArg);
                        break;
                    }
                    case LuaObjCPointerType:
                    {
                        void *pointerArg = va_arg(ap, void*);
                        lua_pushlightuserdata(L, pointerArg);
                        break;
                    }
                    case LuaObjCCGRectType:
                    {
                        CGRect rect = va_arg(ap, CGRect);
                        lua_pushCGRect(L, rect);
                        break;
                    }
                    case LuaObjCCGSizeType:
                    {
                        CGSize size = va_arg(ap, CGSize);
                        lua_pushCGSize(L, size);
                        break;
                    }
                    case LuaObjCCGPointType:
                    {
                        CGPoint point = va_arg(ap, CGPoint);
                        lua_pushCGPoint(L, point);
                        break;
                    }
                    case LuaObjCNSRangeType:
                    {
                        NSRange range = va_arg(ap, NSRange);
                        lua_pushNSRange(L, range);
                        break;
                    }
                    default:
                    {
                        NSInteger intArg = va_arg(ap, NSInteger);
                        lua_pushinteger(L, intArg);
                        break;
                    }
                }
            }
            va_end(ap);
        }
        lua_pcall(L, argumentTypesCount, 0, 0);
        //check return object
    };
    
    block = Block_copy(block);
    
    LuaObjCBlockSetClosureID(clouserID, block);
    
    luaObjC_pushNSObject(L, block);
    
    return 1;
}

static int luaObjC_registerClassPair(lua_State *L)
{
    const char* className = luaObjC_checkString(L, 1);

    Class theClass = LuaClassGetRegisteredClassByName(className);
    
    if (theClass)
    {
        objc_registerClassPair(theClass);
    }
    
    return 0;
}

static int luaObjC_classPredeclearation(lua_State *L)
{
    int argCount = lua_gettop(L);
    
    for (int iLooper = 1; iLooper < argCount + 1; ++iLooper)
    {
        LuaObjCTypeEncodingAddPredeclearedClass(lua_tostring(L, iLooper));
    }
    return 0;
}

static int luaObjC_import_file(lua_State *L)
{
    const char *name = lua_tostring(L, 1);
    
    [LuaBridgeSupport importFramework: [NSString stringWithUTF8String: name]];
    
    NSString *realPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingFormat: @"/%s", name];
    lua_pushstring(L, [realPath UTF8String]);
    lua_getfield(L, LUA_REGISTRYINDEX, "require");
    lua_pcall(L, 1, 1, 0);
    
    return 1;
}

static int _luaEngine_resolveName(lua_State *L)
{
    const char* name = lua_tostring(L, 2);
    //printf("revolve: %s\n", name);
    
    if (!LuaObjCCacheTableGetObjectForKey(L, name))
    {
        //printf("not in cache table, in function: %s line: %d name: %s\n", __func__, __LINE__, name);
        Class theClass = objc_getClass(name);
        if (theClass)
        {
            LuaObjectRef objRef = LuaObjectCreate(L, theClass);
            LuaObjCCacheTableInsertObjectForKey(L, objRef, name);
            luaObjC_pushNSObject(L, theClass);
        }else
        {
            //this maybe a function, such as glEnable(...)
            [LuaBridgeSupport tryToResolveName: [NSString stringWithUTF8String: name]
                                  intoLuaState: L];
        }
    }
    
    return 1;
}

static const luaL_Reg luaObjC_runtimeFunctions[] =
{
    //base feature
    //
    {"sel_registerName", luaObjC_createNSSelector},
    {"objc_getProtocol", luaObjC_getProtocol},
    {"objc_allocateClassPair", luaObjC_createClassWithSuperClass},
    {"class_addProperty", LuaIMPAddPropertyToClass},
    {"class_addInstanceMethod", LuaIMPAddInstanceMethod},
    {"class_addClassMethod", LuaIMPAddClassMethod},
    {"objc_registerClassPair", luaObjC_registerClassPair},
    {"objc_msgSendSuper", LuaObjCMessageSendSuper},
    {"objc_msgSend", LuaObjCMessageSend},
    
    {"objc_import_file", luaObjC_import_file},
    
    {"objc_retainBeforeReturnFromAutoreleasePool", luaObjC_retainBeforeReturnFromAutoreleasePool},
    {"objc_createBlockObject", luaObjC_createBlockObject},
    {"objc_classPredeclearation", luaObjC_classPredeclearation},
    
//    {"resolveName", _luaEngine_resolveName},

    {NULL, NULL}
};

static const luaL_Reg luaObjC_resolveNameFunctions[] =
{
    {"resolveName", _luaEngine_resolveName},
    
    {NULL, NULL},
};

static int _luaObjC_openRuntimeSupport(lua_State *L)
{
    luaL_newlib(L, luaObjC_resolveNameFunctions);
    return 1;
}

int luaopen_foundation(lua_State *L)
{    
    luaopen_classSupport(L);

    LuaObjCLoadGlobalFunctions(L, luaObjC_runtimeFunctions);

    luaL_requiref(L, "ObjC", _luaObjC_openRuntimeSupport, 1);

    //    luaL_getsubtable(L, LUA_REGISTRYINDEX, "_G");
    //    lua_newtable(L);
    //    lua_pushliteral(L, "__index");
    //
    //    luaL_getsubtable(L, LUA_REGISTRYINDEX, "_LOADED");
    //    lua_pushliteral(L, "ObjC");
    //    lua_gettable(L, -2);
    //
    //    lua_pushliteral(L, "resolveName");
    //    lua_gettable(L, -2);
    //    lua_remove(L, -2);
    //    lua_rawset(L, -3);
    //
    //    stackDump(L);
            
    static const char* s_ResolveNameMetaTable = "setmetatable(_G, { __index = ObjC.resolveName})";

	luaL_loadstring(L, s_ResolveNameMetaTable);
	lua_pcall(L, 0, 0, 0);
    
    luaObjC_openNSObjectSupport(L);
    
    luaopen_objc_extensions(L);
    luaopen_objc_profile(L);
    luaObjCInternal_openBridgeFunctor(L);
    
    LuaOpenFoundation(L);
    
    return 1;
    
}