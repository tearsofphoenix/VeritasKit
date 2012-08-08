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
    
    int clouserID = LuaClassGetClouserIDOfSelector(theClass, sel);
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
                case 'c':
                case 'i':
                case 's':
                case 'l':
                case 'q':
                case 'C':
                case 'I':
                case 'S':
                case 'L':
                case 'Q':
                case 'B':
                {
                    NSInteger integerPara = va_arg(ap, NSInteger);
                    lua_pushinteger(luaState, integerPara);
                    break;
                }
                case 'f':
                case 'd':
                {
                    CGFloat doublePara = (CGFloat)va_arg(ap, double);
                    lua_pushnumber(luaState, doublePara);
                    break;
                }
                case '*':
                {
                    const char *str = va_arg(ap, const char*);
                    lua_pushstring(luaState, str);
                    break;
                }
                case '@':
                {
                    id argLooper = va_arg(ap,  id);
                    luaObjC_pushNSObject(luaState, argLooper);
                    break;
                }
                case ':':
                {
                    SEL sel = va_arg(ap, SEL);
                    luaObjC_pushSelector(luaState, sel);
                    break;
                }
                case '{':
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
                case '^':
                case '[':
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

static NSInteger __luaClass_IMP_integer_return(id obj, SEL sel, ...)
{
    va_list ap;
    va_start(ap, sel);
    lua_State *L;
    __luaClass_IMP_preprocess(&L, obj, sel, ap);
    va_end(ap);
    
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
            break;
        }
    }
    return ret;
    
}

static CGFloat __luaClass_IMP_float_return(id obj, SEL sel, ...)
{
    va_list ap;
    va_start(ap, sel);
    lua_State *L;
    __luaClass_IMP_preprocess(&L, obj, sel, ap);
    va_end(ap);
    
    CGFloat ret = lua_tonumber(L, -1);
    return ret;
}

static void __luaClass_IMP_struct_return(id obj, SEL sel, ...)
{
    va_list ap;
    va_start(ap, sel);
    lua_State *L;
    __luaClass_IMP_preprocess(&L, obj, sel, ap);
    va_end(ap);
    
    //store struct type as userdata type
    //
    void *returnData = lua_touserdata(L, -1);
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
    lua_pushlightuserdata(L, returnData);
}

static id __luaClass_IMP_gerneral(id obj, SEL sel, ...)
{
    va_list ap;
    va_start(ap, sel);
    lua_State *L;
    __luaClass_IMP_preprocess(&L, obj, sel, ap);
    va_end(ap);
    
    id ret = luaObjC_checkNSObject(L, -1);
    return ret;
}


static int luaObjC_class_addMethod(lua_State *L, BOOL isObjectMethod)
{
    int argCount = lua_gettop(L);

    NSString * className = [NSString stringWithUTF8String: lua_tostring(L, 1)];
    const char* selectorName = luaObjC_checkString(L, 2);
    const char* typeLooper = NULL;
    NSMutableString *typeEncoding = [[NSMutableString alloc] init];
    
    //printf("add method: %s\n", selectorName);
    //return type
    //
    typeLooper = luaObjC_checkString(L, 3);
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
        case 'c':
        case 'i':
        case 's':
        case 'l':
        case 'q':
        case 'C':
        case 'I':
        case 'S':
        case 'L':
        case 'Q':
        case 'B':
        {
            imp = (IMP)__luaClass_IMP_integer_return;
            break;
        }
        case 'f':
        case 'd':
        {
            imp = (IMP)__luaClass_IMP_float_return;
            break;
        }
        case '{':
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

    LuaClassAddClouserIDForSelector(theClass, luaL_ref(L, LUA_REGISTRYINDEX), selectorName);
    
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

#pragma mark - property

static id __luaObjc_PropertyGetter(id obj, SEL selector)
{
    Ivar ivar = class_getInstanceVariable([obj class], (const char *)selector);
    return object_getIvar(obj, ivar);
}

static void __luaObjc_PropertySetter(id obj, SEL selector, id newValue)
{
    const char *selectorString = (const char*)selector;
    size_t length = strlen(selectorString) - strlen("set") - strlen(":");
    char *propertyName = malloc(sizeof(char) * (length + 1));
    propertyName[length] = 0;
    strncpy(propertyName, selectorString + strlen("set"), length);
    propertyName[0] = tolower(propertyName[0]);
    
    Ivar ivar = class_getInstanceVariable([obj class], propertyName);
    id oldValue = object_getIvar(obj, ivar);
    if (![oldValue isEqual: newValue])
    {
        object_setIvar(obj, ivar, newValue);
    }
    
    //why this? will cause a crash
    free(propertyName);
}

static void LuaIMPAddPropertyToClassOrigin(const char* className, const char* atomic, const char* ownershipName,
                                           const char* getterName, const char* setterName, const char* typeName,
                                           const char* propertyName)
{
    objc_property_attribute_t atomicAttribute = {"", ""};
    if (!strcmp(atomic, "nonatomic"))
    {
        atomicAttribute.name = "N";
    }
    
    objc_property_attribute_t type = { "T", "@" };
    type.value =  [LuaObjCTypeEncodingOfType(typeName) UTF8String];
    
    
    objc_property_attribute_t ownership = { "", "" }; // C = copy, & = retain
    if (!strcmp(ownershipName, "copy"))
    {
        ownership.name = "C";
    }else if (!strcmp(ownershipName, "retain"))
    {
        ownership.name = "&";
    }
    
    objc_property_attribute_t backingivar  = {"V", propertyName};
    objc_property_attribute_t attrs[] = {atomicAttribute, type, ownership, backingivar};
    
    Class theClass = LuaClassGetRegisteredClassByName([NSString stringWithUTF8String: className]);
    
    if(!class_addIvar(theClass, propertyName, sizeof(id), log2(sizeof(id)), @encode(id)))
    {
        printf("Failed to Add Ivar: %s to Class:%s!\n", propertyName, className);
    }
    
    if(!class_addProperty(theClass, propertyName, attrs, 4))
    {
        printf("Failed add Property:%s to Class:%s OK!\n", propertyName, className);
    }
    
    SEL selectorOfGet = sel_registerName(getterName);
    SEL selectorOfSet = sel_registerName(setterName);
    
    if(!class_addMethod(theClass, selectorOfGet, (IMP)__luaObjc_PropertyGetter, "@@:"))
    {
        printf("Failed add Property Getter:%s to Class:%s OK!\n", (const char*)selectorOfGet, className);
    }
    if(!class_addMethod(theClass, selectorOfSet, (IMP)__luaObjc_PropertySetter, "v@:@"))
    {
        printf("Failed add Property Setter:%s to Class:%s OK!\n", (const char*)selectorOfSet, className);
    }
    
}

int LuaIMPAddPropertyToClass(lua_State *L)
{
    const char* className = luaObjC_checkString(L, 1);
    const char* atomic = luaObjC_checkString(L, 2);
    const char* ownershipName = luaObjC_checkString(L, 3);
    const char* getterName = luaObjC_checkString(L, 4);
    const char* setterName = luaObjC_checkString(L, 5);
    const char* typeName = luaObjC_checkString(L, 6);
    const char* propertyName = luaObjC_checkString(L, 7);
    //const char* propertyInternalName = luaObjC_checkString(L, 8);
    LuaIMPAddPropertyToClassOrigin(className, atomic, ownershipName, getterName,
                                   setterName, typeName, propertyName);
    
    return 0;
}
