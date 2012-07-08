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

#import <objc/objc-runtime.h>

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
    
    free(propertyName);
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

#if 0
static int LuaObjectBridge_InvokeMethod(lua_State* lua_state, id obj, SEL selector)
{
	const int NUMBER_OF_SUPPORT_ARGS = 0; // No internal use only arguments
    
	int number_of_arguments = lua_gettop(lua_state);
		
	// using absolute
	LuaUserDataContainerForObject* object_container = LuaObjectBridge_LuaCheckClass(lua_state, 1);
    
	id the_object = object_container->theObject;

	// Very special short circuit case for a method named "super".
	// We will return the the same object with the container marked with the isSuper flag marked.
	// This hack is not callable directly from Objective-C, but I assume in Objective-C, the user
	// invokes super directly, e.g. [super dealloc];
	if(0 == strcmp(lua_method_name, "super"))
	{
		if(LuaObjectBridge_IsClass(object_container))
		{
			LuaObjectBridge_PushClass(lua_state, LuaObjectBridge_GetClass(object_container));
		}
		else
		{
			// FIXME: Ugh. I have to violate my 1 object to 1 userdata rule here.
			// Because I am simply marking a flag in my container rather than creating a unique object,
			// I must create a separate userdata object. I really hope this doesn't break any other assumptions I forgot about.
			// I don't put this in the normal weak table because it will collide with the non-super object.
			// Instead, this goes in a special table just for super instances.
			Class super_class_parameter = nil;
			if(lua_isstring(lua_state, 2))
			{
				super_class_parameter = objc_getClass(lua_tostring(lua_state, 2));
			}
			else if(LuaObjectBridge_isnsstring(lua_state, 2))
			{
				super_class_parameter = NSClassFromString(LuaObjectBridge_tonsstring(lua_state, 2));                
			}
			else if(LuaObjectBridge_isid(lua_state, 2))
			{
				super_class_parameter = LuaObjectBridge_GetClass(lua_touserdata(lua_state, 2));
			}
			LuaObjectBridge_PushSuperid(lua_state, object_container->theObject);
			LuaUserDataContainerForObject* super_container = lua_touserdata(lua_state, -1);
#if !defined(LUA_COCOA_USE_INTERMEDIATE_OBJECTS_TO_HOLD_SUPERCLASS)
			super_container->superClass = super_class_parameter;
#else // experiment to try to create new intermediate containers to pass along superClass informatation
			// I think I was hoping to implicitly decide/remember/know which super class to invoke, but this wasn't working.

			super_container->superClass = super_class_parameter;            
#endif
		}
        
		return 1;
	}
	
	
	// Convert the name of the selector to canonical Objective-C form
    
	// +1 for NULL and another +1 for optional omitted underscore
	size_t max_str_length = strlen(lua_method_name)+2;
	
	char objc_method_name[max_str_length];
	SEL the_selector;
	ParseSupportMethod* parse_support = nil;
	bool use_objc_msg_send = false; // use imp pointer by default since its faster
	Class which_class_found = NULL;
	bool is_instance_defined = false;
	bool did_find_lua_method = LuaSubclassBridge_FindLuaMethod(lua_state, object_container, lua_method_name, &which_class_found, &is_instance_defined);
	
	//		lua_pushstring(lua_state, lua_method_name);
	//		LuaSubclassBridge_GetIndexOnClass(lua_state, object_container, LuaObjectBridge_IsClass(object_container), &did_handle_case);
#warning "FIXME: Need to rewrite to distinguish between Lua-only methods and Obj-C bound methods
    
#warning "FIXME: Need to specify class method vs. instance method"
	if(ObjectSupport_ConvertUnderscoredSelectorToObjC(objc_method_name, lua_method_name, max_str_length, the_object, LuaObjectBridge_IsInstance(object_container), &the_selector, LuaObjectBridge_IsClass(object_container)))
	{
		//		NSString* class_name = [NSString stringWithUTF8String:object_getClassName(the_object)];
		NSString* class_name = NSStringFromClass(LuaObjectBridge_GetClass(object_container));
		
		//		NSLog(@"Got method and selector for class_name:%@", class_name);
#warning "FIXME: Need clue as to whether class or instance method"
        
		// Load up the Obj-C runtime and XML info into an object we can more easily use
		parse_support = [[[ParseSupportMethod alloc] 
						  initWithClassName:class_name
						  methodName:[NSString stringWithUTF8String:objc_method_name] 
						  isInstance:LuaObjectBridge_IsInstance(object_container)
						  theReceiver:the_object
						  isClassMethod:LuaObjectBridge_IsClass(object_container)
						  ] 
						 autorelease];
		
		// If there are variadic arguments, add them to the parse support information.
		// Note that if there are variadic arguments, this parse_support instance cannot be reused/cached for different function calls
		// Offset is 0-1 (0 for no internal use arguments, -1 because the first 2 arguments are supposed to be the receiver and selector,
		// but the selector is not an argument on the stack (it is a upvalue), so we must subtract 1
		LuaFFISupport_ParseVariadicArguments(lua_state, parse_support, NUMBER_OF_SUPPORT_ARGS-1);
		
		
	}
	else if(true == did_find_lua_method) // now lua-only method
	{
		// Assertion is that the lua function is on top of the stack.
		// Several (evil) things need to happen.
		// We need to push "self" as the first parameter.
		// But (this is evil), if the self object was marked as super, we need to disable the super status
		// because FindLuaMethod already used the super status to hunt for the proper method.
		// (If we don't remove the status, it will try to call super instead of self in the method implementation
		// of the function we are about to call.)
		// To get the non-super object, we can refer to our global weak table.
		// We also need to pass all the parameters received in this function call to the function we are about to call.
		// It should be much easier to shift the stack positions so that the function we are about to call
		// is at the very bottom and we should probably pop the super object since we don't want it to persist.
		// Finally, because Lua can return multiple values, we need to count the number of arguments that are returned.			
		
		
		// Put the function we are about to call as the first element in the stack, everything else shifts up 1
		lua_insert(lua_state, 1);
		
		// Next get the non-super instance of our method (if needed)
		// Assumption: super objects are always instances because otherwise we would have just provided the class
		if(LuaObjectBridge_IsSuper(object_container))
		{
            // FIXME: Re-evaluate both of these cases. I'm no longer sure if either of these cases are the best/proper thing to do.
#if !defined(LUA_COCOA_USE_INTERMEDIATE_OBJECTS_TO_HOLD_SUPERCLASS)
			// pushes the non-super object on top of the stack
			LuaCocoaWeakTable_GetObjectInGlobalWeakTable(lua_state, object_container->theObject);
			// The super-instance should be at index 2 (shifted up from 1 after the function shift)
			// Replace the super-instance with the non-super one.
			lua_replace(lua_state, 2);
#else // experiment to try to create new intermediate containers to pass along superClass informatation
			// Will create the new userdata and leave it on the stack
			LuaObjectBridge_CreateUserData(lua_state, object_container->theObject, true, true, false);
			LuaUserDataContainerForObject* new_container = lua_touserdata(lua_state, -1);
			new_container->isLuaSubclass = object_container->isLuaSubclass;
			new_container->superClass = which_class_found;
			// Replace the super-instance with the non-super one.
			lua_replace(lua_state, 2);
#endif
		}
		// Turns out the the number_of_arguments is exactly the number_of_arguments we want.
		// (self + anything passed in)
		lua_call(lua_state, number_of_arguments, LUA_MULTRET);
		int number_of_return_arguments = lua_gettop(lua_state);
		//		NSLog(@"number_of_return_arguments from lua_call is %d", number_of_return_arguments);
		return number_of_return_arguments;
	}	
	else
	{
        
		// FIXME: I don't know what triggers this condition any more.
		
		
		ParseSupportArgument* return_value_argument = nil;
		
		// Could be Lua-only method definition.
		// FIXME: We could actually check this

		parse_support = [[[ParseSupportMethod alloc] init] autorelease];
		// cheat/hack
		[parse_support setVariadic:true];
		if(LuaObjectBridge_IsClass(object_container))
		{
			[parse_support appendVaradicArgumentWithObjcEncodingType:_C_CLASS];
		}
		else
		{
			[parse_support appendVaradicArgumentWithObjcEncodingType:_C_ID];
		}
		
		[parse_support appendVaradicArgumentWithObjcEncodingType:_C_SEL];
		
		if(number_of_arguments - NUMBER_OF_SUPPORT_ARGS - 1 > 0)
		{
			
			// If there are variadic arguments, add them to the parse support information.
			// Note that if there are variadic arguments, this parse_support instance cannot be reused/cached for different function calls
			// Offset is 0-1 (0 for no internal use arguments, -1 because the first 2 arguments are supposed to be the receiver and selector,
			// but the selector is not an argument on the stack (it is a upvalue), so we must subtract 1
			LuaFFISupport_ParseVariadicArguments(lua_state, parse_support, NUMBER_OF_SUPPORT_ARGS-1);
		}
		return_value_argument = [[[ParseSupportArgument alloc] init] autorelease];
		return_value_argument.objcEncodingType = @"v"; // return _C_VOID
		[parse_support setReturnValue:return_value_argument];
		// need to use objc_msg_send to trigger forwardInvocation (I think)
		use_objc_msg_send = true;
		NSLog(@"didn't find selector/method for object:%@, lua_method=%s", the_object, lua_method_name);
		the_selector = sel_registerName(objc_method_name);
	}
    
	/* Creating a block of memory is a bit tricky.
	 We actually need separate blocks of memory:
	 1) Memory for the ffi_cif
	 2) Memory to describe the normal arguments
	 3) Memory to hold custom ffi_type(s) (as in the case that an argument is a struct)
	 4) Memory to describe the flattened arguments (i.e. if #2 is a struct, this contains memory for each individial element in the struct)
	 5) Memory to describe the return argument
	 6) Memory to hold custom ffi_type (as in the case that the return argument is a struct)
	 7) Memory to describe the flattened return argument
	 When using Lua userdata, it is easiest to treat this a single block of memory 
	 since we want garbage collection to clean it up at the same time.
	 But because the memory is for distinct things, we need to keep our pointers straight
	 and not clobber each section's memory.
	 All the structures also need their internal pointers set correctly to find the correct blocks of memory.
	 
	 Userdata is:
	 1) sizeof(cif)
	 2) sizeof(ffi_type*) * number_of_real_function_arguments // don't forget to count varadic
	 3) sizeof(ffi_type) * number_of_real_arguments_that_need_to_be_flattened
	 4) sizeof(ffi_type*) * number_of_flattened_function_arguments // don't forget to count NULL terminators
	 5) sizeof(ffi_type*)
	 6) sizeof(ffi_type) * number_of_return_arguments_that_need_to_be_flattened
	 7) sizeof(ffi_type*) * number_of_flattened_function_arguments // don't forget to count NULL terminators
	 
	 */
	size_t size_of_real_args = sizeof(ffi_type*) * parse_support.numberOfRealArguments;
	size_t size_of_flattened_args = sizeof(ffi_type*) * parse_support.numberOfFlattenedArguments;
	size_t size_of_custom_type_args = sizeof(ffi_type) * parse_support.numberOfRealArgumentsThatNeedToBeFlattened;
	size_t size_of_real_return = sizeof(ffi_type*);
	size_t size_of_flattened_return = sizeof(ffi_type*) * parse_support.numberOfFlattenedReturnValues;
	size_t size_of_custom_type_return;
	if(0 == size_of_flattened_return)
	{
		size_of_custom_type_return = 0;
	}
	else
	{
		size_of_custom_type_return = sizeof(ffi_type);
	}
	
	ffi_cif the_cif;
	
	// FIXME: Check for 0 length sizes and avoid
#define ARBITRARY_NONZERO_SIZE 1
	size_t size_of_real_args_proxy = size_of_real_args ? size_of_real_args : ARBITRARY_NONZERO_SIZE;
	size_t size_of_flattened_args_proxy = size_of_flattened_args ? size_of_flattened_args : ARBITRARY_NONZERO_SIZE;
	size_t size_of_custom_type_args_proxy = size_of_custom_type_args ? size_of_custom_type_args : ARBITRARY_NONZERO_SIZE;
	size_t size_of_real_return_proxy = size_of_real_return ? size_of_real_return : ARBITRARY_NONZERO_SIZE;
	size_t size_of_flattened_return_proxy = size_of_flattened_return ? size_of_flattened_return : ARBITRARY_NONZERO_SIZE;
	size_t size_of_custom_type_return_proxy = size_of_custom_type_return ? size_of_custom_type_return : ARBITRARY_NONZERO_SIZE;
#undef ARBITRARY_NONZERO_SIZE
	
	
	// use VLAs to use stack memory
	int8_t real_args_array[size_of_real_args_proxy];
	int8_t flattened_args_array[size_of_flattened_args_proxy];
	int8_t custom_type_args_array[size_of_custom_type_args_proxy];
	int8_t real_return_array[size_of_real_return_proxy];
	int8_t flattened_return_array[size_of_flattened_return_proxy];
	int8_t custom_type_return_array[size_of_custom_type_return_proxy];
    
	// Setup pointers to memory areas
	ffi_cif* cif_ptr = &the_cif;
	
	ffi_type** real_args_ptr = (ffi_type**)&real_args_array[0];
	ffi_type* custom_type_args_ptr = (ffi_type*)&custom_type_args_array[0];
	ffi_type** flattened_args_ptr = (ffi_type**)&flattened_args_array[0];
    
	ffi_type* real_return_ptr = (ffi_type*)&real_return_array[0];
	ffi_type* custom_type_return_ptr = (ffi_type*)&custom_type_return_array[0];
	ffi_type** flattened_return_ptr = (ffi_type**)&flattened_return_array[0];
    
	char check_void_return;
	if(nil == parse_support.returnValue.objcEncodingType || 0 == [parse_support.returnValue.objcEncodingType length])
	{
		// FIXME:
		NSLog(@"no return type set. This is probably a bug");
		// Not sure if I should assume id or void
		check_void_return = _C_VOID;
	}
	else
	{
		check_void_return = [parse_support.returnValue.objcEncodingType UTF8String][0];
	}
	bool is_void_return = false;
	if(_C_VOID == check_void_return)
	{
		is_void_return = true;
	}
	
	if(0 == size_of_real_args)
	{
		real_args_ptr = NULL;
	}
	if(0 == size_of_flattened_args)
	{
		flattened_args_ptr = NULL;
	}
	if(0 == size_of_custom_type_args)
	{
		custom_type_args_ptr = NULL;
	}
	if(0 == size_of_real_return || true == is_void_return)
	{
		real_return_ptr = NULL;
	}
	if(0 == size_of_flattened_return || true == is_void_return)
	{
		flattened_return_ptr = NULL;
	}
	if(0 == size_of_custom_type_return || true == is_void_return)
	{
		custom_type_return_ptr = NULL;
	}
	
	FFISupport_ParseSupportFunctionArgumentsToFFIType(parse_support, custom_type_args_ptr, &real_args_ptr, flattened_args_ptr);
    
	FFISupport_ParseSupportFunctionReturnValueToFFIType(parse_support, custom_type_return_ptr, &real_return_ptr, flattened_return_ptr);
	
	
	// Prepare the ffi_cif structure.
	ffi_status error_status;
	error_status = ffi_prep_cif(cif_ptr, FFI_DEFAULT_ABI, parse_support.numberOfRealArguments, real_return_ptr, real_args_ptr);
	if(FFI_OK != error_status)
	{
		// Handle the ffi_status error.
		if(FFI_BAD_TYPEDEF == error_status)
		{
			NSLog(@"ffi_prep_cif failed with FFI_BAD_TYPEDEF for function: %@", parse_support.keyName);			
		}
		else if(FFI_BAD_ABI == error_status)
		{
			NSLog(@"ffi_prep_cif failed with FFI_BAD_ABI for function: %@", parse_support.keyName);			
		}
		else
		{
			NSLog(@"ffi_prep_cif failed with unknown error for function: %@", parse_support.keyName);			
			
		}
		return 0;
	}
	
	// PyObjC and JSCocoa seem to look at the return value size and type to figure out which variant
	// of objc_msgSend* to use. But I thought the whole point of using libffi was to eliminate that problem.
	// MacRuby seems to grab an imp instead which makes more sense to me but there
	// are additional cases I don't yet understand in their code base
	void* function_ptr;
	
	{
		Class the_class;
		if(LuaObjectBridge_IsInstance(object_container))
		{
			the_class = object_getClass(object_container->theObject);
		}
		else
		{
			the_class = object_container->theObject;		
		}
		if(ObjectSupport_IsSubclassOfClass(the_class, objc_getClass("NSProxy")))
		{
			use_objc_msg_send = true;
            //			NSLog(@"the real class is %@, but the proxied object is %@", NSStringFromClass(the_class), the_object);  
		}
	}
	
	Method saved_self_method = NULL;
	Method saved_super_method = NULL;
	IMP saved_self_imp = NULL;
	IMP saved_super_imp = NULL;
	
	// PyObjC way
	// Used for NSProxy classes
	if(use_objc_msg_send)
	{
		function_ptr = ObjectSupport_GetObjcMsgSendCallAddress([parse_support returnValueObjcEncodingType], LuaObjectBridge_IsSuper(object_container));
	}
	// MacRuby
	// Used for non-NSProxy classes
	else
	{
		Class the_class;
		if(LuaObjectBridge_IsInstance(object_container))
		{
			if(object_container->isSuper)
			{
				the_class = class_getSuperclass(object_getClass(object_container->theObject));
			}
			else
			{
				the_class = object_getClass(object_container->theObject);				
			}
		}
		else
		{
			if(object_container->isSuper)
			{
				the_class = class_getSuperclass(object_container->theObject);
			}
			else
			{
				the_class = object_container->theObject;
			}
		}
		
		// Assumption: Object instances always get instance methods, while classes always get class methods
		if(LuaObjectBridge_IsInstance(object_container))
		{
			if(LuaObjectBridge_IsSuper(object_container))
			{
                //				NSLog(@"self_class: %@, super_class: %@", NSStringFromClass(object_getClass(object_container->theObject)), NSStringFromClass(object_container->superClass));
				saved_self_method = class_getInstanceMethod(object_getClass(object_container->theObject), the_selector);;
                //				saved_super_method = class_getInstanceMethod(class_getSuperclass(object_getClass(object_container->theObject)), the_selector);;
				saved_super_method = class_getInstanceMethod(object_container->superClass, the_selector);;
				saved_self_imp = method_getImplementation(saved_self_method);
				saved_super_imp = method_getImplementation(saved_super_method);
				function_ptr = saved_super_imp;
				// temporarily swizzle (swap) methods
				method_setImplementation(saved_self_method, saved_super_imp);
                
			}
			else
			{
				Method the_method = class_getInstanceMethod(the_class, the_selector);
				function_ptr = method_getImplementation(the_method);
			}
            
		}
		else
		{
			if(LuaObjectBridge_IsSuper(object_container))
			{
				saved_self_method = class_getClassMethod(object_container->theObject, the_selector);;
                //				saved_super_method = class_getClassMethod(class_getSuperclass(object_container->theObject), the_selector);;
				saved_super_method = class_getClassMethod(object_container->superClass, the_selector);;
				saved_self_imp = method_getImplementation(saved_self_method);
				saved_super_imp = method_getImplementation(saved_super_method);
				function_ptr = saved_super_imp;
				// temporarily swizzle (swap) methods
				method_setImplementation(saved_self_method, saved_super_imp);
			}
			else
			{
				Method the_method = class_getClassMethod(the_class, the_selector);
				function_ptr = method_getImplementation(the_method);
			}
            
			
		}
	}
    
    
	// This part of the implementation uses alloca because it is convenient, likely faster than heap memory, and all the other bridges do the same thing.
	// I would have preferred VLAs because I am unsure about the rules of using alloca (are they reliable as parameters to functions?)
	// but they didn't seem flexible enough as all the sizeof(type)'s are different values.
	// But the big downside is that I can't easily encapsulate the large switch statement into a function because it calls alloca.
	NSUInteger number_of_function_args = parse_support.numberOfRealArguments;
    
    // START COPY AND PASTE HERE	
	void* current_arg;
	int i, j;
    
    //	void** array_for_ffi_arguments = alloca(sizeof(void *) * number_of_function_args);
	void* array_for_ffi_arguments[number_of_function_args];
    
	// for out-arguments
    //	void** array_for_ffi_ref_arguments = array_for_ffi_ref_arguments = alloca(sizeof(void *) * number_of_function_args);
	void* array_for_ffi_ref_arguments[number_of_function_args];
    // END COPY AND PASTE HERE
    
	// remember that the first two argments to objc_msgSend are the object and selector
	// For objc_msgSendSuper, we need to do something different
	struct objc_super super_data;
	struct objc_super* super_data_ptr = &super_data;
	if(true == use_objc_msg_send && LuaObjectBridge_IsSuper(object_container))
	{
		super_data.receiver = the_object;
		
        //		NSLog(@"super_data.receiver: %@", super_data.receiver);
#if !defined(__cplusplus)  &&  !__OBJC2__
		super_data.class = [super_data.receiver superclass];
        //		NSLog(@"Super_class: %@", NSStringFromClass(super_data.class));
#else
		super_data.super_class = [super_data.receiver superclass];
        //		NSLog(@"Super_class: %@", NSStringFromClass(super_data.super_class));
        
        
        //		super_data.super_class = [the_object superclass]->isa;
        //		NSLog(@"Super_class: %@", NSStringFromClass(super_data.super_class));
#endif
        
		array_for_ffi_arguments[0] = &super_data_ptr;
        
	}
	else
	{
		array_for_ffi_arguments[0] = &the_object;
	}
    
	array_for_ffi_arguments[1] = &the_selector;
    //	NSLog(@"the_selector: %@", NSStringFromSelector(the_selector));
    
	// In our lua stack, arg1 is the object, but arg2 is the not the selector, but the next parameter because the selector is an upvalue
	// However we start a j=2 because lua starts at index=1, not 0
    for(i = 2, j = 2 + NUMBER_OF_SUPPORT_ARGS; i < number_of_function_args; i++, j++)
	{
        //		LuaFFISupport_FillFFIArguments(lua_state, array_for_ffi_arguments, array_for_ffi_ref_arguments, i, j, cif_ptr->arg_types[i]->type, [parse_support.argumentArray objectAtIndex:i]);
        
		// START COPY AND PASTE HERE
		unsigned short current_ffi_type = cif_ptr->arg_types[i]->type;
		ParseSupportArgument* current_parse_support_argument = [parse_support.argumentArray objectAtIndex:i];
		
#define putarg(type, val) ((array_for_ffi_arguments[i] = current_arg = alloca(sizeof(type))), *(type *)current_arg = (val))
		switch(current_ffi_type)
		{
			case FFI_TYPE_INT:
			{
				if(lua_isboolean(lua_state, j))
				{
					putarg(int, lua_toboolean(lua_state, j));				   
				}
				else
				{
					putarg(int, lua_tointeger(lua_state, j));
				}
				break;
			}
			case FFI_TYPE_SINT8:
			{
				if(lua_isboolean(lua_state, j))
				{
					putarg(int8_t, lua_toboolean(lua_state, j));				   
				}
				else
				{
					putarg(int8_t, lua_tointeger(lua_state, j));
				}
				break;
			}
			case FFI_TYPE_SINT16:
			{
				if(lua_isboolean(lua_state, j))
				{
					putarg(int16_t, lua_toboolean(lua_state, j));				   
				}
				else
				{
					putarg(int16_t, lua_tointeger(lua_state, j));
				}
				break;
			}
			case FFI_TYPE_SINT32:
			{
				if(lua_isboolean(lua_state, j))
				{
					putarg(int32_t, lua_toboolean(lua_state, j));				   
				}
				else
				{
					putarg(int32_t, lua_tointeger(lua_state, j));
				}
				break;
			}
			case FFI_TYPE_SINT64:
			{
				if(lua_isboolean(lua_state, j))
				{
					putarg(int64_t, lua_toboolean(lua_state, j));				   
				}
				else
				{
					putarg(int64_t, lua_tointeger(lua_state, j));
				}
				break;	
			}
			case FFI_TYPE_UINT8:
			{
				if(lua_isboolean(lua_state, j))
				{
					putarg(uint8_t, lua_toboolean(lua_state, j));				   
				}
				else
				{
					putarg(uint8_t, lua_tointeger(lua_state, j));
				}
				break;	
			}
			case FFI_TYPE_UINT16:
			{
				if(lua_isboolean(lua_state, j))
				{
					putarg(uint16_t, lua_toboolean(lua_state, j));				   
				}
				else
				{
					putarg(uint16_t, lua_tointeger(lua_state, j));
				}
				break;	
			}
			case FFI_TYPE_UINT32:
			{
				if(lua_isboolean(lua_state, j))
				{
					putarg(uint32_t, lua_toboolean(lua_state, j));				   
				}
				else
				{
					putarg(uint32_t, lua_tointeger(lua_state, j));
				}
				break;	
			}
			case FFI_TYPE_UINT64:
			{
				if(lua_isboolean(lua_state, j))
				{
					putarg(uint64_t, lua_toboolean(lua_state, j));				   
				}
				else
				{
					putarg(uint64_t, lua_tointeger(lua_state, j));
				}
				break;	
			}
#if FFI_TYPE_LONGDOUBLE != FFI_TYPE_DOUBLE
			case FFI_TYPE_LONGDOUBLE:
				putarg(long double, lua_tonumber(lua_state, j));
				break;
#endif
				
			case FFI_TYPE_DOUBLE:
				putarg(double, lua_tonumber(lua_state, j));
				break;
				
			case FFI_TYPE_FLOAT:
				putarg(float, lua_tonumber(lua_state, j));
				break;
				
			case FFI_TYPE_STRUCT:
				array_for_ffi_arguments[i] = lua_touserdata(lua_state, j);
				break;
				
			case FFI_TYPE_POINTER:
			{
				//			ParseSupportArgument* current_parse_support_argument = [parse_support.argumentArray objectAtIndex:i];
                //						NSLog(@"current_arg.declaredType=%@ objcEncodingType=%@, inOutTypeModifier=%@", current_parse_support_argument.declaredType, current_parse_support_argument.objcEncodingType, current_parse_support_argument.inOutTypeModifier);
				if([current_parse_support_argument.inOutTypeModifier isEqualToString:@"o"] || [current_parse_support_argument.inOutTypeModifier isEqualToString:@"N"] || [current_parse_support_argument.inOutTypeModifier isEqualToString:@"n"])
				{
					
					// Lion workaround for lack of Full bridgesupport file
					char objc_encoding_type;
					NSString* nsstring_encoding_type = current_parse_support_argument.objcEncodingType;
					if([nsstring_encoding_type length] < 2)
					{
						// assuming we are dealing with regular id's
						objc_encoding_type = _C_ID;						
					}
					else
					{
						objc_encoding_type = [nsstring_encoding_type UTF8String][1];						
					}
					
					switch(objc_encoding_type)
					{
						case _C_BOOL:
						{
							if(lua_isnil(lua_state, j))
							{
								putarg(int8_t*, NULL);
							}
							else
							{
								array_for_ffi_ref_arguments[i] = alloca(sizeof(int8_t));
								*((int8_t*)(array_for_ffi_ref_arguments[i])) = lua_toboolean(lua_state, j);
								putarg(int8_t*, (int8_t*)&(array_for_ffi_ref_arguments[i]));
							}
							break;
						}
						case _C_CHR:
						{
							if(lua_isnil(lua_state, j))
							{
								putarg(int8_t*, NULL);
							}
							else
							{
								array_for_ffi_ref_arguments[i] = alloca(sizeof(int8_t));
								if(lua_isboolean(lua_state, j))
								{
									*((int8_t*)(array_for_ffi_ref_arguments[i])) = lua_toboolean(lua_state, j);
								}
								else
								{
									*((int8_t*)(array_for_ffi_ref_arguments[i])) = lua_tointeger(lua_state, j);
								}
								putarg(int8_t*, (int8_t*)&(array_for_ffi_ref_arguments[i]));
							}
							break;
						}
						case _C_SHT:
						{
							if(lua_isnil(lua_state, j))
							{
								putarg(int8_t*, NULL);
							}
							else
							{
								array_for_ffi_ref_arguments[i] = alloca(sizeof(int16_t));
								*((int16_t*)(array_for_ffi_ref_arguments[i])) = lua_tointeger(lua_state, j);
								putarg(int16_t*, (int16_t*)&(array_for_ffi_ref_arguments[i]));
							}
							break;
						}
						case _C_INT:
						{    
							if(lua_isnil(lua_state, j))
							{
								putarg(int*, NULL);
							}
							else
							{
								array_for_ffi_ref_arguments[i] = alloca(sizeof(int));
								if(lua_isboolean(lua_state, j))
								{
									*((int*)(array_for_ffi_ref_arguments[i])) = lua_toboolean(lua_state, j);
								}
								else
								{
									*((int*)(array_for_ffi_ref_arguments[i])) = lua_tointeger(lua_state, j);
								}
								putarg(int*, (int*)&(array_for_ffi_ref_arguments[i]));
							}
							break;			
						}
						case _C_LNG:
						{
							if(lua_isnil(lua_state, j))
							{
								putarg(long*, NULL);
							}
							else
							{
								array_for_ffi_ref_arguments[i] = alloca(sizeof(long));
								if(lua_isboolean(lua_state, j))
								{
									*((long*)(array_for_ffi_ref_arguments[i])) = lua_toboolean(lua_state, j);
								}
								else
								{
									*((long*)(array_for_ffi_ref_arguments[i])) = lua_tointeger(lua_state, j);
								}
								putarg(long*, (long*)&(array_for_ffi_ref_arguments[i]));
							}
							break;
						}
						case _C_LNG_LNG:
						{
							if(lua_isnil(lua_state, j))
							{
								putarg(long long*, NULL);
							}
							else
							{
								array_for_ffi_ref_arguments[i] = alloca(sizeof(long long));
								*((long long*)(array_for_ffi_ref_arguments[i])) = lua_tointeger(lua_state, j);
								putarg(long long*, (long long*)&(array_for_ffi_ref_arguments[i]));
							}
							break;
						}
						case _C_UCHR:
						{
							if(lua_isnil(lua_state, j))
							{
								putarg(uint8_t*, NULL);
							}
							else
							{
								array_for_ffi_ref_arguments[i] = alloca(sizeof(uint8_t));
								*((uint8_t*)(array_for_ffi_ref_arguments[i])) = lua_tointeger(lua_state, j);
								putarg(uint8_t*, (uint8_t*)&(array_for_ffi_ref_arguments[i]));
							}
							break;
						}
						case _C_USHT:
						{
							if(lua_isnil(lua_state, j))
							{
								putarg(uint16_t*, NULL);
							}
							else
							{
								array_for_ffi_ref_arguments[i] = alloca(sizeof(uint16_t));
								*((uint16_t*)(array_for_ffi_ref_arguments[i])) = lua_tointeger(lua_state, j);
								putarg(uint16_t*, (uint16_t*)&(array_for_ffi_ref_arguments[i]));
							}
							break;
						}
						case _C_UINT:
						{
							if(lua_isnil(lua_state, j))
							{
								putarg(unsigned int*, NULL);
							}
							else
							{
								array_for_ffi_ref_arguments[i] = alloca(sizeof(unsigned int));
								*((unsigned int*)(array_for_ffi_ref_arguments[i])) = lua_tointeger(lua_state, j);
								putarg(unsigned int*, (unsigned int*)&(array_for_ffi_ref_arguments[i]));
							}
							break;
						}
						case _C_ULNG:
						{
							if(lua_isnil(lua_state, j))
							{
								putarg(unsigned long*, NULL);
							}
							else
							{
								array_for_ffi_ref_arguments[i] = alloca(sizeof(unsigned long));
								*((unsigned long*)(array_for_ffi_ref_arguments[i])) = lua_tointeger(lua_state, j);
								putarg(unsigned long*, (unsigned long*)&(array_for_ffi_ref_arguments[i]));
							}
							break;
						}
						case _C_ULNG_LNG:
						{
							if(lua_isnil(lua_state, j))
							{
								putarg(unsigned long long*, NULL);
							}
							else
							{
								array_for_ffi_ref_arguments[i] = alloca(sizeof(unsigned long long));
								*((unsigned long long*)(array_for_ffi_ref_arguments[i])) = lua_tointeger(lua_state, j);
								putarg(unsigned long long*, (unsigned long long*)&(array_for_ffi_ref_arguments[i]));
							}
							break;
						}
						case _C_DBL:
						{
							if(lua_isnil(lua_state, j))
							{
								putarg(double*, NULL);
							}
							else
							{
								array_for_ffi_ref_arguments[i] = alloca(sizeof(double));
								*((double*)(array_for_ffi_ref_arguments[i])) = lua_tointeger(lua_state, j);
								putarg(double*, (double*)&(array_for_ffi_ref_arguments[i]));
							}
						}
						case _C_FLT:
						{
							if(lua_isnil(lua_state, j))
							{
								putarg(float*, NULL);
							}
							else
							{
								array_for_ffi_ref_arguments[i] = alloca(sizeof(float));
								*((float*)(array_for_ffi_ref_arguments[i])) = lua_tointeger(lua_state, j);
								putarg(float*, (float*)&(array_for_ffi_ref_arguments[i]));
							}
						}
							
						case _C_STRUCT_B:
						{
							// Array goes here too
							array_for_ffi_ref_arguments[i] = lua_touserdata(lua_state, j);
							//							array_for_ffi_arguments[i] = lua_touserdata(lua_state, j);
							array_for_ffi_arguments[i] = &array_for_ffi_ref_arguments[i];
							break;
						}
							
						case _C_ID:
						{
							if(lua_isnil(lua_state, j))
							{
								putarg(id, nil);
							}
							else
							{
								array_for_ffi_ref_arguments[i] = alloca(sizeof(id));
								if(LuaObjectBridge_isid(lua_state, j))
								{
									// Considering topropertylist, but I don't think the return-by-reference is going to work right
									array_for_ffi_ref_arguments[i] = LuaObjectBridge_toid(lua_state, j);
								}
								else
								{
									array_for_ffi_ref_arguments[i] = nil;
								}
								putarg(id*, (id*)&(array_for_ffi_ref_arguments[i]));
							}
							break;
						}
						case _C_CLASS:
						{
							if(lua_isnil(lua_state, j))
							{
								putarg(Class, nil);
							}
							else
							{
								array_for_ffi_ref_arguments[i] = alloca(sizeof(id));
								if(LuaObjectBridge_isid(lua_state, j))
								{
									// FIXME: Change to explicit toclass
									array_for_ffi_ref_arguments[i] = LuaObjectBridge_toid(lua_state, j);
								}
								else
								{
									array_for_ffi_ref_arguments[i] = nil;
								}
								putarg(id*, (id*)&(array_for_ffi_ref_arguments[i]));
							}
							break;
						}
						case _C_CHARPTR:
						{
							// I don't expect this to work at all
							if(lua_isnil(lua_state, j))
							{
								putarg(id, nil);
							}
							else
							{
								const char* the_string = lua_tostring(lua_state, j);
								size_t length_of_string = strlen(the_string) + 1; // add one for \0
								
								array_for_ffi_ref_arguments[i] = alloca(sizeof(length_of_string));
								strlcpy(array_for_ffi_ref_arguments[i], the_string, length_of_string);
								putarg(char*, (char*)&(array_for_ffi_ref_arguments[i]));
							}
							break;
						}
						case _C_SEL:
						{
							if(lua_isnil(lua_state, j))
							{
								putarg(SEL, NULL);
							}
							else
							{
								array_for_ffi_ref_arguments[i] = alloca(sizeof(SEL));
								if(LuaSelectorBridge_isselector(lua_state, j))
								{
									array_for_ffi_ref_arguments[i] = LuaSelectorBridge_toselector(lua_state, j);
								}
								else
								{
									array_for_ffi_ref_arguments[i] = nil;
								}
								putarg(SEL*, (SEL*)&(array_for_ffi_ref_arguments[i]));						
							}
							break;
						}
							
						case _C_PTR:
						default:
						{
							if(lua_isnil(lua_state, j))
							{
								putarg(id, nil);
							}
							else
							{
								array_for_ffi_ref_arguments[i] = alloca(sizeof(void*));
								if(LuaSelectorBridge_isselector(lua_state, j))
								{
									array_for_ffi_ref_arguments[i] = lua_touserdata(lua_state, j);
								}
								else
								{
									array_for_ffi_ref_arguments[i] = nil;
								}
								putarg(void**, (void**)&(array_for_ffi_ref_arguments[i]));						
							}
							break;
						}
					}
					
				}
				else
				{
					// Lion workaround for lack of Full bridgesupport file
					char objc_encoding_type;
					NSString* nsstring_encoding_type = current_parse_support_argument.objcEncodingType;
					if([nsstring_encoding_type length] < 1)
					{
						// assuming we are dealing with regular id's
						objc_encoding_type = _C_ID;						
					}
					else
					{
						objc_encoding_type = [nsstring_encoding_type UTF8String][0];						
					}
					
					switch(objc_encoding_type)
					{
						case _C_ID:
						{
							if(lua_isnil(lua_state, j))
							{
								putarg(id, nil);
							}
							else
							{
								// Will auto-coerce numbers, strings, tables to Cocoa objects
								id property_object = LuaObjectBridge_topropertylist(lua_state, j);			
								putarg(id, property_object);
							}
							break;
						}
						case _C_CLASS:
						{
							Class to_object = LuaObjectBridge_toid(lua_state, j);			
							putarg(Class, to_object);
							break;
						}
						case _C_CHARPTR:
						{
							if(lua_isstring(lua_state, j))
							{
								putarg(const char*, lua_tostring(lua_state, j));
							}
							else if(LuaObjectBridge_isnsstring(lua_state, j))
							{
								putarg(const char*, [LuaObjectBridge_tonsstring(lua_state, j) UTF8String]);								
							}
							else
							{
								putarg(const char*, NULL);
							}
							break;
						}
						case _C_SEL:
						{
							putarg(SEL, LuaSelectorBridge_toselector(lua_state, j));
							break;
						}
							
						case _C_PTR:
						default:
						{
							putarg(void*, lua_touserdata(lua_state, j));
						}
					}
				}
				break;
			}
		}
#       undef putarg
		// END COPY AND PASTE HERE
		
    }
	
	// if needed
	int stack_index_for_struct_return_value = 0;
	void* return_value = NULL;
	if(false == is_void_return)
	{
		if(FFI_TYPE_STRUCT == cif_ptr->rtype->type)
		{
			return_value = lua_newuserdata(lua_state, cif_ptr->rtype->size);
			stack_index_for_struct_return_value = lua_gettop(lua_state);
			
			// set correct struct metatable on new userdata
			NSString* return_struct_type_name = parse_support.returnValue.objcEncodingType;
			
			// set correct struct metatable on new userdata
			
			NSString* struct_struct_name = ParseSupport_StructureReturnNameFromReturnTypeEncoding(return_struct_type_name);
			
			NSString* struct_keyname = [ParseSupportStruct keyNameFromStructName:struct_struct_name];
			LuaStructBridge_SetStructMetatableOnUserdata(lua_state, stack_index_for_struct_return_value, struct_keyname, struct_struct_name);
		}
		else
		{
			// rvalue must point to storage that is sizeof(long) or larger. For smaller return value sizes, 
			// the ffi_arg or ffi_sarg integral type must be used to hold the return value.
			// But as far as I can tell, cif_ptr->rtype->size already has the correct size for this case.
			return_value = alloca(cif_ptr->rtype->size);
		}
	}
    
	// Call the function
	ffi_call(cif_ptr, FFI_FN(function_ptr), return_value, array_for_ffi_arguments);		
	
	// Undo the swizzle (swap) for super
	if(LuaObjectBridge_IsSuper(object_container))
	{
		// un-swizzle (swap) methods
		method_setImplementation(saved_self_method, saved_self_imp);
	}
	
	int number_of_return_values = 0;
	
	// If the result (now on the top of the stack) is an object instance
	// we need to check if we need to special handle the retain count.
	
	// This is exception is for things like CALayer where alloc leaves the retainCount at 0.
	// NSPlaceholder objects seem to have retainCounts of < 0. I don't think I need to worry about
	// retaining placeholder objects
	// Analysis:
	// For things like CALayer, defer CFRetain and release if the retainCount is 0 until init is called.
	// For things like Placeholder objects, I think retaining is irrelevant either way as I expect
	// a retain and release to be a no-op. However, if it is not a no-op, then I think I can
	// retain here and when init is called, the reference will generally be overwritten in Lua
	// so Lua knows to collect its memory and we will get to call a balancing release.
	// The release however must be deferred until the init.
	// But this block of code will see the final object as a new/different object because
	// the memory addresses are different.
    
	// I could be more aggressive about checking BridgeSupport to make sure id is the return type.
	if( 0 == strcmp(objc_method_name, "alloc")
	   || 0 == strcmp(objc_method_name, "allocWithZone:")
       )
	{
        
		// Drat. CALayer remains at retainCount=0 after alloc. Seems to change
		// after init. Releasing here causes the object to be released
		// before init can save the object.
		// Also, for placeholder objects, (e.g. NSPlaceholderString, NSPlaceholderDictionary)
		// I may be releasing the wrong objects anyway.
		// So here is a hack to defer retaining and releasing
        
		number_of_return_values += LuaFFISupport_PushReturnValue(lua_state, return_value, cif_ptr->rtype, parse_support.returnValue, stack_index_for_struct_return_value, false, false);
        
	}
	else if(0 == strcmp(objc_method_name, "copy")
            || 0 == strcmp(objc_method_name, "copyWithZone:")
            || 0 == strcmp(objc_method_name, "mutableCopy")
            || 0 == strcmp(objc_method_name, "mutableCopyWithZone:")
            || 0 == strcmp(objc_method_name, "new")
            )
	{
		// Unlike elsewhere, we use release instead of CFRelease
		// because in this case, we are not trying to cancel-out
		// the CFRetain used by lua_objc_pushid which keeps the
		// pointer alive under objc-gc, but cancel-out the extra
		// ref-increment caused by the above methods.
		// Under objc-gc, we only want to use release knowing
		// it is a no-op. Otherwise, we could accidentally decrement
		// the ref-count with CFRelease which is the only thing
		// preventing the objc-gc system from collecting an object
		// out from Lua.
		// I thought about autorelease, but I think release is better
		// because I'm guaranteed to still have an object because of the 
		// CFRetain stuff I do, and I don't have to worry about autorelease pools.
		
		
		
		// Special Hack for objects subclassed in Lua.
		// I need to make sure they get the lua_State* and maybe initialize an ivar table
		// This is a hack. I assume the return value is always an id for init.
		// Grab the return value so we create the environmental table first so it is ready for Pushid.
		LuaSubclassBridge_InitializeNewLuaObjectIfSubclassInLua(*(id*) return_value, lua_state);
		
		// FIXME: Need to copy object instance's Lua-side properties (environment tables, variables) if a subclass
#warning "FIXME: Need to copy object instance's Lua-side properties (environment tables, variables) if a subclass"	
		
		// This will do a CFRetain on the object for the bridge
		number_of_return_values += LuaFFISupport_PushReturnValue(lua_state, return_value, cif_ptr->rtype, parse_support.returnValue, stack_index_for_struct_return_value, true, false);
        
		id the_return_instance = LuaObjectBridge_toid(lua_state, -1);
		// Problem: the instance may not be actually conform to the NSObject protocol
		// respondsToSelector is part of that. Doesn't seem to be much sense checking.
        //			if([the_return_instance respondsToSelector:@selector(release)])
        //			{
        
        // This will decrement the retain count by 1 because we don't need the extra retain generated by these methods
        [the_return_instance release];
        //			}
	}
	else if(0 == strncmp(objc_method_name, "init", 4))
	{
		// Any time a method starts with init, I'll assume an alloc immediately predated it.
		// This might be bad, but I don't know what else to do.
        
        
		// Special Hack for objects subclassed in Lua.
		// I need to make sure they get the lua_State* and maybe initialize an ivar table
		// This is a hack. I assume the return value is always an id for init.
		// Grab the return value so we create the environmental table first so it is ready for Pushid.
		LuaSubclassBridge_InitializeNewLuaObjectIfSubclassInLua(*(id*) return_value, lua_state);
		
		
		// This will push the return value. If the object is already in the weak table, it will do nothing to the retain counts
		// which we will fix immediately below this
		number_of_return_values += LuaFFISupport_PushReturnValue(lua_state, return_value, cif_ptr->rtype, parse_support.returnValue, stack_index_for_struct_return_value, true, false);
		
		// don't think I need to check, just get the pointer
		LuaUserDataContainerForObject* the_container = lua_touserdata(lua_state, -1);
		
		
		// Compare the pointers for the object passed into this function to the one that was returned.
		if(object_container->theObject == the_container->theObject)
		{
			// Another special exception needs to be made for calls to super:init()
			// when overriding methods. We do not want to add extra retains in this case.
			if(!LuaObjectBridge_IsSuper(object_container))
			{
				
				//			NSLog(@"We are reusing the same object for init");
				// In the case where we continue with the same object, we need to correct the retain counts and status flags that we deferred under the alloc side.
				// retain for bridge (using CFRetain for Obj-C 2.0 Garbage Collection to disable collection on this object while under Lua control)
				// retain for bridge (using CFRetain for Obj-C 2.0 Garbage Collection to disable collection on this object while under Lua control)
				CFRetain(the_container->theObject);
				// release for alloc (using regular retain for Obj-C 2.0 Garbage Collection. alloc/init only need to be nullified in the gc case, so no-op release is good in gc.)
				[the_container->theObject release];
				// clear the flag
				the_container->needsRelease = true;	
			}
            
		}
		else
		{
			//			NSLog(@"Looks like we have a different object for init");
			// In this case, we have a brand new object and userdata container that is separate from the old one.
			// The old one is expected to drop out so we can ignore it.
			// Don't need to call CFRetain in this case because PushReturnValue was instructed to CFRetain for us for our bridge.
			// Retain count should now be 2 on the object: 1 for alloc/init, 1 for CFRetain by our bridge
			// We need to release 1 for alloc/init (using regular retain for Obj-C 2.0 Garbage Collection. alloc/init only need to be nullified in the gc case, so no-op release is good in gc.)
			[the_container->theObject release];
		}
        
        
        
	}
	else if(parse_support.returnValue.isAlreadyRetained)
	{
		// We likely called a function like CF*Create().
		// Push, but don't increment the retain count. 
		// We must release the retain count by one
		// I assume the function used a CFRetain() to hold the object.
		// (I only see the already_retained marker in the CoreFoundation XML.)
		// Tell the push function not to retain. We will use this retain towards our bridge count
		number_of_return_values += LuaFFISupport_PushReturnValue(lua_state, return_value, cif_ptr->rtype, parse_support.returnValue, stack_index_for_struct_return_value, false, false);
		LuaUserDataContainerForObject* the_container = lua_touserdata(lua_state, -1);
		the_container->needsRelease = true;
	}
	else
	{
		// general case. Always try to retain and let the natural logic sort out the mess.
		if(false == is_void_return)
		{
			number_of_return_values += LuaFFISupport_PushReturnValue(lua_state, return_value, cif_ptr->rtype, parse_support.returnValue, stack_index_for_struct_return_value, true, false);			
		}
	}
    
    
	// Now traverse out arguments and see which we need to return
	size_t argument_index = 0;
	for(ParseSupportArgument* current_parse_support_argument in parse_support.argumentArray)
	{
		// check for out or inout arguments
		if([current_parse_support_argument.inOutTypeModifier isEqualToString:@"o"] || [current_parse_support_argument.inOutTypeModifier isEqualToString:@"N"])
		{
			int stack_index_for_argument = argument_index + NUMBER_OF_SUPPORT_ARGS + 1; // shift for support arguments, add 1 for lua index starts at 0
			number_of_return_values += LuaFFISupport_PushReturnValue(lua_state, array_for_ffi_arguments[argument_index], cif_ptr->arg_types[argument_index], current_parse_support_argument, stack_index_for_argument, true, true);
		}
		argument_index++;
	}

	return number_of_return_values;
	
}
#endif