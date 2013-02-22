//
//  VMKFunctions.m
//  VeritasMachineKit
//
//  Created by LeixSnake on 2/21/13.
//
//

#include "VMKFunctions.h"
#include "VMKAuxiliary.h"

static int luaObjC_NSLog(VMKLuaStateRef state)
{
    const char* charLooper = VMKCheckString(state, 1);
    
    NSMutableString *logString = [NSMutableString string];
    int iLooper = 2;
    while (charLooper && *charLooper)
    {
        switch (*charLooper)
        {
            case '%':
            {
                ++charLooper;
                switch (*charLooper)
                {
                    case 0:
                    {
                        //end of the format string
                        break;
                    }
                    case '%':
                    {
                        [logString appendString: @"%@"];
                        break;
                    }
                    case 'd':
                    case 'i':
                    case 'u':
                    {
                        lua_Integer value = lua_tointeger(state, iLooper);
#if TARGET_OS_IPHONE
                        [logString appendFormat: @"%d", (NSInteger)value];
#else
                        [logString appendFormat: @"%ld", (NSInteger)value];
#endif
                        ++iLooper;
                        break;
                    }
                    case 'f':
                    case 'F':
                    {
                        double value = lua_tonumber(state, iLooper);
                        [logString appendFormat: @"%f", value];
                        ++iLooper;
                        break;
                    }
                    case 's':
                    {
                        const char *s = lua_tostring(state, iLooper);
                        [logString appendFormat: @"%s", s];
                        ++iLooper;
                        break;
                    }
                    case 'p':
                    {
                        void* value = lua_touserdata(state, iLooper);
                        [logString appendFormat: @"%p", value];
                        ++iLooper;
                        break;
                    }
                    case 'c':
                    {
                        char c = lua_tointeger(state, iLooper);
                        [logString appendFormat: @"%c", c];
                        ++iLooper;
                        break;
                    }
                    case '@':
                    {
                        id obj = VMKCheckObject(state, iLooper);
                        [logString appendFormat: @"%@", obj];
                        ++iLooper;
                        break;
                    }
                    default:
                    {
                        [logString appendFormat: @"%c", *charLooper];
                        break;
                    }
                }
                break;
            }
            default:
            {
                [logString appendFormat: @"%c", *charLooper];
                break;
            }
        }
        ++charLooper;
    }
    
    NSLog(@"%@", logString);
    
    return 0;
}

static const luaL_Reg luaNS_functions[] =
{
    {"NSLog", luaObjC_NSLog},
    {NULL, NULL}
};

int VMKOpenNSFunctions(VMKLuaStateRef state)
{
    VMKLoadGlobalFunctions(state, luaNS_functions);
    
    luaL_newlib(state, luaNS_functions);
    
    return 1;
}
