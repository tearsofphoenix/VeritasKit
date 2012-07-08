//
//  LuaMusicDevice.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaMusicDevice.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_MusicDeviceMIDIEvent(lua_State *L)
{
    MusicDeviceMIDIEvent(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceMIDIEvent(lua_State *L)
{
    MusicDeviceMIDIEvent(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceStartNote(lua_State *L)
{
    MusicDeviceStartNote(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceStopNote(lua_State *L)
{
    MusicDeviceStopNote(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceInstrumentID(lua_State *L)
{
    MusicDeviceInstrumentID(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceInstrumentID(lua_State *L)
{
    MusicDeviceInstrumentID(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceStdNoteParams(lua_State *L)
{
    MusicDeviceStdNoteParams(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceStartNote(lua_State *L)
{
    MusicDeviceStartNote(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceStdNoteParams(lua_State *L)
{
    MusicDeviceStdNoteParams(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceStdNoteParams(lua_State *L)
{
    MusicDeviceStdNoteParams(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceNoteParams(lua_State *L)
{
    MusicDeviceNoteParams(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceStartNote(lua_State *L)
{
    MusicDeviceStartNote(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceStdNoteParams(lua_State *L)
{
    MusicDeviceStdNoteParams(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceNoteParams(lua_State *L)
{
    MusicDeviceNoteParams(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceNoteParams(lua_State *L)
{
    MusicDeviceNoteParams(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceStartNote(lua_State *L)
{
    MusicDeviceStartNote(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceGroupID(lua_State *L)
{
    MusicDeviceGroupID(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceGroupID(lua_State *L)
{
    MusicDeviceGroupID(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceStartNote(lua_State *L)
{
    MusicDeviceStartNote(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceComponent(lua_State *L)
{
    MusicDeviceComponent(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceComponent(lua_State *L)
{
    MusicDeviceComponent(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceMIDIEvent(lua_State *L)
{
    MusicDeviceMIDIEvent(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceMIDIEvent(lua_State *L)
{
    MusicDeviceMIDIEvent(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceSysEx(lua_State *L)
{
    MusicDeviceSysEx(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceSysEx(lua_State *L)
{
    MusicDeviceSysEx(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceStartNote(lua_State *L)
{
    MusicDeviceStartNote(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceStopNote(lua_State *L)
{
    MusicDeviceStopNote(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceProperty_SupportsStartStopNote(lua_State *L)
{
    MusicDeviceProperty_SupportsStartStopNote(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceStartNote(lua_State *L)
{
    MusicDeviceStartNote(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceInstrumentID(lua_State *L)
{
    MusicDeviceInstrumentID(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceGroupID(lua_State *L)
{
    MusicDeviceGroupID(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceNoteParams(lua_State *L)
{
    MusicDeviceNoteParams(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceStopNote(lua_State *L)
{
    MusicDeviceStopNote(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceStartNote(lua_State *L)
{
    MusicDeviceStartNote(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceStartNote(lua_State *L)
{
    MusicDeviceStartNote(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceStopNote(lua_State *L)
{
    MusicDeviceStopNote(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceGroupID(lua_State *L)
{
    MusicDeviceGroupID(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceRange(lua_State *L)
{
    MusicDeviceRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceMIDIEventSelect(lua_State *L)
{
    MusicDeviceMIDIEventSelect(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceSysExSelect(lua_State *L)
{
    MusicDeviceSysExSelect(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDevicePrepareInstrumentSelect(lua_State *L)
{
    MusicDevicePrepareInstrumentSelect(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceReleaseInstrumentSelect(lua_State *L)
{
    MusicDeviceReleaseInstrumentSelect(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceStartNoteSelect(lua_State *L)
{
    MusicDeviceStartNoteSelect(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceStopNoteSelect(lua_State *L)
{
    MusicDeviceStopNoteSelect(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceRange(lua_State *L)
{
    MusicDeviceRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceMIDIEventSelect(lua_State *L)
{
    MusicDeviceMIDIEventSelect(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceSysExSelect(lua_State *L)
{
    MusicDeviceSysExSelect(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDevicePrepareInstrumentSelect(lua_State *L)
{
    MusicDevicePrepareInstrumentSelect(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceReleaseInstrumentSelect(lua_State *L)
{
    MusicDeviceReleaseInstrumentSelect(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceStartNoteSelect(lua_State *L)
{
    MusicDeviceStartNoteSelect(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceStopNoteSelect(lua_State *L)
{
    MusicDeviceStopNoteSelect(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceMIDIEventProc(lua_State *L)
{
    MusicDeviceMIDIEventProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceMIDIEventProc(lua_State *L)
{
    MusicDeviceMIDIEventProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceSysExProc(lua_State *L)
{
    MusicDeviceSysExProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceSysExProc(lua_State *L)
{
    MusicDeviceSysExProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceStartNoteProc(lua_State *L)
{
    MusicDeviceStartNoteProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceStartNoteProc(lua_State *L)
{
    MusicDeviceStartNoteProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceInstrumentID(lua_State *L)
{
    MusicDeviceInstrumentID(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceGroupID(lua_State *L)
{
    MusicDeviceGroupID(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceNoteParams(lua_State *L)
{
    MusicDeviceNoteParams(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceStopNoteProc(lua_State *L)
{
    MusicDeviceStopNoteProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceStopNoteProc(lua_State *L)
{
    MusicDeviceStopNoteProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceGroupID(lua_State *L)
{
    MusicDeviceGroupID(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceStartNote(lua_State *L)
{
    MusicDeviceStartNote(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDevicePrepareInstrument(lua_State *L)
{
    MusicDevicePrepareInstrument(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceInstrumentID(lua_State *L)
{
    MusicDeviceInstrumentID(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceReleaseInstrument(lua_State *L)
{
    MusicDeviceReleaseInstrument(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicDeviceInstrumentID(lua_State *L)
{
    MusicDeviceInstrumentID(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaMusicDeviceAPIs[] = {
    {"MusicDeviceMIDIEvent", lua_MusicDeviceMIDIEvent},
    {"MusicDeviceMIDIEvent", lua_MusicDeviceMIDIEvent},
    {"MusicDeviceStartNote", lua_MusicDeviceStartNote},
    {"MusicDeviceStopNote", lua_MusicDeviceStopNote},
    {"MusicDeviceInstrumentID", lua_MusicDeviceInstrumentID},
    {"MusicDeviceInstrumentID", lua_MusicDeviceInstrumentID},
    {"MusicDeviceStdNoteParams", lua_MusicDeviceStdNoteParams},
    {"MusicDeviceStartNote", lua_MusicDeviceStartNote},
    {"MusicDeviceStdNoteParams", lua_MusicDeviceStdNoteParams},
    {"MusicDeviceStdNoteParams", lua_MusicDeviceStdNoteParams},
    {"MusicDeviceNoteParams", lua_MusicDeviceNoteParams},
    {"MusicDeviceStartNote", lua_MusicDeviceStartNote},
    {"MusicDeviceStdNoteParams", lua_MusicDeviceStdNoteParams},
    {"MusicDeviceNoteParams", lua_MusicDeviceNoteParams},
    {"MusicDeviceNoteParams", lua_MusicDeviceNoteParams},
    {"MusicDeviceStartNote", lua_MusicDeviceStartNote},
    {"MusicDeviceGroupID", lua_MusicDeviceGroupID},
    {"MusicDeviceGroupID", lua_MusicDeviceGroupID},
    {"MusicDeviceStartNote", lua_MusicDeviceStartNote},
    {"MusicDeviceComponent", lua_MusicDeviceComponent},
    {"MusicDeviceComponent", lua_MusicDeviceComponent},
    {"MusicDeviceMIDIEvent", lua_MusicDeviceMIDIEvent},
    {"MusicDeviceMIDIEvent", lua_MusicDeviceMIDIEvent},
    {"MusicDeviceSysEx", lua_MusicDeviceSysEx},
    {"MusicDeviceSysEx", lua_MusicDeviceSysEx},
    {"MusicDeviceStartNote", lua_MusicDeviceStartNote},
    {"MusicDeviceStopNote", lua_MusicDeviceStopNote},
    {"MusicDeviceProperty_SupportsStartStopNote", lua_MusicDeviceProperty_SupportsStartStopNote},
    {"MusicDeviceStartNote", lua_MusicDeviceStartNote},
    {"MusicDeviceInstrumentID", lua_MusicDeviceInstrumentID},
    {"MusicDeviceGroupID", lua_MusicDeviceGroupID},
    {"MusicDeviceNoteParams", lua_MusicDeviceNoteParams},
    {"MusicDeviceStopNote", lua_MusicDeviceStopNote},
    {"MusicDeviceStartNote", lua_MusicDeviceStartNote},
    {"MusicDeviceStartNote", lua_MusicDeviceStartNote},
    {"MusicDeviceStopNote", lua_MusicDeviceStopNote},
    {"MusicDeviceGroupID", lua_MusicDeviceGroupID},
    {"MusicDeviceRange", lua_MusicDeviceRange},
    {"MusicDeviceMIDIEventSelect", lua_MusicDeviceMIDIEventSelect},
    {"MusicDeviceSysExSelect", lua_MusicDeviceSysExSelect},
    {"MusicDevicePrepareInstrumentSelect", lua_MusicDevicePrepareInstrumentSelect},
    {"MusicDeviceReleaseInstrumentSelect", lua_MusicDeviceReleaseInstrumentSelect},
    {"MusicDeviceStartNoteSelect", lua_MusicDeviceStartNoteSelect},
    {"MusicDeviceStopNoteSelect", lua_MusicDeviceStopNoteSelect},
    {"MusicDeviceRange", lua_MusicDeviceRange},
    {"MusicDeviceMIDIEventSelect", lua_MusicDeviceMIDIEventSelect},
    {"MusicDeviceSysExSelect", lua_MusicDeviceSysExSelect},
    {"MusicDevicePrepareInstrumentSelect", lua_MusicDevicePrepareInstrumentSelect},
    {"MusicDeviceReleaseInstrumentSelect", lua_MusicDeviceReleaseInstrumentSelect},
    {"MusicDeviceStartNoteSelect", lua_MusicDeviceStartNoteSelect},
    {"MusicDeviceStopNoteSelect", lua_MusicDeviceStopNoteSelect},
    {"MusicDeviceMIDIEventProc", lua_MusicDeviceMIDIEventProc},
    {"MusicDeviceMIDIEventProc", lua_MusicDeviceMIDIEventProc},
    {"MusicDeviceSysExProc", lua_MusicDeviceSysExProc},
    {"MusicDeviceSysExProc", lua_MusicDeviceSysExProc},
    {"MusicDeviceStartNoteProc", lua_MusicDeviceStartNoteProc},
    {"MusicDeviceStartNoteProc", lua_MusicDeviceStartNoteProc},
    {"MusicDeviceInstrumentID", lua_MusicDeviceInstrumentID},
    {"MusicDeviceGroupID", lua_MusicDeviceGroupID},
    {"MusicDeviceNoteParams", lua_MusicDeviceNoteParams},
    {"MusicDeviceStopNoteProc", lua_MusicDeviceStopNoteProc},
    {"MusicDeviceStopNoteProc", lua_MusicDeviceStopNoteProc},
    {"MusicDeviceGroupID", lua_MusicDeviceGroupID},
    {"MusicDeviceStartNote", lua_MusicDeviceStartNote},
    {"MusicDevicePrepareInstrument", lua_MusicDevicePrepareInstrument},
    {"MusicDeviceInstrumentID", lua_MusicDeviceInstrumentID},
    {"MusicDeviceReleaseInstrument", lua_MusicDeviceReleaseInstrument},
    {"MusicDeviceInstrumentID", lua_MusicDeviceInstrumentID},
    {NULL, NULL},
};

int LuaOpenMusicDevice(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaMusicDeviceAPIs);
    return 0;
}
