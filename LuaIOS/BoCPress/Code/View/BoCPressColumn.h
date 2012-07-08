#import <Foundation/Foundation.h>

#import "NSIdentifiedObject.h"

#import "NSNamedObject.h"

@protocol BoCPressColumn<NSIdentifiedObject, NSNamedObject, NSCopying>

- (BOOL)couldBeSelected;

- (CGFloat)columnWidth;

- (BOOL)isChargeColumn;

- (BOOL)currentChargeFlag;

- (NSUInteger)fetchSize;
- (NSUInteger)fetchMoreSize;

@optional

- (void)addSubColumn: (id<BoCPressColumn>)subColumn;

- (void)storeConfiguration: (id)value forKey: (id)key;

- (id)queryConfigurationWithKey: (id)key;

@end

@interface BoCPressColumn: NSObject<BoCPressColumn> 
{
    BOOL _couldBeSelected;
    CGFloat _columnWidth;
    id _identity;
    NSString *_name;
    
    NSMutableArray* _subColumns;
    
    NSMutableDictionary *_columnConfiguration;
    
    BOOL _isChargeColumn;
    BOOL _currentChargeFlag;
}

- (id)initWithIdentity: (id)identity 
                  name: (NSString *)name
       couldBeSelected: (BOOL)couldBeSelected 
           columnWidth: (CGFloat)columnWidth
            chargeFlag: (BOOL)chargeFlag
     currentChargeFlag: (BOOL) currentChargeFlag;

@end
