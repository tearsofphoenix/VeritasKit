//
//  main.m
//  VeritasMacDemo
//
//  Created by Mac003 on 14-7-1.
//
//

#import <VeritasKit/VeritasMachineKit.h>

int main(int argc, char *argv[])
{
    LuaCall(@"Main.v", @"main", nil, 0, 0, nil);
}
