#import <Foundation/Foundation.h>

#import "ESObjectSystem.h"

@protocol BoCPressSecurityFamily <NSCopying, NSIdentifiedObject, NSNamedObject>

- (BOOL) isChargeColumn;

- (BOOL) currentChargeFlag;

@end

@interface BoCPressSecurityFamily: NSObject<BoCPressSecurityFamily> 
{

@private
    id _identity;
    NSString *_name;
    
    NSMutableDictionary *_securityFamilyConfiguration;
    
    BOOL _isChargeColumn;
    BOOL _currentChargeFlag;
}

- (id)initWithIdentity: (id)identity
                  name: (NSString *)name
            chargeFlag: (BOOL)chargeFlag
     currentChargeFlag: (BOOL)currentChargeFlag;

- (void)storeConfiguration: (id)value forKey: (id)key;

- (id)queryConfigurationWithKey: (id)key;
@end
