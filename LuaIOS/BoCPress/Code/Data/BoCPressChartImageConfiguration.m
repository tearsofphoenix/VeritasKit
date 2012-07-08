//
//  BoCPressChartImageConfiguration.m
//  BoCPress
//
//  Created by E-Reach Administrator on 11/11/11.
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

#import "BoCPressChartImageConfiguration.h"

#import "BoCPressConstant.h"

#import "XMLDocument.h"

#import "XMLNode.h"

#import "NSString+TrimWhiteSpaces.h"

#import "BoCPressSharedFunctions.h"

@implementation BoCPressChartImageConfiguration

static void BoCPressChartImageConfiguration_initConfigurationFromXMLString(NSString *xmlFormattedString,
                                                                           NSMutableDictionary **_configuration)
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    NSData *data = [xmlFormattedString dataUsingEncoding:NSUTF8StringEncoding];
    
    XMLDocument *document = [[XMLDocument alloc] initWithData: data];
    NSArray *nodes = [document evaluateXPathExpression:@"//return" withNamespaces:nil];
    XMLNode *returnNode = [nodes objectAtIndex:0];
    
    NSString *chartAnalyses = [returnNode getTextContentWithChildNodeName:@"analyses"];
    
    NSString *imageURL = [[returnNode getTextContentWithChildNodeName:@"chartUrl"] trimWhiteSpaces];
    NSString *width = [returnNode getTextContentWithChildNodeName:@"width"];
    NSString *height = [returnNode getTextContentWithChildNodeName:@"height"];
    
    NSString *timeIntervalType = [returnNode getTextContentWithChildNodeName:@"interval"];
    NSString *pointStep = [returnNode getTextContentWithChildNodeName:@"points"];
    NSString *ric = [returnNode getTextContentWithChildNodeName:@"ric"];
    NSString *secId = [returnNode getTextContentWithChildNodeName:@"secId"];
    NSString *type = [returnNode getTextContentWithChildNodeName:@"type"];
    NSString *updateDate = [returnNode getTextContentWithChildNodeName:@"updateDate"];
    
    *_configuration = [[NSMutableDictionary alloc] init];
    
    if (chartAnalyses)
    {
        [*_configuration setObject:chartAnalyses forKey:@"analyses"];
    }
    if (imageURL)
    {        
        [*_configuration setObject:imageURL forKey:@"chartUrl"];
    }
    
    if (width)
    {        
        [*_configuration setObject:width forKey:@"width"];
    }
    if (height)
    {
        [*_configuration setObject:height forKey:@"height"];
    }
    if (timeIntervalType) 
    {
        [*_configuration setObject:timeIntervalType forKey:@"interval"];
    }
    if (pointStep)
    {        
        [*_configuration setObject:pointStep forKey:@"points"];
    }
    if (ric)
    {
        [*_configuration setObject:ric forKey:@"ric"];
    }
    if (secId)
    {        
        [*_configuration setObject:secId forKey:@"secId"];
    }

    if (type)
    {        
        [*_configuration setObject:type forKey:@"type"];
    }
    if (updateDate)
    {
        [*_configuration setObject:updateDate forKey:@"updateDate"];
    }

    
    [document release];
    [pool release];
}
- (id)initWithXMLString:(NSString *)xmlFormattedString
{
    if ((self = [super init])) 
    {
        BoCPressChartImageConfiguration_initConfigurationFromXMLString(xmlFormattedString, &_configuration)
        ;
    }
    return self;
}

- (id)init
{
    if ((self = [super init]))
    {
        NSString *xmlFormattedString = @"<return><secId>3001</secId><width>960</width><height>480</height><type>Line</type><analyses></analyses><interval>1_MINUTE</interval><points>30</points></return>";
        BoCPressChartImageConfiguration_initConfigurationFromXMLString(xmlFormattedString, &_configuration);
    }
    
    return self;
}

- (id)initWithSecurityID:(id)identity
{
    if ((self = [super init])) 
    {
        if (identity)
        {
            ;
        }else
        {
            identity = @"3001";
        }
        
        NSString *xmlFormattedString = [NSString stringWithFormat:@"<return><secId>%@</secId><width>960</width><height>480</height><type>Line</type><analyses></analyses><interval>1_MINUTE</interval><points>30</points></return>", identity];
        
        BoCPressChartImageConfiguration_initConfigurationFromXMLString(xmlFormattedString, &_configuration);
    }
    return self;
}
- (void)dealloc
{
    [_configuration release];
    
    [super dealloc];
    
}

//<secId>%@</secId><width>%@</width><height>%@</height><type>%@</type><analyses>%@</analyses><interval>%@</interval><points>%@</points>
- (NSString *)xmlFormattedString
{
    id identity = [_configuration objectForKey:@"secId"];
    id width = [_configuration objectForKey:@"width"];
    id height = [_configuration objectForKey:@"height"];
    id type = [_configuration objectForKey:@"type"];
    id analyses = [_configuration objectForKey:@"analyses"];
    id timeIntervalType = [_configuration objectForKey:@"interval"];
    id pointStep = [_configuration objectForKey:@"points"];
    
    NSString *xmlString = @"";

    xmlString = [xmlString stringByAppendingString:formatXMLValueAndKey(identity, @"secId")];        
    xmlString = [xmlString stringByAppendingString:formatXMLValueAndKey(width, @"width")];
    xmlString = [xmlString stringByAppendingString:formatXMLValueAndKey(height, @"height")];        
    xmlString = [xmlString stringByAppendingString:formatXMLValueAndKey(type, @"type")];
    xmlString = [xmlString stringByAppendingString:formatXMLValueAndKey(analyses, @"analyses")];        
    xmlString = [xmlString stringByAppendingString:formatXMLValueAndKey(timeIntervalType, @"interval")];
    xmlString = [xmlString stringByAppendingString:formatXMLValueAndKey(pointStep, @"points")];
    
    return xmlString;
}

- (void)storeConfiguration:(id)configuration forKey:(id)key
{
    if (configuration && key)
    {
        [_configuration setObject:configuration forKey:key];
    }
}

- (id)queryConfigurationWithKey:(id)key
{
    return [_configuration objectForKey:key];
}

- (BOOL)hasSameConfigurationWith:(id<BoCPressChartImageConfiguration>)anotherConfiguration
{
    id identity = [anotherConfiguration queryConfigurationWithKey:@"secId"];
    if (identity && ![identity isEqual:[_configuration objectForKey:@"secId"]]) 
    {
        return NO;
    }
    id width = [anotherConfiguration queryConfigurationWithKey:@"width"];
    if (width && ![width isEqual:[_configuration objectForKey:@"width"]])
    {
        return NO;
    }
    id height = [anotherConfiguration queryConfigurationWithKey:@"height"];
    if (height && ![height isEqual:[_configuration objectForKey:@"height"]])
    {
        return NO;
    }
    id type = [anotherConfiguration queryConfigurationWithKey:@"type"];
    if (type && ![type isEqual:[_configuration objectForKey:@"type"]])
    {
        return NO;
    }
    id analyses = [anotherConfiguration queryConfigurationWithKey:@"analyses"];
    if(analyses && ![analyses isEqual:[_configuration objectForKey:@"analyses"]])
    {
        return NO;
    }
    id timeIntervalType = [anotherConfiguration queryConfigurationWithKey:@"interval"];
    if (timeIntervalType && ![timeIntervalType isEqual:[_configuration objectForKey:@"interval"]])
    {
        return NO;
    }
    id pointStep = [anotherConfiguration queryConfigurationWithKey:@"points"];
    if (pointStep && ![pointStep isEqual:[_configuration objectForKey:@"points"]])
    {
        return NO;
    }
    
    return YES;
    
}

- (void)updateDate: (id)date
          imageURL: (id)imgURL
{
    if (date)
    {
        [_configuration setObject: date
                           forKey: @"updateDate"];
    }
    
    if (imgURL)
    {
        [_configuration setObject: imgURL
                           forKey: @"chartUrl"];
    }

}

- (void)copyConfigurationFrom:(id<BoCPressChartImageConfiguration>)anotherConfiguration
{
    id identity = [anotherConfiguration queryConfigurationWithKey:@"secId"];
    id width = [anotherConfiguration queryConfigurationWithKey:@"width"];
    id height = [anotherConfiguration queryConfigurationWithKey:@"height"];
    id type = [anotherConfiguration queryConfigurationWithKey:@"type"];
    id analyses = [anotherConfiguration queryConfigurationWithKey:@"analyses"];
    id timeIntervalType = [anotherConfiguration queryConfigurationWithKey:@"interval"];
    id pointStep = [anotherConfiguration queryConfigurationWithKey:@"points"];
    
    if (identity)
    {
        [_configuration setObject:@"secId" forKey:identity];
    }
    if (width)
    {
        [_configuration setObject:@"width" forKey:width];
    }
    if (height)
    {
        [_configuration setObject:@"height" forKey:height];
    }    
    if (type)
    {
        [_configuration setObject:@"type" forKey:type];
    }    
    if (analyses)
    {
        [_configuration setObject:@"analyses" forKey:analyses];
    }    
    if (timeIntervalType)
    {
        [_configuration setObject:@"interval" forKey:timeIntervalType];
    }
    if (pointStep)
    {
        [_configuration setObject:@"points" forKey:pointStep];
    }
    
    NSString *ric = [anotherConfiguration queryConfigurationWithKey:@"ric"];
    
    if (ric)
    {
        [_configuration setObject:ric forKey:@"ric"];
    }

    NSString *updateDate = [anotherConfiguration queryConfigurationWithKey:@"updateDate"];
    if (updateDate)
    {
        [_configuration setObject:updateDate forKey:@"updateDate"];
    }
    
    NSString *chartUrl = [anotherConfiguration queryConfigurationWithKey:@"chartUrl"];
    if (chartUrl)
    {
        [_configuration setObject:chartUrl forKey:@"chartUrl"];
    }
}

- (NSString *)description
{
    return [self xmlFormattedString];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{

    if ((self = [super init]))
    {
        _configuration = [[NSMutableDictionary alloc] init];
        [_configuration setDictionary: [aDecoder decodeObjectForKey: @"_configuration"]];        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject: _configuration forKey: @"_configuration"];
}
@end
