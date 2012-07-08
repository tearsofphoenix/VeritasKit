//
//  BoCPressQuoteService.h
//  BoCPress
//
//  Created by E-Reach Administrator on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressMetaService.h"

@protocol BoCPressSecurity;
@protocol BoCPressSecurityFamily;
@protocol BoCPressCallback;
@protocol BoCPressChartImageConfiguration;

@protocol BoCPressQuoteService<BoCPressMetaService>

@required

- (void)listOrderedSecurityInFamily: (id<BoCPressSecurityFamily>)family 
                       withCallback: (id<BoCPressCallback>)callback
                        triggerFlag: (NSString *)flag;

- (void)listOrderedLongTermSecurityInFamily: (id<BoCPressSecurityFamily>)family 
                               withCallback: (id<BoCPressCallback>)callback;

- (void)listOrderedSecurityFamiliesWithCallback: (id<BoCPressCallback>)callback;

- (void)contentOfQuote: (id<BoCPressSecurity>)security
          inSecurities: (NSArray *)securities
          withCallback: (id<BoCPressCallback>)callback
           triggerFlag: (NSString *)flag;

- (void)downloadChartImageWith: (id)info 
                      callback: (id<BoCPressCallback>)callback;

- (void)getChartImage: (id<BoCPressChartImageConfiguration>)chartImageConfiguration
         withCallback: (id<BoCPressCallback>)callback
          triggerFlag: (NSString *)flag;

- (void)listOrderedRelatedCriticPostsOfSecurity: (id<BoCPressSecurity>)security
                                   withCallback: (id<BoCPressCallback>)callback;

- (void)listOrderedRelatedNewsOfSecurity: (id<BoCPressSecurity>)security
                            withCallback: (id<BoCPressCallback>)callback;

- (void)storeQuoteContentPageChartConfiguration: (id)chartImageConfiguration;

- (id)quoteContentPageChartConfiguration;


@end

@interface BoCPressQuoteService : BoCPressMetaService<BoCPressQuoteService>

@end

extern NSString * const BoCPressQuoteServiceID;
