//
//  VMKProfile.m
//  LuaIOS
//
//  Created by tearsofphoenix on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VMKProfile.h"

#import "VMKAuxiliary.h"

#import <mach/mach_time.h>

static int luaObjc_nano_timeinterval(VMKLuaStateRef state)
{
    lua_Number timeinterval = luaL_checknumber(state, 1);
    
    static mach_timebase_info_data_t sTimebaseInfo;
    
    // Convert to nanoseconds.
    
    // If this is the first time we've run, get the timebase.
    // We can use denom == 0 to indicate that sTimebaseInfo is 
    // uninitialised because it makes no sense to have a zero 
    // denominator is a fraction.
    
    if ( sTimebaseInfo.denom == 0 ) 
    {
        (void) mach_timebase_info(&sTimebaseInfo);
    }
    
    // Do the maths. We hope that the multiplication doesn't 
    // overflow; the price you pay for working in fixed point.
    
    lua_pushnumber(state,  timeinterval * sTimebaseInfo.numer / sTimebaseInfo.denom);
    
    return 1;
}


static int luaObjc_micro_timeinterval(VMKLuaStateRef state)
{
    lua_Number timeinterval = luaL_checknumber(state, 1);
    
    static mach_timebase_info_data_t sTimebaseInfo;
    
    // Convert to nanoseconds.
    
    // If this is the first time we've run, get the timebase.
    // We can use denom == 0 to indicate that sTimebaseInfo is 
    // uninitialised because it makes no sense to have a zero 
    // denominator is a fraction.
    
    if ( sTimebaseInfo.denom == 0 ) 
    {
        (void) mach_timebase_info(&sTimebaseInfo);
    }
    
    // Do the maths. We hope that the multiplication doesn't 
    // overflow; the price you pay for working in fixed point.
    
    lua_pushnumber(state,  timeinterval * sTimebaseInfo.numer / (sTimebaseInfo.denom * 1000000));
    
    return 1;
}

static int luaObjc_mach_time(VMKLuaStateRef state)
{
    lua_pushnumber(state,  mach_absolute_time());
    return 1;
}


static const luaL_Reg __luaObjCProfileFunctions [] = 
{
    //profile
    {"mach_time", luaObjc_mach_time},
    {"nanoseconds", luaObjc_nano_timeinterval},
    {"microseconds", luaObjc_micro_timeinterval},
    {NULL, NULL}
};


int VMKOpenProfileSupport(VMKLuaStateRef state)
{
    VMKLoadGlobalFunctions(state, __luaObjCProfileFunctions);
    return 1;
}
