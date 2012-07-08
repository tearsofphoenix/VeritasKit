//
//  BoCPressQuoteContentDatasource.h
//  BoCPress
//
//  Created by LeixSnake on 10/27/11.
/*************************************************************************

*

* EREACH CONFIDENTIAL

* ____________________

*

* [2011] eReach Mobile Software Technology Co., Ltd.

* All Rights Reserved.

*

* NOTICE: All information contained herein is, and remains the

* property of eReach Mobile Software Technology and its suppliers,

* if any. The intellectual and technical concepts contained herein

* are proprietary to eReach Mobile Software Technology and its

* suppliers and may be covered by U.S. and Foreign Patents, patents

* in process, and are protected by trade secret or copyright law.

* Dissemination of this information or reproduction of this material

* is strictly forbidden unless prior written permission is obtained

* from eReach Mobile Software Technology Co., Ltd.

*/

#import <Foundation/Foundation.h>

@protocol BoCPressSecurity;
@protocol BoCPressDataSource;
@protocol BoCPressCallback;
@protocol BoCPressChartImageConfiguration;

@class BoCPressChartImageConfiguration;

@protocol BoCPressQuoteContentDatasource<NSObject>

#pragma mark - action handle
- (void)downloadChartImageWith: (id)info 
                      callback: (id<BoCPressCallback>)callback;

- (void)contentOfQuoteWithCallback:(id<BoCPressCallback>)callback;

- (void)contentOfQuoteWithCallbackByTimer:(id<BoCPressCallback>)callback;

- (void)getChartImageWithCallback: (id<BoCPressCallback>)callback;

- (void)getChartImageWithCallbackByTimer: (id<BoCPressCallback>)callback;

- (void)listOrderedRelatedCriticPostsWithCallback: (id<BoCPressCallback>)callback;

- (void)listOrderedRelatedNewsWithCallback: (id<BoCPressCallback>)callback;

//save configuration to filesystem
//
- (void)storeChartImageConfiguration;

//change configuration
//
- (void)setChartImageConfigurationValue: (id)value 
                                forKey: (id)key;

//
- (id)queryChartImageConfigurationWithTag: (id)tag;

- (id)queryConfigurationWithTag: (id)tag;


- (BOOL)hasSameConfigurationWith: (BoCPressChartImageConfiguration *)imageConfiguration;

- (void)updateDate: (id)date
          imageURL: (id)imgURL;

- (NSArray *)timeIntervalTypes;

#pragma mark - configuration

- (NSArray *)configurationSections;

- (NSDictionary *)configurationGroups;

- (BoCPressChartImageConfiguration *)chartImageConfiguration;

@property (nonatomic, retain) id<BoCPressSecurity> security;

#pragma mark - authorize

@end

@interface BoCPressQuoteContentDatasource : NSObject<BoCPressQuoteContentDatasource>
{
    id<BoCPressDataSource> _rootDataSource;
    NSArray *_securities;
#pragma mark - configuration
    BoCPressChartImageConfiguration *_chartImageConfiguration;
    NSDictionary *_groups;
    NSArray *_sections;
    NSArray *_timeIntervalChoices;
    NSArray *_chartTypes;
    NSArray *_pointChoices;
    NSArray *_analysesChoices;

}


- (id)initWithService: (id<BoCPressDataSource>) rootDataSource 
                    security: (id<BoCPressSecurity>)security
                  securities: (NSArray *)securities;

@end
