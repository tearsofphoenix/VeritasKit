//
//  main.m
//  LuaIOS
//
//  Created by tearsofphoenix on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <VeritasVM/VeritasVM.h>
#import "LuaObjCInternal.h"
#import <Block.h>
@interface FakeBlock : NSObject



@end

static void test_call(id block)
{
    ((dispatch_block_t)block)();
}

int main(int argc, char *argv[])
{
    //objc_dumpClass([UIPopoverController class]);
    //id string = @"xx";
   // test_call(string);
    LuaCall(@"Main.v", @"main", nil, 0, 1, nil);
}
