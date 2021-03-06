//
//  main.m
//  Demos
//
//  Created by Mac003 on 14/12/26.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <lua.h>
#import <lualib.h>
#import <lauxlib.h>
#import <LuaSDL/LuaSDL.h>
#import <SDL_main.h>

int setLuaPath(lua_State *L, NSString* path )
{
    lua_getglobal( L, "package" );
    lua_getfield( L, -1, "path" ); // get field "path" from table at top of stack (-1)
    NSString * cur_path = [NSString stringWithUTF8String:lua_tostring( L, -1 )]; // grab path string from top of stack
    cur_path = [cur_path stringByAppendingString:@";"]; // do your path magic here
    cur_path = [cur_path stringByAppendingString:path];
    cur_path = [cur_path stringByAppendingString:@"/?.lua"];
    lua_pop( L, 1 ); // get rid of the string on the stack we just pushed on line 5
    lua_pushstring( L, [cur_path UTF8String]); // push the new one
    lua_setfield( L, -2, "path" ); // set the field "path" in table at -2 with value at top of stack
    lua_pop( L, 1 ); // get rid of package table from top of stack
    return 0; // all done!
}


void testTTF(lua_State *L)
{
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *path = [mainBundle pathForResource: @"font"
                                          ofType: @"lua"];
    NSError *error = nil;
    NSString *content = [[NSString alloc] initWithContentsOfFile: path
                                                        encoding: NSUTF8StringEncoding
                                                           error: &error];
    luaL_requiref(L, "SDL", luaopen_SDL, 1);
    luaL_requiref(L, "SDL.ttf", luaopen_SDL_ttf, 1);
    
    if (luaL_dostring(L, [content UTF8String]) != LUA_OK)
    {
        lua_error(L);
    }
}

void testImage(lua_State *L)
{
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *path = [mainBundle pathForResource: @"image"
                                          ofType: @"lua"];
    NSError *error = nil;
    NSString *content = [[NSString alloc] initWithContentsOfFile: path
                                                        encoding: NSUTF8StringEncoding
                                                           error: &error];
    luaL_requiref(L, "SDL", luaopen_SDL, 1);
    luaL_requiref(L, "SDL.image", luaopen_SDL_image, 1);
    
    if (luaL_dostring(L, [content UTF8String]) != LUA_OK)
    {
        lua_error(L);
    }
}

int main(int argc, char * argv[])
{
    @autoreleasepool
    {
        lua_State *L = luaL_newstate();
        
        luaL_openlibs(L);
        NSBundle *mainBundle = [NSBundle mainBundle];

        setLuaPath(L, [mainBundle resourcePath]);
        
        testTTF(L);

    }
    
    return 0;
}
