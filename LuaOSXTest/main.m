//
//  main.m
//  LuaOSXTest
//
//  Created by LeixSnake on 8/3/12.
//
//

#import <Foundation/Foundation.h>
#import <LuaOSX/LuaEngineOSX.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        LuaCall(@"local ab = function() print(\"hello, world\") end", @"ab", nil, 0, 0, nil);
    }
    return 0;
}

