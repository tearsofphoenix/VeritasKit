//
//  LuaCGGeometry.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCGGeometry.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "LuaObjCAuxiliary.h"

int lua_pushCGPoint(lua_State *L, CGPoint p)
{
    CGPoint *point = lua_newuserdata(L, sizeof(CGPoint));
    point->x = p.x;
    point->y = p.y;

    luaL_getmetatable(L, LUA_CGPoint_METANAME);
    lua_setmetatable(L, -2);
    return 1;

}

int lua_pushCGSize(lua_State *L, CGSize s)
{
    CGSize *size = lua_newuserdata(L, sizeof(CGSize));
    size->width = s.width;
    size->height = s.height;
    
    luaL_getmetatable(L, LUA_CGSize_METANAME);
    lua_setmetatable(L, -2);
    return 1;
}

int lua_pushCGRect(lua_State *L, CGRect r)
{
    CGRect *rect = lua_newuserdata(L, sizeof(CGRect));
    rect->origin = r.origin;
    rect->size = r.size;
    
    luaL_getmetatable(L, LUA_CGRect_METANAME);
    lua_setmetatable(L, -2);
    return 1;
}


#pragma mark - CGGeometry APIs


static int lua_CGPointMake(lua_State *L)
{
    return lua_pushCGPoint(L, CGPointMake(lua_tonumber(L, 1), lua_tonumber(L, 2)));
}

/* Make a size from `(width, height)'. */

static int lua_CGSizeMake(lua_State *L)
{
    return lua_pushCGSize(L, CGSizeMake(lua_tonumber(L, 1), lua_tonumber(L, 2)));
}

/* Make a rect from `(x, y; width, height)'. */

static int lua_CGRectMake(lua_State *L)
{
    return lua_pushCGRect(L, CGRectMake(lua_tonumber(L, 1), 
                                        lua_tonumber(L, 2),
                                        lua_tonumber(L, 3),
                                        lua_tonumber(L, 4)));
}


/* Return the leftmost x-value of `rect'. */

static int lua_CGRectGetMinX(lua_State *L)
{
    CGRect *r = lua_touserdata(L, 1);
    lua_pushnumber(L, CGRectGetMinX(*r));
    return 1;
}


/* Return the midpoint x-value of `rect'. */

static int lua_CGRectGetMidX(lua_State *L)
{
    CGRect *r = lua_touserdata(L, 1);
    lua_pushnumber(L, CGRectGetMidX(*r));
    return 1;
}


/* Return the rightmost x-value of `rect'. */

static int lua_CGRectGetMaxX(lua_State *L)
{
    CGRect *r = lua_touserdata(L, 1);
    lua_pushnumber(L, CGRectGetMaxX(*r));
    return 1;
}


/* Return the bottommost y-value of `rect'. */

static int lua_CGRectGetMinY(lua_State *L)
{
    CGRect *r = lua_touserdata(L, 1);
    lua_pushnumber(L, CGRectGetMinY(*r));
    return 1;
}


/* Return the midpoint y-value of `rect'. */

static int lua_CGRectGetMidY(lua_State *L)
{
    CGRect *r = lua_touserdata(L, 1);
    lua_pushnumber(L, CGRectGetMidY(*r));
    return 1;
}

/* Return the topmost y-value of `rect'. */

static int lua_CGRectGetMaxY(lua_State *L)
{
    CGRect *r = lua_touserdata(L, 1);
    lua_pushnumber(L, CGRectGetMaxY(*r));
    return 1;
}


/* Return the width of `rect'. */

static int lua_CGRectGetWidth(lua_State *L)
{
    CGRect *r = lua_touserdata(L, 1);
    lua_pushnumber(L, CGRectGetWidth(*r));
    return 1;
}


/* Return the height of `rect'. */

static int lua_CGRectGetHeight(lua_State *L)
{
    CGRect *r = lua_touserdata(L, 1);
    lua_pushnumber(L, CGRectGetHeight(*r));
    return 1;
}


/* Return true if `point1' and `point2' are the same, false otherwise. */

static int lua_CGPointEqualToPoint(lua_State *L)
{
    CGPoint *point1 = lua_touserdata(L, 1);
    CGPoint *point2 = lua_touserdata(L, 2);
    lua_pushboolean(L, CGPointEqualToPoint(*point1, *point2));
    return 1;
}


/* Return true if `size1' and `size2' are the same, false otherwise. */

static int lua_CGSizeEqualToSize(lua_State *L)
{
    CGSize *size1 = lua_touserdata(L, 1);
    CGSize *size2 = lua_touserdata(L, 2);
    lua_pushboolean(L, CGSizeEqualToSize(*size1, *size2));
    return 1;
}

/* Return true if `rect1' and `rect2' are the same, false otherwise. */

static int lua_CGRectEqualToRect(lua_State *L)
{
    CGRect *rect1 = lua_touserdata(L, 1);
    CGRect *rect2 = lua_touserdata(L, 2);
    lua_pushboolean(L, CGRectEqualToRect(*rect1, *rect2));
    return 1;
}


/* Standardize `rect' -- i.e., convert it to an equivalent rect which has
 positive width and height. */

static int lua_CGRectStandardize(lua_State *L)
{
    CGRect *rect = lua_touserdata(L, 1);
    lua_pushCGRect(L,  CGRectStandardize(*rect));
    return 1;
}

/* Return true if `rect' is empty (that is, if it has zero width or height),
 false otherwise. A null rect is defined to be empty. */

static int lua_CGRectIsEmpty(lua_State *L)
{
    CGRect *rect = lua_touserdata(L, 1);
    lua_pushboolean(L, CGRectIsEmpty(*rect));
    return 1;
}


/* Return true if `rect' is the null rectangle, false otherwise. */

static int lua_CGRectIsNull(lua_State *L)
{
    CGRect *rect = lua_touserdata(L, 1);
    lua_pushboolean(L, CGRectIsNull(*rect));
    return 1;
}


/* Return true if `rect' is the infinite rectangle, false otherwise. */

static int lua_CGRectIsInfinite(lua_State *L)
{
    CGRect *rect = lua_touserdata(L, 1);
    lua_pushboolean(L, CGRectIsInfinite(*rect));
    return 1;
}



/* Inset `rect' by `(dx, dy)' -- i.e., offset its origin by `(dx, dy)', and
 decrease its size by `(2*dx, 2*dy)'. */

static int lua_CGRectInset(lua_State *L)
{
    CGRect *rect = lua_touserdata(L, 1);
    lua_pushCGRect(L, CGRectInset(*rect, lua_tonumber(L, 2), lua_tonumber(L, 3)));
    return 1;
}


/* Expand `rect' to the smallest rect containing it with integral origin and
 size. */

static int lua_CGRectIntegral(lua_State *L)
{
    CGRect *rect = lua_touserdata(L, 1);
    lua_pushCGRect(L, CGRectIntegral(*rect));
    return 1;
}


/* Return the union of `r1' and `r2'. */

static int lua_CGRectUnion(lua_State *L)
{
    CGRect *r1 = lua_touserdata(L, 1);
    CGRect *r2 = lua_touserdata(L, 2);
    lua_pushCGRect(L, CGRectUnion(*r1, *r2));
    return 1;
}


/* Return the intersection of `r1' and `r2'. This may return a null rect. */

static int lua_CGRectIntersection(lua_State *L)
{
    CGRect *r1 = lua_touserdata(L, 1);
    CGRect *r2 = lua_touserdata(L, 2);
    lua_pushCGRect(L, CGRectIntersection(*r1, *r2));
    return 1;
}


/* Offset `rect' by `(dx, dy)'. */

static int lua_CGRectOffset(lua_State *L)
{
    CGRect *rect = lua_touserdata(L, 1);
    lua_pushCGRect(L, CGRectOffset(*rect, lua_tonumber(L, 2), lua_tonumber(L, 3)));
    return 1;
}


/* Make two new rectangles, `slice' and `remainder', by dividing `rect' with
 a line that's parallel to one of its sides, specified by `edge' -- either
 `CGRectMinXEdge', `CGRectMinYEdge', `CGRectMaxXEdge', or
 `CGRectMaxYEdge'. The size of `slice' is determined by `amount', which
 measures the distance from the specified edge. */

static int lua_CGRectDivide(lua_State *L)
{
    CGRect *rect = lua_touserdata(L, 1); 
    CGFloat amount = lua_tonumber(L, 2);
    CGRectEdge edge = lua_tointeger(L, 3);
    
    CGRect slice;
    CGRect remainder;
    CGRectDivide(*rect, &slice, &remainder, amount, edge);
    lua_pushCGRect(L, slice);
    lua_pushCGRect(L, remainder);
    return 2;    
}


/* Return true if `point' is contained in `rect', false otherwise. */

static int lua_CGRectContainsPoint(lua_State *L)
{
    CGRect *rect = lua_touserdata(L, 1);
    CGPoint *point = lua_touserdata(L, 2);
    lua_pushboolean(L, CGRectContainsPoint(*rect, *point));
    return 1;
}


/* Return true if `rect2' is contained in `rect1', false otherwise. `rect2'
 is contained in `rect1' if the union of `rect1' and `rect2' is equal to
 `rect1'. */

static int lua_CGRectContainsRect(lua_State *L)
{
    CGRect *r1 = lua_touserdata(L, 1);
    CGRect *r2 = lua_touserdata(L, 2);
    lua_pushboolean(L, CGRectContainsRect(*r1, *r2));
    return 1;
}


/* Return true if `rect1' intersects `rect2', false otherwise. `rect1'
 intersects `rect2' if the intersection of `rect1' and `rect2' is not the
 null rect. */

static int lua_CGRectIntersectsRect(lua_State *L)
{
    CGRect *r1 = lua_touserdata(L, 1);
    CGRect *r2 = lua_touserdata(L, 2);
    lua_pushboolean(L, CGRectContainsRect(*r1, *r2));
    return 1;
}

static const luaL_Reg __luaCGGeometryAPIs[] = 
{
    
    {"CGPointMake", lua_CGPointMake},
    {"CGSizeMake", lua_CGSizeMake},
    {"CGRectMake", lua_CGRectMake},
    {"CGRectGetMinX", lua_CGRectGetMinX},
    {"CGRectGetMidX", lua_CGRectGetMidX},
    {"CGRectGetMaxX", lua_CGRectGetMaxX},
    {"CGRectGetMinY", lua_CGRectGetMinY},
    {"CGRectGetMidY", lua_CGRectGetMidY},
    {"CGRectGetMaxY", lua_CGRectGetMaxY},
    {"CGRectGetWidth", lua_CGRectGetWidth},
    {"CGRectGetHeight", lua_CGRectGetHeight},
    {"CGPointEqualToPoint", lua_CGPointEqualToPoint},
    {"CGSizeEqualToSize", lua_CGSizeEqualToSize},
    {"CGRectEqualToRect", lua_CGRectEqualToRect},
    {"CGRectStandardize", lua_CGRectStandardize},
    {"CGRectIsEmpty", lua_CGRectIsEmpty},
    {"CGRectIsNull", lua_CGRectIsNull},
    {"CGRectIsInfinite", lua_CGRectIsInfinite},
    {"CGRectInset", lua_CGRectInset},
    {"CGRectIntegral", lua_CGRectIntegral},
    {"CGRectUnion", lua_CGRectUnion},
    {"CGRectIntersection", lua_CGRectIntersection},
    {"CGRectOffset", lua_CGRectOffset},
    {"CGRectDivide", lua_CGRectDivide},
    {"CGRectContainsPoint", lua_CGRectContainsPoint},
    {"CGRectContainsRect", lua_CGRectContainsRect},
    {"CGRectIntersectsRect", lua_CGRectIntersectsRect},
    {NULL, NULL},
};

int LuaOpenCGGeometry(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __luaCGGeometryAPIs);
    return 0;
}
