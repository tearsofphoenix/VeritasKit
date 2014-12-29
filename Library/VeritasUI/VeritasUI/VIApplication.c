//
//  VIApplication.c
//  VeritasUI
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 NewGrace. All rights reserved.
//

#include "VIApplication.h"
#include <SDL.h>
#include <VeritasFoundation/CFRuntime.h>

int VIApplicationMain(int argc, char *argv[])
{    
    /* initialize SDL */
    if (SDL_Init(SDL_INIT_VIDEO) < 0)
    {
        printf("Could not initialize SDL");
    }
    
    return 0;
}