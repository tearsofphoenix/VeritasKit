#import "BoCPressApplicationState.h"

#import "BoCPressApplication.h"

#import "BoCPressViewController.h"

#import "BoCPressViewState.h"

#import "BoCPressNetworkService.h"

#import "BoCPressSoapDataSource.h"

#import "BoCPressConstant.h"

@implementation BoCPressApplicationState

- (id)init
{
    
    self = [super init];
    if (self)
    {
        _dataSource = [[BoCPressSoapDataSource alloc] init];
        
        BoCPressApplicationDelegate *delegate = [[UIApplication sharedApplication] delegate];
        
        BoCPressViewController *rootViewController = (BoCPressViewController *)[[delegate window] rootViewController];
        
        [rootViewController setViewState: [[[BoCPressViewState alloc] initWithDataSource: _dataSource] autorelease]];
        
        
        [[NSNotificationCenter defaultCenter] postNotificationName: kDataSource_getGUIConfiguration 
                                                            object: self 
                                                          userInfo: nil];
        
        
    }
    
    return self;
    
}

- (void)dealloc
{
    [_dataSource release];
    
    [super dealloc];    
}

- (void)resetBadgeNumber
{
    [_dataSource resetBadgeNumber];
}
@end
