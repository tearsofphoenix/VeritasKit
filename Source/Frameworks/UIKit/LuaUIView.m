//
//  LuaUIView.m
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIView.h"

#import "LuaObjCMessage.h"

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
                                          luaL_error(luaState, "error in [UIView animateWithDuration:animations:]");
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
                                          luaL_error(luaState, "error in animation of [UIView animateWithDuration:animations:completion:]");
                                      }
                                  })
                     completion: (^(BOOL finished) 
                                  {                                      
                                      lua_rawgeti(luaState, LUA_REGISTRYINDEX, completionID);
                                      lua_pushboolean(luaState, finished);
                                      int status = lua_pcall(luaState, 1, 0, 0);
                                      if (status != LUA_OK)
                                      {
                                          luaL_error(luaState, "error in completion of [UIView animateWithDuration:animations:completion:]");
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
                                          luaL_error(luaState, "error in animation of [UIView animateWithDuration:delay:options:animations:completion:]");
                                      }
                                  })
                     completion: (^(BOOL finished) 
                                  {
                                      lua_rawgeti(luaState, LUA_REGISTRYINDEX, completionID);
                                      lua_pushboolean(luaState, finished);
                                      int status = lua_pcall(luaState, 1, 0, 0);
                                      if (status != LUA_OK)
                                      {
                                          luaL_error(luaState, "error in completion of [UIView animateWithDuration:delay:options:animations:completion:]");
                                      }
                                  })];
    return 0;
}

int LuaObjCOpenUIView(lua_State *L)
{    
    //UIView animation accelerators
    //
    LuaObjCRegisterAccelerator([UIView class], @selector(animateWithDuration:animations:),
                                _luaObjC_UIView_animateWithDuration_animations);
    LuaObjCRegisterAccelerator([UIView class], @selector(animateWithDuration:animations:completion:),
                                _luaObjC_UIView_animateWithDuration_animations_completion);
    LuaObjCRegisterAccelerator([UIView class], @selector(animateWithDuration:delay:options:animations:completion:),
                                _luaObjC_UIView_animateWithDuration_delay_options_animations_completion);
    
    return 0;
}
