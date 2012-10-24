//
//  main.m
//  LuaIOS
//
//  Created by tearsofphoenix on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <VeritasVM/VeritasVM.h>
#import "NSData+Base64.h"

int main(int argc, char *argv[])
{
//    @try
//    {
//        @try
//        {
//            @throw [NSException exceptionWithName: @"xx"
//                                           reason: @"xadas"
//                                         userInfo: nil];
//        }
//        @catch (NSException *exception)
//        {
//            printf("in inner @catch\n");
//            @throw exception;
//        }
//        @finally
//        {
//            printf("inner\n");
//            @throw [NSException exceptionWithName: @"throw in inner @finally"
//                                           reason: @"test"
//                                         userInfo: nil];
//        }
//    }
//    @catch (NSException *exception)
//    {
//        @throw exception;
//    }
//    @finally
//    {
//        printf("outter\n");
//    }
    
    LuaCall(@"Main.v", @"main", nil, 0, 1, nil);
}
