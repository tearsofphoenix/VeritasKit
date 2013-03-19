//
//  VMKFunctions.m
//  VeritasMachineKit
//
//  Created by tearsofphoenix on 13-2-28.
//
//

#import "VMKDebugFunctions.h"
#import <netinet/in.h>
#import <ifaddrs.h>
#import <arpa/inet.h>

void cleanSocket(int socket)
{
    shutdown(socket, 2);
    close(socket);
}

 NSData *dataFromSocket(int socket)
{
    int size = 256;

    NSMutableData *lineData = [[NSMutableData alloc] initWithCapacity: size * 4];
    
    char buff[size];
    int r = 0;
    do
    {
        r = read(socket, buff, size);
        if (r > 0)
        {
            [lineData appendBytes: buff
                           length: size];
        }
    } while (r > 0);
    
    if (r == -1)
    {
        [lineData release];
        return nil;
    }
    
    return [lineData autorelease];
}

NSString *sockaddrToNSString(struct sockaddr *addr)
{
    char str[20];
    
    if (addr->sa_family == AF_INET)
    {
        struct sockaddr_in *v4 = (struct sockaddr_in *)addr;
        const char *result = inet_ntop(AF_INET, &(v4->sin_addr), str, 20);
        if (result == NULL)
        {
            return nil;
        }
        
    }else if (addr->sa_family == AF_INET6)
    {
        struct sockaddr_in6 *v6 = (struct sockaddr_in6 *)addr;
        const char *result = inet_ntop(AF_INET6, &(v6->sin6_addr), str, 20);
        if (result == NULL)
        {
            return nil;
        }
    }
    
    return @(str);
}

NSString *stringFromCurrentTime(void)
{
    NSDate *date = [NSDate date];
    
    NSString *description = [date description];
    
    return [description stringByReplacingOccurrencesOfString: @" +0000"
                                                  withString: @""];
}
