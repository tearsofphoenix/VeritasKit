//
//  LuaObjCRuntime.m
//  LuaIOS
//
//  Created by tearsofphoenix on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaObjCRuntime.h"

#import <objc/runtime.h>

#import "LuaObjCClass.h"

#import "LuaObjCInternal.h"

#import "LuaCGGeometry.h"

#import "LuaObjCAuxiliary.h"

#import "LuaObjCProfile.h"

#import "LuaFoundation.h"

#import "LuaNSRange.h"

#import "LuaBridgeSupport.h"

#import "LuaBridgeFunctor.h"

#import "LuaNSObjectSupport.h"

#import "NSString+LuaObjCIndex.h"

#import "NSArray+LuaObjCIndex.h"

#pragma mark - block support


static CFMutableDictionaryRef __LuaObjC_clouserBlockDictionary = NULL;

static inline void LuaObjCBlockSupportInitialize(void)
{
    
    __LuaObjC_clouserBlockDictionary = CFDictionaryCreateMutable(CFAllocatorGetDefault(),
                                                                 1024,
                                                                 &kCFTypeDictionaryKeyCallBacks,
                                                                 NULL);
}

static inline void luaObjC_addClosureIDForBlock(LuaClosureType clouserID, id block)
{
    if (!__LuaObjC_clouserBlockDictionary)
    {
        LuaObjCBlockSupportInitialize();
    }
    
    if (block)
    {
        CFDictionaryAddValue(__LuaObjC_clouserBlockDictionary, block, (const void *)clouserID);
    }
}

LuaClosureType luaObjC_getClosureIDOfBlock(id block)
{
    LuaClosureType closureID = (LuaClosureType) CFDictionaryGetValue(__LuaObjC_clouserBlockDictionary, block);
    
    if (closureID)
    {
        return closureID;
    }
    return LuaObjCInvalidClouserID;
}

#pragma mark - class support

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
    
    Class registeredClass = luaObjC_getClass(newClassName);
    //has registered, put it into state
    //
    if (registeredClass)
    {
        printf("Has Registerd:%s superClass:%s\n", newClassName, superClassName);
        luaObjC_pushNSObject(L, registeredClass, true);
        
    }else
    {
        Class theNewClass = objc_allocateClassPair(superClass, newClassName, 0);
        
        luaObjC_allocateClass(L, theNewClass, newClassName);
        luaObjC_pushNSObject(L, theNewClass, true);
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
    
    luaObjC_addClosureIDForBlock(clouserID, block);
    
    luaObjC_pushNSObject(L, block, true);
    
    return 1;
}

static int luaObjC_registerClassPair(lua_State *L)
{
    const char* className = luaObjC_checkString(L, 1);
    
    Class theClass = luaObjC_getClass(className);
    
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
        luaObjC_addEncodingForPredeclearClass(lua_tostring(L, iLooper));
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
    
    if (!luaObjC_getValueInCacheTable(L, name))
    {
        //printf("not in cache table, in function: %s line: %d name: %s\n", __func__, __LINE__, name);
        Class theClass = objc_getClass(name);
        if (theClass)
        {
            LuaObjectRef objRef = LuaObjectCreate(L, theClass);
            luaObjC_addValueInCacheTable(L, objRef, name);
            luaObjC_pushNSObject(L, theClass, true);
        }else
        {
            //this maybe a function, such as glEnable(...)
            [LuaBridgeSupport tryToResolveName: [NSString stringWithUTF8String: name]
                                  intoLuaState: L];
        }
    }
    
    return 1;
}


static int luaObjC_objc_throw(lua_State *L)
{
    switch (lua_type(L, 1))
    {
        case LUA_TNIL:
        case LUA_TNONE:
        {
            luaL_error(L, "@throw nil value!");
            break;
        }
        case LUA_TBOOLEAN:
        {
            BOOL value = lua_toboolean(L, 1);
            luaL_error(L,  "@throw BOOL:%s value!", value ? "YES" : "NO");
            break;
        }
        case LUA_TLIGHTUSERDATA:
        {
            void* p = lua_touserdata(L, 1);
            luaL_error(L, "@throw pointer:%p value!", p);
            break;
        }
        case LUA_TNUMBER:
        {
            lua_Number number = lua_tonumber(L, 1);
            luaL_error(L, "@throw number:%f value!", number);
            break;
        }
        case LUA_TSTRING:
        {
            const char* str = lua_tostring(L, 1);
            luaL_error(L, "@throw string:%s value!", str);
            break;
        }
        case LUA_TTABLE:
        {
            luaL_error(L, "@throw table value!");
            break;
        }
        case LUA_TFUNCTION:
        {
            luaL_error(L, "@throw function value!");
            break;
        }
        case LUA_TUSERDATA:
        {
            id obj = luaObjC_checkNSObject(L, 1);
            luaL_error(L, "@throw object:%s value!", [[obj description] UTF8String]);
            break;
        }
        case LUA_TTHREAD:
        {
            luaL_error(L, "@throw thread value!");
            break;
        }
        default:
        {
            luaL_error(L, "@throw (unknown) type!");
            break;
        }
    }
    
    return 0;
}

static int luaObjC_objc_tryCatchFinally(lua_State *L)
{
    int finallyBlock = luaL_ref(L, LUA_REGISTRYINDEX);
    int catchBlock = luaL_ref(L, LUA_REGISTRYINDEX);
    int tryBlock = luaL_ref(L, LUA_REGISTRYINDEX);
    @try
    {
        lua_rawgeti(L, LUA_REGISTRYINDEX, tryBlock);
        
        printf("try in objc, line:%d\n", __LINE__);
        if(lua_pcall(L, 0, 0, 0) != LUA_OK)
        {
            printf("1st in try\n");
            luaL_error(L, "error in @try");
        }
        
        
    }
    @catch (NSException *exception)
    {
        lua_rawgeti(L, LUA_REGISTRYINDEX, catchBlock);
        
        luaObjC_pushNSObject(L, exception, true);
        
        printf("catch in objc, line:%d\n", __LINE__);
        
        if(lua_pcall(L, 1, 0, 0) != LUA_OK)
        {
            printf("1st in catch\n");
            
            luaL_error(L, "error in @catch");
        }
    }
    @finally
    {
        printf("finally in objc, line:%d\n", __LINE__);
        
        lua_rawgeti(L, LUA_REGISTRYINDEX, finallyBlock);
        lua_pcall(L, 0, 0, 0);
    }
    return 1;
}

static int luaObjC_objc_UUIDString(lua_State *L)
{
    NSString *uuidString = [[NSString UUID] stringByReplacingOccurrencesOfString: @"-" withString: @"_"];
    lua_pushstring(L, [uuidString UTF8String]);
    return 1;
}

static int luaObjC_objc_NSFastEnumerate(lua_State *L)
{
    id obj = luaObjC_checkNSObject(L, 1);
    if (obj)
    {
        //if the object does not support fast enumerate, it will cause a runtime exception
        //
        lua_CFunction enumerator = [obj luaEnumerator];
        lua_pushcclosure(L, enumerator, 1);
        return 1;
    }
    return 0;
}

#pragma mark - literal object support, i.e. @{}, @[], @1 

static CFMutableArrayRef _LuaObjCLiteralStorage = NULL;

static int luaObjC_createLiteralArray(lua_State *L)
{
    int count = lua_gettop(L);
    
    NSMutableArray *array = [[[NSMutableArray alloc] init] autorelease];
    
    for (int iLooper = 1; iLooper < count + 1; ++iLooper)
    {
        [array addObject: luaObjC_checkNSObject(L, iLooper)];
    }
    
    NSArray *value = [NSArray arrayWithArray: array];
    
    CFArrayAppendValue(_LuaObjCLiteralStorage, value);
    
    luaObjC_pushNSObject(L, value, true);
    
    return 1;
}

static int luaObjC_createLiteralDictionary(lua_State *L)
{
    int count = lua_gettop(L);
    int halfIndex = count / 2;
    
    NSMutableArray *keys = [[NSMutableArray alloc] initWithCapacity: halfIndex];
    NSMutableArray *values = [[NSMutableArray alloc] initWithCapacity: halfIndex];
    
    for (int iLooper = 1; iLooper < halfIndex + 1; ++iLooper)
    {
        [keys addObject: luaObjC_checkNSObject(L, iLooper)];
        [values addObject: luaObjC_checkNSObject(L, halfIndex + iLooper)];
    }
    
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjects: values
                                                       forKeys: keys];
    CFArrayAppendValue(_LuaObjCLiteralStorage, dict);
    
    [dict release];
    
    [keys release];
    [values release];
    
    luaObjC_pushNSObject(L, dict, true);
    
    return 1;
}

static inline int luaObjC_createConstantNumber(lua_State *L)
{
    NSNumber *number = [[NSNumber alloc] initWithDouble: lua_tonumber(L, 1)];
    CFArrayAppendValue(_LuaObjCLiteralStorage, number);
    [number release];
    
    luaObjC_pushNSObject(L, number, true);
    
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
    
    {"objc_tryCatchFinally", luaObjC_objc_tryCatchFinally},
    {"objc_throw", luaObjC_objc_throw},
    {"objc_UUIDString", luaObjC_objc_UUIDString},
    {"objc_NSFastEnumerate", luaObjC_objc_NSFastEnumerate},
    {"objc_createLiteralArray", luaObjC_createLiteralArray},
    {"objc_createLiteralDictionary", luaObjC_createLiteralDictionary},
    
    {"__NSConstantNumber", luaObjC_createConstantNumber},
    
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

int luaObjC_openFoundationSupport(lua_State *L)
{
    if (!_LuaObjCLiteralStorage)
    {
        _LuaObjCLiteralStorage = CFArrayCreateMutable(CFAllocatorGetDefault(), 64, &kCFTypeArrayCallBacks);
    }
    
    luaObjC_classInitialize(L);
    
    luaObjC_loadGlobalFunctions(L, luaObjC_runtimeFunctions);
    
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
    
    luaObjC_openNSObjectExtensionSupport(L);
    
    luaopen_objc_profile(L);
    luaObjCInternal_openBridgeFunctor(L);
    
    LuaOpenFoundation(L);
    
    return 1;
    
}