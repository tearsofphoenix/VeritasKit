#import "BoCPressCheckView.h"

@implementation BoCPressCheckView

- (id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) 
    {
        
        _radioView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressOption"]];
        [self addSubview: _radioView];
        
        _checkedView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressOptionSelected"]];
        [self addSubview: _checkedView];
        [_checkedView setAlpha: 0];
        
        _label = [[UILabel alloc] init];
        [_label setFont: [UIFont fontWithName: @"Helvetica"
                                         size: 17]];
        [_label setBackgroundColor: [UIColor clearColor]];
        [self addSubview: _label];
        
        _checked = NO;
        
        UITapGestureRecognizer *tapForCheck = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeCheckState:)];
        [self addGestureRecognizer:tapForCheck];
        [tapForCheck release];
        
    }
    
    return self;
    
}

- (void)dealloc
{
    [_radioView release];
    [_checkedView release];
    [_label release];
    
    [super dealloc];
}

- (BOOL)checked
{
    return _checked;
}

- (void)setChecked: (BOOL)checked
{
    
    if (checked)
    {
        [UIView animateWithDuration: 0.5
                              delay: 0
                            options: UIViewAnimationOptionTransitionNone
                         animations: (^(void)
                                      {
                                          [_checkedView setAlpha: 1];
                                      })
                         completion: (^(BOOL finished)
                                      {
                                          _checked = checked;
                                      })];
    }
    else
    {
        [UIView animateWithDuration: 0.5
                              delay: 0
                            options: UIViewAnimationOptionTransitionNone
                         animations: (^(void)
                                      {
                                          [_checkedView setAlpha: 0];
                                      })
                         completion: (^(BOOL finished)
                                      {
                                          _checked = checked;
                                      })];
    }
    
}

- (void)setText: (NSString *)text
{
    
    [_label setText: text];
    
    CGSize size = [text sizeWithFont: [_label font]];
    
    [_label setFrame: CGRectMake(30, 0, size.width, size.height)];
    
}

- (NSString *)text
{
    return [_label text];
}

#pragma mark -  change check state
- (void)changeCheckState: (id)sender
{
    [self setChecked:!_checked];
}
@end
