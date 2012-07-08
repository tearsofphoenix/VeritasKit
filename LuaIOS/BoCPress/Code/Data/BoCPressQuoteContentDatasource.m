//
//  BoCPressQuoteContentDatasource.m
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

#import "BoCPressQuoteContentDatasource.h"

#import "BoCPressDataSource.h"

#import "BoCPressSecurity.h"

#import "BoCPressChartImageConfiguration.h"

#import "BoCPressEntry.h"

#import "BoCPressConfigurationService.h"

#import "BoCPressColumn.h"

@implementation BoCPressQuoteContentDatasource

static void BoCPressQuoteContentDatasource_initTimeInterval(NSArray **_timeIntervalChoices)
{
    NSMutableArray *entries = [[NSMutableArray alloc] init];
    BoCPressEntry *iLooper = nil;
    
    iLooper = [[BoCPressEntry alloc] initWithName:@"1分钟" internalName:@"1_MINUTE" identity:@"1"];  
    [iLooper setIsChosen:YES];
    [entries addObject:iLooper];
    [iLooper release];
    
    iLooper = [[BoCPressEntry alloc] initWithName:@"30分钟" internalName:@"30_MINUTES" identity:@"2"];
    [entries addObject:iLooper];
    [iLooper release];
    
    iLooper = [[BoCPressEntry alloc] initWithName:@"1小时" internalName:@"1_HOUR" identity:@"3"];
    [entries addObject:iLooper];
    [iLooper release];
    
    iLooper = [[BoCPressEntry alloc] initWithName:@"1天" internalName:@"1_DAY" identity:@"4"];
    [entries addObject:iLooper];
    [iLooper release];
    
    iLooper = [[BoCPressEntry alloc] initWithName:@"1周" internalName:@"1_WEEK" identity:@"5"];
    
    [entries addObject:iLooper];
    [iLooper release];
    
    iLooper = [[BoCPressEntry alloc] initWithName:@"1月" internalName:@"1_MONTH" identity:@"6"];
    
    [entries addObject:iLooper];
    [iLooper release];
    
    *_timeIntervalChoices = [[NSArray alloc] initWithArray:entries];
    
    [entries release];
    
}
static void BoCPressQuoteContentDatasource_initConfiguration(NSArray **_timeIntervalChoices,
                                                       NSArray **_chartTypes,
                                                       NSArray **_pointChoices,
                                                       NSArray **_analysesChoices,
                                                       NSArray **_sections,
                                                       NSDictionary **_groups
                                                       )
{
    NSMutableArray *entries = [[NSMutableArray alloc] init];
    BoCPressEntry *iLooper = nil;
    
    
    BoCPressQuoteContentDatasource_initTimeInterval(_timeIntervalChoices);
    
    iLooper = [[BoCPressEntry alloc] initWithName:@"分时图(Line)" internalName:@"Line" identity:@"1"];
    [entries addObject:iLooper];
    [iLooper release];
    
    iLooper = [[BoCPressEntry alloc] initWithName:@"蜡烛图(Candle)" internalName:@"Candle" identity:@"2"];
    [iLooper setIsChosen:YES];
    [entries addObject:iLooper];
    [iLooper release];
    
    *_chartTypes = [[NSArray alloc] initWithArray:entries];
    
    [entries removeAllObjects];
    
    
    iLooper = [[BoCPressEntry alloc] initWithName:@"30" internalName:@"30" identity:@"1"];
    [entries addObject:iLooper];
    [iLooper release];
    
    iLooper = [[BoCPressEntry alloc] initWithName:@"60" internalName:@"60" identity:@"2"];
    [iLooper setIsChosen:YES];
    [entries addObject:iLooper];
    [iLooper release];
    
    iLooper = [[BoCPressEntry alloc] initWithName:@"90" internalName:@"90" identity:@"3"];
    [entries addObject:iLooper];
    [iLooper release];
    
    iLooper = [[BoCPressEntry alloc] initWithName:@"200" internalName:@"200" identity:@"4"];
    [entries addObject:iLooper];
    [iLooper release];
    
    iLooper = [[BoCPressEntry alloc] initWithName:@"400" internalName:@"400" identity:@"5"];
    [entries addObject:iLooper];
    [iLooper release];
    
    iLooper = [[BoCPressEntry alloc] initWithName:@"500" internalName:@"500" identity:@"6"];
    [entries addObject:iLooper];
    [iLooper release];

    *_pointChoices = [[NSArray alloc] initWithArray:entries];
    
    [entries removeAllObjects];
    
    iLooper = [[BoCPressEntry alloc] initWithName:@"无" internalName:@"" identity:@"1"];
    [iLooper setIsChosen:YES];
    [entries addObject:iLooper];
    [iLooper release];
    
    iLooper = [[BoCPressEntry alloc] initWithName:@"MACD" internalName:@"MACD" identity:@"2"];
    [entries addObject:iLooper];
    [iLooper release];
    
    iLooper = [[BoCPressEntry alloc] initWithName:@"RSI" internalName:@"RSI" identity:@"3"];
    [entries addObject:iLooper];
    [iLooper release];
    
    iLooper = [[BoCPressEntry alloc] initWithName:@"MA" internalName:@"MA" identity:@"4"];
    [entries addObject:iLooper];
    [iLooper release];
    
    iLooper = [[BoCPressEntry alloc] initWithName:@"Bbands" internalName:@"Bbands" identity:@"5"];
    [entries addObject:iLooper];
    [iLooper release];
    
    iLooper = [[BoCPressEntry alloc] initWithName:@"StochS(KDJ)" internalName:@"KDJ" identity:@"6"];
    [entries addObject:iLooper];
    [iLooper release];
    
    iLooper = [[BoCPressEntry alloc] initWithName:@"Mom" internalName:@"Mom" identity:@"7"];
    [entries addObject:iLooper];
    [iLooper release];
    
    iLooper = [[BoCPressEntry alloc] initWithName:@"Osc" internalName:@"Osc" identity:@"8"];
    [entries addObject:iLooper];
    [iLooper release];

    
    *_analysesChoices = [[NSArray alloc] initWithArray:entries];
    [entries release];
    
    *_sections = [[NSArray alloc] initWithObjects:@"图表类型", @"显示单位", @"指标分类", nil];
    *_groups = [[NSDictionary alloc] initWithObjectsAndKeys:
                *_chartTypes, @"图表类型",
                *_pointChoices, @"显示单位",
                *_analysesChoices, @"指标分类",
                nil];
    
}


static void BoCPressQuoteContentDatasource_reloadChartImageConfiguration(NSArray *_timeIntervalTypes,
                                                                         NSArray *_types,
                                                                         NSArray *_points,
                                                                         NSArray *_analyses,
                                                                         id<BoCPressSecurity> _security,
                                                                         BoCPressChartImageConfiguration *_chartImageConfiguration)
{
    for (id<BoCPressEntry> iLooper in _timeIntervalTypes)
    {
        if ([iLooper isChosen]) 
        {
            [_chartImageConfiguration storeConfiguration:[iLooper internalName] forKey:@"interval"];
            break;
        }
    }
    
    for (id<BoCPressEntry> iLooper in _types)
    {
        if ([iLooper isChosen]) 
        {
            [_chartImageConfiguration storeConfiguration:[iLooper internalName] forKey:@"type"];
            break;
        }
    }
    
    for (id<BoCPressEntry> iLooper in _points)
    {
        if ([iLooper isChosen]) 
        {
            [_chartImageConfiguration storeConfiguration:[iLooper internalName] forKey:@"points"];
            break;
        }
    }

    for (id<BoCPressEntry> iLooper in _analyses)
    {
        if ([iLooper isChosen]) 
        {
            [_chartImageConfiguration storeConfiguration:[iLooper internalName] forKey:@"analyses"];
            break;
        }
    }

    [_chartImageConfiguration storeConfiguration: [_security identity] forKey:@"secId"];
        
}

@synthesize security = _security;

- (id)initWithService: (id<BoCPressDataSource>) rootDataSource
                    security: (id<BoCPressSecurity>)security
                  securities: (NSArray *)securities
{
    if ((self = [super init]))
    {
        _rootDataSource = rootDataSource;
        _security = [security retain];
        _securities = [securities retain];
        
        _chartImageConfiguration = [[BoCPressChartImageConfiguration alloc] initWithSecurityID:[_security identity]];
        
        _groups = [[_rootDataSource quoteContentPageChartConfiguration] retain];
        if (!_groups)
        {
            
            BoCPressQuoteContentDatasource_initConfiguration(&_timeIntervalChoices, 
                                                       &_chartTypes, 
                                                       &_pointChoices,
                                                       &_analysesChoices,
                                                       &_sections,
                                                       &_groups);
            BoCPressQuoteContentDatasource_reloadChartImageConfiguration(_timeIntervalChoices, 
                                                                         _chartTypes, 
                                                                         _pointChoices, 
                                                                         _analysesChoices, 
                                                                         _security,
                                                                         _chartImageConfiguration);
            
        }else
        {
            _sections = [[NSArray alloc] initWithObjects:@"图表类型", @"显示单位", @"指标分类", nil];
            BoCPressQuoteContentDatasource_initTimeInterval(&_timeIntervalChoices);
            _chartTypes = [[NSArray alloc] initWithArray:[_groups objectForKey:@"图表类型"]];
             _pointChoices = [[NSArray alloc] initWithArray:[_groups objectForKey:@"显示单位"]];
            _analysesChoices = [[NSArray alloc] initWithArray:[_groups objectForKey:@"指标分类"]];
        }
    }
    
    return self;
}

- (void)dealloc
{
    
    [_security release];
    [_chartImageConfiguration release];
    [_groups release];
    [_sections release];
    [_chartTypes release];
    [_analysesChoices release];
    [_pointChoices release];
    [_timeIntervalChoices release];
    
    [super dealloc];
}

- (void)downloadChartImageWith: (id)info 
                      callback: (id<BoCPressCallback>)callback
{
    [_rootDataSource downloadChartImageWith: info 
                                   callback: callback];
}

- (void)contentOfQuoteWithCallback:(id<BoCPressCallback>)callback
{
    [_rootDataSource contentOfQuote: _security
                       inSecurities: _securities
                       withCallback: callback];
}

- (void)contentOfQuoteWithCallbackByTimer:(id<BoCPressCallback>)callback
{
    [_rootDataSource contentOfQuoteByTimer: _security
                              inSecurities: _securities
                              withCallback: callback];
}

- (void)getChartImageWithCallback:(id<BoCPressCallback>)callback
{
    BoCPressQuoteContentDatasource_reloadChartImageConfiguration(_timeIntervalChoices, 
                                                                 _chartTypes, 
                                                                 _pointChoices, 
                                                                 _analysesChoices, 
                                                                 _security,
                                                                 _chartImageConfiguration);
    [_rootDataSource getChartImage: _chartImageConfiguration
                      withCallback: callback];
}

- (void)getChartImageWithCallbackByTimer: (id<BoCPressCallback>)callback
{
    BoCPressQuoteContentDatasource_reloadChartImageConfiguration(_timeIntervalChoices, 
                                                                 _chartTypes, 
                                                                 _pointChoices, 
                                                                 _analysesChoices, 
                                                                 _security,
                                                                 _chartImageConfiguration);
    [_rootDataSource getChartImage: _chartImageConfiguration
                      withCallbackByTimer: callback];
}

- (void)setChartImageConfigurationValue:(id)value 
                                forKey:(id)key
{
    [_chartImageConfiguration storeConfiguration:value forKey:key];
}

- (void)storeChartImageConfiguration
{

    [_rootDataSource storeQuoteContentPageChartConfiguration: _groups];
}

- (id)queryConfigurationWithTag:(id)tag
{
    return [_groups objectForKey:tag];
}

- (BOOL)hasSameConfigurationWith:(BoCPressChartImageConfiguration *)imageConfiguration
{
    return [_chartImageConfiguration hasSameConfigurationWith:imageConfiguration];
}

- (void)updateDate: (id)date
          imageURL: (id)imgURL
{
    [_chartImageConfiguration updateDate: date
                                imageURL: imgURL];
}

- (NSArray *)timeIntervalTypes
{
    return _timeIntervalChoices;
}
   
- (id)queryChartImageConfigurationWithTag:(id)tag
{
    return [_chartImageConfiguration queryConfigurationWithKey:tag];
}

- (NSArray *)configurationSections
{
    return _sections;
}

- (NSDictionary *)configurationGroups
{
    return _groups;
}

- (BoCPressChartImageConfiguration *)chartImageConfiguration
{
    BoCPressQuoteContentDatasource_reloadChartImageConfiguration(_timeIntervalChoices, 
                                                                 _chartTypes, 
                                                                 _pointChoices, 
                                                                 _analysesChoices, 
                                                                 _security,
                                                                 _chartImageConfiguration);
    return _chartImageConfiguration;
}

- (void)listOrderedRelatedCriticPostsWithCallback: (id<BoCPressCallback>)callback
{
    [_rootDataSource listOrderedRelatedCriticPostsOfSecurity: _security
                                                withCallback: callback];
}

- (void)listOrderedRelatedNewsWithCallback: (id<BoCPressCallback>)callback
{
    [_rootDataSource listOrderedRelatedNewsOfSecurity: _security 
                                         withCallback: callback];
}

@end
