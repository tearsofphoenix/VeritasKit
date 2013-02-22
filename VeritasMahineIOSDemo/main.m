//
//  main.m
//  VeritasMahineIOSDemo
//
//  Created by tearsofphoenix on 12-11-2.
//
//

#import <VeritasMachineKit/VeritasMachineKit.h>

int main(int argc, char *argv[])
{
    LuaCall(@"Main.v", @"main", nil, 0, 0, nil);
}
