//
//  VMKFunctions.h
//  VeritasMachineKit
//
//  Created by tearsofphoenix on 13-2-28.
//
//

#import <Foundation/Foundation.h>
#import <sys/socket.h>

void cleanSocket(int socket);

NSData *dataOfLineFromSocket(int socket);

NSDictionary *queryParametersOfURL(NSURL *url);

NSDictionary *headersOfSocket(int socket);

NSString *sockaddrToNSString(struct sockaddr *addr);