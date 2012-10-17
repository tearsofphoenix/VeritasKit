//
//  main.m
//  LuaIOS
//
//  Created by tearsofphoenix on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <VeritasVM/VeritasVM.h>
#import "LuaObjCInternal.h"

int main(int argc, char *argv[])
{
    //objc_dumpClass([UIPopoverController class]);
    LuaCall(@"Main.v", @"main", nil, 0, 1, nil);
}
