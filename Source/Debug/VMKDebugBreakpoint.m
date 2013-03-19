//
//  VMKDebugBreakpoint.m
//  VeritasMachineKit
//
//  Created by tearsofphoenix on 13-3-1.
//
//

#import "VMKDebugBreakpoint.h"

@interface VMKDebugBreakpoint ()

@property (nonatomic, retain) NSString *actionString;
@property (nonatomic, retain) NSString *conditionString;

@end

@implementation VMKDebugBreakpoint

- (void)dealloc
{
    if (_actionBlock)
    {
        Block_release(_actionBlock);
        _actionBlock = nil;
    }
    
    if (_conditionBlock)
    {
        Block_release(_conditionBlock);
        _conditionBlock = nil;
    }
    
    [_actionString release];
    [_conditionString release];
    
    [super dealloc];
}

- (void)updateFromSettings: (NSDictionary *)settings
{
    NSString *lineNumber = [settings objectForKey: VMKDebugBreakpointLineKey];
    
    //must have this in settings
    //
    if (lineNumber)
    {
        [self setLineNumber: [lineNumber integerValue]];
    }
    
    NSString *autoContinue = [settings objectForKey: VMKDebugBreakpointAutoContinueKey];
    
    if (autoContinue)
    {
        [self setAutoContinueAfterEvaluating: [autoContinue boolValue]];
    }
    
    NSString *ignoreTimes = [settings objectForKey: VMKDebugBreakpointIgnoreTimesKey];
    
    if (ignoreTimes)
    {
        [self setIgnoreTimesBeforeStopping: [ignoreTimes integerValue]];
    }
    
    NSString *actionBlock = [settings objectForKey: VMKDebugBreakpointActionBlockKey];
    
    if (actionBlock)
    {
        //TODO
        //
        [self setActionString: actionBlock];
        
    }
    
    NSString *conditionBlock = [settings objectForKey: VMKDebugBreakpointConditionBlockKey];
    
    if (conditionBlock)
    {
        //TODO
        //
        [self setConditionString: conditionBlock];
    }
    
    NSString *disabled = [settings objectForKey: VMKDebugBreakpointDisableKey];
    
    if (disabled)
    {
        [self setDisabled: [disabled boolValue]];
    }
}

- (NSString *)description
{
    NSMutableDictionary *info = [[NSMutableDictionary alloc] init];
    
    if (_lineNumber)
    {
        [info setObject: @(_lineNumber)
                 forKey: VMKDebugBreakpointLineKey];
    }
    
    [info setObject: _autoContinueAfterEvaluating ? @"YES" : @"NO"
             forKey: VMKDebugBreakpointAutoContinueKey];

    [info setObject: @(_ignoreTimesBeforeStopping)
             forKey: VMKDebugBreakpointIgnoreTimesKey];

    if (_actionString)
    {
        [info setObject: _actionString
                 forKey: VMKDebugBreakpointActionBlockKey];
    }
    
    if (_conditionString)
    {
        [info setObject: _conditionString
                 forKey: VMKDebugBreakpointConditionBlockKey];
    }
    
    [info setObject: _disabled ? @"YES" : @"NO"
             forKey: VMKDebugBreakpointDisableKey];
    
    return [info description];
}

@end
