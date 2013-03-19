//
//  VMKDebugBreakpoint.h
//  VeritasMachineKit
//
//  Created by tearsofphoenix on 13-3-1.
//
//

#import <Foundation/Foundation.h>

typedef BOOL (^ VMKDebugBreakpointConditionBlock)(void);

#define VMKDebugBreakpointLineKey @"line"
#define VMKDebugBreakpointAutoContinueKey @"autoContinue"
#define VMKDebugBreakpointIgnoreTimesKey @"ignoreTimes"
#define VMKDebugBreakpointActionBlockKey @"action"
#define VMKDebugBreakpointConditionBlockKey @"condition"
#define VMKDebugBreakpointDisableKey @"disable"

@interface VMKDebugBreakpoint : NSObject

@property (nonatomic) NSUInteger lineNumber;
@property (nonatomic, getter = isDisabled) BOOL disabled;
@property (nonatomic) BOOL autoContinueAfterEvaluating;
@property (nonatomic) NSUInteger ignoreTimesBeforeStopping;
@property (nonatomic, copy) dispatch_block_t actionBlock;
@property (nonatomic, copy) VMKDebugBreakpointConditionBlock conditionBlock;

- (void)updateFromSettings: (NSDictionary *)settings;

@end
