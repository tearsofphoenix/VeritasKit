//
//  VMKFunctions.m
//  VeritasMachineKit
//
//  Created by tearsofphoenix on 13-2-28.
//
//

#import "VMKFunctions.h"
#import <netinet/in.h>
#import <ifaddrs.h>
#import <arpa/inet.h>

void cleanSocket(int socket)
{
    shutdown(socket, 2);
    close(socket);
}

 NSData *dataOfLineFromSocket(int socket)
{
    NSMutableData *lineData = [[NSMutableData alloc] initWithCapacity:100];
    
    char buff[1];
    int r = 0;
    do
    {
        r = recv(socket, buff, 1, 0);
        if (r > 0 && buff[0] > '\r')
        {
            [lineData appendBytes: buff
                           length: 1];
        }
    } while (r > 0 && buff[0] != '\n');
    
    if (r == -1)
    {
        [lineData release];
        return nil;
    }
    
    return [lineData autorelease];
}

 NSDictionary *queryParametersOfURL(NSURL *url)
{
    NSMutableDictionary *parameters = [[[NSMutableDictionary alloc] initWithCapacity:10] autorelease];
    NSString *urlQuery = [url query];
    
    if (urlQuery)
    {
        NSArray *tokens = [urlQuery componentsSeparatedByString: @"&"];
        
        for (NSString *parameter in tokens)
        {
            
            NSArray *paramTokens = [parameter componentsSeparatedByString: @"="];
            
            if ([paramTokens count] >= 2)
            {
                NSString *paramName = [paramTokens objectAtIndex:0];
                NSString *paramValue = [paramTokens objectAtIndex:1];
                
                if (paramValue && paramName)
                {
                    NSString *escapedName = [paramName stringByReplacingPercentEscapesUsingEncoding: NSASCIIStringEncoding];
                    NSString *escapedValue = [paramValue stringByReplacingPercentEscapesUsingEncoding: NSASCIIStringEncoding];
                    
                    if (escapedName && escapedValue)
                    {
                        [parameters setObject: escapedValue
                                       forKey: escapedName];
                    }
                }
            }
        }
    }
    
    return parameters;
}

 NSDictionary *headersOfSocket(int socket)
{
    NSMutableDictionary *headersDictionary = [[[NSMutableDictionary alloc] initWithCapacity:10] autorelease];
    NSData *tmpLine = nil;
    
    do
    {
        tmpLine = dataOfLineFromSocket(socket);
        
        if (tmpLine)
        {
            int lineLength = [tmpLine length];
            if (lineLength > 0)
            {
                NSString *tmpLineString = [[[NSString alloc] initWithData: tmpLine
                                                                 encoding: NSASCIIStringEncoding] autorelease];
                
                NSArray *headerTokens = [tmpLineString componentsSeparatedByString: @":"];
                
                if (headerTokens && [headerTokens count] >= 2)
                {
                    NSString *headerName = [headerTokens objectAtIndex:0];
                    NSString *headerValue = [headerTokens objectAtIndex:1];
                    
                    if (headerName && headerValue)
                    {
                        [headersDictionary setObject: headerValue
                                              forKey: headerName];
                    }
                }
            }
            
            if (lineLength == 0)
            {
                break;
            }
        }
        
    } while (tmpLine);
    
    return headersDictionary;
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
