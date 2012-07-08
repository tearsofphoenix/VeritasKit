//
//  BoCPressSoapXMLParser.m
//  BoCPress
//
//  Created by LeixSnake on 6/8/11.
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


#import "BoCPressSoapXMLParser.h"

#import "XMLDocument.h"

#import "XMLPathProcessor.h"

#import "BoCPressNews.h"

#import "BoCPressConstant.h"

#import "BoCPressCallback.h"

#import "BoCPressMedia.h"

#import "BoCPressSecurity.h"

#import "BoCPressAuthor.h"

#import "BoCPressLongTermSecurity.h"

#import "BoCPressConstant.h"

#import "NSString+XMLTextEscaping.h"

#import "NSString+TrimWhiteSpaces.h"

#import "BoCPressSecurityFamily.h"

#import "BoCPressChartImageConfiguration.h"

#import "BoCPressProduct.h"

#import "BoCPressSharedFunctions.h"

#import "BoCPressNewsTagColumn.h"

#import "BoCPressEntry.h"

#import "BoCPressServerPushNotification.h"

#import "BoCPressQuoteConstants.h"

#define kBoCPressSoap_RemoteNotificationConfiguration_TagPrefix @"id_"

static NSString * getResponseType(id data)
{
    
    NSString *tmpStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"received soap xml:%@", tmpStr);
    NSString *responseType = nil;
    
    //try to match "</ns2:xxxx>"
    //
    NSRange responseTypeRange = [tmpStr rangeOfString:@"\\<\\/ns2\\:[a-zA-Z]+\\>" options:NSRegularExpressionSearch];
    
    if (responseTypeRange.location != NSNotFound)
    {
        NSString *step1String = [tmpStr substringWithRange:responseTypeRange];
        
        NSString *tempString = [step1String substringWithRange: [step1String rangeOfString:@"\\:[a-zA-Z]+" options:NSRegularExpressionSearch]];
        
        responseType = [tempString substringWithRange:[tempString rangeOfString:@"[a-zA-Z]+" options:NSRegularExpressionSearch]];
        
    }else
    {
        responseType = kNetwork_ErrorResponse;
    }
    
    [tmpStr release];
    
    return responseType;
}

#pragma mark - parse

typedef void ( *BoCPressSoapXMLParser_ParserFunctionType)(id data, NSMutableDictionary * _results, NSDictionary *callbackInfo);

static void parse_listOrderedNewsWithTag_(id data, 
                                          NSMutableDictionary *_results)
{
    @autoreleasepool 
    {
        
        XMLDocument *document = [[XMLDocument alloc] initWithData: data] ;
        
        NSArray *items = [document evaluateXPathExpression: @"//item" withNamespaces: nil];
        
        XMLNode *node = nil;
        
        NSMutableArray *itemIDs = [[NSMutableArray alloc] init] ;
        
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ;

        // for example: 2011-06-07 11:11:12.0
        [dateFormatter setDateFormat:kNetwork_DateFormatterString]; 
        
        id hasNextFlag = nil;
        
        for (node in items) 
        {
            //XMLNode *authorNode = [node childWithName:@"author"];
            
            BoCPressNews *tmpItem = [[BoCPressNews alloc] initWithIdentity:[node getTextContentWithChildNodeName:@"id"] 
                                                                      name:[[node getTextContentWithChildNodeName:@"title"] xmlTextUnescaped] 
                                                                  postTime:[dateFormatter dateFromString:[node getTextContentWithChildNodeName:@"postDate"]] 
                                                           articleAbstract:nil 
                                                            articleContent:nil 
                                                                    author:nil] ;
            XMLNode *columnNode = [node childWithName: @"column"];
            BoCPressNewsTagColumn *column = [[BoCPressNewsTagColumn alloc] initWithIdentity: [columnNode getTextContentWithChildNodeName: @"id"]
                                                                                       name: [columnNode getTextContentWithChildNodeName: @"name"]];
            
            [tmpItem setNewsTag: column];
            [column release];
            
            [_results setObject: tmpItem 
                         forKey: [tmpItem identity]];
            
            [itemIDs addObject: [tmpItem identity]];
            
            hasNextFlag = [node getTextContentWithChildNodeName:kSoapXMLParser_HasNextFlag];
            
            
            [tmpItem release];

        }
                
        if (hasNextFlag) 
        {
            [_results setObject:hasNextFlag forKey:kSoapXMLParser_HasNextFlag];
        }
        
        [_results setObject:itemIDs forKey:@"itemIDs"];
        
        
        [_results setObject:kNetwork_GetPostListResponse forKey:kNetwork_SoapResponseType];
        
        [itemIDs release];
        [dateFormatter release];
        
        [document release];
        
    }
}

static void parse_listOrderedMediaOfType_or_listOrderedMediaWithTag_(id data,
                                                                     NSMutableDictionary *_results,
                                                                     id<BoCPressMediaType> mediaType)
{
    @autoreleasepool 
    {
        
        XMLDocument *document = [[XMLDocument alloc] initWithData: data];
        
        NSArray *items = [document evaluateXPathExpression: @"//item" withNamespaces: nil];
        
        XMLNode *node = nil;
        
        NSMutableArray *itemIDs = [[NSMutableArray alloc] init];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

        // for example: 2011-06-07 11:11:12.0
        [dateFormatter setDateFormat:kNetwork_DateFormatterString]; 
        
        id hasNextFlag = nil;
        
        for (node in items) 
        {
            NSString *mediaURL = [[node getTextContentWithChildNodeName:@"mediaURL"] trimWhiteSpaces];
            NSString *imageURL = [[node getTextContentWithChildNodeName:@"featureImage"] trimWhiteSpaces];
            
            BoCPressMedia *tmpItem = [[BoCPressMedia alloc] initWithIdentity: [node getTextContentWithChildNodeName:@"id"]         
                                                                        name: [[node getTextContentWithChildNodeName:@"title"] xmlTextUnescaped]
                                                                    postTime: [dateFormatter dateFromString:[node getTextContentWithChildNodeName:@"postDate"]]
                                                                   mediaType: mediaType
                                                        mediaPlayingDuration: [node getTextContentWithChildNodeName:@"duration"]
                                                                mediaContent:  mediaURL 
                                                           thumbnailImageURL: [NSURL URLWithString:imageURL]
                                      ]; 
            
            [_results setObject:tmpItem forKey:[(id<NSIdentifiedObject>)tmpItem identity]];
            
            [itemIDs addObject:[(id<NSIdentifiedObject>)tmpItem identity]];
            
            hasNextFlag = [node getTextContentWithChildNodeName:kSoapXMLParser_HasNextFlag];
            
            [tmpItem release];
        }
        
        if (hasNextFlag)
        {
            [_results setObject:hasNextFlag forKey:kSoapXMLParser_HasNextFlag];
        }
        
        [_results setObject:itemIDs forKey:@"itemIDs"];
        
        [_results setObject:kNetwork_GetPostListResponse forKey:kNetwork_SoapResponseType];

        [dateFormatter release];    
        [itemIDs release];    
        [document release];
        
    }
}
static void parseGetPostListResponse( id data, 
                                     NSMutableDictionary *_results, 
                                     NSDictionary *callbackInfo)
{
    id action = [callbackInfo objectForKey:kNetwork_CallbackAction];
    
    id mediaType = [callbackInfo objectForKey:kNetwork_MediaType];
    
    if ([kCallbackAction_listOrderedNewsWithTag isEqualToString: action]) 
    {
        parse_listOrderedNewsWithTag_(data, _results);
        
    }else if([kCallbackAction_listOrderedMediaOfType isEqualToString:action]
             || [kCallbackAction_listOrderedMediaWithTag isEqualToString:action])
    {
        parse_listOrderedMediaOfType_or_listOrderedMediaWithTag_(data, _results, mediaType);
    }
}

static void parseMediaResult(id data, 
                             NSMutableDictionary *_results,
                             NSDictionary *callbackInfo)
{
    id mediaType = [callbackInfo objectForKey:kNetwork_MediaType];
    
    @autoreleasepool 
    {
        
        XMLDocument *document = [[XMLDocument alloc] initWithData: data] ;
        
        
        NSArray *items = [document evaluateXPathExpression: @"//return" withNamespaces: nil];
        
        if ([items count] < 1)
        {
            [document release];
            
            return;
        }
        
        XMLNode *node = [items objectAtIndex:0];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ;
        
        [dateFormatter setDateFormat:kNetwork_DateFormatterString]; 
        
        NSString *mediaURL = [[node getTextContentWithChildNodeName:@"mediaURL"] trimWhiteSpaces];
        NSString *imageURL = [[node getTextContentWithChildNodeName:@"featureImage"] trimWhiteSpaces];
        
        BoCPressMedia *tmpItem = [[BoCPressMedia alloc] initWithIdentity: [node getTextContentWithChildNodeName:@"id"]         
                                                                    name: [[node getTextContentWithChildNodeName:@"title"] xmlTextUnescaped]
                                                                postTime: [dateFormatter dateFromString:[node getTextContentWithChildNodeName:@"postDate"]]
                                                               mediaType: mediaType
                                                    mediaPlayingDuration: [node getTextContentWithChildNodeName:@"duration"]
                                                            mediaContent: mediaURL
                                                       thumbnailImageURL:[NSURL URLWithString:imageURL]
                                  ] ;
        
        [dateFormatter release];
        
        [_results setObject:tmpItem forKey:[(id<NSIdentifiedObject>)tmpItem identity]];
        
        [tmpItem release];
        
        [_results setObject:kNetwork_GetPostResponse forKey:kNetwork_SoapResponseType];
        
        [document release];
    }
}

static void parseCriticPostResult(id data,
                                  NSMutableDictionary *_results)
{
    @autoreleasepool 
    {
        
        XMLDocument *document = [[XMLDocument alloc] initWithData: data];
        
        
        NSArray *items = [document evaluateXPathExpression: @"//return" withNamespaces: nil];
        
        XMLNode *node = nil;
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ;
        // for example: 2011-06-07 11:11:12.0
        [dateFormatter setDateFormat:kNetwork_DateFormatterString]; 
        
        NSString *imageURLLooper = nil;
        BoCPressAuthor *authorLooper = nil;
        BoCPressImageView *imageViewLooper = nil;
        BoCPressNews *tmpItem = nil;
        
        for (node in items) 
        {
            XMLNode *authorNode = [node childWithName:@"author"];
            
            NSString *authorID = [authorNode getTextContentWithChildNodeName:@"id"];
            
            imageURLLooper = [authorNode getTextContentWithChildNodeName:@"avatar"];
            
            imageViewLooper = [[BoCPressImageView alloc] initWithImageURL: [NSURL URLWithString:imageURLLooper] 
                                                                  imageID: authorID] ;
            
            authorLooper = [[BoCPressAuthor alloc] initWithIdentity:[authorNode getTextContentWithChildNodeName:@"id"] 
                                                               name:[authorNode getTextContentWithChildNodeName:@"displayName"] 
                                                       authorAvatar: imageViewLooper
                                                  briefIntroduction:[[authorNode getTextContentWithChildNodeName:@"introduction"] xmlTextUnescaped]] ;
            
            [imageViewLooper release];
            
            tmpItem = [[BoCPressNews alloc] initWithIdentity:[node getTextContentWithChildNodeName:@"id"] 
                                                        name:[[node getTextContentWithChildNodeName:@"title"] xmlTextUnescaped]
                                                    postTime:[dateFormatter dateFromString:[node getTextContentWithChildNodeName:@"postDate"]]
                                             articleAbstract: [[node getTextContentWithChildNodeName:@"content"] xmlTextUnescaped]
                                              articleContent:[[node getTextContentWithChildNodeName:@"content"] xmlTextUnescaped]
                                                      author: authorLooper
                       ] ;
            
            XMLNode *columnNode = [node childWithName: @"column"];
            BoCPressNewsTagColumn *column = [[BoCPressNewsTagColumn alloc] initWithIdentity: [columnNode getTextContentWithChildNodeName: @"id"]
                                                                                       name: [columnNode getTextContentWithChildNodeName: @"name"]];
            
            [tmpItem setNewsTag: column];
            [column release];
            
            [authorLooper release];
            
            [_results setObject:tmpItem forKey:tmpItem.identity];
            
            
            [tmpItem release];
            
        }
        
        [dateFormatter release];
        [_results setObject:kNetwork_GetPostResponse forKey:kNetwork_SoapResponseType];
        
        [document release];
    }
    
}


static void parseGetPostResponse(id data,
                                 NSMutableDictionary* _results,
                                 NSDictionary *callbackInfo)
{
    id callbackAction = [callbackInfo objectForKey:kNetwork_CallbackAction];
    
    if([callbackAction isEqual:kCallbackAction_contentOfMedia])
    {
        parseMediaResult(data, _results, callbackInfo);
    }else
    {
        parseCriticPostResult(data, _results);
        
    }
}

static void parseGetAuthorResponse(id data,
                                   NSMutableDictionary* _results,
                                   NSDictionary *callbackInfo)
{
    @autoreleasepool 
    {
        XMLDocument *document = [[XMLDocument alloc] initWithData: data] ;
        
        NSArray *items = [document evaluateXPathExpression: @"//return" withNamespaces: nil];
        if ([items count] < 1)
        {
            [document release];
            return;
        }
        
        //only one item will be returned
        //
        XMLNode *node = [items objectAtIndex:0];
        
        NSString *criticID = [node getTextContentWithChildNodeName:@"id"];
        
        NSString *imageURL = [node getTextContentWithChildNodeName:@"avatar"];
        
        BoCPressImageView* imageView = [[BoCPressImageView alloc] initWithImageURL: [NSURL URLWithString:imageURL] 
                                                                           imageID: criticID
                                        ];
        
        BoCPressAuthor *critic = [[BoCPressAuthor alloc] initWithIdentity: criticID
                                                                     name:[node getTextContentWithChildNodeName:@"displayName"]
                                                             authorAvatar: imageView
                                                        briefIntroduction:[node getTextContentWithChildNodeName:@"introduction"]] ;
        [imageView release];
        
        [_results setObject:critic forKey:kNetwork_ReturnedInfoOfAuthor];
        
        [critic release];
        
        [_results setObject:kNetwork_GetAuthorResponse forKey:kNetwork_SoapResponseType];
        
        [document release];
        
    }
}

static void parseGetAuthorListResponse(id data, 
                                       NSMutableDictionary* _results,
                                       NSDictionary *callbackInfo)
{
    @autoreleasepool 
    {
        
        XMLDocument *document = [[XMLDocument alloc] initWithData: data] ;
        
        NSArray *items = [document evaluateXPathExpression: @"//item" withNamespaces: nil];
        
        XMLNode *node = nil;
        
        NSMutableArray *itemIDs = [[NSMutableArray alloc] init] ;
        
        id hasNextFlag = nil;
        
        NSString *imageURLLooper = nil;
        
        BoCPressImageView *imageViewLooper = nil;
        NSString *authorID = nil;
        
        for (node in items) 
        {
            
            authorID = [node getTextContentWithChildNodeName:@"id"];
            
            imageURLLooper = [node getTextContentWithChildNodeName:@"avatar"];
            
            imageViewLooper = [[BoCPressImageView alloc] initWithImageURL:[NSURL URLWithString:imageURLLooper] 
                                                                  imageID:authorID];
            
            BoCPressAuthor *author = [[BoCPressAuthor alloc] initWithIdentity: authorID
                                                                         name: [node getTextContentWithChildNodeName:@"displayName"] 
                                                                 authorAvatar: imageViewLooper
                                                            briefIntroduction: [[node getTextContentWithChildNodeName:@"introduction"] xmlTextUnescaped]] ;
            [imageViewLooper release];
            
            hasNextFlag = [node getTextContentWithChildNodeName:kSoapXMLParser_HasNextFlag];
            
            [_results setObject:author forKey:[author identity]];
            
            [itemIDs addObject:[author identity]];
            
            [author release];
            
        }
        
        if (hasNextFlag)
        {
            [_results setObject:hasNextFlag forKey:kSoapXMLParser_HasNextFlag];
        }
        
        [_results setObject:itemIDs forKey:@"itemIDs"];
        
        [itemIDs release];
        
        [_results setObject:kNetwork_GetAuthorListResponse forKey:kNetwork_SoapResponseType];
        
        [document release];
        
    }
}

static void parseGetQuoteListResponse(id data, 
                                      NSMutableDictionary *_results,
                                      NSDictionary *callbackInfo)
{
    id callbackAction = [callbackInfo objectForKey:kNetwork_CallbackAction];
    id<BoCPressSecurityFamily> family = [callbackInfo objectForKey: kType_Global_SecurityFamily]; 
    
    @autoreleasepool 
    {
        
        if ([callbackAction isEqual:kCallbackAction_listOrderedLongTermSecurityInFamily])
        {
            XMLDocument *document = [[XMLDocument alloc] initWithData: data];
            
            NSArray *items = [document evaluateXPathExpression: @"//item" withNamespaces: nil];
            
            if ([items count] > 0)
            {
                
                XMLNode *node = nil;
                
                
                NSMutableArray *itemIDs = [[NSMutableArray alloc] init] ;
                
                id hasNextFlag = nil;
                
                for (node in items) 
                {
                    NSString *idString = [node getTextContentWithChildNodeName:@"id"];
                    NSString *name = [node getTextContentWithChildNodeName:@"name"];
                    NSString *oneWeekValue = [node getTextContentWithChildNodeName:@"forexPrice_7_Day"];
                    NSString *oneMonthValue = [node getTextContentWithChildNodeName:@"forexPrice_1_Month"];
                    NSString *threeMonthValue = [node getTextContentWithChildNodeName:@"forexPrice_3_Month"];
                    NSString *sixMonthValue = [node getTextContentWithChildNodeName:@"forexPrice_6_Month"];
                    NSString *nineMonthValue = [node getTextContentWithChildNodeName:@"forexPrice_9_Month"];
                    NSString *twelveMonthValue = [node getTextContentWithChildNodeName:@"forexPrice_12_Month"];
                    
                    BoCPressLongTermSecurity *tmpItem = [[BoCPressLongTermSecurity alloc] initWithIdentity:idString 
                                                                                                      name:name 
                                                                                                   oneWeek:oneWeekValue 
                                                                                                  oneMonth:oneMonthValue 
                                                                                                threeMonth:threeMonthValue 
                                                                                                  sixMonth:sixMonthValue 
                                                                                                 nineMonth:nineMonthValue 
                                                                                               twelveMonth:twelveMonthValue];
                    
                    hasNextFlag = [node getTextContentWithChildNodeName:kSoapXMLParser_HasNextFlag];
                    
                    [_results setObject:tmpItem forKey:[tmpItem identity]];
                    
                    [itemIDs addObject:[tmpItem identity]];
                    
                    [tmpItem release];
                }
                
                if (hasNextFlag)
                {
                    [_results setObject:hasNextFlag forKey:kSoapXMLParser_HasNextFlag];
                }
                
                [_results setObject:[[items objectAtIndex:0] getTextContentWithChildNodeName:kSoapXMLParser_quoteDate] forKey: kNetwork_UpdateTime];
                
                [_results setObject:itemIDs forKey:@"itemIDs"];
                
                [itemIDs release];
            }
            
            [_results setObject:kNetwork_GetQuoteListResponse forKey:kNetwork_SoapResponseType];
            
            
            [document release];
            
        }else
        {
            XMLDocument *document = [[XMLDocument alloc] initWithData: data] ;
            
            NSArray *items = [document evaluateXPathExpression: @"//item" withNamespaces: nil];
            
            XMLNode *node = nil;
            
            id familyIdentity = [family identity];
            
            NSMutableArray *itemIDs = [[NSMutableArray alloc] init] ;
            
            id hasNextFlag = nil;
            
            for (node in items) 
            {
                BoCPressSecurity* tmpItem;
                
                if ([familyIdentity isEqualToString:kString_Global_ExchangeRateViewIdentity])
                {
                    tmpItem  = [[BoCPressSecurity alloc] initWithIdentity: [node getTextContentWithChildNodeName:@"id"] 
                                                                     name: [node getTextContentWithChildNodeName:@"name"] 
                                                                lastValue:[node getTextContentWithChildNodeName:@"askPrice"] 
                                                           lastPercentage:[node getTextContentWithChildNodeName:@"bidPriceSpot"]
                                                                 inFamily:family] ;
                }else
                {
                    tmpItem = [[BoCPressSecurity alloc] initWithIdentity: [node getTextContentWithChildNodeName:@"id"] 
                                                                    name: [node getTextContentWithChildNodeName:@"name"] 
                                                               lastValue:[node getTextContentWithChildNodeName:@"quote"] 
                                                          lastPercentage:[node getTextContentWithChildNodeName:@"changePercentage"]
                                                                inFamily:family] ;
                }
                
                NSString  *isTradebleFlag = [node getTextContentWithChildNodeName:@"isTradable"];
                
                [tmpItem setIsTradebleFlag: isTradebleFlag];
                
                hasNextFlag = [node getTextContentWithChildNodeName:kSoapXMLParser_HasNextFlag];
                
                [_results setObject:tmpItem forKey:[tmpItem identity]];
                
                [itemIDs addObject:[tmpItem identity]];
                
                [tmpItem release];
            }
            
            if (hasNextFlag)
            {
                [_results setObject:hasNextFlag forKey:kSoapXMLParser_HasNextFlag];
            }
            
            [_results setObject:[[items objectAtIndex:0] getTextContentWithChildNodeName:kSoapXMLParser_quoteDate] forKey: kNetwork_UpdateTime];
            
            [_results setObject:itemIDs forKey:@"itemIDs"];
            
            [itemIDs release];
            
            [_results setObject:kNetwork_GetQuoteListResponse forKey:kNetwork_SoapResponseType];
            
            [document release];
        }
        
    }
}
/*
 <return>
 <askPrice>0</askPrice>
 <bidPrice>0</bidPrice>
 <change>1.548</change>
 <changePercent>0.06%</changePercent>
 <currency>CNY</currency>
 <currentPrice>2481.084</currentPrice>
 <dailyHigh>2496.5269</dailyHigh>
 <dailyLow>2472.7608</dailyLow>
 <exchangeId>SHH</exchangeId>
 <name>上证综指</name>
 <openingPrice>2483.9571</openingPrice>
 <previousClosePrice>2479.536</previousClosePrice>
 <ric>.SSEC</ric>
 <secId>3001</secId>
 <serverDateTime>2011-11-11 16:48:45</serverDateTime>
 <tradeDate>2011-11-11</tradeDate>
 <tradeDateTime>2011-11-11 07:15</tradeDateTime>
 <tradeTime>07:15</tradeTime>
 </return>
 */
static void parseGetQuoteDetailResponse(id data, 
                                        NSMutableDictionary *_results,
                                        NSDictionary *callbackInfo)
{
    @autoreleasepool 
    {
        
        XMLDocument *document = [[XMLDocument alloc] initWithData:data];
        NSArray *items = [document evaluateXPathExpression:@"//return" withNamespaces:nil];
        XMLNode *returnNode = [items objectAtIndex:0];
        
        NSString *askPrice = [returnNode getTextContentWithChildNodeName:@"askPrice"];
        NSString *bidPrice = [returnNode getTextContentWithChildNodeName:@"bidPrice"];
        NSString *change = [returnNode getTextContentWithChildNodeName:@"change"];
        NSString *changePercent = [returnNode getTextContentWithChildNodeName:@"changePercent"];
        NSString *currency = [returnNode getTextContentWithChildNodeName:@"currency"];
        NSString *currentPrice = [returnNode getTextContentWithChildNodeName:@"currentPrice"];
        NSString *dailyHigh = [returnNode getTextContentWithChildNodeName:@"dailyHigh"];
        NSString *dailyLow = [returnNode getTextContentWithChildNodeName:@"dailyLow"];
        NSString *exchangeId = [returnNode getTextContentWithChildNodeName:@"exchangeId"];
        NSString *name = [returnNode getTextContentWithChildNodeName:@"name"];
        NSString *openingPrice = [returnNode getTextContentWithChildNodeName:@"openingPrice"];
        NSString *previousClosePrice = [returnNode getTextContentWithChildNodeName:@"previouseClosePrice"];
        NSString *ric = [returnNode getTextContentWithChildNodeName:@"ric"];
        NSString *secId= [returnNode getTextContentWithChildNodeName:@"secId"];
        NSString *serverDateTime = [returnNode getTextContentWithChildNodeName:@"serverDateTime"];
        NSString *tradeDate = [returnNode getTextContentWithChildNodeName:@"tradeDate"];
        NSString *tradeDateTime = [returnNode getTextContentWithChildNodeName:@"tradeDateTime"];
        NSString *tradeTime = [returnNode getTextContentWithChildNodeName:@"tradeTime"];
        
        if (!askPrice) 
        {
            askPrice = @" ";
        }
        if (!bidPrice)
        {
            bidPrice = @" ";
        }
        if (!change)
        {
            change = @" ";
        }
        if (!changePercent)
        {
            changePercent = @" ";
        }
        if (!currency)
        {
            currency = @" ";
        }
        if (!currentPrice)
        {
            currentPrice = @" ";
        }
        if (!dailyHigh) 
        {
            dailyHigh = @" ";
        }
        if (!dailyLow)
        {
            dailyLow = @" ";
        }
        if (!exchangeId) {
            exchangeId = @" ";
        }
        if (!name)
        {
            name = @" ";
        }
        if (!openingPrice)
        {
            openingPrice = @" ";
        }
        if (!previousClosePrice)
        {
            previousClosePrice = @" ";
        }
        if (!ric)
        {
            ric = @" ";
        }
        if (!secId)
        {
            secId = @" ";
        }
        if (!serverDateTime)
        {
            serverDateTime = @" ";
        }
        if (!tradeDate)
        {
            tradeDate = @" ";
        }
        if (!tradeDateTime)
        {
            tradeDateTime = @" ";
        }
        if (!tradeTime)
        {
            tradeTime = @" ";
        }
        
        BoCPressSecurity *security = [[BoCPressSecurity alloc] initWithIdentity:secId 
                                                                           name:name
                                                                      lastValue:nil 
                                                                 lastPercentage:nil 
                                                                       inFamily:nil];
        [security setAskPrice:askPrice];
        [security setBidPrice: bidPrice];
        [security setChange:change];
        [security setChangePercent:changePercent];
        [security setCurrency:currency];
        [security setCurrentPrice: currentPrice];
        [security setDailyHigh:dailyHigh];
        [security setDailyLow:dailyLow];
        [security setExchangeId:exchangeId];
        [security setOpeningPrice:openingPrice];
        [security setPreviousClosePrice:previousClosePrice];
        [security setRic:ric];
        [security setServerDateTime:serverDateTime];
        [security setTradeDate:tradeDate];
        [security setTradeDateTime:tradeDateTime];
        [security setTradeTime:tradeTime];
        
        [_results setObject:security forKey:kType_GLobal_SecurityObject];
        [security release];
        
        [document release];
    }
}

/*
 <return>
 <analyses>MACD</analyses>
 <chartUrl/>
 <height>500</height>
 <interval>1_DAY</interval>
 <points>100</points>
 <ric>.SSEC</ric>
 <secId>3001</secId>
 <type>Line</type>
 <updateDate/>
 <width>400</width>
 </return>
 */
static void parseGetChartResponse(id data, 
                                  NSMutableDictionary *_results,
                                  NSDictionary *callbackInfo)
{
    NSString *xmlFormattedString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    BoCPressChartImageConfiguration *chartImageConfiguration = [[BoCPressChartImageConfiguration alloc] initWithXMLString:xmlFormattedString];
    [_results setObject:chartImageConfiguration forKey:kBoCPress_Global_ChartImageConfigurationObject];
    
    [xmlFormattedString release];
    [chartImageConfiguration release];
    
}

static void parseGetOpinionListResponse(id data, 
                                        NSMutableDictionary *_results,
                                        NSDictionary *callbackInfo)
{
    @autoreleasepool 
    {
        
        XMLDocument *document = [[XMLDocument alloc] initWithData: data];
        
        NSArray *items = [document evaluateXPathExpression: @"//item" withNamespaces: nil];
        
        XMLNode *node = nil;
        
        NSMutableArray *itemIDs = [[NSMutableArray alloc] init];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        // for example: 2011-06-07 11:11:12.0
        //
        [dateFormatter setDateFormat:kNetwork_DateFormatterString]; 
        
        id hasNextFlag = nil;
        
        BoCPressAuthor *authorLooper = nil;
        BoCPressImageView *imageViewLooper = nil;
        NSString *imageURLLooper = nil;
        
        for (node in items) 
        {
            XMLNode * authorNode = [node childWithName:@"author"];
            
            NSString *authorID = [authorNode getTextContentWithChildNodeName:@"id"];
            
            imageURLLooper = [authorNode getTextContentWithChildNodeName:@"avatar"];
            
            imageViewLooper = [[BoCPressImageView alloc] initWithImageURL: [NSURL URLWithString: imageURLLooper] 
                                                                  imageID: authorID];
            
            authorLooper = [[BoCPressAuthor alloc] initWithIdentity: [authorNode getTextContentWithChildNodeName:@"id"]
                                                               name: [authorNode getTextContentWithChildNodeName:@"displayName"]
                                                       authorAvatar: imageViewLooper
                                                  briefIntroduction: [[authorNode getTextContentWithChildNodeName:@"introduction"]xmlTextUnescaped]]; 
            [imageViewLooper release];
            
            BoCPressNews *theNews = [[BoCPressNews alloc] initWithIdentity:  [node getTextContentWithChildNodeName:@"id"]
                                                                      name: [[node getTextContentWithChildNodeName:@"title"] xmlTextUnescaped]
                                                                  postTime: [dateFormatter dateFromString:[node getTextContentWithChildNodeName:@"postDate"]]
                                                           articleAbstract: [[node getTextContentWithChildNodeName:@"excerpt"] xmlTextUnescaped]
                                                            articleContent: [[node getTextContentWithChildNodeName:@"excerpt"] xmlTextUnescaped]
                                                                    author: authorLooper
                                     ] ;
            [authorLooper release];
            
            XMLNode *columnNode = [node childWithName: @"column"];
            BoCPressNewsTagColumn *column = [[BoCPressNewsTagColumn alloc] initWithIdentity: [columnNode getTextContentWithChildNodeName: @"id"]
                                                                                       name: [columnNode getTextContentWithChildNodeName: @"name"]];
            
            [theNews setNewsTag: column];
            [column release];
            
            hasNextFlag = [node getTextContentWithChildNodeName:kSoapXMLParser_HasNextFlag];
            
            [_results setObject:theNews forKey:[theNews identity]];
            
            [itemIDs addObject:[theNews identity]];
            
            [theNews release];
        }
        
        if (hasNextFlag) 
        {
            [_results setObject:hasNextFlag forKey:kSoapXMLParser_HasNextFlag];
        }
        
        [_results setObject:itemIDs forKey:@"itemIDs"];
        
        [_results setObject:kNetwork_GetOpinionListResponse forKey:kNetwork_SoapResponseType];
        
        [dateFormatter release];
        [itemIDs release];
        [document release];
    }
    
}

static void parseGetSubColumnListResponse(id data,
                                          NSMutableDictionary *_results,
                                          NSDictionary *callbackInfo)
{
    id mediaType = [callbackInfo objectForKey:kNetwork_MediaType];
    
    @autoreleasepool 
    {
        XMLDocument *document = [[XMLDocument alloc] initWithData: data];
        
        NSArray *items = [document evaluateXPathExpression: @"//item" withNamespaces: nil];
        
        XMLNode *node = nil;
        
        NSMutableArray *itemIDs = [[NSMutableArray alloc] init];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setDateFormat:kNetwork_DateFormatterString]; 
        
        id hasNextFlag = nil;
                
        for (node in items) 
        {
            NSString *mediaURL = [[node getTextContentWithChildNodeName:@"mediaURL"] trimWhiteSpaces];
            NSString *imageURL = [[node getTextContentWithChildNodeName:@"featureImage"] trimWhiteSpaces];
            
            BoCPressMedia *tmpItem = [[BoCPressMedia alloc] initWithIdentity: [node getTextContentWithChildNodeName:@"id"]         
                                                                        name: [[node getTextContentWithChildNodeName:@"title"] xmlTextUnescaped]
                                                                    postTime: [dateFormatter dateFromString:[node getTextContentWithChildNodeName:@"postDate"]]
                                                                   mediaType: mediaType
                                                        mediaPlayingDuration: [node getTextContentWithChildNodeName:@"duration"]
                                                                mediaContent: mediaURL
                                                           thumbnailImageURL:[NSURL URLWithString:imageURL]
                                      ]; 
            
            hasNextFlag = [node getTextContentWithChildNodeName:kSoapXMLParser_HasNextFlag];
            
            [_results setObject:tmpItem forKey:[(id<NSIdentifiedObject>)tmpItem identity]];
            
            [itemIDs addObject:[(id<NSIdentifiedObject>)tmpItem identity]];
            
            [tmpItem release];
        }
        
        if (hasNextFlag) 
        {
            [_results setObject:hasNextFlag forKey:kSoapXMLParser_HasNextFlag];
        }
        
        
        [_results setObject:itemIDs forKey:@"itemIDs"];
        
        [_results setObject:kNetwork_GetSubColumnPostListResponse forKey:kNetwork_SoapResponseType];
        
        [dateFormatter release];
        [itemIDs release];
        [document release];
    }
}

static void parseFeedBackResponse(id data, 
                                  NSMutableDictionary *_results,
                                  NSDictionary *callbackInfo)
{
    @autoreleasepool 
    {
        XMLDocument *document = [[XMLDocument alloc] initWithData: data];
        
        NSArray *items = [document evaluateXPathExpression: @"//return" withNamespaces: nil];
        
        for (XMLNode *node in items) 
        {
            [_results setObject:[node getTextContentWithChildNodeName:@"avgRating"] forKey:@"avgRating"];
            [_results setObject:[node getTextContentWithChildNodeName:@"postId"] forKey:@"postId"];
            [_results setObject:[node getTextContentWithChildNodeName:@"rateCount"] forKey:@"rateCount"];
            [_results setObject:[node getTextContentWithChildNodeName:kSoapXMLParser_NewsCommentRepeatRatingFlag] forKey:kSoapXMLParser_NewsCommentRepeatRatingFlag];
        }
        
        
        [_results setObject:kNetwork_SetCommentResponse forKey:kNetwork_SoapResponseType];
        
        [document release];
    }
}


static void parseGetBroadcastLivingResponse(id data, 
                                            NSMutableDictionary *_results,
                                            NSDictionary *callbackInfo)
{
    id mediaType = [callbackInfo objectForKey:kNetwork_MediaType];
    
    @autoreleasepool 
    {
        XMLDocument *document = [[XMLDocument alloc] initWithData: data];
        
        NSArray *items = [document evaluateXPathExpression: @"//return" withNamespaces: nil];
        
        XMLNode *node = nil;
        NSMutableArray *itemIDs = [[NSMutableArray alloc] init];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

        // for example: 2011-06-07 11:11:12.0
        [dateFormatter setDateFormat:kNetwork_DateFormatterString]; 
        
        for (node in items) 
        {
            NSString *mediaURL = [[node getTextContentWithChildNodeName:@"mediaURL"] trimWhiteSpaces];
            NSString *imageURL = [[node getTextContentWithChildNodeName:@"featureImage"] trimWhiteSpaces];
            
            BoCPressMedia *tmpItem = [[BoCPressMedia alloc] initWithIdentity: [node getTextContentWithChildNodeName:@"id"]         
                                                                        name: [[node getTextContentWithChildNodeName:@"title"] xmlTextUnescaped]
                                                                    postTime: [dateFormatter dateFromString:[node getTextContentWithChildNodeName:@"postDate"]]
                                                                   mediaType: mediaType
                                                        mediaPlayingDuration: [node getTextContentWithChildNodeName:@"duration"]
                                                                mediaContent: mediaURL
                                                           thumbnailImageURL:[NSURL URLWithString:imageURL]
                                      ]; 
            
            [_results setObject:tmpItem forKey:[(id<NSIdentifiedObject>)tmpItem identity]];
            
            [tmpItem release];
            
            [itemIDs addObject:[(id<NSIdentifiedObject>)tmpItem identity]];
        }
        
        [_results setObject:itemIDs forKey:@"itemIDs"];
        [_results setObject:kNetwork_GetBroadcastLivingResponse forKey:kNetwork_SoapResponseType];
                
        [dateFormatter release];
        [itemIDs release];
        [document release];
        
    }
}

static void parseGetBroadcastForecastResponse(id data, 
                                              NSMutableDictionary *_results,
                                              NSDictionary *callbackInfo)
{
    id mediaType = [callbackInfo objectForKey:kNetwork_MediaType];
    
    @autoreleasepool 
    {
        XMLDocument *document = [[XMLDocument alloc] initWithData: data];
        
        NSArray *items = [document evaluateXPathExpression: @"//item" withNamespaces: nil];
                
        NSMutableArray *itemIDs = [[NSMutableArray alloc] init];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

        // for example: 2011-06-07 11:11:12.0
        [dateFormatter setDateFormat:kNetwork_DateFormatterString]; 
        
        id hasNextFlag = nil;
        
        for (XMLNode *node in items) 
        {
            NSString *mediaURL = [[node getTextContentWithChildNodeName:@"mediaURL"] trimWhiteSpaces];
            NSString *imageURL = [[node getTextContentWithChildNodeName:@"featureImage"] trimWhiteSpaces];
                        
            BoCPressMedia *tmpItem = [[BoCPressMedia alloc] initWithIdentity: [node getTextContentWithChildNodeName:@"id"]         
                                                                        name: [[node getTextContentWithChildNodeName:@"title"] xmlTextUnescaped]
                                                                    postTime: [dateFormatter dateFromString:[node getTextContentWithChildNodeName:@"broadcastStart"]]
                                                                   mediaType: mediaType
                                                        mediaPlayingDuration: [node getTextContentWithChildNodeName:@"duration"]
                                                                mediaContent: mediaURL
                                                           thumbnailImageURL:[NSURL URLWithString:imageURL]
                                      ]; 
            
            hasNextFlag = [node getTextContentWithChildNodeName:kSoapXMLParser_HasNextFlag];
            
            [_results setObject:tmpItem forKey:[(id<NSIdentifiedObject>)tmpItem identity]];
            
            [itemIDs addObject:[(id<NSIdentifiedObject>)tmpItem identity]];
            
            [tmpItem release];
        }
        
        if (hasNextFlag) 
        {
            [_results setObject:hasNextFlag forKey:kSoapXMLParser_HasNextFlag];
        }
        
        [_results setObject:itemIDs forKey:@"itemIDs"];
        [_results setObject:kNetwork_GetBroadcastForecastResponse forKey:kNetwork_SoapResponseType];
        [dateFormatter release];
        [itemIDs release];
        [document release];
    }
}


static void parseGetCommentSummaryResponse(id data,
                                           NSMutableDictionary *_results,
                                           NSDictionary *callbackInfo)
{
    @autoreleasepool 
    {
        XMLDocument *document = [[XMLDocument alloc] initWithData: data];
        
        NSArray *items = [document evaluateXPathExpression: @"//return" withNamespaces: nil];
                
        for (XMLNode *node in items) 
        {
            [_results setObject:[node getTextContentWithChildNodeName:@"avgRating"] forKey:kCommentSummary_PostAverageRateing];
            [_results setObject:[node getTextContentWithChildNodeName:@"rateCount"] forKey:kCommentSummary_PostRateCount];
            [_results setObject:[node getTextContentWithChildNodeName:@"postId"] forKey:kCommentSummary_PostID];
            [_results setObject:[node getTextContentWithChildNodeName:kSoapXMLParser_NewsCommentRepeatRatingFlag] forKey:kSoapXMLParser_NewsCommentRepeatRatingFlag];
        }
        
        [_results setObject:kNetwork_GetCommentSummaryResponse forKey:kNetwork_SoapResponseType];
        
        [document release];
    }
}


static void parseGetHelpInfoResponse(id data, 
                                     NSMutableDictionary *_results,
                                     NSDictionary *callbackInfo)
{
    id columnID = [callbackInfo objectForKey:kBoCPress_Global_ColumnID];
    
    @autoreleasepool 
    {
        XMLDocument *document = [[XMLDocument alloc] initWithData: data];
        
        NSArray *items = [document evaluateXPathExpression: @"//item" withNamespaces: nil];
        
        //the return has only one element
        //
        for (XMLNode *node in items) 
        {
            [_results setObject:[node getTextContentWithChildNodeName:@"content"] forKey:kGetHelpInfoContent];
        }
        
        [_results setObject:columnID forKey:kBoCPress_Global_ColumnID];
        
        [_results setObject:kNetwork_GetHelpInfoResponse forKey:kNetwork_SoapResponseType];
        
        [document release];
    }
}


static void parseSetUserFeedbackResponse(id data, 
                                         NSMutableDictionary *_results,
                                         NSDictionary *callbackInfo)
{
    @autoreleasepool 
    {
        XMLDocument *document = [[XMLDocument alloc] initWithData: data];
        
        NSArray *items = [document evaluateXPathExpression: @"//return" withNamespaces: nil];
        
        //the return has only one element
        //
        XMLNode *node = [items objectAtIndex:0];
        [_results setObject:[node textContent] forKey:kNetwork_SetUserFeedBackReturnContent];
        [_results setObject:kNetwork_SetFeedBackResponse forKey:kNetwork_SoapResponseType];
        
        [document release];
    }
}


static void parseGetConfigurationResponse(id data,
                                          NSMutableDictionary *_results,
                                          NSDictionary *callbackInfo)
{
    @autoreleasepool 
    {
        XMLDocument *document = [[XMLDocument alloc] initWithData:data];
        
        NSArray *items = [document evaluateXPathExpression:@"//return" withNamespaces:nil];
        
        
        XMLNode *returnNode = [items objectAtIndex:0];
        
        NSString *xmlConfigurationFileString = [returnNode textContent];
        
        [_results setObject:xmlConfigurationFileString forKey:kNetwork_XMLConfigurationString];;
        
        [document release];
    }
}

static void parseErrorResponse(id data,
                               NSMutableDictionary * _results,
                               NSDictionary *callbackInfo)
{
    @autoreleasepool 
    {
        XMLDocument *document = [[XMLDocument alloc] initWithData:data];
        
        NSArray *faultInfoNodes = [document evaluateXPathExpression:@"//errMsgCN" withNamespaces:nil];
        
        if ([faultInfoNodes count] > 0)
        {
            XMLNode *faultInfoNode = [faultInfoNodes objectAtIndex:0];
            
            NSString *errorMessageCN = [faultInfoNode textContent];
            if (errorMessageCN)
            {    
                [_results setObject:errorMessageCN forKey:kBoCPress_Global_ServerErrorMessage_CN];
            }
        }
        
        faultInfoNodes = [document evaluateXPathExpression:@"//errMsgEN" withNamespaces:nil];
        
        if ([faultInfoNodes count] > 0)
        {
            
            NSString *errorMessageEN = [[faultInfoNodes objectAtIndex:0] textContent];        
            
            if (errorMessageEN)    
            {
                [_results setObject:errorMessageEN forKey:kBoCPress_Global_ServerErrorMessage_EN]; 
            }
        }    
        
        faultInfoNodes = [document evaluateXPathExpression:@"//errCode" withNamespaces:nil];
        
        if ([faultInfoNodes count] > 0)
        {
            
            NSString *errCode = [[faultInfoNodes objectAtIndex:0] textContent];        
            
            if (errCode)    
            {
                [_results setObject:errCode forKey:kBoCPress_Global_ServerErrorCode]; 
            }
        }    
        
        [_results setObject:[NSNumber numberWithBool:NO] forKey:kBoCPress_Global_ResponseStatus];    
        
        [document release];
    }
    
}

/*
 <return><email>tear0ofphoenix@gmail.com</email>
 <extraInfo></extraInfo>
 <id>39</id>
 <pass>c3dd897273d94b122f5c600ffd613a30</pass>
 <registerDate>2011-10-27 16:55:46</registerDate>
 <status>0</status>
 
 <userMeta>
 
 <entry>
 <key>PAY_END_DATE</key><value>2012-06-26 16:55:46</value>
 </entry>
 
 <entry>
 <key>FREE_DAYS_ON_REGISTRATION</key><value>7</value>
 </entry>
 </userMeta>
 </return>
 */
static void parseUserInfoResponse(id data,
                                  NSMutableDictionary *_results,
                                  NSDictionary *callbackInfo)
{
    //TODO
    @autoreleasepool 
    {
        XMLDocument *document = [[XMLDocument alloc] initWithData:data];
        
        NSArray *items = [document evaluateXPathExpression:@"//return" withNamespaces:nil];
        
        if ([items count] > 0)
        {
            
            XMLNode *returnNode = [items objectAtIndex:0];
            
            NSString *userID = [returnNode getTextContentWithChildNodeName:@"id"];
            if (userID)
            {            
                [_results setObject:userID forKey:kBoCPress_Global_ObjectID];
            }
            
            NSString *userEmail = [returnNode getTextContentWithChildNodeName:@"email"];
            if (userEmail)
            {            
                [_results setObject:userEmail forKey:@"email"];
            }
            NSString *extraInfo = [returnNode getTextContentWithChildNodeName:@"extraInfo"];
            if (extraInfo)
            {
                [_results setObject:extraInfo forKey:@"extraInfo"];
            }
            NSString *registerDate = [returnNode getTextContentWithChildNodeName:@"registerDate"];
            if (registerDate) 
            {
                [_results setObject:registerDate forKey:@"registerDate"];
            }
            NSString *status = [returnNode getTextContentWithChildNodeName:@"status"];
            if (status)
            {
                [_results setObject:status forKey:@"status"];
            }
            NSString *password = [returnNode getTextContentWithChildNodeName:@"pass"];
            if (password)
            {
                [_results setObject:password forKey:@"password"];
            }
            NSString *payExpired = [returnNode getTextContentWithChildNodeName:@"payExpired"];
            if (payExpired)
            {
                [_results setObject: payExpired forKey: @"payExpired"];
            }
            
            XMLNode *userMeta = [returnNode childWithName:@"userMeta"];
            XMLNode *entryLooper = [userMeta firstChild];
            
            while (entryLooper) 
            {
                NSString *key = [entryLooper getTextContentWithChildNodeName:@"key"];
                NSString *value = [entryLooper getTextContentWithChildNodeName:@"value"];
                [_results setObject:value forKey:key];
                
                entryLooper = [entryLooper nextSibling];
            }
            
            [_results setObject:[NSNumber numberWithBool:YES] forKey:kBoCPress_Global_ResponseStatus];
        }
        
        [document release];
    }
}

static void parseNormalAccountRegisterResponse(id data, 
                                               NSMutableDictionary * _results,
                                               NSDictionary *callbackInfo)
{
    parseUserInfoResponse(data, _results, callbackInfo);
}
static void parseUserLoginResponse(id data, 
                                   NSMutableDictionary *_results,
                                   NSDictionary *callbackInfo)
{
    parseUserInfoResponse(data, _results, callbackInfo);
}

static void parseUserLogoutResponse(id data, 
                                    NSMutableDictionary *_results,
                                    NSDictionary *callbackInfo)
{
    
    @autoreleasepool 
    {
        XMLDocument *document = [[XMLDocument alloc] initWithData:data];
        
        NSArray *items = [document evaluateXPathExpression:@"//return" withNamespaces:nil];
        
        if ([items count] > 0)
        {
            
            XMLNode *returnNode = [items objectAtIndex:0];
            
            [_results setObject:[returnNode textContent] forKey:kBoCPress_Global_ResponseStatus];
        }
        
        [document release];
    }
}

static void parseFindUserPasswordResponse(id data, 
                                          NSMutableDictionary *_results,
                                          NSDictionary *callbackInfo)
{
    @autoreleasepool 
    {
        XMLDocument *document = [[XMLDocument alloc] initWithData:data];
        
        NSArray *items = [document evaluateXPathExpression:@"//return" withNamespaces:nil];
        
        if ([items count] > 0)
        {
            
            XMLNode *returnNode = [items objectAtIndex:0];
            
            [_results setObject:[returnNode textContent] forKey:kBoCPress_Global_ResponseStatus];
        }
        
        [document release];
    }
}

static void parseChangeUserPasswordResponse(id data, 
                                            NSMutableDictionary *_results,
                                            NSDictionary *callbackInfo)
{
    @autoreleasepool 
    {
        XMLDocument *document = [[XMLDocument alloc] initWithData:data];
        
        NSArray *items = [document evaluateXPathExpression:@"//return" withNamespaces:nil];
        
        if ([items count] > 0)
        {
            
            XMLNode *returnNode = [items objectAtIndex:0];
            
            [_results setObject:[returnNode textContent] forKey:kBoCPress_Global_ResponseStatus];
        }
        
        [document release];
    }
}

static void parseActivateCodeResponse(id data, 
                                      NSMutableDictionary *_results,
                                      NSDictionary *callbackInfo)
{
    parseUserInfoResponse(data, _results, callbackInfo);
}

static void parseGetAdvertisementResponse(id data,
                                          NSMutableDictionary *_results,
                                          NSDictionary *callbackInfo)
{
    @autoreleasepool 
    {
        
        XMLDocument *document = [[XMLDocument alloc] initWithData: data];
        
        
        NSArray *items = [document evaluateXPathExpression: @"//item" withNamespaces: nil];
        
        if ([items count] == 0)
        {
            [document release];
            return;
        }
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ;
        // for example: 2011-06-07 11:11:12.0
        [dateFormatter setDateFormat:kNetwork_DateFormatterString]; 
        
        XMLNode *adNode = [items objectAtIndex: 0];
        
        XMLNode *authorNode = [adNode childWithName:@"author"];
        
        
        NSString *authorID = [authorNode getTextContentWithChildNodeName:@"id"];
        
        NSString *imageURLLooper = [authorNode getTextContentWithChildNodeName:@"avatar"];
        
        BoCPressImageView *imageViewLooper = [[BoCPressImageView alloc] initWithImageURL: [NSURL URLWithString:imageURLLooper] 
                                                                                 imageID: authorID] ;
        
        BoCPressAuthor *authorLooper = [[BoCPressAuthor alloc] initWithIdentity:[authorNode getTextContentWithChildNodeName:@"id"] 
                                                                           name:[authorNode getTextContentWithChildNodeName:@"name"] 
                                                                   authorAvatar: imageViewLooper
                                                              briefIntroduction:[[authorNode getTextContentWithChildNodeName:@"introduction"] xmlTextUnescaped]] ;
        
        [imageViewLooper release];
        
        BoCPressNews *tmpItem = [[BoCPressNews alloc] initWithIdentity: [adNode getTextContentWithChildNodeName:@"id"] 
                                                                  name: [[adNode getTextContentWithChildNodeName:@"title"] xmlTextUnescaped]
                                                              postTime: [dateFormatter dateFromString:[adNode getTextContentWithChildNodeName:@"postDate"]]
                                                       articleAbstract: [[adNode getTextContentWithChildNodeName:@"content"] xmlTextUnescaped]
                                                        articleContent: [[adNode getTextContentWithChildNodeName:@"content"] xmlTextUnescaped]
                                                                author: authorLooper
                                 ];
        
        XMLNode *columnNode = [adNode childWithName: @"column"];
        BoCPressNewsTagColumn *column = [[BoCPressNewsTagColumn alloc] initWithIdentity: [columnNode getTextContentWithChildNodeName: @"id"]
                                                                                   name: [columnNode getTextContentWithChildNodeName: @"name"]];
        
        [tmpItem setNewsTag: column];
        [column release];
        
        [_results setObject: tmpItem
                     forKey: @"ads"];
        
        [authorLooper release];
        
        [tmpItem release];
        
        [dateFormatter release];
        
        NSString *advertisementViewFlag = nil;
        NSString *excerptContent = [[adNode childWithName: @"excerpt"] textContent];
        if ([excerptContent rangeOfString: @"INTERNAL"].location != NSNotFound)
        {
            advertisementViewFlag = @"INTERNAL";
        }else 
        {
            advertisementViewFlag = @"EXTERNAL";
        }
        
        [_results setObject: advertisementViewFlag 
                     forKey: @"advertisementViewFlag"];
        
        [_results setObject: kNetwork_getAds
                     forKey: kNetwork_SoapResponseType];
        
        [document release];
        
    }
}

static void parseGetProductResponse(id data,
                                    NSMutableDictionary *_result,
                                    NSDictionary *callbackInfo)
{
    @autoreleasepool 
    {
        XMLDocument *document = [[XMLDocument alloc] initWithData:data];
        NSArray *productNodes = [document evaluateXPathExpression:@"//item" withNamespaces:nil];
        NSMutableArray *products = [[NSMutableArray alloc] initWithCapacity:[productNodes count]];
        
        NSString *hasNextFlag = nil;
        
        for (XMLNode *productNodeLooper in productNodes) 
        {
            BoCPressProduct *productLooper = [[BoCPressProduct alloc] init];
            
            [productLooper setProductFamily:[productNodeLooper getTextContentWithChildNodeName:@"feeBelongsProd"]];
            [productLooper setProductIdentifier:[productNodeLooper getTextContentWithChildNodeName:@"feeCode"]];
            [productLooper setProductDescription:[productNodeLooper getTextContentWithChildNodeName:@"feeDesc"]];
            [productLooper setStoreName:[productNodeLooper getTextContentWithChildNodeName:@"feeFor"]];
            [productLooper setIdentity:[productNodeLooper getTextContentWithChildNodeName:@"feeId"]];
            [productLooper setName:[productNodeLooper getTextContentWithChildNodeName:@"feeName"]];
            [productLooper setLocalizedPrice:[productNodeLooper getTextContentWithChildNodeName:@"feeRate"]];
            [productLooper setCurrencyName:[productNodeLooper getTextContentWithChildNodeName:@"feeUnit"]];
            
            hasNextFlag = [productNodeLooper getTextContentWithChildNodeName:@"hasNext"];
            
            [products addObject:productLooper];
            [productLooper release];
        }
        
        if (hasNextFlag)
        {
            [_result setObject:hasNextFlag forKey:kSoapXMLParser_HasNextFlag];
        }
        
        [_result setObject:products forKey:kType_Global_NSArray];
        
        [products release];
        
        [document release];
    }
}

static void parseVerifyReceiptResponse(id data, 
                                       NSMutableDictionary *_results,
                                       NSDictionary *callbackInfo)
{
    @autoreleasepool 
    {
        XMLDocument *document = [[XMLDocument alloc] initWithData:data];
        NSArray *items = [document evaluateXPathExpression:@"//return" withNamespaces:nil];
        
        if ([items count] > 0)
        {
            
            XMLNode *returnNode = [items objectAtIndex:0];
            
            [_results setObject:[returnNode textContent] forKey:kBoCPress_Global_ResponseStatus];
        }    
        
        [document release];
    }
}

static void parseCreatePurchaseOrderResponse(id data, 
                                             NSMutableDictionary *_results,
                                             NSDictionary *callbackInfo)
{
    @autoreleasepool 
    {
        XMLDocument *document = [[XMLDocument alloc] initWithData:data];
        NSArray *items = [document evaluateXPathExpression:@"//return" withNamespaces:nil];
        
        if ([items count] > 0)
        {
            
            XMLNode *returnNode = [items objectAtIndex:0];
            
            NSString *orderCode = [returnNode getTextContentWithChildNodeName:@"orderCode"];
            if (orderCode)
            {
                [_results setObject:orderCode forKey:kPurchaseManager_OrderCode];
            }
        }    
        
        [document release];
    }
}
//<return>
//<extraInfo/>
//<id>0</id>
//<logDateTime/>
//<orderCode>FAKE-ORDER-CODE</orderCode>
//<prodCode>FAKE-PROD-CODE</prodCode>
//<prodQuantity>-1</prodQuantity>
//<receipt/>
//<status>0</status>
//<userId>0</userId>
//</return>
static void parseRequestPurchaseResponse(id data, 
                                         NSMutableDictionary *_results,
                                         NSDictionary *callbackInfo)
{
    @autoreleasepool 
    {
        XMLDocument *document = [[XMLDocument alloc] initWithData:data];
        NSArray *items = [document evaluateXPathExpression:@"//return" withNamespaces:nil];
        
        if ([items count] > 0)
        {
            
            XMLNode *returnNode = [items objectAtIndex:0];
            
            NSString *orderCode = [returnNode getTextContentWithChildNodeName:@"orderCode"];
            if (orderCode)
            {
                [_results setObject:orderCode forKey:kPurchaseManager_OrderCode];
            }
            
            NSString *productionCode = [returnNode getTextContentWithChildNodeName:@"prodCode"];
            if (productionCode)
            {
                [_results setObject:productionCode forKey:kBuyCard_productCode];
            }
            
            NSString *status = [returnNode getTextContentWithChildNodeName:@"status"];
            if (status)
            {
                [_results setObject:status forKey:@"status"];
            }
        }    
        
        [document release];
    }
    
}
static void parseGetProtocolContentResponse(id data, 
                                            NSMutableDictionary *_results,
                                            NSDictionary *callbackInfo)

{
    @autoreleasepool 
    {
        XMLDocument *document = [[XMLDocument alloc] initWithData:data];
        NSArray *items = [document evaluateXPathExpression:@"//return" withNamespaces:nil];
        
        if ([items count] > 0)
        {
            
            XMLNode *returnNode = [items objectAtIndex:0];
            
            NSString *protocolContent = [returnNode textContent];
            if (protocolContent)
            {
                [_results setObject:protocolContent forKey:kGlobal_ProtocolContent];
            }
            
        }    
        
        [document release];
    }
}

static void parseGetRelatedOpinionsInQuoteContentResponse(id data, 
                                                          NSMutableDictionary *_results,
                                                          NSDictionary *callbackInfo)
{
    parseGetOpinionListResponse(data, _results, callbackInfo);
}

static void parseGetRelatedNewsInQuoteContentResponse(id data, 
                                                      NSMutableDictionary *_results,
                                                      NSDictionary *callbackInfo)
{
    parse_listOrderedNewsWithTag_(data, _results);
}

static void parseGetSplashAdvertisementResponse(id data,
                                                NSMutableDictionary *_results,
                                                NSDictionary *callbackInfo)
{
    parseGetAdvertisementResponse(data, _results, callbackInfo);
}

static void parseGetRemoteNotificationConfigurationResponse(id data, 
                                                            NSMutableDictionary *_results,
                                                            NSDictionary *callbackInfo)
{
    @autoreleasepool 
    {
        XMLDocument *document = [[XMLDocument alloc] initWithData: data];
        NSArray *returnNodes = [document evaluateXPathExpression: @"//return"
                                                  withNamespaces: nil];
        if ([returnNodes count] > 0)
        {
            XMLNode *node = [returnNodes objectAtIndex: 0];
            
            NSString* configSetting = [NSString stringWithFormat: @"<document>%@</document>", [node textContent]];
            XMLDocument *configDocument = [[XMLDocument alloc] initWithData: [configSetting dataUsingEncoding: NSUTF8StringEncoding]];
            returnNodes = [configDocument evaluateXPathExpression: @"//news"
                                                   withNamespaces: nil];
            if ([returnNodes count] > 0)
            {                
                node = [returnNodes objectAtIndex: 0];
                NSMutableDictionary *configuration = [[NSMutableDictionary alloc] init];
                NSMutableArray *orderdNames = [[NSMutableArray alloc] init];
                NSMutableArray *_configs = nil;
                while (node)
                {
                    _configs = [[NSMutableArray alloc] init];
                    
                    XMLNode *configLooper = [node firstChild];
                    while (configLooper)
                    {
                        NSString *elementName = [configLooper elementName];
                        NSString *identityLooper = [elementName stringByReplacingOccurrencesOfString: kBoCPressSoap_RemoteNotificationConfiguration_TagPrefix
                                                                                          withString: @""];
                        id<BoCPressEntry> entryLooper = [[BoCPressEntry alloc] initWithName: elementName
                                                                               internalName: identityLooper
                                                                                   identity: identityLooper];
                        [entryLooper setIsChosen: [[configLooper textContent] boolValue]];
                        
                        [_configs addObject: entryLooper];
                        [entryLooper release];
                        
                        configLooper = [configLooper nextSibling];
                    }
                    
                    [orderdNames addObject: [node elementName]];
                    [configuration setObject: _configs
                                      forKey: [node elementName]];
                    [_configs release];
                    node = [node nextSibling];
                }
                [configuration setObject: orderdNames
                                  forKey: kType_Global_NSArray];
                [orderdNames release];
                
                [_results setObject: configuration
                             forKey: kBoCPressSoap_RemoteNotificationConfigurationFromServer];
                [configuration release];
            }
            
            [configDocument release];
        }
        
        [document release];
    }
}

static void parseSetPushConfigResponse(id data, 
                                       NSMutableDictionary *_results,
                                       NSDictionary *callbackInfo)
{
    @autoreleasepool 
    {
        XMLDocument *document = [[XMLDocument alloc] initWithData:data];
        NSArray *items = [document evaluateXPathExpression:@"//return" withNamespaces:nil];
        
        if ([items count] > 0)
        {
            
            XMLNode *returnNode = [items objectAtIndex:0];
            
            [_results setObject:[returnNode textContent] forKey:kBoCPress_Global_ResponseStatus];
        }    
        
        [document release];
    }
}

static void parseGetPushNotificationResponse(id data, 
                                             NSMutableDictionary *_results,
                                             NSDictionary *callbackInfo)
{
    parseCriticPostResult(data, _results);
}

static void parseSetPushBadgeResponse(id data,
                                      NSMutableDictionary *_results,
                                      NSDictionary *callbackInfo)
{
    
}

static void parseGetRemoteNotificationListResponse(id data,
                                                   NSMutableDictionary *_results,
                                                   NSDictionary *callbackInfo)
{
    //    <?xml version='1.0' encoding='UTF-8'?>
    //    <S:Envelope xmlns:S="http://schemas.xmlsoap.org/soap/envelope/"><S:Body>
    //    <ns2:getPushNotificationListResponse xmlns:ns2="http://ws.boc.eintsoft.com/">
    //    <return>
    //    <item>
    //    <id>12</id>
    //    <msgActionExtra>17176</msgActionExtra>
    //    <msgActionType>post</msgActionType>
    //    <msgContent></msgContent>
    //    <msgTitle>日本将协助缅甸组建证交所--消息</msgTitle>
    //    <plannedSendDateTime>2012-04-11 10:25:45</plannedSendDateTime>
    //    <pushType>USER</pushType>
    //    <status>DONE</status>
    //    <statusLastUpdate>2012-04-11 10:27:54</statusLastUpdate>
    //    <targetDeviceVersion>["all"]</targetDeviceVersion>
    //    <targetSoftVersion>["all"]</targetSoftVersion>
    //    <targetUserEmail></targetUserEmail>
    //    <targetUserType>["all"]</targetUserType>
    //    </item>
    
    @autoreleasepool 
    {
        XMLDocument *document = [[XMLDocument alloc] initWithData: data] ;
        
        NSArray *items = [document evaluateXPathExpression: @"//item" withNamespaces: nil];
        
        NSMutableArray *itemIDs = [[NSMutableArray alloc] init] ;
        for (XMLNode *itemNodeLooper in items) 
        {
            NSString *identityLooper = [itemNodeLooper getTextContentWithChildNodeName: @"id"];
            [itemIDs addObject: identityLooper];
            
            id<BoCPressServerPushNotification> notificationLooper = [[BoCPressServerPushNotification alloc] init];
            [notificationLooper setIdentity: identityLooper];
            [notificationLooper setActionArgument: [itemNodeLooper getTextContentWithChildNodeName: @"msgActionExtra"]];
            [notificationLooper setAction: [itemNodeLooper getTextContentWithChildNodeName: @"msgActionType"]];
            [notificationLooper setMessageContent: [itemNodeLooper getTextContentWithChildNodeName: @"msgContent"]];
            [notificationLooper setMessageTitle: [itemNodeLooper getTextContentWithChildNodeName: @"msgTitle"]];
            [notificationLooper setPlannedSendDateTime: [itemNodeLooper getTextContentWithChildNodeName: @"plannedSendDateTime"]];
            [notificationLooper setPushType: [itemNodeLooper getTextContentWithChildNodeName: @"pushType"]];
            [notificationLooper setStatus: [itemNodeLooper getTextContentWithChildNodeName: @"status"]];
            [notificationLooper setStatusLastUpdate: [itemNodeLooper getTextContentWithChildNodeName: @"statusLastUpdate"]];
            [notificationLooper setTargetDeviceVersion: [itemNodeLooper getTextContentWithChildNodeName: @"targetDeviceVersion"]];
            [notificationLooper setTargetSoftVersion: [itemNodeLooper getTextContentWithChildNodeName: @"targetSoftVersion"]];
            [notificationLooper setTargetUserEmail: [itemNodeLooper getTextContentWithChildNodeName: @"targetUserEmail"]];
            [notificationLooper setTargetUserType: [itemNodeLooper getTextContentWithChildNodeName: @"targetUserType"]];
            
            [_results setObject: notificationLooper
                         forKey: identityLooper];
            [notificationLooper release];
        }
        
        [_results setObject: itemIDs
                     forKey: @"itemIDs"];
        
        [itemIDs release];
        [document release];
    }
    
}


static void BoCPressSoapXMLParser_initSupportedSoapMethods(NSMutableDictionary **_supportedSoapMethods)
{
    *_supportedSoapMethods = [[NSMutableDictionary alloc] initWithObjectsAndKeys: 
                              storeCFunctionInNSValue(parseGetPostResponse),  kNetwork_GetPostResponse,
                              storeCFunctionInNSValue(parseGetPostListResponse), kNetwork_GetPostListResponse,
                              storeCFunctionInNSValue(parseGetQuoteListResponse), kNetwork_GetQuoteListResponse,
                              storeCFunctionInNSValue(parseGetOpinionListResponse), kNetwork_GetOpinionListResponse,
                              storeCFunctionInNSValue(parseGetAuthorListResponse), kNetwork_GetAuthorListResponse,
                              storeCFunctionInNSValue(parseGetSubColumnListResponse), kNetwork_GetSubColumnPostListResponse,
                              storeCFunctionInNSValue(parseFeedBackResponse), kNetwork_SetCommentResponse,
                              storeCFunctionInNSValue(parseGetBroadcastLivingResponse), kNetwork_GetBroadcastLivingResponse,
                              storeCFunctionInNSValue(parseGetBroadcastForecastResponse), kNetwork_GetBroadcastForecastResponse,
                              storeCFunctionInNSValue(parseGetCommentSummaryResponse), kNetwork_GetCommentSummaryResponse,
                              storeCFunctionInNSValue(parseGetHelpInfoResponse), kNetwork_GetHelpInfoResponse,
                              storeCFunctionInNSValue(parseGetAuthorResponse), kNetwork_GetAuthorResponse, 
                              storeCFunctionInNSValue(parseSetUserFeedbackResponse), kNetwork_SetFeedBackResponse,
                              storeCFunctionInNSValue(parseGetConfigurationResponse), kNetwork_getConfigurationResponse,
                              storeCFunctionInNSValue(parseNormalAccountRegisterResponse), kNetwork_NormalAccountRegisterResponse,
                              storeCFunctionInNSValue(parseErrorResponse), kNetwork_ErrorResponse,
                              storeCFunctionInNSValue(parseUserLoginResponse), kNetwork_userLoginResponse,
                              storeCFunctionInNSValue(parseUserLogoutResponse), kNetwork_userLogoutResponse,
                              storeCFunctionInNSValue(parseFindUserPasswordResponse), kNetwork_FindUserPasswordResponse,
                              storeCFunctionInNSValue(parseActivateCodeResponse), kNetwork_ActivateCodeResponse,
                              storeCFunctionInNSValue(parseChangeUserPasswordResponse), kNetwork_ChangeUserPasswordResponse,
                              storeCFunctionInNSValue(parseGetQuoteDetailResponse), kNetwork_getQuoteDetailResponse,
                              storeCFunctionInNSValue(parseGetChartResponse), kNetwork_getChartResponse,    
                              storeCFunctionInNSValue(parseGetProductResponse), kNetwork_getFeeScheduleResponse,
                              storeCFunctionInNSValue(parseVerifyReceiptResponse), kNetwork_verifyReceiptResponse,
                              storeCFunctionInNSValue(parseUserInfoResponse), kNetwork_getUserInfoResponse,
                              storeCFunctionInNSValue(parseCreatePurchaseOrderResponse), kNetwork_createPurchaseOrderResponse,
                              storeCFunctionInNSValue(parseRequestPurchaseResponse), kNetwork_requestPurchaseResponse,
                              storeCFunctionInNSValue(parseGetProtocolContentResponse), kNetwork_getPromptMsgResponse,
                              storeCFunctionInNSValue(parseGetRelatedOpinionsInQuoteContentResponse), kNetwork_getQuoteRelatedOpinionsListResponse,
                              storeCFunctionInNSValue(parseGetRelatedNewsInQuoteContentResponse), kNetwork_getQuoteRelatedNewsListResponse,
                              storeCFunctionInNSValue(parseGetAdvertisementResponse), kNetwork_getAdsResponse,
                              storeCFunctionInNSValue(parseGetSplashAdvertisementResponse), kNetwork_getSplashAdsResponse,   
                              storeCFunctionInNSValue(parseGetRemoteNotificationConfigurationResponse), kNetwork_getPushConfigResponse,
                              storeCFunctionInNSValue(parseGetPushNotificationResponse), kNetwork_getPushNotificationResponse,
                              storeCFunctionInNSValue(parseSetPushBadgeResponse), kNetwork_setPushBadgeResponse,
                              storeCFunctionInNSValue(parseSetPushConfigResponse), kNetwork_setPushConfigResponse,
                              storeCFunctionInNSValue(parseGetRemoteNotificationListResponse), kNetwork_getPushNotificationListResponse,
                              nil];
}


@implementation BoCPressSoapXMLParser

- (id)init
{
    self = [super init];
    if (self) 
    {
        _results = [[NSMutableDictionary alloc] init];        
        BoCPressSoapXMLParser_initSupportedSoapMethods(&_supportedSoapMethods);
    }
    
    return self;
}

- (void)dealloc
{
    [_results release];
    [_supportedSoapMethods release];
    
    [super dealloc];
}

#pragma mark - Parse XML

@synthesize delegate = _delegate;

- (void)setDelegate:(id<BoCPressSoapXMLParserDelegate>)delegate
{
    if (_delegate != delegate)
    {
        _delegate = delegate;
        _delegateFlag.delegateRespondsFinishedParseWithResult = [_delegate respondsToSelector: @selector(soapXMLParser:finishedParseWithResult:)];
    }
}
- (void)parseData: (id)data withCallBackInfo:(id)callbackInfo
{
    //    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    NSString *responseType = getResponseType(data);
    
    [_results removeAllObjects];
    
    BoCPressSoapXMLParser_ParserFunctionType pFunction = (BoCPressSoapXMLParser_ParserFunctionType)[[_supportedSoapMethods objectForKey:responseType] pointerValue];
    
    if (pFunction)
    {
        pFunction(data, _results, callbackInfo);
        
        
        [_results setObject: responseType 
                     forKey: kNetwork_SoapResponseType];
        
        if (_delegateFlag.delegateRespondsFinishedParseWithResult)
        {
            NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:
                                  _results, kNetworkManager_responsedData,
                                  callbackInfo, kNetwork_CallbackObject,
                                  nil];
            [_delegate soapXMLParser: self finishedParseWithResult: info];
            
        }
    }    
}

@end
