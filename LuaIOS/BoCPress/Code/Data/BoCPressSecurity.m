#import "BoCPressSecurity.h"

#import "BoCPressEntry.h"

@implementation BoCPressSecurity

@synthesize entries = _entries;
@synthesize askPrice = _askPrice;
@synthesize bidPrice = _bidPrice;
@synthesize change = _change;
@synthesize changePercent = _changePercent;
@synthesize currency = _currency;
@synthesize currentPrice = _currentPrice;
@synthesize dailyHigh = _dailyHigh;
@synthesize dailyLow = _dailyLow;
@synthesize exchangeId = _exchangeId;
@synthesize openingPrice = _openingPrice;
@synthesize previousClosePrice = _previousClosePrice;
@synthesize ric = _ric;
@synthesize secId = _secId;
@synthesize serverDateTime = _serverDateTime;
@synthesize tradeDate = _tradeDate;
@synthesize tradeDateTime = _tradeDateTime;
@synthesize tradeTime = _tradeTime;
@synthesize isTradebleFlag = _isTradebleFlag;

- (id)initWithIdentity: (id)identity
                  name: (NSString *)name
             lastValue: (NSString*)lastValue
        lastPercentage: (NSString*)lastPercentage
              inFamily: (id<BoCPressSecurityFamily>)family;

{
    
    self = [super init];
    if (self)
    {
        
        _identity = [identity retain];
        _name = [name retain];
        _lastValue = [lastValue retain];
        _lastPercentage = [lastPercentage retain];
        _families = [[NSSet alloc] initWithObjects: family, nil];
        
        //TODO
        //
        NSMutableArray *entries = [[NSMutableArray alloc] init];
        BoCPressEntry *iLooper = nil;
        iLooper = [[BoCPressEntry alloc] initWithName:@"1分钟" internalName:@"1_MINUTE" identity:@"1"];
                   
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
        
        _entries = [[NSArray alloc] initWithArray:entries];
        
        [entries release];
    }
    
    return self;
    
}

- (void)dealloc
{
    [_identity release];
    [_name release];
    
    [_lastValue release];
    [_lastPercentage release];
    [_families release];
    
    [_entries release];
    
    [_askPrice release];
    [_bidPrice release];
    [_change release];
    [_changePercent release];
    [_currency release];
    [_currentPrice release];
    [_dailyHigh release];
    [_dailyLow release];
    [_exchangeId release];
    [_openingPrice release];
    [_previousClosePrice release];
    [_ric release];
    [_secId release];
    [ _serverDateTime release];
    [_tradeDate release];
    [_tradeDateTime release];
    [_tradeTime release];
    [_isTradebleFlag release];
    
    [super dealloc];
    
}

- (id)identity
{
    return _identity;
}

- (NSString *)name
{
    return _name;
}

- (NSString*) lastValue
{
    return _lastValue;
}

- (NSString*) lastPercentage
{
    return _lastPercentage;
}

- (NSSet *)securityFamilies
{
    return _families;
}

- (BOOL)isEqual:(id)object
{
    if ([object conformsToProtocol: @protocol(BoCPressSecurity)])
    {
        return [[self identity] isEqual: [(id<BoCPressSecurity>)object identity]];
    }else
    {
        return NO;
    }
}

@end
