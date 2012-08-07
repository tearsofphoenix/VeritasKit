//
//  ERGeneralConstants.h
//  ERGeneral
//
//  Created by tearsofphoenix on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

typedef void (^ERGeneralCallbackBlock)(NSString *action, NSArray *arguments);
typedef void (^ERGeneralServiceBlock)(ERGeneralCallbackBlock callback, NSString *action, NSArray *arguments);
