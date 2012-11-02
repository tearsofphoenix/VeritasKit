//
//  LuaObjCBase.h
//  LuaIOS
//
//  Created by tearsofphoenix on 9/29/12.
//
//

#ifndef LuaIOS_LuaObjCBase_h
#define LuaIOS_LuaObjCBase_h

#import <LuaKit/lua.h>
#import <LuaKit/lauxlib.h>

#define VK_EXPORT LUAMOD_API

#include <TargetConditionals.h>

#if TARGET_OS_MAC

    #include <sys/cdefs.h>

#else

    #ifndef __BEGIN_DECLS

        #if defined(__cplusplus)
            #define	__BEGIN_DECLS	extern "C" {
            #define	__END_DECLS	}
        #else
            #define	__BEGIN_DECLS
            #define	__END_DECLS
        #endif

    #endif
#endif

#endif
