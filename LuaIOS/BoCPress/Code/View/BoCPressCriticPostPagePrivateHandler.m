#import "BoCPressCriticPostPagePrivateHandler.h"

#import "BoCPressCriticPostPage.h"

#import "BoCPressConstant.h"

@implementation BoCPressCriticPostPagePrivateHandler

- (id)initWithCriticPostPage: (BoCPressCriticPostPage *)page
                  criticPost: (id<BoCPressNews>)criticPost
{
    
    self = [super init];
    if (self) 
    {
        
        _page = page;
        _criticPost = criticPost;
    }
    
    return self;
}

#pragma mark - callback

- (void)callbackForAction: (id)action withData: (id)data
{
    if(_callbackFlag)
    {
//        if ([kCallbackAction_contentOfCriticPost isEqualToString: action])
//        {
//            [_page updateData: data];
//        }else 
            if([kCallbackAction_submitFeedback isEqualToString:action])
        {
            [_page removeFeedBackViewWithData: data];
        }else if([kCallbackAction_getCommentSummaryContentOfNews isEqualToString:action])
        {
            [_page stepToShowFeedBackViewWithData: data];
        }
    }
    
}
@end
