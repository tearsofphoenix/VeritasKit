//
//  BoCPressViewStatePrivateHandler.h
//  BoCPress
//
//  Created by E-Reach Administrator on 4/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressCallback.h"

@class BoCPressViewState;

@interface BoCPressViewStatePrivateHandler : BoCPressCallback
{
@private
    BoCPressViewState *_viewState;
}

- (id)initWithViewState: (BoCPressViewState *)viewState;

@end
