//
//  BoCPressMetaService.h
//  BoCPress
//
//  Created by E-Reach Administrator on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressSoapXMLParser.h"
#import "NSIdentifiedObject.h"

@protocol BoCPressNetworkService;
@protocol BoCPressCacheService;
@protocol BoCPressConfigurationService;
@protocol BoCPressRequestStringFormatService;

@protocol BoCPressNews;
@protocol BoCPressCallback;
@protocol BoCPressFeedback;

@protocol BoCPressMetaService <NSIdentifiedObject>

@end

@interface BoCPressMetaService : NSObject<BoCPressMetaService, BoCPressSoapXMLParserDelegate>
{
    id<BoCPressNetworkService> _networkService;
    id<BoCPressCacheService> _cacheService;
    id<BoCPressConfigurationService> _configurationService;
    id<BoCPressRequestStringFormatService> _requestFormatService;
    
    NSMutableDictionary *_soapCallbackFunctions;
}

- (id)initWithNetworkService: (id<BoCPressNetworkService>)networkService
                cacheService: (id<BoCPressCacheService>)cacheService
        configurationService: (id<BoCPressConfigurationService>)configurationService
        requestFormatService: (id<BoCPressRequestStringFormatService>)requestFormatService;

- (void)initSoapCallbackFunctions;

- (void)getCommentSummaryContentOfNews: (id<BoCPressNews>)news
                          withCallback: (id<BoCPressCallback>)callback;

- (void)submitFeedback: (id<BoCPressFeedback>)feedback 
                toNews: (id<BoCPressNews>)news 
          withCallback: (id<BoCPressCallback>)callback;


@end

extern NSString * const BoCPressMetaServiceID;