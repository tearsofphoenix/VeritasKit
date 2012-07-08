//
//  LuaAudioComponent.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAudioComponent.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AudioComponentInstance(lua_State *L)
{
    AudioComponentInstance(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponents(lua_State *L)
{
    AudioComponents(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponents(lua_State *L)
{
    AudioComponents(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponents(lua_State *L)
{
    AudioComponents(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentDescription(lua_State *L)
{
    AudioComponentDescription(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentFactoryFunction(lua_State *L)
{
    AudioComponentFactoryFunction(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentFlag_Unsearchable(lua_State *L)
{
    AudioComponentFlag_Unsearchable(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentDescription(lua_State *L)
{
    AudioComponentDescription(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentFlag_Unsearchable(lua_State *L)
{
    AudioComponentFlag_Unsearchable(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentDescription(lua_State *L)
{
    AudioComponentDescription(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentDescription(lua_State *L)
{
    AudioComponentDescription(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentDescription(lua_State *L)
{
    AudioComponentDescription(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentInstance(lua_State *L)
{
    AudioComponentInstance(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentInstance(lua_State *L)
{
    AudioComponentInstance(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentInstance(lua_State *L)
{
    AudioComponentInstance(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentMethod(lua_State *L)
{
    AudioComponentMethod(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentMethod(lua_State *L)
{
    AudioComponentMethod(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentPlugInInterface(lua_State *L)
{
    AudioComponentPlugInInterface(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentPlugInInterface(lua_State *L)
{
    AudioComponentPlugInInterface(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentInstance(lua_State *L)
{
    AudioComponentInstance(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentMethod(lua_State *L)
{
    AudioComponentMethod(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentPlugInInterface(lua_State *L)
{
    AudioComponentPlugInInterface(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentFactoryFunction(lua_State *L)
{
    AudioComponentFactoryFunction(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentInstances(lua_State *L)
{
    AudioComponentInstances(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponents(lua_State *L)
{
    AudioComponents(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentRegister(lua_State *L)
{
    AudioComponentRegister(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentDescription(lua_State *L)
{
    AudioComponentDescription(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentPlugInInterface(lua_State *L)
{
    AudioComponentPlugInInterface(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentPlugInInterface(lua_State *L)
{
    AudioComponentPlugInInterface(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentPlugInInterface(lua_State *L)
{
    AudioComponentPlugInInterface(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentFindNext(lua_State *L)
{
    AudioComponentFindNext(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentFindNext(lua_State *L)
{
    AudioComponentFindNext(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentDescription(lua_State *L)
{
    AudioComponentDescription(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentCount(lua_State *L)
{
    AudioComponentCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponents(lua_State *L)
{
    AudioComponents(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentDescription(lua_State *L)
{
    AudioComponentDescription(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentCount(lua_State *L)
{
    AudioComponentCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentCopyName(lua_State *L)
{
    AudioComponentCopyName(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentCopyName(lua_State *L)
{
    AudioComponentCopyName(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentGetDescription(lua_State *L)
{
    AudioComponentGetDescription(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentGetDescription(lua_State *L)
{
    AudioComponentGetDescription(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentDescription(lua_State *L)
{
    AudioComponentDescription(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentGetVersion(lua_State *L)
{
    AudioComponentGetVersion(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentGetVersion(lua_State *L)
{
    AudioComponentGetVersion(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentInstanceNew(lua_State *L)
{
    AudioComponentInstanceNew(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentInstanceNew(lua_State *L)
{
    AudioComponentInstanceNew(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentInstance(lua_State *L)
{
    AudioComponentInstance(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentInstanceDispose(lua_State *L)
{
    AudioComponentInstanceDispose(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentInstanceDispose(lua_State *L)
{
    AudioComponentInstanceDispose(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentInstanceGetComponent(lua_State *L)
{
    AudioComponentInstanceGetComponent(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentInstanceGetComponent(lua_State *L)
{
    AudioComponentInstanceGetComponent(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentInstanceCanDo(lua_State *L)
{
    AudioComponentInstanceCanDo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentInstanceCanDo(lua_State *L)
{
    AudioComponentInstanceCanDo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentRegister(lua_State *L)
{
    AudioComponentRegister(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponents(lua_State *L)
{
    AudioComponents(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponents(lua_State *L)
{
    AudioComponents(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentDescription(lua_State *L)
{
    AudioComponentDescription(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentFactoryFunction(lua_State *L)
{
    AudioComponentFactoryFunction(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentRegister(lua_State *L)
{
    AudioComponentRegister(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioComponentFactoryFunction(lua_State *L)
{
    AudioComponentFactoryFunction(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAudioComponentAPIs[] = {
    {"AudioComponentInstance", lua_AudioComponentInstance},
    {"AudioComponents", lua_AudioComponents},
    {"AudioComponents", lua_AudioComponents},
    {"AudioComponents", lua_AudioComponents},
    {"AudioComponentDescription", lua_AudioComponentDescription},
    {"AudioComponentFactoryFunction", lua_AudioComponentFactoryFunction},
    {"AudioComponentFlag_Unsearchable", lua_AudioComponentFlag_Unsearchable},
    {"AudioComponentDescription", lua_AudioComponentDescription},
    {"AudioComponentFlag_Unsearchable", lua_AudioComponentFlag_Unsearchable},
    {"AudioComponentDescription", lua_AudioComponentDescription},
    {"AudioComponentDescription", lua_AudioComponentDescription},
    {"AudioComponentDescription", lua_AudioComponentDescription},
    {"AudioComponentInstance", lua_AudioComponentInstance},
    {"AudioComponentInstance", lua_AudioComponentInstance},
    {"AudioComponentInstance", lua_AudioComponentInstance},
    {"AudioComponentMethod", lua_AudioComponentMethod},
    {"AudioComponentMethod", lua_AudioComponentMethod},
    {"AudioComponentPlugInInterface", lua_AudioComponentPlugInInterface},
    {"AudioComponentPlugInInterface", lua_AudioComponentPlugInInterface},
    {"AudioComponentInstance", lua_AudioComponentInstance},
    {"AudioComponentMethod", lua_AudioComponentMethod},
    {"AudioComponentPlugInInterface", lua_AudioComponentPlugInInterface},
    {"AudioComponentFactoryFunction", lua_AudioComponentFactoryFunction},
    {"AudioComponentInstances", lua_AudioComponentInstances},
    {"AudioComponents", lua_AudioComponents},
    {"AudioComponentRegister", lua_AudioComponentRegister},
    {"AudioComponentDescription", lua_AudioComponentDescription},
    {"AudioComponentPlugInInterface", lua_AudioComponentPlugInInterface},
    {"AudioComponentPlugInInterface", lua_AudioComponentPlugInInterface},
    {"AudioComponentPlugInInterface", lua_AudioComponentPlugInInterface},
    {"AudioComponentFindNext", lua_AudioComponentFindNext},
    {"AudioComponentFindNext", lua_AudioComponentFindNext},
    {"AudioComponentDescription", lua_AudioComponentDescription},
    {"AudioComponentCount", lua_AudioComponentCount},
    {"AudioComponents", lua_AudioComponents},
    {"AudioComponentDescription", lua_AudioComponentDescription},
    {"AudioComponentCount", lua_AudioComponentCount},
    {"AudioComponentCopyName", lua_AudioComponentCopyName},
    {"AudioComponentCopyName", lua_AudioComponentCopyName},
    {"AudioComponentGetDescription", lua_AudioComponentGetDescription},
    {"AudioComponentGetDescription", lua_AudioComponentGetDescription},
    {"AudioComponentDescription", lua_AudioComponentDescription},
    {"AudioComponentGetVersion", lua_AudioComponentGetVersion},
    {"AudioComponentGetVersion", lua_AudioComponentGetVersion},
    {"AudioComponentInstanceNew", lua_AudioComponentInstanceNew},
    {"AudioComponentInstanceNew", lua_AudioComponentInstanceNew},
    {"AudioComponentInstance", lua_AudioComponentInstance},
    {"AudioComponentInstanceDispose", lua_AudioComponentInstanceDispose},
    {"AudioComponentInstanceDispose", lua_AudioComponentInstanceDispose},
    {"AudioComponentInstanceGetComponent", lua_AudioComponentInstanceGetComponent},
    {"AudioComponentInstanceGetComponent", lua_AudioComponentInstanceGetComponent},
    {"AudioComponentInstanceCanDo", lua_AudioComponentInstanceCanDo},
    {"AudioComponentInstanceCanDo", lua_AudioComponentInstanceCanDo},
    {"AudioComponentRegister", lua_AudioComponentRegister},
    {"AudioComponents", lua_AudioComponents},
    {"AudioComponents", lua_AudioComponents},
    {"AudioComponentDescription", lua_AudioComponentDescription},
    {"AudioComponentFactoryFunction", lua_AudioComponentFactoryFunction},
    {"AudioComponentRegister", lua_AudioComponentRegister},
    {"AudioComponentFactoryFunction", lua_AudioComponentFactoryFunction},
    {NULL, NULL},
};

int LuaOpenAudioComponent(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAudioComponentAPIs);
    return 0;
}
