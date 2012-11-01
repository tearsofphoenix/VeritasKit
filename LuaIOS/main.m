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
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex: 0];
    path = [path stringByAppendingPathComponent: @"/test.out"];
    NSString *source = [[NSBundle mainBundle] pathForResource: @"Main"
                                                       ofType: @"v"];
    source = [[NSString alloc] initWithContentsOfFile: source
                                             encoding: NSUTF8StringEncoding
                                                error: NULL];
    
    VSC(VMachineServiceID, VMachineServiceDumpSourceCodeToPathAction, nil, @[ source, path ]);
    
    [source release];
    
    LuaCall(@"Main.v", @"main", nil, 0, 1, nil);
}
