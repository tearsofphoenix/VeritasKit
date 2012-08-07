//
//  main.m
//  LuaIOS
//
//  Created by tearsofphoenix on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaEngineService.h"

int main(int argc, char *argv[])
{
    NSUInteger size;
    NSUInteger align;
    const char* encode = "{_ABActionCallbacks=\"version\"i\"property\"^?\"title\"^?\"enabled\"^?\"selected\"^?}";
    
    const char* p = NSGetSizeAndAlignment(encode, &size, &align);
    NSLog(@"p: %s size: %d align: %d", p, size, align);
    
    LuaCall(@"Main.v", @"main", nil, 0, 1, nil);
}
