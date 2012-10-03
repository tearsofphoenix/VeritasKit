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

static inline const char *LuaClassGetPropertyNameWithGetter(Class theClass, SEL getter)
{
    NSMutableDictionary *getters = objc_getAssociatedObject(theClass, &__LuaObjC_KeyForGetterProperties);
    NSString *propertyName = [getters objectForKey: [NSValue valueWithPointer: getter]];
    return [propertyName UTF8String];
}

static inline const char *LuaClassGetPropertyNameWithSetter(Class theClass, SEL setter)
{
    NSMutableDictionary *setters = objc_getAssociatedObject(theClass, &__LuaObjC_KeyForSetterProperties);
    NSString *propertyName = [setters objectForKey: [NSValue valueWithPointer: setter]];
    return [propertyName UTF8String];
}

#pragma mark - property
//getter
#define __LuaObjC_propertyGetterWithType(Type, obj, selector)     Class objClass = object_getClass(obj);\
                                                                const char *propertyName = LuaClassGetPropertyNameWithGetter(objClass, selector);\
                                                                Type returnValue;\
                                                                 object_getInstanceVariable(obj, propertyName, (void **)&returnValue);\
                                                                 return returnValue;

static id __luaObjc_PropertyGetter(id obj, SEL selector)
{
    __LuaObjC_propertyGetterWithType(id, obj, selector);
}

static NSInteger __luaObjC_propertyGetterIntegerReturn(id obj, SEL selector)
{
    Class objClass = object_getClass(obj);
    const char *propertyName = LuaClassGetPropertyNameWithGetter(objClass, selector);
    NSInteger returnValue = 0;
    
    Ivar ivar = class_getInstanceVariable(objClass, propertyName);
    if (ivar)
    {
        returnValue = *((NSInteger *)obj + ivar_getOffset(ivar));
    }
    
    return returnValue;
}

static CGFloat __luaObjC_propertyGetterFloatReturn(id obj, SEL selector)
{
    Class objClass = object_getClass(obj);
    const char *propertyName = LuaClassGetPropertyNameWithGetter(objClass, selector);
    CGFloat returnValue = 0.0;

    Ivar ivar = class_getInstanceVariable(objClass, propertyName);
    if (ivar)
    {
        returnValue = *((CGFloat *)obj + ivar_getOffset(ivar));
    }

    return returnValue;

    //__LuaObjC_propertyGetterWithType(CGFloat, obj, selector);
}

#undef __LuaObjC_propertyGetterWithType

//TODO
//
#define __LuaObjC_propertySetterWithType(Type, obj, selector, newValue)     Class objClass = object_getClass(obj);\
                                                                  const char *propertyName = LuaClassGetPropertyNameWithSetter(objClass, selector);\
                                                                  Type value = newValue;\
                                                                  object_setInstanceVariable(obj, propertyName, &value);

//TODO
//
static void __luaObjc_PropertySetter(id obj, SEL selector, id newValue)
{
//    Class objClass = object_getClass(obj);
//    const char *propertyName = LuaClassGetPropertyNameWithSetter(objClass, selector);
//    object_setInstanceVariable(obj, propertyName, newValue);
}

static void __luaObjC_PropertySetter_floatValue(id obj, SEL selector, CGFloat newValue)
{
    Class objClass = object_getClass(obj);
    const char *propertyName = LuaClassGetPropertyNameWithSetter(objClass, selector);
    Ivar ivar = class_getInstanceVariable(objClass, propertyName);
    if (ivar)
    {
        CGFloat *value = (CGFloat *)obj + ivar_getOffset(ivar);
        *value = newValue;
    }
    //__LuaObjC_propertySetterWithType(CGFloat, obj, selector, newValue);
}

static void __luaObjC_PropertySetter_integerValue(id obj, SEL selector, NSInteger newValue)
{
    Class objClass = object_getClass(obj);
    const char *propertyName = LuaClassGetPropertyNameWithSetter(objClass, selector);
    Ivar ivar = class_getInstanceVariable(objClass, propertyName);
    if (ivar)
    {
        NSInteger *value = (NSInteger *)obj + ivar_getOffset(ivar);
        *value = newValue;
    }
}

#undef __LuaObjC_propertySetterWithType

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
    const char* typeEncoding = [LuaObjCTypeEncodingOfType(typeName) UTF8String];
    type.value =  typeEncoding;
    
    
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
    
    if(!class_addIvar(theClass, propertyName, typeSize, log2(typeSize), typeEncoding))
    {
        printf("Failed to Add Ivar: %s to Class:%s!\n", propertyName, className);
    }
    
    if(!class_addProperty(theClass, propertyName, attrs, sizeof(attrs) / sizeof(attrs[0])))
    {
        printf("Failed add Property:%s to Class:%s OK!\n", propertyName, className);
    }
    
    SEL selectorOfGet = sel_registerName(getterName);
    SEL selectorOfSet = sel_registerName(setterName);
    
    IMP getterIMP = NULL;
    IMP setterIMP = NULL;
    
    switch (*typeEncoding)
    {
        case _C_ID:
        case _C_CLASS:
        {
            getterIMP = (IMP)__luaObjc_PropertyGetter;
            setterIMP = (IMP)__luaObjc_PropertySetter;
            break;
        }
        case _C_FLT:
        case _C_DBL:
        {
            getterIMP = (IMP)__luaObjC_propertyGetterFloatReturn;
            setterIMP = (IMP)__luaObjC_PropertySetter_floatValue;
            break;
        }
        default:
        {
            getterIMP = (IMP)__luaObjC_propertyGetterIntegerReturn;
            setterIMP = (IMP)__luaObjC_PropertySetter_integerValue;
            break;
        }
    }
    
    if(!class_addMethod(theClass, selectorOfGet, getterIMP, [[NSString stringWithFormat: @"%s@:", typeEncoding] UTF8String]))
    {
        printf("Failed add Property Getter:%s to Class:%s OK!\n", (const char*)selectorOfGet, className);
    }
    
    if(!class_addMethod(theClass, selectorOfSet, setterIMP, [[NSString stringWithFormat: @"v@:%s", typeEncoding] UTF8String]))
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