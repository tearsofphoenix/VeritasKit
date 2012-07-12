//
//  LuaObjCExtensions.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaObjCExtensions.h"

#import "LuaObjCAuxiliary.h"

#import "lstate.h"

#import "lauxlib.h"



#import "LuaObjCInternal.h"

#import "NSString+LuaObjCIndex.h"
#import "NSArray+LuaObjCIndex.h"
#import "NSDictionary+LuaObjCIndex.h"

#import "Block_private.h"

static struct Block_descriptor_1 * _Block_descriptor_1(struct Block_layout *aBlock)
{
    return aBlock->descriptor;
}

static struct Block_descriptor_2 * _Block_descriptor_2(struct Block_layout *aBlock)
{
    if (! (aBlock->flags & BLOCK_HAS_COPY_DISPOSE)) return NULL;
    uint8_t *desc = (uint8_t *)aBlock->descriptor;
    desc += sizeof(struct Block_descriptor_1);
    return (struct Block_descriptor_2 *)desc;
}

static struct Block_descriptor_3 * _Block_descriptor_3(struct Block_layout *aBlock)
{
    if (! (aBlock->flags & BLOCK_HAS_SIGNATURE)) return NULL;
    uint8_t *desc = (uint8_t *)aBlock->descriptor;
    desc += sizeof(struct Block_descriptor_1);
    if (aBlock->flags & BLOCK_HAS_COPY_DISPOSE) {
        desc += sizeof(struct Block_descriptor_2);
    }
    return (struct Block_descriptor_3 *)desc;
}

static const char *MyBlock_dump(const void *block) {
    struct Block_layout *closure = (struct Block_layout *)block;
    static char buffer[512];
    char *cp = buffer;
    if (closure == NULL) {
        sprintf(cp, "NULL passed to _Block_dump\n");
        return buffer;
    }
    cp += sprintf(cp, "^%p (new layout) =\n", closure);
    if (closure->isa == NULL) {
        cp += sprintf(cp, "isa: NULL\n");
    }
    else if (closure->isa == _NSConcreteStackBlock) {
        cp += sprintf(cp, "isa: stack Block\n");
    }
    else if (closure->isa == _NSConcreteMallocBlock) {
        cp += sprintf(cp, "isa: malloc heap Block\n");
    }
    else if (closure->isa == _NSConcreteAutoBlock) {
        cp += sprintf(cp, "isa: GC heap Block\n");
    }
    else if (closure->isa == _NSConcreteGlobalBlock) {
        cp += sprintf(cp, "isa: global Block\n");
    }
    else if (closure->isa == _NSConcreteFinalizingBlock) {
        cp += sprintf(cp, "isa: finalizing Block\n");
    }
    else {
        cp += sprintf(cp, "isa?: %p\n", closure->isa);
    }
    cp += sprintf(cp, "flags:");
    if (closure->flags & BLOCK_HAS_SIGNATURE) {
        cp += sprintf(cp, " HASSIGNATURE");
    }
    if (closure->flags & BLOCK_USE_STRET) {
        cp += sprintf(cp, " STRET");
    }
    if (closure->flags & BLOCK_NEEDS_FREE) {
        cp += sprintf(cp, " FREEME");
    }
    if (closure->flags & BLOCK_IS_GC) {
        cp += sprintf(cp, " ISGC");
    }
    if (closure->flags & BLOCK_HAS_COPY_DISPOSE) {
        cp += sprintf(cp, " HASHELP");
    }
    if (closure->flags & BLOCK_HAS_CTOR) {
        cp += sprintf(cp, " HASCTOR");
    }
    cp += sprintf(cp, "\nrefcount+deallocating: %u\n", closure->flags & (BLOCK_REFCOUNT_MASK|BLOCK_DEALLOCATING));
    cp += sprintf(cp, "invoke: %p\n", closure->invoke);
    {
        struct Block_descriptor_1 *desc1 = _Block_descriptor_1(closure);
        struct Block_descriptor_2 *desc2 = _Block_descriptor_2(closure);
        struct Block_descriptor_3 *desc3 = _Block_descriptor_3(closure);
        if (desc1) {
            cp += sprintf(cp, "descriptor: %p\n", desc1);
            cp += sprintf(cp, "descriptor->reserved: %lu\n", desc1->reserved);
            cp += sprintf(cp, "descriptor->size: %lu\n", desc1->size);
        }
        if (desc2) {
            cp += sprintf(cp, "descriptor->copy helper: %p\n", desc2->copy);
            cp += sprintf(cp, "descriptor->dispose helper: %p\n", desc2->dispose);
        }
        if (desc3) {
            cp += sprintf(cp, "descriptor->signature: %p '%s'\n", desc3->signature, desc3->signature);
            cp += sprintf(cp, "descriptor->layout: %p '%s'\n", desc3->layout, desc3->layout);
        }
    }
    return buffer;
}

void MyBlock_ReplaceInvokeFunction(void *block, void *newInvoke)
{
    struct Block_layout *closure = (struct Block_layout *)block;
    closure->invoke = newInvoke;
}

static int luaObjC_convertTableToNSArray(lua_State *L)
{
    int type = lua_type(L, 1);
    
    switch (type)
    {
        case LUA_TNIL:
        {
            lua_pushnil(L);
            return 1;
        }
        case LUA_TTABLE:
        {
            int n = lua_rawlen(L, 1);                                
            NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity: n];
            
            for (int i=0; i<n; ++i)
            {
                lua_rawgeti(L, 1, i+1);                             
                [array addObject: luaObjC_checkNSObject(L, -1)];           
                lua_remove(L, -1);
            }
            
            luaObjC_pushNSObject(L, array);
            
            return 1; 
        }
        default:
        {
            printf("Error:Invalid argument for object array!");
            return 0;
        }
    }
    
    return 0;
}

static int  luaObjC_convertTableToNSDictionary(lua_State *L)
{
    int type = lua_type(L, 1);
    
    switch (type)
    {
        case LUA_TNIL:
        {
            lua_pushnil(L);
            return 1;
        }
        case LUA_TTABLE:
        {
            int n = lua_rawlen(L, 1);                                
            NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] initWithCapacity: n];
            id keyLooper = nil;
            id valueLooper = nil;
            for (int i=0; i<n; i = i + 2)
            {
                lua_rawgeti(L, 1, i+1);                             
                keyLooper = luaObjC_checkNSObject(L, -1);           
                lua_remove(L, -1);
                
                lua_rawgeti(L, 1, i+2);                             
                valueLooper = luaObjC_checkNSObject(L, -1);           
                lua_remove(L, -1);
                
                [dictionary setObject: valueLooper
                               forKey: keyLooper];
            }
            
            luaObjC_pushNSObject(L, dictionary);
            
            return 1; 
        }
        default:
        {
            printf("Error:Invalid argument for object array!");
            return 0;
        }
    }
    
    return 0;
}

static int luaObjC_convertNSObjectToTable(lua_State *L)
{
    id obj = luaObjC_checkNSObject(L, 1);
    
    if ([obj isKindOfClass: [NSArray class]])
    {
        NSUInteger size = [obj count];
        lua_createtable(L, size, 0);
        
        for (int i = 0; i < size; ++i)
        {
            lua_pushinteger(L, i+1); 
            luaObjC_pushNSObject(L, [obj objectAtIndex: i]);
            lua_settable(L, -3);
        }
        return 1;
    }else if([obj isKindOfClass: [NSDictionary class]])
    {
        NSUInteger count = [obj count];
        lua_createtable(L, 0, count);
        id valueLooper = nil;
        for (id keyLooper in obj)
        {  /* fill the table with given functions */
            valueLooper = [obj objectForKey: keyLooper];
            luaObjC_pushNSObject(L, keyLooper);
            luaObjC_pushNSObject(L, valueLooper);
            lua_settable(L, -3);
        }
        return 1;
    }else 
    {
        NSLog(@"Error, unsupported class:%@ to table\n", [obj class]);
    }
    
    return 0;
}

static int luaObjC_objc_throw(lua_State *L)
{
    NSString *reason = nil;
    switch (lua_type(L, 1))
    {
        case LUA_TNIL:
        case LUA_TNONE:
        {
            reason = @"@throw nil value!";
            break;
        }   
        case LUA_TBOOLEAN:
        {
            BOOL value = lua_toboolean(L, 1);
            reason = [NSString stringWithFormat: @"@throw BOOL:%s value!", 
                      value ? "YES" : "NO"];
            break;
        }
        case LUA_TLIGHTUSERDATA:
        {
            void* p = lua_touserdata(L, 1);
            reason = [NSString stringWithFormat: @"@throw pointer:%p value!", p];
            break;
        }
        case LUA_TNUMBER:
        {
            lua_Number number = lua_tonumber(L, 1);
            reason = [NSString stringWithFormat: @"@throw number:%f value!", number];
            break;
        }
        case LUA_TSTRING:
        {
            const char* str = lua_tostring(L, 1);
            reason = [NSString stringWithFormat: @"@throw string:%s value!", str];
            break;
        }
        case LUA_TTABLE:
        {
            reason = @"@throw table value!";
            break;
        }
        case LUA_TFUNCTION:
        {                                                            
            reason = @"@throw function value!";
            break;
        }
        case LUA_TUSERDATA:
        {
            id obj = luaObjC_checkNSObject(L, 1);
            reason = [NSString stringWithFormat: @"@throw object:%@ value!", obj];
            break;
        }            
        case LUA_TTHREAD:
        {                                                             
            reason = @"@throw thread value!";
            break;
        }
        default:
        {                                                             
            reason = @"@throw (unknown) type!";
            break;
        }
    }
    
    NSException *exception = [NSException exceptionWithName: @"LuaObjCException"
                                                     reason: reason
                                                   userInfo: nil];

    @throw exception;
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
            luaObjC_throwExceptionIfError(L);
        }
        

    }
    @catch (NSException *exception) 
    {
        lua_rawgeti(L, LUA_REGISTRYINDEX, catchBlock);

        luaObjC_pushNSObject(L, exception);

        printf("catch in objc, line:%d\n", __LINE__);

        if(lua_pcall(L, 1, 0, 0) != LUA_OK)
        {
            printf("1st in catch\n");

            luaObjC_throwExceptionIfError(L);
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

static int luaObjC_createLiteralArray(lua_State *L)
{
    int count = lua_gettop(L);
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int iLooper = 1; iLooper < count + 1; ++iLooper)
    {
        [array addObject: luaObjC_checkNSObject(L, iLooper)];
    }
    luaObjC_pushNSObject(L, array);
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
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithObjects: values 
                                                                     forKeys: keys];
    luaObjC_pushNSObject(L, dict);
    return 1;
}

static int luaObjC_createConstantNumber(lua_State *L)
{
    CGFloat number = lua_tonumber(L, 1);
    luaObjC_pushNSObject(L, [NSNumber numberWithDouble: number]);
    return 1;
}

static const luaL_Reg __luaObjCExtensions [] =
{
    //veritas extensions
    {"luaObjC_convertTableToNSArray", luaObjC_convertTableToNSArray},
    {"luaObjC_convertTableToNSDictionary",luaObjC_convertTableToNSDictionary},
    {"luaObjC_convertNSObjectToTable", luaObjC_convertNSObjectToTable},
    {"objc_tryCatchFinally", luaObjC_objc_tryCatchFinally},
    {"objc_throw", luaObjC_objc_throw},
    {"objc_UUIDString", luaObjC_objc_UUIDString},
    {"objc_NSFastEnumerate", luaObjC_objc_NSFastEnumerate},
    {"objc_createLiteralArray", luaObjC_createLiteralArray},
    {"objc_createLiteralDictionary", luaObjC_createLiteralDictionary},
    {"__NSConstantNumber", luaObjC_createConstantNumber},
    {NULL, NULL}
};

int luaopen_objc_extensions(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __luaObjCExtensions);
    return 1;
}