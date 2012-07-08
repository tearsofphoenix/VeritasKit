//
//  LuaUIView.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIView.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"
#import "LuaObjCAccelerator.h"

static int _luaObjC_UIView_animateWithDuration_animations(id obj, SEL selector, lua_State *luaState)
{    
    NSTimeInterval duration = luaL_checknumber(luaState, LuaObjCArgumentStart);
    int clouserID = luaL_ref(luaState, LUA_REGISTRYINDEX);
    
    [UIView animateWithDuration: duration
                     animations: (^
                                  {
                                      lua_rawgeti(luaState, LUA_REGISTRYINDEX, clouserID);
                                      
                                      int status = lua_pcall(luaState, 0, 1, 0);
                                      if (status != LUA_OK)
                                      {
                                          luaObjC_throwExceptionIfError(luaState);
                                      }
                                  })];
    return 0;
}

static int _luaObjC_UIView_animateWithDuration_animations_completion(id obj, SEL selector, lua_State *luaState)
{
    NSTimeInterval duration = luaL_checknumber(luaState, LuaObjCArgumentStart);
    int completionID = luaL_ref(luaState, LUA_REGISTRYINDEX);
    int animationID = luaL_ref(luaState, LUA_REGISTRYINDEX);
    
    [UIView animateWithDuration: duration
                     animations: (^
                                  {
                                      lua_rawgeti(luaState, LUA_REGISTRYINDEX, animationID);
                                      
                                      int status = lua_pcall(luaState, 0, 0, 0);
                                      if (status != LUA_OK)
                                      {
                                          luaObjC_throwExceptionIfError(luaState);
                                      }
                                  })
                     completion: (^(BOOL finished) 
                                  {                                      
                                      lua_rawgeti(luaState, LUA_REGISTRYINDEX, completionID);
                                      lua_pushboolean(luaState, finished);
                                      int status = lua_pcall(luaState, 1, 0, 0);
                                      if (status != LUA_OK)
                                      {
                                          luaObjC_throwExceptionIfError(luaState);
                                      }
                                  })];
    return 0;
}

static int _luaObjC_UIView_animateWithDuration_delay_options_animations_completion(id obj, SEL selector, lua_State *luaState)
{
    NSTimeInterval delay = luaL_checknumber(luaState, LuaObjCArgumentStart);
    UIViewAnimationOptions options = lua_tointeger(luaState, LuaObjCArgumentStart + 1);
    NSTimeInterval duration = lua_tonumber(luaState, LuaObjCArgumentStart + 2);
    int completionID = luaL_ref(luaState, LUA_REGISTRYINDEX);
    int clouserID = luaL_ref(luaState, LUA_REGISTRYINDEX);
    
    [UIView animateWithDuration: duration
                          delay: delay
                        options: options
                     animations: (^
                                  {
                                      lua_rawgeti(luaState, LUA_REGISTRYINDEX, clouserID);
                                      
                                      int status = lua_pcall(luaState, 0, 0, 0);
                                      if (status != LUA_OK)
                                      {
                                          luaObjC_throwExceptionIfError(luaState);
                                      }
                                  })
                     completion: (^(BOOL finished) 
                                  {
                                      lua_rawgeti(luaState, LUA_REGISTRYINDEX, completionID);
                                      lua_pushboolean(luaState, finished);
                                      int status = lua_pcall(luaState, 1, 0, 0);
                                      if (status != LUA_OK)
                                      {
                                          luaObjC_throwExceptionIfError(luaState);
                                      }
                                  })];
    return 0;
}

static const LuaSDKConst __luaUIViewConstants[] = 
{
    {"UIViewAnimationCurveEaseInOut", UIViewAnimationCurveEaseInOut},
    {"UIViewAnimationCurveEaseIn", UIViewAnimationCurveEaseIn},
    {"UIViewAnimationCurveEaseOut", UIViewAnimationCurveEaseOut},
    {"UIViewAnimationCurveLinear", UIViewAnimationCurveLinear},
    {"UIViewContentModeScaleToFill", UIViewContentModeScaleToFill},
    {"UIViewContentModeScaleAspectFit", UIViewContentModeScaleAspectFit},
    {"UIViewContentModeScaleAspectFill", UIViewContentModeScaleAspectFill},
    {"UIViewContentModeRedraw", UIViewContentModeRedraw},
    {"UIViewContentModeCenter", UIViewContentModeCenter},
    {"UIViewContentModeTop", UIViewContentModeTop},
    {"UIViewContentModeBottom", UIViewContentModeBottom},
    {"UIViewContentModeLeft", UIViewContentModeLeft},
    {"UIViewContentModeRight", UIViewContentModeRight},
    {"UIViewContentModeTopLeft", UIViewContentModeTopLeft},
    {"UIViewContentModeTopRight", UIViewContentModeTopRight},
    {"UIViewContentModeBottomLeft", UIViewContentModeBottomLeft},
    {"UIViewContentModeBottomRight", UIViewContentModeBottomRight},
    {"UIViewAnimationTransitionNone", UIViewAnimationTransitionNone},
    {"UIViewAnimationTransitionFlipFromLeft", UIViewAnimationTransitionFlipFromLeft},
    {"UIViewAnimationTransitionFlipFromRight", UIViewAnimationTransitionFlipFromRight},
    {"UIViewAnimationTransitionCurlUp", UIViewAnimationTransitionCurlUp},
    {"UIViewAnimationTransitionCurlDown", UIViewAnimationTransitionCurlDown},
    {"UIViewAutoresizingNone", UIViewAutoresizingNone},
    {"UIViewAutoresizingFlexibleLeftMargin", UIViewAutoresizingFlexibleLeftMargin},
    {"UIViewAutoresizingFlexibleWidth", UIViewAutoresizingFlexibleWidth},
    {"UIViewAutoresizingFlexibleRightMargin", UIViewAutoresizingFlexibleRightMargin},
    {"UIViewAutoresizingFlexibleTopMargin", UIViewAutoresizingFlexibleTopMargin},
    {"UIViewAutoresizingFlexibleHeight", UIViewAutoresizingFlexibleHeight},
    {"UIViewAutoresizingFlexibleBottomMargin", UIViewAutoresizingFlexibleBottomMargin},
    {"UIViewAnimationOptionLayoutSubviews", UIViewAnimationOptionLayoutSubviews},
    {"UIViewAnimationOptionAllowUserInteraction", UIViewAnimationOptionAllowUserInteraction},
    {"UIViewAnimationOptionBeginFromCurrentState", UIViewAnimationOptionBeginFromCurrentState},
    {"UIViewAnimationOptionRepeat", UIViewAnimationOptionRepeat},
    {"UIViewAnimationOptionAutoreverse", UIViewAnimationOptionAutoreverse},
    {"UIViewAnimationOptionOverrideInheritedDuration", UIViewAnimationOptionOverrideInheritedDuration},
    {"UIViewAnimationOptionOverrideInheritedCurve", UIViewAnimationOptionOverrideInheritedCurve},
    {"UIViewAnimationOptionAllowAnimatedContent", UIViewAnimationOptionAllowAnimatedContent},
    {"UIViewAnimationOptionShowHideTransitionViews", UIViewAnimationOptionShowHideTransitionViews},
    {"UIViewAnimationOptionCurveEaseInOut", UIViewAnimationOptionCurveEaseInOut},
    {"UIViewAnimationOptionCurveEaseIn", UIViewAnimationOptionCurveEaseIn},
    {"UIViewAnimationOptionCurveEaseOut", UIViewAnimationOptionCurveEaseOut},
    {"UIViewAnimationOptionCurveLinear", UIViewAnimationOptionCurveLinear},
    {"UIViewAnimationOptionTransitionNone", UIViewAnimationOptionTransitionNone},
    {"UIViewAnimationOptionTransitionFlipFromLeft", UIViewAnimationOptionTransitionFlipFromLeft},
    {"UIViewAnimationOptionTransitionFlipFromRight", UIViewAnimationOptionTransitionFlipFromRight},
    {"UIViewAnimationOptionTransitionCurlUp", UIViewAnimationOptionTransitionCurlUp},
    {"UIViewAnimationOptionTransitionCurlDown", UIViewAnimationOptionTransitionCurlDown},
    {"UIViewAnimationOptionTransitionCrossDissolve", UIViewAnimationOptionTransitionCrossDissolve},
    {"UIViewAnimationOptionTransitionFlipFromTop", UIViewAnimationOptionTransitionFlipFromTop},
    {"UIViewAnimationOptionTransitionFlipFromBottom", UIViewAnimationOptionTransitionFlipFromBottom},
    {NULL, 0},
};

int LuaOpenUIView(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUIViewConstants);
    
    //UIView animation accelerators
    //
    luaObjC_registerAccelerator(@selector(animateWithDuration:animations:), _luaObjC_UIView_animateWithDuration_animations);
    luaObjC_registerAccelerator(@selector(animateWithDuration:animations:completion:),_luaObjC_UIView_animateWithDuration_animations_completion);
    luaObjC_registerAccelerator(@selector(animateWithDuration:delay:options:animations:completion:), _luaObjC_UIView_animateWithDuration_delay_options_animations_completion);
    
    return 0;
}
