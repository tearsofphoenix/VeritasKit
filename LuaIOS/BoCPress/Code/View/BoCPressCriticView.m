#import "NSSuperHandler.h"

#import "BoCPressCriticView.h"

#import "BoCPressAuthor.h"

#import "BoCPressConstant.h"

@implementation BoCPressCriticView

- (id)initWithPageFlag: (id)pageFlag
{
    
    self = [super init];
    if (self) 
    {
        
        //_backgroundView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressCriticTabTitleBackground"]];
        if ([pageFlag isEqual:kCriticView_HideTriangleNavigateLogo])
        {
            _backgroundView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressCriticTabTitleBackground"]];
        }else if([pageFlag isEqual:kCriticView_ShowTriangleNavigateLogo])
        {
            _backgroundView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressCriticViewBackGround"]];
        }
        [self addSubview: _backgroundView];
        
        //        
        //        _avatarView = [[[UIImageView alloc] init] autorelease];
        //        [_avatarView setBackgroundColor: [UIColor blackColor]];
        //        [_avatarView setFrame: CGRectMake(15, 10, 60, 45)];
        //        [self addSubview: _avatarView];
        _avatarView = [[UIImageView alloc] init];
        
        [_avatarView setFrame: CGRectMake(15, 10, 60, 45)];
        [self addSubview: _avatarView];
        
        _authorNameLabel = [[UILabel alloc] init];
        [_authorNameLabel setFrame: CGRectMake(15, 55, 60, 16)];
        [_authorNameLabel setBackgroundColor: [UIColor colorWithRed: 183.0 / 255
                                                              green: 24.0 / 255 
                                                               blue: 47.0 / 255
                                                              alpha: 1]];
        [_authorNameLabel setTextColor: [UIColor whiteColor]];
        [_authorNameLabel setTextAlignment: UITextAlignmentCenter];
        [_authorNameLabel setFont: [UIFont fontWithName: @"Helvetica" size: 10]];
        [self addSubview: _authorNameLabel];
        
        _newsAbstractLabel = [[UILabel alloc] init];
        [_newsAbstractLabel setNumberOfLines: 2];
        [_newsAbstractLabel setLineBreakMode: UILineBreakModeWordWrap];
        [_newsAbstractLabel setFrame: CGRectMake(90, 25, 190, 34)];
        [_newsAbstractLabel setFont: [UIFont fontWithName: @"Helvetica" size: 12]];
        [_newsAbstractLabel setBackgroundColor: [UIColor clearColor]];
        [_newsAbstractLabel setTextColor: [UIColor colorWithRed: 93.0 / 255
                                                          green: 93.0 / 255
                                                           blue: 93.0 / 255 
                                                          alpha: 1]];
        [self addSubview: _newsAbstractLabel];
        
        _avatarImage = nil;
    }
    
    return self;
    
}

- (void)dealloc
{
    [_backgroundView release];
    [_authorNameLabel release];
    [_newsAbstractLabel release];
    [_avatarView release];
    [_avatarImage release];
    
    [super dealloc];
    
}

- (void)setCritic: (id<BoCPressAuthor>)critic 
{

    [_authorNameLabel setText: [critic name]];
    [_newsAbstractLabel setText: [critic authorBriefIntroduction]];
    
    [(BoCPressAuthor*)critic setSuperHandler:self];

    if ([[critic authorAvatar] image])
    {
        [_avatarView setImage:[[critic authorAvatar] image]];
    }
    
}

- (void)setSelected: (BOOL)selected
{
    
}

- (void)updateSuperStatementWithData:(id)data
{
    if (data)
    {
       
        [_avatarView setImage:data];
    }
}
@end
