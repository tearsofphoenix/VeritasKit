#import <Foundation/Foundation.h>

#import "ESObjectSystem.h"

@protocol BoCPressMediaTagColumn;

@protocol BoCPressMediaType<NSIdentifiedObject, NSNamedObject, NSCoding>

- (BOOL)isChargeColumn;

- (BOOL)currentChargeFlag;

@end

@interface BoCPressMediaType: NSObject<BoCPressMediaType> 
{

@private
    NSString *_identity;
    NSString *_name;
    
    BOOL _isChargeColumn;
    BOOL _currentChargeFlag;
}

- (id)initWithIdentity: (NSString *)identity 
                  name: (NSString *)name
            chargeFlag: (BOOL)chargeFlag
         currentChargeFlag: (BOOL)currentChargeFlag;

@end