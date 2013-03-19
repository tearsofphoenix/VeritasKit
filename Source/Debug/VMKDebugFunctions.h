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

NSData *dataFromSocket(int socket);

NSString *sockaddrToNSString(struct sockaddr *addr);

NSString *stringFromCurrentTime(void);
