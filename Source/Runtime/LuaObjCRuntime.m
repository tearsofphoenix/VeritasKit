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

#import "LuaObjCMessage.h"

#import "LuaObjCProperty.h"

#import "LuaCGGeometry.h"

#import "LuaObjCAuxiliary.h"

#import "LuaObjCProfile.h"

#import "LuaFoundation.h"

#import "LuaNSRange.h"

#import "VBridgeService.h"

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

LuaClosureType LuaInternalGetClosureIDOfBlock(id block)
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
    
    Class registeredClass = LuaInternalGetClass(newClassName);
    //has registered, put it into state
    //
    if (registeredClass)
    {
        printf("Has Registerd:%s superClass:%s\n", newClassName, superClassName);
        LuaObjCPushObject(L, registeredClass, true, true);
        
    }else
    {
        Class theNewClass = objc_allocateClassPair(superClass, newClassName, 0);
        
        LuaInternalAllocateClass(L, theNewClass, newClassName);
        LuaObjCPushObject(L, theNewClass, true, true);
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
    LuaObjectRef objRef = lua_touserdata(L, 1);
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
                        LuaObjCPushCGRect(L, rect);
                        break;
                    }
                    case LuaObjCCGSizeType:
                    {
                        CGSize size = va_arg(ap, CGSize);
                        LuaObjCPushCGSize(L, size);
                        break;
                    }
                    case LuaObjCCGPointType:
                    {
                        CGPoint point = va_arg(ap, CGPoint);
                        LuaObjCPushCGPoint(L, point);
                        break;
                    }
                    case LuaObjCNSRangeType:
                    {
                        NSRange range = va_arg(ap, NSRange);
                        LuaObjCPushNSRange(L, range);
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
        
        if(lua_pcall(L, argumentTypesCount, 0, 0) != LUA_OK)
        {
            lua_error(L);
        }
        //check return object
    };
    
    block = Block_copy(block);
    
    luaObjC_addClosureIDForBlock(clouserID, block);
    
    LuaObjCPushObject(L, block, true, false);
    
    return 1;
}

static int luaObjC_registerClassPair(lua_State *L)
{
    const char* className = LuaObjCCheckString(L, 1);
    
    Class theClass = LuaInternalGetClass(className);
    
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
        LuaObjCAddEncodingForPredeclearClass(lua_tostring(L, iLooper));
    }
    return 0;
}

static int luaObjC_import_file(lua_State *L)
{
    const char *name = lua_tostring(L, 1);
    
    VSC(VBridgeServiceIdentifier, VBridgeServiceImportFrameworkAction, nil, @[ [NSString  stringWithUTF8String: name] ]);
    
    lua_getfield(L, LUA_REGISTRYINDEX, "require");
    
    NSString *realPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingFormat: @"/%s", name];
    lua_pushstring(L, [realPath UTF8String]);
    
    //just ignore error here
    //
    lua_pcall(L, 1, 1, 0);
    
    return 1;
}

static int luaObjC_resolveName(lua_State *L)
{
    const char* name = lua_tostring(L, 2);
    
    Class theClass = objc_getClass(name);
    
    if (theClass)
    {
        LuaObjCPushObject(L, theClass, false, true);
        
    }else
    {
        //this maybe a function, such as glEnable(...)
        //
        VSC(VBridgeServiceIdentifier,
            VBridgeServiceResolveNameIntoStateAction,
            nil,
            @[ [NSString stringWithUTF8String: name], [NSValue valueWithPointer: L] ]);
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
            luaL_error(L, "@throw nil!");
            break;
        }
        case LUA_TBOOLEAN:
        {
            BOOL value = lua_toboolean(L, 1);
            luaL_error(L,  "@throw BOOL:%s!", value ? "YES" : "NO");
            break;
        }
        case LUA_TLIGHTUSERDATA:
        {
            void* p = lua_touserdata(L, 1);
            luaL_error(L, "@throw pointer:%p!", p);
            break;
        }
        case LUA_TNUMBER:
        {
            lua_Number number = lua_tonumber(L, 1);
            luaL_error(L, "@throw number:%f!", number);
            break;
        }
        case LUA_TSTRING:
        {
            const char* str = lua_tostring(L, 1);
            luaL_error(L, "@throw string:%s!", str);
            break;
        }
        case LUA_TTABLE:
        {
            luaL_error(L, "@throw table!");
            break;
        }
        case LUA_TFUNCTION:
        {
            luaL_error(L, "@throw function!");
            break;
        }
        case LUA_TUSERDATA:
        {
            id obj = LuaObjCCheckObject(L, 1);
            luaL_error(L, "@throw object:%s!", [[obj description] UTF8String]);
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
    
    
    lua_rawgeti(L, LUA_REGISTRYINDEX, tryBlock);
    
    int status = lua_pcall(L, 0, 0, 0);
    if(status != LUA_OK)
    {
        const char* errorString = luaL_checkstring(L, 1);
        
        lua_rawgeti(L, LUA_REGISTRYINDEX, catchBlock);
        
        lua_pushstring(L, errorString);

        lua_remove(L, 1);

        status = lua_pcall(L, 1, 0, 0);
        if(status != LUA_OK)
        {
            //@throw again in @catch
            //
            if (finallyBlock != LuaObjCInvalidClouserID)
            {
                lua_rawgeti(L, LUA_REGISTRYINDEX, finallyBlock);
                lua_pcall(L, 0, 0, 0);                
            }
            
            lua_error(L);
            
        }else
        {
            if (finallyBlock != LuaObjCInvalidClouserID)
            {
                lua_rawgeti(L, LUA_REGISTRYINDEX, finallyBlock);
                status = lua_pcall(L, 0, 0, 0);
                if (status != LUA_OK)
                {
                    lua_error(L);
                }
            }
        }
    }
    
    return 1;
}


static int luaObjC_objc_NSFastEnumerate(lua_State *L)
{
    id obj = LuaObjCCheckObject(L, 1);
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

static CFMutableSetRef _LuaObjCLiteralStorage = NULL;

static int luaObjC_createLiteralArray(lua_State *L)
{
    int count = lua_gettop(L);
    
    NSMutableArray *array = [[[NSMutableArray alloc] init] autorelease];
    
    for (int iLooper = 1; iLooper < count + 1; ++iLooper)
    {
        [array addObject: LuaObjCCheckObject(L, iLooper)];
    }
    
    NSArray *value = [NSArray arrayWithArray: array];
    
    CFSetAddValue(_LuaObjCLiteralStorage, value);
    
    LuaObjCPushObject(L, value, true, false);
    
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
        [keys addObject: LuaObjCCheckObject(L, iLooper)];
        [values addObject: LuaObjCCheckObject(L, halfIndex + iLooper)];
    }
    
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjects: values
                                                       forKeys: keys];
    CFSetAddValue(_LuaObjCLiteralStorage, dict);
    
    [dict release];
    
    [keys release];
    [values release];
    
    LuaObjCPushObject(L, dict, true, false);
    
    return 1;
}

static inline int luaObjC_createConstantNumber(lua_State *L)
{
    NSNumber *number = [[NSNumber alloc] initWithDouble: lua_tonumber(L, 1)];
    CFSetAddValue(_LuaObjCLiteralStorage, number);
    [number release];
    
    LuaObjCPushObject(L, number, true, false);
    
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
    {"objc_NSFastEnumerate", luaObjC_objc_NSFastEnumerate},
    {"objc_createLiteralArray", luaObjC_createLiteralArray},
    {"objc_createLiteralDictionary", luaObjC_createLiteralDictionary},
    
    {"__NSConstantNumber", luaObjC_createConstantNumber},
    
    {NULL, NULL}
};

static const luaL_Reg luaObjC_resolveNameFunctions[] =
{
    {"resolveName", luaObjC_resolveName},
    
    {NULL, NULL},
};

static int _luaObjC_openRuntimeSupport(lua_State *L)
{
    luaL_newlib(L, luaObjC_resolveNameFunctions);
    return 1;
}

int LuaObjCOpenFoundationSupport(lua_State *L)
{
    if (!_LuaObjCLiteralStorage)
    {
        _LuaObjCLiteralStorage = CFSetCreateMutable(CFAllocatorGetDefault(), 64, &kCFTypeSetCallBacks);
    }
    
    LuaObjCClassInitialize(L);
    
    LuaObjCLoadGlobalFunctions(L, luaObjC_runtimeFunctions);
    
    luaL_requiref(L, "ObjC", _luaObjC_openRuntimeSupport, 1);
    
    static const char* s_ResolveNameMetaTable = "local _VMachineGlobalCache = {}"
    "setmetatable(_G, "
    "            {"
    "              __index = function(t, name) "
    "                           local value = _VMachineGlobalCache[name]"
    "                           if value then"
    "                              return value"
    "                           else"
    "                              value = ObjC.resolveName(t, name)"
    "                               _VMachineGlobalCache[name] = value"
    "                              return value"
    "                           end"
    "                         end"
    "             })";
    
	luaL_dostring(L, s_ResolveNameMetaTable);
    
    LuaObjCOpenNSObjectExtensionSupport(L);
    
    LuaObjCOpenProfileSupport(L);
    LuaInternalOpenBridgeFunctorSupport(L);
    
    LuaObjCOpenFoundation(L);
    
    return 1;
    
}