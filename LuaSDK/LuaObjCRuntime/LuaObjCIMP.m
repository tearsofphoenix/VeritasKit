//
//  LuaObjCIMP.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaObjCIMP.h"

#import "LuaObjCClass.h"

#import "LuaObjCInternal.h"

#import "LuaCGGeometry.h"

#import "LuaObjCAuxiliary.h"

#import "lauxlib.h"

#import <objc/runtime.h>

typedef enum
{
    LuaClassIMPFunction,
    LuaClassIMPProperty,
    LuaClassIMPUnknown,
}LuaClassIMPType;

static int luaObjC_getArgumentCountOfSelector(SEL sel)
{
    const char *str = [NSStringFromSelector(sel) cStringUsingEncoding: NSUTF8StringEncoding];
    int count = 0;
    while (str && *str) 
    {
        if (*str == ':')
        {
            ++count;
        }
        
        ++str;
    }
    
    return count;
}

static LuaClassIMPType __luaClass_IMP_preprocess(lua_State **returnedLuaState, id obj, SEL sel, va_list ap)
{
    LuaObjCClassRef classRef = luaObjC_getRegisteredClassByName(NSStringFromClass([obj class]));

    int clouserID = LuaObjCClassGetClouserIDOfSelector(classRef, sel);
    lua_State *luaState = LuaObjCClassGetLuaState(classRef);

    if (clouserID != LuaObjCInvalidClouserID)
    {        
        //preprare arguments
        //        
        if (returnedLuaState)
        {
            *returnedLuaState = luaState;
        }
        
        //push lua function into stack
        //
        lua_rawgeti(luaState, LUA_REGISTRYINDEX, clouserID);
        
        NSUInteger numberOfArgument = luaObjC_getArgumentCountOfSelector(sel);
        
        const char* methodTypeEncoding = method_getTypeEncoding(class_getInstanceMethod([obj class], sel));
        
        //jump over return type, id, SEL
        //
        const char* typeLooper = methodTypeEncoding + 1 + 1;
        
        //push arguments
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
                    lua_pushstring(luaState, sel_getName(sel));
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
        
        //preprare `self' for lua function call
        //
        luaObjC_setThisPointerInCurrentContextOfClass(luaState, obj);
        
        int status = lua_pcall(luaState, numberOfArgument, 1, 0);
        if (status != LUA_OK)
        {
            luaObjC_throwExceptionIfError(luaState);
        }
        
        //set `self' to `nil' after the lua function call
        //
        luaObjC_setThisPointerInCurrentContextOfClass(luaState, nil);
        
        return LuaClassIMPFunction;
    }
    /*if is property*/
    IMP imp = class_getMethodImplementation([obj class], sel);
    if (imp)
    {
        //TODO
        //
        luaObjC_pushNSObject(luaState, imp(obj, sel, luaObjC_checkNSObject(luaState, 1)));
        return LuaClassIMPProperty;
        
    }else
    {
        NSLog(@"call stack:%@", [NSThread callStackSymbols]);
        [obj doesNotRecognizeSelector: sel];        
        return LuaClassIMPUnknown;
    }
}

static NSInteger __luaClass_IMP_integer_return(id obj, SEL sel, ...)
{
    va_list ap;
    va_start(ap, sel);
    lua_State *L;
    LuaClassIMPType impType = __luaClass_IMP_preprocess(&L, obj, sel, ap);
    va_end(ap);
    
    switch (impType)
    {
        case LuaClassIMPUnknown:
        {
            printf("Error:%s line:%d\n", __FUNCTION__, __LINE__);
            break;
        }   
        case LuaClassIMPFunction:
        {
            NSInteger ret = 0;
            NSInteger returnIndexOfLuaFunction = -1;
            switch (lua_type(L, returnIndexOfLuaFunction)) 
            {
                case LUA_TNIL:
                case LUA_TNONE:
                {
                    break;
                }
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
        case LuaClassIMPProperty:
        {
            //TODO
            //
            return 0;
        }
        default:
        {
            break;
        }
    }
    return 0;
    
}

static CGFloat __luaClass_IMP_float_return(id obj, SEL sel, ...)
{
    va_list ap;
    va_start(ap, sel);
    lua_State *L;
    LuaClassIMPType impType = __luaClass_IMP_preprocess(&L, obj, sel, ap);
    va_end(ap);
    
    switch (impType)
    {
        case LuaClassIMPUnknown:
        {
            printf("Error:%s line:%d\n", __FUNCTION__, __LINE__);
            break;
        }   
        case LuaClassIMPFunction:
        {
            CGFloat ret = lua_tonumber(L, -1);
            return ret;
        }
        case LuaClassIMPProperty:
        {
            //TODO
            //
            return 0;
        }
        default:
        {
            break;
        }
    }
    return 0.0;
}

static void __luaClass_IMP_struct_return(void *returnAddress, id obj, SEL sel, ...)
{
    va_list ap;
    va_start(ap, sel);
    lua_State *L;
    LuaClassIMPType impType = __luaClass_IMP_preprocess(&L, obj, sel, ap);
    va_end(ap);
    
    switch (impType)
    {
        case LuaClassIMPUnknown:
        {
            printf("Error:%s line:%d\n", __FUNCTION__, __LINE__);
            break;
        }   
        case LuaClassIMPFunction:
        {
            //TODO
            //
        }
        case LuaClassIMPProperty:
        {
            //TODO
            //
        }
        default:
        {
            break;
        }
    }
}

static id __luaClass_IMP_gerneral(id obj, SEL sel, ...)
{
    va_list ap;
    va_start(ap, sel);
    lua_State *L;
    LuaClassIMPType impType = __luaClass_IMP_preprocess(&L, obj, sel, ap);
    va_end(ap);
    
    switch (impType)
    {
        case LuaClassIMPUnknown:
        {
            printf("Error:%s line:%d\n", __FUNCTION__, __LINE__);
            break;
        }   
        case LuaClassIMPFunction:
        {
            id ret = luaObjC_checkNSObject(L, -1);
            return ret;
        }
        case LuaClassIMPProperty:
        {
            //TODO
            //
        }
        default:
        {
            break;
        }
    }
    return nil;
}


static int luaObjC_luaClass_addMethod(lua_State *L, BOOL isObjectMethod)
{
    int argCount = lua_gettop(L);
    LuaObjCClassRef obj = lua_touserdata(L, 1);
    const char* selectorName = luaObjC_checkString(L, 2);
    const char* typeLooper = NULL;
    NSMutableString *typeEncoding = [[NSMutableString alloc] init];
    
    //return type
    //
    typeLooper = luaObjC_checkString(L, 3);
    const char* returnType = [_LuaObjC_getTypeEncodingOfType(typeLooper) UTF8String];
    
    [typeEncoding appendString: _LuaObjC_getTypeEncodingOfType(typeLooper)];
    [typeEncoding appendString: _LuaObjC_getTypeEncoding(@"id")];
    [typeEncoding appendString: _LuaObjC_getTypeEncoding(@"SEL")];
    
    for (int iLooper = 4; iLooper < argCount; ++iLooper)
    {
        typeLooper = luaObjC_checkString(L, iLooper);
        
        [typeEncoding appendString: _LuaObjC_getTypeEncodingOfType(typeLooper)];
    }
    
    Class theClass = LuaObjCClassGetObject(obj);
    
    if (!isObjectMethod) 
    {
        theClass = objc_getMetaClass(class_getName(theClass));
    }
    
    SEL sel = sel_registerName(selectorName);
    
    const char* typeEncodingCString = [typeEncoding UTF8String];
    
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
            if(!class_addMethod(theClass, sel, (IMP)__luaClass_IMP_integer_return, typeEncodingCString))
            {
                printf("fail to add class method:%s\n", (const char*)sel);
            }
            break;
        }
        case 'f':
        case 'd':
        {
            if(!class_addMethod(theClass, sel, (IMP)__luaClass_IMP_float_return, typeEncodingCString))
            {
                printf("Fail to class:%s registered method:%s typeencoding:%s return type:%s\n", [NSStringFromClass(theClass) UTF8String], (const char*)sel, typeEncodingCString, returnType);                
            }
            break;
        }
        case '{':
        {
            if(!class_addMethod(theClass, sel, (IMP)__luaClass_IMP_struct_return, typeEncodingCString))
            {
                printf("Fail to class:%s registered method for SEL:%s typeencoding:%s\n", [NSStringFromClass(theClass) UTF8String], (const char*)sel, typeEncodingCString);                
            }
            break;
        }
        default:
        {
            if(!class_addMethod(theClass, sel, __luaClass_IMP_gerneral, typeEncodingCString))
            {
                printf("Fail, class:%s registered method:%s typeencoding:%s return type:%s\n", [NSStringFromClass(theClass) UTF8String], (const char*)sel, typeEncodingCString, returnType);                
            }
            break;
        }
            
    }
    LuaObjCClassAddClouserIDForSelector(obj, luaL_ref(L, LUA_REGISTRYINDEX), selectorName);

    [typeEncoding release];
    
    return 0;
}


int luaObjC_luaClass_addObjectMethod(lua_State *L)
{
    return luaObjC_luaClass_addMethod(L, YES);
}

int luaObjC_luaClass_addClassMethod(lua_State *L)
{
    return luaObjC_luaClass_addMethod(L, NO);
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
    char* propertyName = strndup(selectorString + strlen("set"), strlen(selectorString) - strlen("set") - strlen(":"));
    
    propertyName[0] = tolower(propertyName[0]);
    
    Ivar ivar = class_getInstanceVariable([obj class], propertyName);
    id oldValue = object_getIvar(obj, ivar);
    if (![oldValue isEqual: newValue]) 
    {
        object_setIvar(obj, ivar, newValue);
    }
    
    //why this? will cause a crash
    //free(propertyName);
}

#pragma mark - add default Ivar

void _luaObjC_addDefaultIvarToNewClass(Class theNewClass)
{
    //lua_State
    //
    class_addIvar(theNewClass, "luaState", sizeof(lua_State*), log2(sizeof(lua_State*)), @encode(lua_State*));
    
    SEL getterName = @selector(luaState);
    SEL setterName = @selector(setLuaState:);
    
    class_addMethod(theNewClass, getterName, (IMP)__luaObjc_PropertyGetter, "^@:");
    class_addMethod(theNewClass, setterName, (IMP)__luaObjc_PropertySetter, "v@:^");
    //lua_Class
    class_addIvar(theNewClass, "luaClass", sizeof(id), log2(sizeof(id)), @encode(id));
    
    getterName = @selector(luaClass);
    setterName = @selector(setLuaClass:);
    
    class_addMethod(theNewClass, getterName, (IMP)__luaObjc_PropertyGetter, "^@:");
    class_addMethod(theNewClass, setterName, (IMP)__luaObjc_PropertySetter, "v@:^");
    
}

static Class luaObjC_getLuaClassByName(NSString *className)
{
    LuaObjCClassRef classRef = luaObjC_getRegisteredClassByName(className);
    return LuaObjCClassGetObject(classRef);
}

void luaObjC_addPropertyToClassOrigin(const char* className, const char* atomic, const char* ownershipName,
                                      const char* getterName, const char* setterName, const char* typeName,
                                      const char* propertyName)
{
    objc_property_attribute_t atomicAttribute = {"", ""};
    if (!strcmp(atomic, "nonatomic"))
    {
        atomicAttribute.name = "N";
    }
    
    objc_property_attribute_t type = { "T", "@" };
    type.value =  [_LuaObjC_getTypeEncodingOfType(typeName) UTF8String];
    
    
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
    
    Class theClass = luaObjC_getLuaClassByName([NSString stringWithUTF8String: className]);
    
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
int luaObjC_addPropertyToClass(lua_State *L)
{
    const char* className = luaObjC_checkString(L, 1);
    const char* atomic = luaObjC_checkString(L, 2);
    const char* ownershipName = luaObjC_checkString(L, 3);
    const char* getterName = luaObjC_checkString(L, 4);
    const char* setterName = luaObjC_checkString(L, 5);
    const char* typeName = luaObjC_checkString(L, 6);
    const char* propertyName = luaObjC_checkString(L, 7);
    //const char* propertyInternalName = luaObjC_checkString(L, 8);
    luaObjC_addPropertyToClassOrigin(className, atomic, ownershipName, getterName, 
                                     setterName, typeName, propertyName);
     
    return 0;
}
