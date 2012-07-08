#import <Foundation/Foundation.h>

@protocol BoCPressColumn;

@protocol BoCPressColumnDelegate <NSObject>

- (void)didColumnSwitchTo: (id<BoCPressColumn>)column;

- (void)didMoreColumnsSelected;

@end
