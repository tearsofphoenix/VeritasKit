//
//  LuaMPMediaItem.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaMPMediaItem.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_MPMediaItemArtwork(lua_State *L)
{
    MPMediaItemArtwork(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemArtwork(lua_State *L)
{
    MPMediaItemArtwork(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyPersistentID(lua_State *L)
{
    MPMediaItemPropertyPersistentID(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyMediaType(lua_State *L)
{
    MPMediaItemPropertyMediaType(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyTitle(lua_State *L)
{
    MPMediaItemPropertyTitle(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyAlbumTitle(lua_State *L)
{
    MPMediaItemPropertyAlbumTitle(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyAlbumPersistentID(lua_State *L)
{
    MPMediaItemPropertyAlbumPersistentID(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyArtist(lua_State *L)
{
    MPMediaItemPropertyArtist(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyArtistPersistentID(lua_State *L)
{
    MPMediaItemPropertyArtistPersistentID(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyAlbumArtist(lua_State *L)
{
    MPMediaItemPropertyAlbumArtist(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyAlbumArtistPersistentID(lua_State *L)
{
    MPMediaItemPropertyAlbumArtistPersistentID(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyGenre(lua_State *L)
{
    MPMediaItemPropertyGenre(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyGenrePersistentID(lua_State *L)
{
    MPMediaItemPropertyGenrePersistentID(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyComposer(lua_State *L)
{
    MPMediaItemPropertyComposer(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyComposerPersistentID(lua_State *L)
{
    MPMediaItemPropertyComposerPersistentID(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyPlaybackDuration(lua_State *L)
{
    MPMediaItemPropertyPlaybackDuration(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyAlbumTrackNumber(lua_State *L)
{
    MPMediaItemPropertyAlbumTrackNumber(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyAlbumTrackCount(lua_State *L)
{
    MPMediaItemPropertyAlbumTrackCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyDiscNumber(lua_State *L)
{
    MPMediaItemPropertyDiscNumber(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyDiscCount(lua_State *L)
{
    MPMediaItemPropertyDiscCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyArtwork(lua_State *L)
{
    MPMediaItemPropertyArtwork(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyLyrics(lua_State *L)
{
    MPMediaItemPropertyLyrics(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyIsCompilation(lua_State *L)
{
    MPMediaItemPropertyIsCompilation(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyReleaseDate(lua_State *L)
{
    MPMediaItemPropertyReleaseDate(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyBeatsPerMinute(lua_State *L)
{
    MPMediaItemPropertyBeatsPerMinute(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyComments(lua_State *L)
{
    MPMediaItemPropertyComments(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyAssetURL(lua_State *L)
{
    MPMediaItemPropertyAssetURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyPodcastTitle(lua_State *L)
{
    MPMediaItemPropertyPodcastTitle(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyPodcastPersistentID(lua_State *L)
{
    MPMediaItemPropertyPodcastPersistentID(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyPlayCount(lua_State *L)
{
    MPMediaItemPropertyPlayCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertySkipCount(lua_State *L)
{
    MPMediaItemPropertySkipCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyRating(lua_State *L)
{
    MPMediaItemPropertyRating(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyLastPlayedDate(lua_State *L)
{
    MPMediaItemPropertyLastPlayedDate(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaItemPropertyUserGrouping(lua_State *L)
{
    MPMediaItemPropertyUserGrouping(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaMPMediaItemAPIs[] = {
    {"MPMediaItemArtwork", lua_MPMediaItemArtwork},
    {"MPMediaItemArtwork", lua_MPMediaItemArtwork},
    {"MPMediaItemPropertyPersistentID", lua_MPMediaItemPropertyPersistentID},
    {"MPMediaItemPropertyMediaType", lua_MPMediaItemPropertyMediaType},
    {"MPMediaItemPropertyTitle", lua_MPMediaItemPropertyTitle},
    {"MPMediaItemPropertyAlbumTitle", lua_MPMediaItemPropertyAlbumTitle},
    {"MPMediaItemPropertyAlbumPersistentID", lua_MPMediaItemPropertyAlbumPersistentID},
    {"MPMediaItemPropertyArtist", lua_MPMediaItemPropertyArtist},
    {"MPMediaItemPropertyArtistPersistentID", lua_MPMediaItemPropertyArtistPersistentID},
    {"MPMediaItemPropertyAlbumArtist", lua_MPMediaItemPropertyAlbumArtist},
    {"MPMediaItemPropertyAlbumArtistPersistentID", lua_MPMediaItemPropertyAlbumArtistPersistentID},
    {"MPMediaItemPropertyGenre", lua_MPMediaItemPropertyGenre},
    {"MPMediaItemPropertyGenrePersistentID", lua_MPMediaItemPropertyGenrePersistentID},
    {"MPMediaItemPropertyComposer", lua_MPMediaItemPropertyComposer},
    {"MPMediaItemPropertyComposerPersistentID", lua_MPMediaItemPropertyComposerPersistentID},
    {"MPMediaItemPropertyPlaybackDuration", lua_MPMediaItemPropertyPlaybackDuration},
    {"MPMediaItemPropertyAlbumTrackNumber", lua_MPMediaItemPropertyAlbumTrackNumber},
    {"MPMediaItemPropertyAlbumTrackCount", lua_MPMediaItemPropertyAlbumTrackCount},
    {"MPMediaItemPropertyDiscNumber", lua_MPMediaItemPropertyDiscNumber},
    {"MPMediaItemPropertyDiscCount", lua_MPMediaItemPropertyDiscCount},
    {"MPMediaItemPropertyArtwork", lua_MPMediaItemPropertyArtwork},
    {"MPMediaItemPropertyLyrics", lua_MPMediaItemPropertyLyrics},
    {"MPMediaItemPropertyIsCompilation", lua_MPMediaItemPropertyIsCompilation},
    {"MPMediaItemPropertyReleaseDate", lua_MPMediaItemPropertyReleaseDate},
    {"MPMediaItemPropertyBeatsPerMinute", lua_MPMediaItemPropertyBeatsPerMinute},
    {"MPMediaItemPropertyComments", lua_MPMediaItemPropertyComments},
    {"MPMediaItemPropertyAssetURL", lua_MPMediaItemPropertyAssetURL},
    {"MPMediaItemPropertyPodcastTitle", lua_MPMediaItemPropertyPodcastTitle},
    {"MPMediaItemPropertyPodcastPersistentID", lua_MPMediaItemPropertyPodcastPersistentID},
    {"MPMediaItemPropertyPlayCount", lua_MPMediaItemPropertyPlayCount},
    {"MPMediaItemPropertySkipCount", lua_MPMediaItemPropertySkipCount},
    {"MPMediaItemPropertyRating", lua_MPMediaItemPropertyRating},
    {"MPMediaItemPropertyLastPlayedDate", lua_MPMediaItemPropertyLastPlayedDate},
    {"MPMediaItemPropertyUserGrouping", lua_MPMediaItemPropertyUserGrouping},
    {NULL, NULL},
};

int LuaOpenMPMediaItem(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaMPMediaItemAPIs);
    return 0;
}
