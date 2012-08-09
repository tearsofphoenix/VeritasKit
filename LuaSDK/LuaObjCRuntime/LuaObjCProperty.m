//
//  LuaObjCProperty.m
//  LuaIOS
//
//  Created by LeixSnake on 8/9/12.
//
//

#import "LuaObjCProperty.h"

#import "LuaObjCBlock.h"

#import "LuaObjCClass.h"

#import "LuaObjCInternal.h"

#import "LuaCGGeometry.h"

#import "LuaObjCAuxiliary.h"

#import "lauxlib.h"

#import "LuaObjCTypeEncoding.h"

#import <objc/runtime.h>

//keys for setter & getter properties of the Class defined by Objective-Lua
//
static char __LuaObjC_KeyForSetterProperties;

static char __LuaObjC_KeyForGetterProperties;

const char *LuaClassGetPropertyNameWithGetter(Class theClass, SEL getter)
{
    NSMutableDictionary *getters = objc_getAssociatedObject(theClass, &__LuaObjC_KeyForGetterProperties);
    NSString *propertyName = [getters objectForKey: [NSValue valueWithPointer: getter]];
    return [propertyName UTF8String];
}

const char *LuaClassGetPropertyNameWithSetter(Class theClass, SEL setter)
{
    NSMutableDictionary *setters = objc_getAssociatedObject(theClass, &__LuaObjC_KeyForSetterProperties);
    NSString *propertyName = [setters objectForKey: [NSValue valueWithPointer: setter]];
    return [propertyName UTF8String];
}

#pragma mark - property

static id __luaObjc_PropertyGetter(id obj, SEL selector)
{
    Class objClass = [obj class];
    const char *propertyName = LuaClassGetPropertyNameWithGetter(objClass, selector);
    Ivar ivar = class_getInstanceVariable(objClass, propertyName);
    return object_getIvar(obj, ivar);
}

//TODO
//
static void __luaObjc_PropertySetter(id obj, SEL selector, id newValue)
{
    Class objClass = [obj class];
    const char *propertyName = LuaClassGetPropertyNameWithSetter(objClass, selector);
    
    Ivar ivar = class_getInstanceVariable(objClass, propertyName);
    id oldValue = object_getIvar(obj, ivar);
    if (![oldValue isEqual: newValue])
    {
        object_setIvar(obj, ivar, newValue);
    }
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
    
    NSUInteger typeSize;
    NSGetSizeAndAlignment(type.value, &typeSize, NULL);
    
    if(!class_addIvar(theClass, propertyName, typeSize, log2(typeSize), type.value))
    {
        printf("Failed to Add Ivar: %s to Class:%s!\n", propertyName, className);
    }
    
    if(!class_addProperty(theClass, propertyName, attrs, sizeof(attrs) / sizeof(attrs[0])))
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
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, (^
                               {
                                   NSMutableDictionary *setters = [[NSMutableDictionary alloc] init];
                                   
                                   objc_setAssociatedObject(theClass, &__LuaObjC_KeyForSetterProperties, setters, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                                   
                                   [setters release];
                                   
                                   
                                   NSMutableDictionary *getters = [[NSMutableDictionary alloc] init];
                                   
                                   objc_setAssociatedObject(theClass, &__LuaObjC_KeyForGetterProperties, getters, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                                   
                                   [getters release];
                               }));
    
    NSMutableDictionary *setters = objc_getAssociatedObject(theClass, &__LuaObjC_KeyForSetterProperties);
    [setters setObject: [NSString stringWithUTF8String: propertyName]
                forKey: [NSValue valueWithPointer: selectorOfSet]];
    
    NSMutableDictionary *getters = objc_getAssociatedObject(theClass, &__LuaObjC_KeyForGetterProperties);
    [getters setObject: [NSString stringWithUTF8String: propertyName]
                forKey: [NSValue valueWithPointer: selectorOfGet]];
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