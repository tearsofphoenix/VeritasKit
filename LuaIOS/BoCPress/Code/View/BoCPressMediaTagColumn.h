#import <Foundation/Foundation.h>

#import "NSReadableTag.h"

#import "BoCPressColumn.h"

@protocol BoCPressMediaType;

@protocol BoCPressMediaTagColumn<NSReadableTag, NSCoding>

- (id<BoCPressMediaType>)mediaType;

@end

@interface BoCPressMediaTagColumn: BoCPressColumn<BoCPressMediaTagColumn>
{
    id<BoCPressMediaType> _mediaType;
}

- (id)initWithIdentity:(id)identity 
                  name:(NSString *)name 
             mediaType:(id<BoCPressMediaType>)mediaType
            chargeFlag: (BOOL)chargeFlag
     currentChargeFlag: (BOOL) currentChargeFlag;

@end
