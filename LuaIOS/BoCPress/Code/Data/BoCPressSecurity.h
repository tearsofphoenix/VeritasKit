#import <Foundation/Foundation.h>

#import "NSIdentifiedObject.h"

#import "NSNamedObject.h"

@protocol BoCPressSecurityFamily;

@protocol BoCPressSecurity <NSIdentifiedObject, NSNamedObject>

#pragma mark - Security parameters

@required

- (NSSet *)securityFamilies;

- (NSString*) lastValue;

- (NSString*) lastPercentage;

- (NSArray *)entries;

- (NSString *)isTradebleFlag;

#pragma mark - Quotes

@end

@interface BoCPressSecurity: NSObject<BoCPressSecurity>
{
    
@private
    NSSet *_families;

    NSString* _lastValue;
    NSString* _lastPercentage;
    id _identity;
    NSString *_name;
    
}

@property (nonatomic, retain) NSArray *entries;
@property (nonatomic, retain) NSString *askPrice;
@property (nonatomic, retain) NSString *bidPrice;
@property (nonatomic, retain) NSString *change;
@property (nonatomic, retain) NSString *changePercent;
@property (nonatomic, retain) NSString *currency;
@property (nonatomic, retain) NSString *currentPrice;
@property (nonatomic, retain) NSString *dailyHigh;
@property (nonatomic, retain) NSString *dailyLow;
@property (nonatomic, retain) NSString *exchangeId;
@property (nonatomic, retain) NSString *openingPrice;
@property (nonatomic, retain) NSString *previousClosePrice;
@property (nonatomic, retain) NSString *ric;
@property (nonatomic, retain) NSString *secId;
@property (nonatomic, retain) NSString *serverDateTime;
@property (nonatomic, retain) NSString *tradeDate;
@property (nonatomic, retain) NSString *tradeDateTime;
@property (nonatomic, retain) NSString *tradeTime;
@property (nonatomic, retain) NSString *isTradebleFlag;
           

- (id)initWithIdentity: (id)identity
                  name: (NSString *)name
             lastValue: (NSString*)lastValue
           lastPercentage: (NSString*)lastPercentage
              inFamily: (id<BoCPressSecurityFamily>)family;



@end
