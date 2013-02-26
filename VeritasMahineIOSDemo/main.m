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
    @autoreleasepool
    {        
        NSString *sourceCode = [[NSString alloc] initWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"Main"
                                                                                                         ofType: @"v"]
                                                               encoding: NSUTF8StringEncoding
                                                                  error: NULL];
        
        LuaCall(sourceCode, @"main", nil, 0, 0, nil);
        
        
        [sourceCode release];
    }
}
