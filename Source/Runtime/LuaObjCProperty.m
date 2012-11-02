//
//  LuaObjCProperty.m
//  LuaIOS
//
//  Created by LeixSnake on 8/9/12.
//
//

#import "LuaObjCClass.h"

#import "LuaObjCAuxiliary.h"

#import "LuaObjCProperty.h"

#import <objc/runtime.h>

#pragma mark - helper functions


void LuaInternalDumpObjCClass(Class theClass)
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

int LuaInternalDumpLuaStack (lua_State *L)
{
    int nargs = lua_gettop(L);
    printf(" ----------------  Stack Dump ----------------\n" );
    
    int t = 0;
    
    for (int i = 1; i <= nargs; ++i)
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
    
    return 0;
}

#pragma mark - @property implementation

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
    const char* typeEncoding = LuaObjCTypeEncodingOfType(typeName);
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
    
    Class theClass = LuaInternalGetClass( className );
    
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
    
    NSMutableDictionary *setters = objc_getAssociatedObject(theClass, &__LuaObjC_KeyForSetterProperties);
    if (!setters)
    {
        setters = [[NSMutableDictionary alloc] init];
        
        objc_setAssociatedObject(theClass, &__LuaObjC_KeyForSetterProperties, setters, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [setters release];
    }
    
    NSMutableDictionary *getters = objc_getAssociatedObject(theClass, &__LuaObjC_KeyForGetterProperties);
    if (!getters)
    {
        getters = [[NSMutableDictionary alloc] init];
        
        objc_setAssociatedObject(theClass, &__LuaObjC_KeyForGetterProperties, getters, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [getters release];
        
    }
    
    [setters setObject: [NSString stringWithUTF8String: propertyName]
                forKey: [NSValue valueWithPointer: selectorOfSet]];
    
    [getters setObject: [NSString stringWithUTF8String: propertyName]
                forKey: [NSValue valueWithPointer: selectorOfGet]];
}

int LuaIMPAddPropertyToClass(struct lua_State *L)
{
    
    const char* className = LuaObjCCheckString(L, 1);
    const char* atomic = LuaObjCCheckString(L, 2);
    const char* ownershipName = LuaObjCCheckString(L, 3);
    const char* getterName = LuaObjCCheckString(L, 4);
    const char* setterName = LuaObjCCheckString(L, 5);
    const char* typeName = LuaObjCCheckString(L, 6);
    const char* propertyName = LuaObjCCheckString(L, 7);
    //const char* propertyInternalName = LuaObjCCheckString(L, 8);
    LuaIMPAddPropertyToClassOrigin(className, atomic, ownershipName, getterName,
                                   setterName, typeName, propertyName);
    
    return 0;
}