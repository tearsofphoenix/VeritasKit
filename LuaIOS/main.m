//
//  main.m
//  LuaIOS
//
//  Created by tearsofphoenix on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaEngineService.h"
#import "NSData+Base64.h"

int main(int argc, char *argv[])
{
    NSData *data = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"LuaObjCParser"
                                                                                   ofType: @"lua"]];
    NSLog(@"%@", [data base64EncodedString]);
    
    LuaCall(@"Main.v", @"main", nil, 0, 1, nil);
}
