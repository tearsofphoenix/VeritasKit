//
//  LuaNSExpression.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSExpression.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __LuaNSExpressionConstants[] = 
{
    {"NSConstantValueExpressionType", NSConstantValueExpressionType},
    {"NSEvaluatedObjectExpressionType", NSEvaluatedObjectExpressionType},
    {"NSVariableExpressionType", NSVariableExpressionType},
    {"NSKeyPathExpressionType", NSKeyPathExpressionType},
    {"NSFunctionExpressionType", NSFunctionExpressionType},
    {"NSUnionSetExpressionType", NSUnionSetExpressionType},
    {"NSIntersectSetExpressionType", NSIntersectSetExpressionType},
    {"NSMinusSetExpressionType", NSMinusSetExpressionType},
    {"NSSubqueryExpressionType", NSSubqueryExpressionType},
    {"NSAggregateExpressionType", NSAggregateExpressionType},
    {"NS_BLOCKS_AVAILABLE", NS_BLOCKS_AVAILABLE},
    {"NSBlockExpressionType", NSBlockExpressionType},
    {NULL, 0},
};

int LuaOpenNSExpression(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __LuaNSExpressionConstants);
    return 0;
}
