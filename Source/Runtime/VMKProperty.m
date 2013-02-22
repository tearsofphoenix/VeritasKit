//
//  VMKProperty.m
//  LuaIOS
//
//  Created by LeixSnake on 8/9/12.
//
//

#include "VMKClass.h"
#include "VMKAuxiliary.h"
#include "VMKProperty.h"

#include <objc/runtime.h>
#include <CoreFoundation/CoreFoundation.h>

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

int LuaInternalDumpLuaStack (VMKLuaStateRef state)
{
    int nargs = lua_gettop(state);
    printf(" ----------------  Stack Dump ----------------\n" );
    
    int t = 0;
    
    for (int i = 1; i <= nargs; ++i)
    {
        t = lua_type(state, i);
        switch (t)
        {
            case LUA_TSTRING:
            {
                printf("%d:`%s'\n", i, lua_tostring(state, i));
                break;
            }
            case LUA_TBOOLEAN:
            {
                printf("%d: %s\n", i, lua_toboolean(state, i) ? "true" : "false");
                break;
            }
            case LUA_TNUMBER:
            {
                printf("%d: %g\n",  i, lua_tonumber(state, i));
                break;
            }
            case LUA_TNIL:
            {
                printf("%d: nil\n",  i);
                break;
            }
            default:
            {
                printf("%d: %p %s\n", i, lua_topointer(state, t), lua_typename(state, t));
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
static char __VMKSetterPropertiesKey;

static char __VMKGetterPropertiesKey;

static inline const char *LuaClassGetPropertyNameWithGetter(Class theClass, SEL getter)
{
    CFDictionaryRef getters = (CFDictionaryRef)objc_getAssociatedObject((id)theClass, &__VMKGetterPropertiesKey);
    if (getters)
    {
        CFStringRef propertyName = CFDictionaryGetValue(getters, getter);
    
        return [(NSString *)propertyName UTF8String];
    }
    
    return NULL;
}

static inline const char *LuaClassGetPropertyNameWithSetter(Class theClass, SEL setter)
{
    CFDictionaryRef setters = (CFDictionaryRef)objc_getAssociatedObject(theClass, &__VMKSetterPropertiesKey);
    if (setters)
    {
        NSString *propertyName = CFDictionaryGetValue(setters, setter);
        
        return [propertyName UTF8String];
    }
    
    return NULL;
}

#pragma mark - property
//getter
#define __LuaObjC_propertyGetterWithType(Type, obj, selector)     Class objClass = object_getClass(obj);\
const char *propertyName = LuaClassGetPropertyNameWithGetter(objClass, selector);\
Type returnValue;\
object_getInstanceVariable(obj, propertyName, (void **)&returnValue);\
return returnValue;

static id __VMKPropertyGetterIMP(id obj, SEL selector)
{
    __LuaObjC_propertyGetterWithType(id, obj, selector);
}

static CFIndex __VMKPropertyGetterIntegerReturnIMP(id obj, SEL selector)
{
    Class objClass = object_getClass(obj);
    const char *propertyName = LuaClassGetPropertyNameWithGetter(objClass, selector);
    CFIndex returnValue = 0;
    
    Ivar ivar = class_getInstanceVariable(objClass, propertyName);
    if (ivar)
    {
        returnValue = *((CFIndex *)obj + ivar_getOffset(ivar));
    }
    
    return returnValue;
}

static Float32 __VMKPropertyGetterFloatReturnIMP(id obj, SEL selector)
{
    Class objClass = object_getClass(obj);
    const char *propertyName = LuaClassGetPropertyNameWithGetter(objClass, selector);
    Float32 returnValue = 0.0;
    
    Ivar ivar = class_getInstanceVariable(objClass, propertyName);
    if (ivar)
    {
        returnValue = *((Float32 *)obj + ivar_getOffset(ivar));
    }
    
    return returnValue;    
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
static void __VMKPropertySetterIMP(id obj, SEL selector, id newValue)
{
    //    Class objClass = object_getClass(obj);
    //    const char *propertyName = LuaClassGetPropertyNameWithSetter(objClass, selector);
    //    object_setInstanceVariable(obj, propertyName, newValue);
}

static void __VMKPropertySetterFloatReturnIMP(id obj, SEL selector, Float32 newValue)
{
    Class objClass = object_getClass(obj);
    const char *propertyName = LuaClassGetPropertyNameWithSetter(objClass, selector);
    Ivar ivar = class_getInstanceVariable(objClass, propertyName);
    if (ivar)
    {
        Float32 *value = (Float32 *)obj + ivar_getOffset(ivar);
        *value = newValue;
    }
    //__LuaObjC_propertySetterWithType(Float32, obj, selector, newValue);
}

static void __VMKPropertySetterIntegerReturnIMP(id obj, SEL selector, CFIndex newValue)
{
    Class objClass = object_getClass(obj);
    const char *propertyName = LuaClassGetPropertyNameWithSetter(objClass, selector);
    Ivar ivar = class_getInstanceVariable(objClass, propertyName);
    if (ivar)
    {
        CFIndex *value = (CFIndex *)obj + ivar_getOffset(ivar);
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
    const char* typeEncoding = VMKTypeEncodingOfType(typeName);
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
            getterIMP = (IMP)__VMKPropertyGetterIMP;
            setterIMP = (IMP)__VMKPropertySetterIMP;
            break;
        }
        case _C_FLT:
        case _C_DBL:
        {
            getterIMP = (IMP)__VMKPropertyGetterFloatReturnIMP;
            setterIMP = (IMP)__VMKPropertySetterFloatReturnIMP;
            break;
        }
        default:
        {
            getterIMP = (IMP)__VMKPropertyGetterIntegerReturnIMP;
            setterIMP = (IMP)__VMKPropertySetterIntegerReturnIMP;
            break;
        }
    }
    
    int length = strlen(typeEncoding) + MAX(strlen("@:"), strlen("v@:")) + 1;
    char *fullEncodingString = calloc(length, sizeof(char));
    strcpy(fullEncodingString, typeEncoding);
    strcat(fullEncodingString, "@:");
    
    if(!class_addMethod(theClass, selectorOfGet, getterIMP, fullEncodingString))
    {
        printf("Failed add Property Getter:%s to Class:%s OK!\n", (const char*)selectorOfGet, className);
    }
    
    memset(fullEncodingString, '\0', sizeof(char) * length);
    
    strcpy(fullEncodingString, "v@:");
    strcat(fullEncodingString, typeEncoding);
    
    if(!class_addMethod(theClass, selectorOfSet, setterIMP, fullEncodingString))
    {
        printf("Failed add Property Setter:%s to Class:%s OK!\n", (const char*)selectorOfSet, className);
    }
    
    free(fullEncodingString);
    
    CFMutableDictionaryRef setters = (CFMutableDictionaryRef)objc_getAssociatedObject(theClass, &__VMKSetterPropertiesKey);
    if (!setters)
    {
        setters = CFDictionaryCreateMutable(NULL, 0, NULL, &kCFTypeDictionaryValueCallBacks);
        
        objc_setAssociatedObject(theClass, &__VMKSetterPropertiesKey, (id)setters, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

        CFRelease(setters);
    }
    
    CFMutableDictionaryRef getters = (CFMutableDictionaryRef)objc_getAssociatedObject(theClass, &__VMKGetterPropertiesKey);
    if (!getters)
    {
        getters = CFDictionaryCreateMutable(NULL, 0, NULL, &kCFTypeDictionaryValueCallBacks);
        
        objc_setAssociatedObject(theClass, &__VMKGetterPropertiesKey, (id)getters, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        CFRelease(getters);        
    }
    
    CFDictionaryAddValue(setters, selectorOfSet, @( propertyName ));
    CFDictionaryAddValue(getters, selectorOfGet, @( propertyName ));
}

int LuaIMPAddPropertyToClass(VMKLuaStateRef state)
{
    
    const char* className = VMKCheckString(state, 1);
    const char* atomic = VMKCheckString(state, 2);
    const char* ownershipName = VMKCheckString(state, 3);
    const char* getterName = VMKCheckString(state, 4);
    const char* setterName = VMKCheckString(state, 5);
    const char* typeName = VMKCheckString(state, 6);
    const char* propertyName = VMKCheckString(state, 7);
    //const char* propertyInternalName = VMKCheckString(L, 8);
    LuaIMPAddPropertyToClassOrigin(className, atomic, ownershipName, getterName,
                                   setterName, typeName, propertyName);
    
    return 0;
}