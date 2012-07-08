#import "BoCPressNewsPagePrivateHandler.h"

#import "BoCPressNewsPage.h"

#import "BoCPressConstant.h"

#import "BoCPressConstant.h"

#import "BoCPressViewConstants.h"

@implementation BoCPressNewsPagePrivateHandler

- (id)initWithListPage: (BoCPressNewsPage *)page
{
    
    self = [super init];
    if (self) 
    {
        _page = page;
        
        _callbackFlag = YES;
    }
    
    return self;
    
}

#pragma mark - Data source callback

- (void)callbackForAction: (id)action
                 withData: (id)data
{
    if (_callbackFlag)
    {
        if ([kCallbackAction_contentOfNews isEqualToString: action])
        {
            [_page updateContentOfNews: data 
                         withDirection: kBoCPressNewsPage_pageSlideDirectionNone];
            
        }else if([kCallbackAction_submitFeedback  isEqualToString:action])
        {
            [_page removeFeedBackViewWithData: data];
            
        }else if([kCallbackAction_getCommentSummaryContentOfNews isEqualToString:action])
        {
            [_page stepToShowFeedBackViewWithData: data];
        }else if ([kCallbackAction_tryWithPreviousCallbackActionAgainAfterServerError isEqualToString: action])
        {
            //May this never happen
            //
            NSString *previousCallbackAction = [data objectForKey: kNetwork_CallbackStoredCallbackInfo];
            if ([previousCallbackAction isEqualToString: kCallbackAction_listOrderedNewsWithTag])
            {
                //TODO
                [_page didUpdateData];
                NSDictionary * animationInfo = [[NSDictionary alloc] initWithObjectsAndKeys: 
                                                kBoCPress_View_AnimationTypeTopToBottom, 
                                                kBoCPress_Global_AnimationType, nil];
                [_page wantToUpdateDataWithInfo: animationInfo];
                [animationInfo release];
            }
        }
    }
}

@end
