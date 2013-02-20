//
//  VMKRuntime.m
//  LuaIOS
//
//  Created by tearsofphoenix on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VMKRuntime.h"

#import <objc/runtime.h>

#import "VMKClass.h"

#import "VMKMessage.h"

#import "VMKProperty.h"

#import "LuaCGGeometry.h"

#import "VMKAuxiliary.h"

#import "VMKProfile.h"

#import "LuaFoundation.h"

#import "LuaNSRange.h"

#import "VMKBridgeService.h"

#import "VMKBridgeFunctor.h"

#import "VMKObject.h"

#import "NSString+VMKIndex.h"

#import "NSArray+VMKIndex.h"

#pragma mark - block support


static CFMutableDictionaryRef __LuaObjC_clouserBlockDictionary = NULL;

static inline void VMKBlockSupportInitialize(void)
{
    __LuaObjC_clouserBlockDictionary = CFDictionaryCreateMutable(NULL, 1024, &kCFTypeDictionaryKeyCallBacks, NULL);
}

static inline void luaObjC_addClosureIDForBlock(LuaClosureType clouserID, id block)
{
    if (!__LuaObjC_clouserBlockDictionary)
    {
        VMKBlockSupportInitialize();
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
    return VMKInvalidClouserID;
}

#pragma mark - class support

static int luaObjC_createClassWithSuperClass(VMKLuaStateRef state)
{
    const char *newClassName = lua_tostring(state, 1);
    const char *superClassName = lua_tostring(state, 2);
    
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
        VMKPushObject(state, registeredClass, true, true);
        
    }else
    {
        Class theNewClass = objc_allocateClassPair(superClass, newClassName, 0);
        
        LuaInternalAllocateClass(state, theNewClass, newClassName);
        VMKPushObject(state, theNewClass, true, true);
    }
    return 1;
}


static int luaObjC_createNSSelector(VMKLuaStateRef state)
{
    //deal SEL as c-string
    //
    const char *selectorName = lua_tostring(state, 1);
    lua_pushstring(state, selectorName);
    
    return 1;
}

static int luaObjC_getProtocol(VMKLuaStateRef state)
{
    const char *protocolName = lua_tostring(state, 1);
    lua_pushlightuserdata(state, objc_getProtocol(protocolName));
    
    return 1;
}

static int luaObjC_retainBeforeReturnFromAutoreleasePool(VMKLuaStateRef state)
{
    VMKObjectRef objRef = lua_touserdata(state, 1);
    if (objRef)
    {
        //is NSObject instance
        CFRetain(VMKObjectGetObject(objRef));
    }
    return 1;
}

typedef enum
{
    VMKIntegerType,
    VMKFloatType,
    VMKBOOLType,
    VMKPointerType,
    VMKCGRectType,
    VMKCGPointType,
    VMKCGSizeType,
    VMKNSRangeType,
}VMKValueType;

static VMKValueType luaObjCGetTypeOfTypeName(const char* typeName)
{
    if (strchr(typeName, '*'))
    {
        return VMKPointerType;
    }
    if (!strcmp(typeName, "CGFloat")
        || !strcmp(typeName, "float")
        || !strcmp(typeName, "double")
        || !strcmp(typeName, "NSTimeInterval")
        )
    {
        return VMKFloatType;
    }
    if (!strcmp(typeName, "BOOL"))
    {
        return VMKBOOLType;
    }
    
    return VMKIntegerType;
}

static int luaObjC_createBlockObject(VMKLuaStateRef state)
{
    int argumentTypesCount = lua_gettop(state) - 1;
    LuaClosureType clouserID = luaL_ref(state, LUA_REGISTRYINDEX);
    const char** argumentTypes = NULL;
    
    if (argumentTypesCount > 0)
    {
        argumentTypes = malloc(argumentTypesCount * sizeof(char*));
        
        for (int iLooper = 0; iLooper < argumentTypesCount; ++iLooper)
        {
            argumentTypes[iLooper] = lua_tostring(state, iLooper + 1);
        }
        
    }
    
    void (^block)(id selfObject, ...) = (^(id selfObject, ...)
                                         {
                                             lua_rawgeti(state, LUA_REGISTRYINDEX, clouserID);
                                             
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
                                                         case VMKBOOLType:
                                                         {
                                                             BOOL boolArg = va_arg(ap, int);
                                                             lua_pushboolean(state, boolArg);
                                                             break;
                                                         }
                                                         case VMKFloatType:
                                                         {
                                                             CGFloat floatArg = va_arg(ap, double);
                                                             lua_pushnumber(state, floatArg);
                                                             break;
                                                         }
                                                         case VMKPointerType:
                                                         {
                                                             void *pointerArg = va_arg(ap, void*);
                                                             lua_pushlightuserdata(state, pointerArg);
                                                             break;
                                                         }
                                                         case VMKCGRectType:
                                                         {
                                                             CGRect rect = va_arg(ap, CGRect);
                                                             VMKPushCGRect(state, rect);
                                                             break;
                                                         }
                                                         case VMKCGSizeType:
                                                         {
                                                             CGSize size = va_arg(ap, CGSize);
                                                             VMKPushCGSize(state, size);
                                                             break;
                                                         }
                                                         case VMKCGPointType:
                                                         {
                                                             CGPoint point = va_arg(ap, CGPoint);
                                                             VMKPushCGPoint(state, point);
                                                             break;
                                                         }
                                                         case VMKNSRangeType:
                                                         {
                                                             NSRange range = va_arg(ap, NSRange);
                                                             VMKPushNSRange(state, range);
                                                             break;
                                                         }
                                                         default:
                                                         {
                                                             NSInteger intArg = va_arg(ap, NSInteger);
                                                             lua_pushinteger(state, intArg);
                                                             break;
                                                         }
                                                     }
                                                 }
                                                 va_end(ap);
                                             }
                                             
                                             if(lua_pcall(state, argumentTypesCount, 0, 0) != LUA_OK)
                                             {
                                                 lua_error(state);
                                             }
                                             //check return object
                                         });
    
    block = Block_copy(block);
    
    luaObjC_addClosureIDForBlock(clouserID, block);
    
    VMKPushObject(state, block, true, false);
    
    return 1;
}

static int luaObjC_registerClassPair(VMKLuaStateRef state)
{
    const char* className = VMKCheckString(state, 1);
    
    Class theClass = LuaInternalGetClass(className);
    
    if (theClass)
    {
        objc_registerClassPair(theClass);
    }
    
    return 0;
}

static int luaObjC_classPredeclearation(VMKLuaStateRef state)
{
    int argCount = lua_gettop(state);
    
    for (int iLooper = 1; iLooper < argCount + 1; ++iLooper)
    {
        VMKAddEncodingForPredeclearClass(lua_tostring(state, iLooper));
    }
    return 0;
}

static int luaObjC_import_file(VMKLuaStateRef state)
{
    const char *name = lua_tostring(state, 1);
    
    [[VMKBridgeService sharedService] importFramework: @(name)];
    
    lua_getfield(state, LUA_REGISTRYINDEX, "require");
    
    NSString *realPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingFormat: @"/%s", name];
    lua_pushstring(state, [realPath UTF8String]);
    
    //just ignore error here
    //
    lua_pcall(state, 1, 1, 0);
    
    return 1;
}

static int luaObjC_resolveName(VMKLuaStateRef state)
{
    const char* name = lua_tostring(state, 2);
    
    Class theClass = objc_getClass(name);
    
    if (theClass)
    {
        VMKPushObject(state, theClass, false, true);
        
    }else
    {
        //this maybe a function, such as glEnable(...)
        //
        [[VMKBridgeService sharedService] resolveName: @(name)
                                            intoState: state];
    }
    
    return 1;
}


static int luaObjC_objc_throw(VMKLuaStateRef state)
{
    switch (lua_type(state, 1))
    {
        case LUA_TNIL:
        case LUA_TNONE:
        {
            luaL_error(state, "@throw nil!");
            break;
        }
        case LUA_TBOOLEAN:
        {
            Boolean value = lua_toboolean(state, 1);
            luaL_error(state,  "@throw BOOL:%s!", value ? "YES" : "NO");
            break;
        }
        case LUA_TLIGHTUSERDATA:
        {
            void* p = lua_touserdata(state, 1);
            luaL_error(state, "@throw pointer:%p!", p);
            break;
        }
        case LUA_TNUMBER:
        {
            lua_Number number = lua_tonumber(state, 1);
            luaL_error(state, "@throw number:%f!", number);
            break;
        }
        case LUA_TSTRING:
        {
            const char* str = lua_tostring(state, 1);
            luaL_error(state, "@throw string:%s!", str);
            break;
        }
        case LUA_TTABLE:
        {
            luaL_error(state, "@throw table!");
            break;
        }
        case LUA_TFUNCTION:
        {
            luaL_error(state, "@throw function!");
            break;
        }
        case LUA_TUSERDATA:
        {
            id obj = VMKCheckObject(state, 1);
            luaL_error(state, "@throw object:%s!", [[obj description] UTF8String]);
            break;
        }
        case LUA_TTHREAD:
        {
            luaL_error(state, "@throw thread value!");
            break;
        }
        default:
        {
            luaL_error(state, "@throw (unknown) type!");
            break;
        }
    }
    
    return 0;
}

static int luaObjC_objc_tryCatchFinally(VMKLuaStateRef state)
{
    int finallyBlock = luaL_ref(state, LUA_REGISTRYINDEX);
    int catchBlock = luaL_ref(state, LUA_REGISTRYINDEX);
    int tryBlock = luaL_ref(state, LUA_REGISTRYINDEX);
    
    
    lua_rawgeti(state, LUA_REGISTRYINDEX, tryBlock);
    
    int status = lua_pcall(state, 0, 0, 0);
    if(status != LUA_OK)
    {
        const char* errorString = luaL_checkstring(state, 1);
        
        lua_rawgeti(state, LUA_REGISTRYINDEX, catchBlock);
        
        lua_pushstring(state, errorString);
        
        lua_remove(state, 1);
        
        status = lua_pcall(state, 1, 0, 0);
        if(status != LUA_OK)
        {
            //@throw again in @catch
            //
            if (finallyBlock != VMKInvalidClouserID)
            {
                lua_rawgeti(state, LUA_REGISTRYINDEX, finallyBlock);
                lua_pcall(state, 0, 0, 0);
            }
            
            lua_error(state);
            
        }else
        {
            if (finallyBlock != VMKInvalidClouserID)
            {
                lua_rawgeti(state, LUA_REGISTRYINDEX, finallyBlock);
                status = lua_pcall(state, 0, 0, 0);
                if (status != LUA_OK)
                {
                    lua_error(state);
                }
            }
        }
    }
    
    return 1;
}


static int luaObjC_objc_NSFastEnumerate(VMKLuaStateRef state)
{
    id obj = VMKCheckObject(state, 1);
    if (obj)
    {
        //if the object does not support fast enumerate, it will cause a runtime exception
        //
        lua_CFunction enumerator = [obj luaEnumerator];
        lua_pushcclosure(state, enumerator, 1);
        return 1;
    }
    return 0;
}

#pragma mark - literal object support, i.e. @{}, @[], @1

static CFMutableSetRef _LuaObjCLiteralStorage = NULL;

static int luaObjC_createLiteralArray(VMKLuaStateRef state)
{
    int count = lua_gettop(state);
    
    CFMutableArrayRef array = CFArrayCreateMutable(NULL, 0, &kCFTypeArrayCallBacks);
    
    for (int iLooper = 1; iLooper < count + 1; ++iLooper)
    {
        CFArrayAppendValue(array, VMKCheckObject(state, iLooper));
    }
    
    CFArrayRef value = CFArrayCreateCopy(CFGetAllocator(array), array);
    
    CFRelease(array);
    
    CFSetAddValue(_LuaObjCLiteralStorage, value);
    
    CFMakeCollectable(value);
    
    VMKPushObject(state, (id)value, true, false);
    
    return 1;
}

static int luaObjC_createLiteralDictionary(VMKLuaStateRef state)
{
    int count = lua_gettop(state);
    int halfIndex = count / 2;
    
    CFMutableDictionaryRef dict = CFDictionaryCreateMutable(NULL, halfIndex, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    
    for (int iLooper = 1; iLooper < halfIndex + 1; ++iLooper)
    {
        CFDictionaryAddValue(dict, VMKCheckObject(state, iLooper), VMKCheckObject(state, halfIndex + iLooper));
    }
    
    CFDictionaryRef result = CFDictionaryCreateCopy(CFGetAllocator(dict), dict);
    
    CFRelease(dict);
    
    CFSetAddValue(_LuaObjCLiteralStorage, result);
    
    CFMakeCollectable(result);
    
    VMKPushObject(state, (id)result, true, false);
    
    return 1;
}

static inline int luaObjC_createConstantNumber(VMKLuaStateRef state)
{
    lua_Number value = lua_tonumber(state, 1);
    
    CFNumberRef number = CFNumberCreate(NULL, kCFNumberDoubleType, &value);
    
    CFSetAddValue(_LuaObjCLiteralStorage, number);
    
    CFMakeCollectable(number);
    
    VMKPushObject(state, (id)number, true, false);
    
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
    {"objc_msgSendSuper", VMKMessageSendSuper},
    {"objc_msgSend", VMKMessageSend},
    
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

static int _luaObjC_openRuntimeSupport(VMKLuaStateRef state)
{
    luaL_newlib(state, luaObjC_resolveNameFunctions);
    return 1;
}

int VMKOpenFoundationSupport(VMKLuaStateRef state)
{
    if (!_LuaObjCLiteralStorage)
    {
        _LuaObjCLiteralStorage = CFSetCreateMutable(NULL, 64, &kCFTypeSetCallBacks);
    }
    
    VMKClassInitialize(state);
    
    VMKLoadGlobalFunctions(state, luaObjC_runtimeFunctions);
    
    luaL_requiref(state, "ObjC", _luaObjC_openRuntimeSupport, 1);
    
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
    
	luaL_dostring(state, s_ResolveNameMetaTable);
    
    VMKOpenNSObjectExtensionSupport(state);
    
    VMKOpenProfileSupport(state);
    LuaInternalOpenBridgeFunctorSupport(state);
    
    VMKOpenFoundation(state);
    
    return 1;
    
}