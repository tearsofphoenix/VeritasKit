//
//  LuaFoundation.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaFoundation.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "LuaFoundationErrors.h"
#import "LuaNSAttributedString.h"
#import "LuaNSBundle.h"
#import "LuaNSCalendar.h"
#import "LuaNSComparisonPredicate.h"
#import "LuaNSCompoundPredicate.h"
#import "LuaNSData.h"
#import "LuaNSDateFormatter.h"
#import "LuaNSDecimal.h"
#import "LuaNSDecimalNumber.h"
#import "LuaNSError.h"
#import "LuaNSExpression.h"
#import "LuaNSFileCoordinator.h"
#import "LuaNSFileHandle.h"
#import "LuaNSFileManager.h"
#import "LuaNSFileVersion.h"
#import "LuaNSFileWrapper.h"
#import "LuaNSHTTPCookie.h"
#import "LuaNSKeyValueObserving.h"
#import "LuaNSLinguisticTagger.h"
#import "LuaNSLocale.h"
#import "LuaNSMetadata.h"
#import "LuaNSNetServices.h"
#import "LuaNSNumberFormatter.h"
#import "LuaNSOperation.h"
#import "LuaNSPort.h"
#import "LuaNSPropertyList.h"
#import "LuaNSRange.h"
#import "LuaNSRegularExpression.h"
#import "LuaNSStream.h"
#import "LuaNSString.h"
#import "LuaNSTimeZone.h"
#import "LuaNSURL.h"
#import "LuaNSURLCache.h"
#import "LuaNSURLCredential.h"
#import "LuaNSURLError.h"
#import "LuaNSURLRequest.h"
#import "LuaNSUbiquitousKeyValueStore.h"
#import "LuaNSUndoManager.h"
#import "LuaNSXMLParser.h"
#import "LuaNSZone.h"
#import "LuaNSCollection.h"
#import "LuaNSCoder.h"

int LuaOpenFoundation(lua_State *L)
{    
    LuaOpenFoundationErrors(L);
    LuaOpenNSAttributedString(L);
    LuaOpenNSBundle(L);
    LuaOpenNSCalendar(L);
    LuaOpenNSComparisonPredicate(L);
    LuaOpenNSCompoundPredicate(L);
    LuaOpenNSData(L);
    LuaOpenNSDateFormatter(L);
    LuaOpenNSDecimal(L);
    LuaOpenNSDecimalNumber(L);
    LuaOpenNSError(L);
    LuaOpenNSExpression(L);
    LuaOpenNSFileCoordinator(L);
    LuaOpenNSFileHandle(L);
    LuaOpenNSFileManager(L);
    LuaOpenNSFileVersion(L);
    LuaOpenNSFileWrapper(L);
    LuaOpenNSHTTPCookie(L);
    LuaOpenNSKeyValueObserving(L);
    LuaOpenNSLinguisticTagger(L);
    LuaOpenNSLocale(L);
    LuaOpenNSMetadata(L);
    LuaOpenNSNetServices(L);
    LuaOpenNSNumberFormatter(L);
    LuaOpenNSOperation(L);
    LuaOpenNSPort(L);
    LuaOpenNSPropertyList(L);
    LuaOpenNSRange(L);
    LuaOpenNSRegularExpression(L);
    LuaOpenNSStream(L);
    LuaOpenNSString(L);
    LuaOpenNSTimeZone(L);
    LuaOpenNSURL(L);
    LuaOpenNSURLCache(L);
    LuaOpenNSURLCredential(L);
    LuaOpenNSURLError(L);
    LuaOpenNSURLRequest(L);
    LuaOpenNSUbiquitousKeyValueStore(L);
    LuaOpenNSUndoManager(L);
    LuaOpenNSXMLParser(L);
    LuaOpenNSZone(L);
    LuaOpenNSColletion(L);
    LuaOpenNSCoder(L);
    
    return 0;
}
