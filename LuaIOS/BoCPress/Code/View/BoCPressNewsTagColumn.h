#import <Foundation/Foundation.h>

#import "BoCPressNewsTag.h"

#import "BoCPressColumn.h"

@interface BoCPressNewsTagColumn: BoCPressNewsTag<BoCPressColumn>

- (id)initWithIdentity: (id)identity
                  name: (NSString *)name
            chargeFlag: (BOOL)chargeFlag
     currentChargeFlag: (BOOL) currentChargeFlag;
//
//- (BOOL)isChargeColumn;
//
//- (BOOL)currentChargeFlag;

@end
