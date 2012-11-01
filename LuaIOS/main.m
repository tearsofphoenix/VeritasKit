//
//  main.m
//  LuaIOS
//
//  Created by tearsofphoenix on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <VeritasMachine/VeritasMachine.h>

int main(int argc, char *argv[])
{
    LuaCall(@"Main.v", @"main", nil, 0, 1, nil);
}
