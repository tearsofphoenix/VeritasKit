//
//  LuaCFTree.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFTree.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFTrees(lua_State *L)
{
    CFTrees(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeRetainCallBack(lua_State *L)
{
    CFTreeRetainCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeContext(lua_State *L)
{
    CFTreeContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeRetainCallBack(lua_State *L)
{
    CFTreeRetainCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeReleaseCallBack(lua_State *L)
{
    CFTreeReleaseCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeContext(lua_State *L)
{
    CFTreeContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeReleaseCallBack(lua_State *L)
{
    CFTreeReleaseCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeCopyDescriptionCallBack(lua_State *L)
{
    CFTreeCopyDescriptionCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeContext(lua_State *L)
{
    CFTreeContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeCopyDescriptionCallBack(lua_State *L)
{
    CFTreeCopyDescriptionCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeContext(lua_State *L)
{
    CFTreeContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeRetainCallBack(lua_State *L)
{
    CFTreeRetainCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeReleaseCallBack(lua_State *L)
{
    CFTreeReleaseCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeCopyDescriptionCallBack(lua_State *L)
{
    CFTreeCopyDescriptionCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeContext(lua_State *L)
{
    CFTreeContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeApplierFunction(lua_State *L)
{
    CFTreeApplierFunction(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeApplierFunction(lua_State *L)
{
    CFTreeApplierFunction(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeRef(lua_State *L)
{
    CFTreeRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTrees(lua_State *L)
{
    CFTrees(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeRef(lua_State *L)
{
    CFTreeRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeGetTypeID(lua_State *L)
{
    CFTreeGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeGetTypeID(lua_State *L)
{
    CFTreeGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeCreate(lua_State *L)
{
    CFTreeCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeContext(lua_State *L)
{
    CFTreeContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeContext(lua_State *L)
{
    CFTreeContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeContext(lua_State *L)
{
    CFTreeContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeRef(lua_State *L)
{
    CFTreeRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeGetParent(lua_State *L)
{
    CFTreeGetParent(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeRef(lua_State *L)
{
    CFTreeRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeGetNextSibling(lua_State *L)
{
    CFTreeGetNextSibling(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeRef(lua_State *L)
{
    CFTreeRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeGetFirstChild(lua_State *L)
{
    CFTreeGetFirstChild(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeRef(lua_State *L)
{
    CFTreeRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeGetContext(lua_State *L)
{
    CFTreeGetContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeContext(lua_State *L)
{
    CFTreeContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeContext(lua_State *L)
{
    CFTreeContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeContext(lua_State *L)
{
    CFTreeContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeGetContext(lua_State *L)
{
    CFTreeGetContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeGetChildCount(lua_State *L)
{
    CFTreeGetChildCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeGetChildCount(lua_State *L)
{
    CFTreeGetChildCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeGetChildAtIndex(lua_State *L)
{
    CFTreeGetChildAtIndex(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeRef(lua_State *L)
{
    CFTreeRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeGetChildren(lua_State *L)
{
    CFTreeGetChildren(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeGetChildCount(lua_State *L)
{
    CFTreeGetChildCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeGetChildren(lua_State *L)
{
    CFTreeGetChildren(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeApplyFunctionToChildren(lua_State *L)
{
    CFTreeApplyFunctionToChildren(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeApplyFunctionToChildren(lua_State *L)
{
    CFTreeApplyFunctionToChildren(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeFindRoot(lua_State *L)
{
    CFTreeFindRoot(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeRef(lua_State *L)
{
    CFTreeRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeSetContext(lua_State *L)
{
    CFTreeSetContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeContext(lua_State *L)
{
    CFTreeContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeContext(lua_State *L)
{
    CFTreeContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeContext(lua_State *L)
{
    CFTreeContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeSetContext(lua_State *L)
{
    CFTreeSetContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreePrependChild(lua_State *L)
{
    CFTreePrependChild(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreePrependChild(lua_State *L)
{
    CFTreePrependChild(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeAppendChild(lua_State *L)
{
    CFTreeAppendChild(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeAppendChild(lua_State *L)
{
    CFTreeAppendChild(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeInsertSibling(lua_State *L)
{
    CFTreeInsertSibling(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeInsertSibling(lua_State *L)
{
    CFTreeInsertSibling(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeRemove(lua_State *L)
{
    CFTreeRemove(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeRemove(lua_State *L)
{
    CFTreeRemove(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeRemoveAllChildren(lua_State *L)
{
    CFTreeRemoveAllChildren(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeRemoveAllChildren(lua_State *L)
{
    CFTreeRemoveAllChildren(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeSortChildren(lua_State *L)
{
    CFTreeSortChildren(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTreeSortChildren(lua_State *L)
{
    CFTreeSortChildren(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFTreeAPIs[] = {
    {"CFTrees", lua_CFTrees},
    {"CFTreeRetainCallBack", lua_CFTreeRetainCallBack},
    {"CFTreeContext", lua_CFTreeContext},
    {"CFTreeRetainCallBack", lua_CFTreeRetainCallBack},
    {"CFTreeReleaseCallBack", lua_CFTreeReleaseCallBack},
    {"CFTreeContext", lua_CFTreeContext},
    {"CFTreeReleaseCallBack", lua_CFTreeReleaseCallBack},
    {"CFTreeCopyDescriptionCallBack", lua_CFTreeCopyDescriptionCallBack},
    {"CFTreeContext", lua_CFTreeContext},
    {"CFTreeCopyDescriptionCallBack", lua_CFTreeCopyDescriptionCallBack},
    {"CFTreeContext", lua_CFTreeContext},
    {"CFTreeRetainCallBack", lua_CFTreeRetainCallBack},
    {"CFTreeReleaseCallBack", lua_CFTreeReleaseCallBack},
    {"CFTreeCopyDescriptionCallBack", lua_CFTreeCopyDescriptionCallBack},
    {"CFTreeContext", lua_CFTreeContext},
    {"CFTreeApplierFunction", lua_CFTreeApplierFunction},
    {"CFTreeApplierFunction", lua_CFTreeApplierFunction},
    {"CFTreeRef", lua_CFTreeRef},
    {"CFTrees", lua_CFTrees},
    {"CFTreeRef", lua_CFTreeRef},
    {"CFTreeGetTypeID", lua_CFTreeGetTypeID},
    {"CFTreeGetTypeID", lua_CFTreeGetTypeID},
    {"CFTreeCreate", lua_CFTreeCreate},
    {"CFTreeContext", lua_CFTreeContext},
    {"CFTreeContext", lua_CFTreeContext},
    {"CFTreeContext", lua_CFTreeContext},
    {"CFTreeRef", lua_CFTreeRef},
    {"CFTreeGetParent", lua_CFTreeGetParent},
    {"CFTreeRef", lua_CFTreeRef},
    {"CFTreeGetNextSibling", lua_CFTreeGetNextSibling},
    {"CFTreeRef", lua_CFTreeRef},
    {"CFTreeGetFirstChild", lua_CFTreeGetFirstChild},
    {"CFTreeRef", lua_CFTreeRef},
    {"CFTreeGetContext", lua_CFTreeGetContext},
    {"CFTreeContext", lua_CFTreeContext},
    {"CFTreeContext", lua_CFTreeContext},
    {"CFTreeContext", lua_CFTreeContext},
    {"CFTreeGetContext", lua_CFTreeGetContext},
    {"CFTreeGetChildCount", lua_CFTreeGetChildCount},
    {"CFTreeGetChildCount", lua_CFTreeGetChildCount},
    {"CFTreeGetChildAtIndex", lua_CFTreeGetChildAtIndex},
    {"CFTreeRef", lua_CFTreeRef},
    {"CFTreeGetChildren", lua_CFTreeGetChildren},
    {"CFTreeGetChildCount", lua_CFTreeGetChildCount},
    {"CFTreeGetChildren", lua_CFTreeGetChildren},
    {"CFTreeApplyFunctionToChildren", lua_CFTreeApplyFunctionToChildren},
    {"CFTreeApplyFunctionToChildren", lua_CFTreeApplyFunctionToChildren},
    {"CFTreeFindRoot", lua_CFTreeFindRoot},
    {"CFTreeRef", lua_CFTreeRef},
    {"CFTreeSetContext", lua_CFTreeSetContext},
    {"CFTreeContext", lua_CFTreeContext},
    {"CFTreeContext", lua_CFTreeContext},
    {"CFTreeContext", lua_CFTreeContext},
    {"CFTreeSetContext", lua_CFTreeSetContext},
    {"CFTreePrependChild", lua_CFTreePrependChild},
    {"CFTreePrependChild", lua_CFTreePrependChild},
    {"CFTreeAppendChild", lua_CFTreeAppendChild},
    {"CFTreeAppendChild", lua_CFTreeAppendChild},
    {"CFTreeInsertSibling", lua_CFTreeInsertSibling},
    {"CFTreeInsertSibling", lua_CFTreeInsertSibling},
    {"CFTreeRemove", lua_CFTreeRemove},
    {"CFTreeRemove", lua_CFTreeRemove},
    {"CFTreeRemoveAllChildren", lua_CFTreeRemoveAllChildren},
    {"CFTreeRemoveAllChildren", lua_CFTreeRemoveAllChildren},
    {"CFTreeSortChildren", lua_CFTreeSortChildren},
    {"CFTreeSortChildren", lua_CFTreeSortChildren},
    {NULL, NULL},
};

int LuaOpenCFTree(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFTreeAPIs);
    return 0;
}
