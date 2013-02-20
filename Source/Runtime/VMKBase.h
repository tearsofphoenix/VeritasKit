//
//  VMKBase.h
//  LuaIOS
//
//  Created by tearsofphoenix on 9/29/12.
//
//

#ifndef __VMK_VMKBASE__
#define __VMK_VMKBASE__ 1

#include <CoreFoundation/CFBase.h>

#include <LuaKit/lua.h>
#include <LuaKit/lauxlib.h>

#define VMK_EXPORT CF_EXPORT
#define VMK_EXTERN_C_BEGIN  __BEGIN_DECLS
#define VMK_EXTERN_C_END   __END_DECLS

typedef struct lua_State *VMKLuaStateRef;

#endif
