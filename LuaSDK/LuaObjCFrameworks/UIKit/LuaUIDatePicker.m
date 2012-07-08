//
//  LuaUIDatePicker.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIDatePicker.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUIDatePickerConstants[] = {
    {"UIDatePickerModeTime", UIDatePickerModeTime},
    {"UIDatePickerModeDate", UIDatePickerModeDate},
    {"UIDatePickerModeDateAndTime", UIDatePickerModeDateAndTime},
    {"UIDatePickerModeCountDownTimer", UIDatePickerModeCountDownTimer},
    {NULL, 0},
};

int LuaOpenUIDatePicker(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUIDatePickerConstants);
    return 0;
}
