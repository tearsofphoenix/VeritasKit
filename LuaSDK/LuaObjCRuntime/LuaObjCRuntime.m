//
//  LuaObjCRuntime.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaObjCRuntime.h"

#import <objc/runtime.h>

#import "lauxlib.h"

#import "LuaObjCClass.h"

#import "LuaObjCAccelerator.h"

#import "LuaObjCInternal.h"

#import "LuaCGGeometry.h"

#import "LuaObjCMessage.h"

#import "LuaObjCIMP.h"

#import "LuaObjCAuxiliary.h"

#import "LuaObjCExtensions.h"

#import "LuaObjCProfile.h"

#import "LuaFoundation.h"

#import "LuaNSRange.h"

#import "LuaObjCLangExtensions.h"

#import "LuaBridgeSupport.h"

#import "LuaBridgeFunctor.h"

static int luaObjC_NSLog(lua_State *L)
{    
    const char* charLooper = luaObjC_checkString(L, 1);
    NSMutableString *logString = [NSMutableString string];
    NSUInteger iLooper = 2;
    while (charLooper && *charLooper)
    {
        switch (*charLooper)
        {
            case '%':
            {
                ++charLooper;
                switch (*charLooper)
                {
                    case 0:
                    {
                        //end of the format string
                        break;
                    }
                    case '%':
                    {
                        [logString appendString: @"%@"];
                        break;
                    }
                    case 'd':
                    case 'i':
                    case 'u':
                    {
                        NSUInteger value = lua_tointeger(L, iLooper);
                        [logString appendFormat: @"%d", value];
                        ++iLooper;
                        break;
                    }
                    case 'f':
                    case 'F':
                    {
                        double value = lua_tonumber(L, iLooper);
                        [logString appendFormat: @"%f", value];
                        ++iLooper;
                        break;
                    }
                    case 's':
                    {
                        const char *s = lua_tostring(L, iLooper);
                        [logString appendFormat: @"%s", s];
                        ++iLooper;
                        break;
                    }
                    case 'p':
                    {
                        void* value = lua_touserdata(L, iLooper);
                        [logString appendFormat: @"%p", value];
                        ++iLooper;
                        break;
                    }
                    case 'c':
                    {
                        char c = lua_tointeger(L, iLooper);
                        [logString appendFormat: @"%c", c];
                        ++iLooper;
                        break;
                    }
                    case '@':
                    {
                        id obj = luaObjC_checkNSObject(L, iLooper);
                        [logString appendFormat: @"%@", obj];
                        ++iLooper;
                        break;
                    }
                    default:
                    {
                        [logString appendFormat: @"%c", *charLooper];
                        break;
                    }
                }
                break;
            }
            default:
            {
                [logString appendFormat: @"%c", *charLooper];
                break;
            }
        }
        ++charLooper;
    }

    NSLog(@"%@", logString);
    
    return 0;
}

int luaObjC_description(lua_State *L)
{
    LuaObjCClassRef obj = lua_touserdata(L, 1);
    NSString *description = [LuaObjCClassGetObject(obj) description];
    lua_pushstring(L, [description UTF8String]);
    return 1;
}

static int luaObjC_createClassWithSuperClass(lua_State *L)
{
    const char *newClassName = lua_tostring(L, 1);
    const char *superClassName = lua_tostring(L, 2);
    
    NSString *internalClassName = [NSString stringWithUTF8String: newClassName];
    
    Class superClass = objc_getClass(superClassName);
    
    if (!superClass) 
    {
        printf("Error: Unkown superclass:%s\n", superClassName);        
        return 0;
    }    
    
    LuaObjCClassRef registeredClassRef = luaObjC_getRegisteredClassByName(internalClassName);
    //has registered, put it into state
    //
    if (registeredClassRef)
    {
        printf("Has Registerd:%s superClass:%s\n", newClassName, superClassName);
        lua_pushlightuserdata(L, registeredClassRef);
        
    }else
    {
        Class theNewClass = objc_allocateClassPair(superClass, newClassName, 0); 
        //add ivar to the new class
        LuaObjCClassRef obj = LuaObjCClassInitialize(L, theNewClass, internalClassName, false);
        
        luaObjC_registerClass(obj);
        
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
    LuaObjCClassRef classRef = luaL_testudata(L, 1, LUA_NSOBJECT_METATABLENAME);
    if (classRef)
    {
        //is NSObject instance
        CFRetain(LuaObjCClassGetObject(classRef));
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
    int clouserID = luaL_ref(L, LUA_REGISTRYINDEX);
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
    
    _luaObjC_insertClouserIDOfBlock(clouserID, block);
    
    luaObjC_pushNSObject(L, block);
    
    return 1;
}

static int luaObjC_registerClassPair(lua_State *L)
{
    const char* className = luaObjC_checkString(L, 1);
    LuaObjCClassRef classRef = luaObjC_getRegisteredClassByName([NSString stringWithUTF8String: className]);
    
    if (classRef)
    {
        objc_registerClassPair(LuaObjCClassGetObject(classRef));
    }
    
    return 0;
}

static int luaObjC_classPredeclearation(lua_State *L)
{
    int argCount = lua_gettop(L);

    for (int iLooper = 1; iLooper < argCount + 1; ++iLooper)
    {
        _luaObjC_registerClassPredeclearation([NSString stringWithUTF8String: lua_tostring(L, iLooper)]);
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

static const luaL_Reg luaObjC_runtimeFunctions[] = 
{
    //base feature
    //
    {"sel_registerName", luaObjC_createNSSelector},
    {"objc_getProtocol", luaObjC_getProtocol},
    {"objc_allocateClassPair", luaObjC_createClassWithSuperClass},
    {"class_addProperty", luaObjC_addPropertyToClass},
    {"class_addObjectMethod", luaObjC_luaClass_addObjectMethod},
    {"class_addClassMethod", luaObjC_luaClass_addClassMethod},
    {"objc_registerClassPair", luaObjC_registerClassPair},
    {"objc_msgSendSuper", luaObjC_objc_messageSend_Super},
    {"objc_msgSend", luaObjC_objc_messageSend},
    
    {"objc_import_file", luaObjC_import_file},

    {"objc_retainBeforeReturnFromAutoreleasePool", luaObjC_retainBeforeReturnFromAutoreleasePool},
    {"objc_createBlockObject", luaObjC_createBlockObject},
    {"objc_classPredeclearation", luaObjC_classPredeclearation},
    {NULL, NULL}
};

static int luaObjC_garbadgeCollection(lua_State *L)
{
    LuaObjCClassRef objRef = lua_touserdata(L, 1);
    lua_Debug ar;
    lua_getstack(L, 1, &ar);
    const char * name = lua_getlocal(L, &ar, 1);
    //stackDump(L);

    printf("[GC]name: %s count: %d\n", name, LuaObjCClassGetRetainCount(objRef));
    LuaObjCClassFinalize(objRef);
    //free(objRef);

    return 0;
}

static int luaObjC_isEqual(lua_State *L)
{
    id obj1 = luaObjC_checkNSObject(L, 1);
    id obj2 = luaObjC_checkNSObject(L, 2);
    lua_pushboolean(L, [obj1 isEqual: obj2]);
    return 1;
}
   
static int luaObjC_indexCollection(lua_State *L)
{
    id obj = luaObjC_checkNSObject(L, 1);
    NSLog(@"in func: %s line: %d obj: %@", __func__, __LINE__, obj);
    if ([obj respondsToSelector: @selector(indexObjectWithState:)])
    {
        [obj indexObjectWithState: L];
        return 1;
    }else
    {
        return 0;
    }
}

static int luaObjC_addObjectToCollection(lua_State *L)
{
    return 0;
}

static int luaObjC_getLengthOfObject(lua_State *L)
{
    id obj = luaObjC_checkNSObject(L, 1);
    if ([obj respondsToSelector: @selector(getLengthOfObjectWithState:)])
    {
        [obj getLengthOfObjectWithState: L];
        return 1;
    }else
    {
        return 0;
    }
}

static int luaObjC_unionCollection(lua_State *L)
{
    return 1;
}

static int luaObjC_subconcatCollection(lua_State *L)
{
    return 1;
}

static int luaObjC_concatCollection(lua_State *L)
{
    id obj = luaObjC_checkNSObject(L, 1);
    
    NSLog(@"in func: %s line: %d obj: %@", __func__, __LINE__, obj);
    if ([obj respondsToSelector: @selector(concatObjectWithState:)])
    {
        [obj concatObjectWithState: L];
        return 1;
    }else
    {
        return 0;
    }
}

static int luaObjC_callBlockObject(lua_State *L)
{
    //include the block
    //
    int argCount = lua_gettop(L);
    int returnCount = 1;
    id block = luaObjC_checkNSObject(L, 1);
    
    if ([block isKindOfClass: objc_getClass("NSBlock")])
    {
        int clouserID = _luaObjC_getClouserIDOfBlock(block);
        lua_rawgeti(L, LUA_REGISTRYINDEX, clouserID);
        for (int iLooper = 2; iLooper < argCount + 1; ++iLooper)
        {
            switch (lua_type(L, iLooper))
            {
                case LUA_TNIL:
                {
                    lua_pushnil(L);
                    break;
                }   
                case LUA_TBOOLEAN:		
                {
                    lua_pushboolean(L, lua_toboolean(L, iLooper));
                    break;
                }
                case LUA_TLIGHTUSERDATA:
                case LUA_TUSERDATA:
                {
                    lua_pushlightuserdata(L, lua_touserdata(L, iLooper));
                    break;
                }
                case LUA_TNUMBER:
                {
                    lua_pushnumber(L, lua_tonumber(L, iLooper));
                    break;
                }
                case LUA_TSTRING:
                {
                    lua_pushstring(L, lua_tostring(L, iLooper));
                    break;
                }
                case LUA_TTABLE:
                {
                    //TODO
                    //lua_gettable(<#lua_State *L#>, <#int idx#>)
                    break;
                }
                case LUA_TFUNCTION:
                {
                    //TODO
                    //
                    break;
                }
                case LUA_TTHREAD:
                {
                    //TODO
                    break;                    
                }
                default:
                {
                    break;
                }
            }
        }

        if(lua_pcall(L, argCount - 1, returnCount, 0) != LUA_OK)
        {
            luaObjC_throwExceptionIfError(L);
        }
        
    }else 
    {
        NSException *exception = [NSException exceptionWithName: @"LuaObjCBlockException"
                                                         reason: @"Expect block object!"
                                                       userInfo: nil];
        @throw exception;
    }
    return returnCount;
}

static const luaL_Reg LuaNS_ObjectMethods[] = 
{
    {"__gc", luaObjC_garbadgeCollection},
    {"__tostring", luaObjC_description},
    
    {"__index", luaObjC_indexCollection},
    {"__newindex", luaObjC_addObjectToCollection},
    {"__len", luaObjC_getLengthOfObject},
    {"__eq", luaObjC_isEqual},
    {"__add", luaObjC_unionCollection},
    {"__sub", luaObjC_subconcatCollection},
    {"__concat", luaObjC_concatCollection},
    {"__call", luaObjC_callBlockObject},
    {NULL, NULL}
};


static const luaL_Reg luaNS_functions[] = 
{
    {"NSLog", luaObjC_NSLog},
    {NULL, NULL}  
};


void luaObjC_setThisPointerInCurrentContextOfClass(lua_State *L, id thisObj)
{
    if (thisObj)
    {
        luaObjC_pushNSObject(L, thisObj);
    }else 
    {
        lua_pushnil(L);
    }
    
    lua_setglobal(L, "self");
}

int luaopen_foundation(lua_State *L)
{
    luaObjC_modifyRootClass();
    luaObjC_initializeAccelerators();
    
    luaopen_objc(L);
    luaObjC_loadGlobalFunctions(L, luaObjC_runtimeFunctions);
    luaObjC_loadGlobalFunctions(L, luaNS_functions);
    luaopen_objc_extensions(L);
    luaopen_objc_profile(L);
    luaObjCInternal_openBridgeFunctor(L);
    
    luaL_newlib(L, luaNS_functions);  

    luaObjCInternal_createmeta(L, LUA_NSOBJECT_METATABLENAME, LuaNS_ObjectMethods);
    
    LuaOpenFoundation(L);
    
    return 1;
    
}