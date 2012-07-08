#import "UIView+LoadingIndicatorView.h"

#import "BoCPressConstant.h"

#import <QuartzCore/QuartzCore.h>

@implementation UIView(LoadingIndicatorView)

- (UIView *)loadingIndicatorWithOutText
{
    CGRect bounds = [self bounds];
    
    UIView *view = [[[UIView alloc] initWithFrame: bounds] autorelease];
    
    UIView *backgrouadView = [[[UIView alloc] init] autorelease];
    [backgrouadView setBackgroundColor:[UIColor colorWithRed:128 / 255.0 green:128 / 255.0 blue:128 / 255.0 alpha:0.7]];
    
    [[backgrouadView layer] setCornerRadius:5.0f];
    
    UIActivityIndicatorView *indicator = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleGray] autorelease];
    [indicator startAnimating];
    
     
    [backgrouadView  setFrame:CGRectMake(140, 220, 80, 80)];
    
    [backgrouadView setCenter:CGPointMake(bounds.origin.x + bounds.size.width / 2, 
                                          bounds.origin.y + bounds.size.height / 2)];
    
    float x = ([backgrouadView frame].size.width - 20) / 2;
    
    float y = ([backgrouadView frame].size.height - 20) / 2;
    
    [indicator setFrame:CGRectMake(x, y, 20, 20)];
    
    [backgrouadView addSubview:indicator];
    
    [view addSubview:backgrouadView];
    
    
    return view;

}

- (UIView *)loadingIndicator
{
    
    CGRect bounds = [self bounds];
    
    UIView *view = [[[UIView alloc] initWithFrame: bounds] autorelease];
    
    UIView *backgrouadView = [[[UIView alloc] init] autorelease];
    [backgrouadView setBackgroundColor:[UIColor colorWithRed:128 / 255.0 green:128 / 255.0 blue:128 / 255.0 alpha:0.7]];
    
    [[backgrouadView layer] setCornerRadius:5.0f];
    
    UIActivityIndicatorView *indicator = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleGray] autorelease];
    [indicator startAnimating];
            
    UILabel *label = [[[UILabel alloc] init] autorelease];
    
    UIFont *font = [UIFont fontWithName: @"Helvetica" size: 17];
    [label setFont: font];
    [label setShadowColor: [UIColor whiteColor]];
    [label setBackgroundColor: [UIColor clearColor]];
    [label setShadowOffset: CGSizeMake(1, 1)];
    [label setText: @"正在载入..."];
        
    CGSize size = [[label text] sizeWithFont: font];
    size.width += 25;
    size.height = 20;
    
   
    [backgrouadView  setFrame:CGRectMake(140, 220, size.width + 20, 80)];
    
    [backgrouadView setCenter:CGPointMake(bounds.origin.x + bounds.size.width / 2, 
                                          bounds.origin.y + bounds.size.height / 2)];

    float x = ([backgrouadView frame].size.width - size.width) / 2;
                
    float y = ([backgrouadView frame].size.height - size.height) / 2;
    
    [indicator setFrame:CGRectMake(x, y, 20, 20)];
    [label setFrame:CGRectMake(x + 25, y + 1.5, size.width - 20, 20)];
    
    [backgrouadView addSubview:indicator];
    [backgrouadView addSubview:label];
    [backgrouadView bringSubviewToFront:label];
    
    [view addSubview:backgrouadView];

    
    return view;
    
}

- (UIView *)loadingIndicatorWithText:(NSString *)text
{
    NSString *contentText = text;
    if (!contentText) 
    {
        return [self loadingIndicatorWithOutText];
    }
    
    CGRect bounds = [self bounds];
    
    UIView *view = [[[UIView alloc] initWithFrame: bounds] autorelease];
    
    UIView *backgrouadView = [[[UIView alloc] init] autorelease];
    [backgrouadView setBackgroundColor:[UIColor colorWithRed:128 / 255.0 green:128 / 255.0 blue:128 / 255.0 alpha:0.7]];
    
    [[backgrouadView layer] setCornerRadius:5.0f];
    
    UIActivityIndicatorView *indicator = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleGray] autorelease];
    [indicator startAnimating];
        
    UILabel *label = [[[UILabel alloc] init] autorelease];
    
    UIFont *font = [UIFont fontWithName: @"Helvetica" size: 17];
    [label setFont: font];
    [label setShadowColor: [UIColor whiteColor]];
    [label setBackgroundColor: [UIColor clearColor]];
    [label setShadowOffset: CGSizeMake(1, 1)];
    [label setText: contentText];
        
    CGSize size = [[label text] sizeWithFont: font];
    size.width += 25;
    size.height = 20;
    
    
    [backgrouadView  setFrame:CGRectMake(140, 220, size.width + 20, 80)];
    
    [backgrouadView setCenter:CGPointMake(bounds.origin.x + bounds.size.width / 2, 
                                          bounds.origin.y + bounds.size.height / 2)];

    float x = ([backgrouadView frame].size.width - size.width) / 2;
    
    float y = ([backgrouadView frame].size.height - size.height) / 2;
    
    [indicator setFrame:CGRectMake(x, y, 20, 20)];
    [label setFrame:CGRectMake(x + 25, y + 1.5, size.width - 20, 20)];
    
    [backgrouadView addSubview:indicator];
    [backgrouadView addSubview:label];
    [backgrouadView bringSubviewToFront:label];
    
    [view addSubview:backgrouadView];
        
    return view;
}

@end
