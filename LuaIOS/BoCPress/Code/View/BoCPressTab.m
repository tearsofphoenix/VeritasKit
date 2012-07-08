#import "BoCPressTab.h"

#import "NSIdentifiedObject.h"

@implementation BoCPressTab

@synthesize tabPageController = _tabPageController;
@synthesize tabIdentity = _tabIdentity;
@synthesize identity = _identity;

- (id)initWithImage: (UIImage *)image 
   andSelectedImage: (UIImage *)selectedImage
     forTabIdentity: (id)tabIdentity
{
    
    self = [super init];
    if (self)
    {
        
        _tabIdentity = tabIdentity;
        
        [self setImage: image forState: UIControlStateNormal];
        
        if (selectedImage)
        {
            [self setImage: selectedImage forState: UIControlStateSelected];
            [self setImage: selectedImage forState: UIControlStateHighlighted];
        }
        
    }
    
    return self;
    
}

- (UIButton *)tabButton
{
    return self;
}

- (void)dealloc
{
    [_identity release];    
    [super dealloc];
}

@end
