#import "BoCPressMediaHomePagePrivateHandler.h"

#import "BoCPressMedia.h"

#import "BoCPressMediaType.h"
#import "BoCPressMediaHomePage.h"

#import "NSArraySlice.h"

#import "BoCPressImageView.h"

#import "BoCPressConstant.h"

#import "BoCPressMediaHomePageCell.h"

#import "BoCPressViewConstants.h"


@implementation BoCPressMediaHomePagePrivateHandler

#pragma mark - Instance initialization

- (id)initWithHomePage: (BoCPressMediaHomePage *)page
         forMediaTypes: (NSArray *)types
    maximumToShowCount: (NSUInteger)count
               inMedia: (NSDictionary *)media
{
    
    self = [super init];
    if (self)
    {
        _page = page;
        _count = count;
        _types = types;
        _media = media;
        _indexPathOfCurrentSelectedCell = nil;
    }
    
    return self;
    
}

#pragma mark - More button handle

- (void)handleSectionMoreButtonTapGesture: (UIGestureRecognizer *)recognizer
{
    
    NSUInteger typeIndex = [[recognizer view] tag];
    
    id<BoCPressMediaType> type = [_types objectAtIndex: typeIndex];
    
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject: type forKey: kType_Global_MediaTypeObject];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_wantToReadListOfMediaType 
                                                        object: self 
                                                      userInfo: userInfo];
    
}

#pragma mark - Table data source

- (NSInteger)view: (UIView *)view 
numberOfRowsInSection: (NSInteger)section
{
    
    if (view == (UIView *)_page)
    {
        
        id identity = [(id<BoCPressMediaType>)[_types objectAtIndex: section] identity];
        
        NSUInteger count = [[_media objectForKey: identity] count];
        if (count > _count)
        {
            return _count;
        }
        else
        {
            return count;
        }
        
    }
    else
    {
        return 0;
    }
    
}

- (NSInteger)numberOfSectionsInView: (UIView *)view
{
    
    if (view == (UIView *)_page)
    {
        return [_types count];
    }
    else
    {
        return 0;
    }
    
}

- (BoCPressMediaHomePageCell *)view: (UIView *)view 
              cellForRowAtIndexPath: (NSIndexPath *)indexPath
{
    
    if (view == (UIView *)_page)
    {
        
        id<BoCPressMediaType> type = [_types objectAtIndex: [indexPath indexAtPosition: 0]];
        id<BoCPressMedia> media = [[_media objectForKey: [type identity]] objectAtIndex: [indexPath indexAtPosition: 1]];
        BoCPressMediaHomePageCell *cell = [[[BoCPressMediaHomePageCell alloc] initWithMedia:media ] autorelease];
        
        UITapGestureRecognizer *tapGestureRecognizer = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleCellTapedEvent:)] autorelease];
        
        [cell addGestureRecognizer:tapGestureRecognizer];
        
        return cell;
        
    }
    else
    {
        return nil;
    }
    
}

#pragma mark - Table delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{    
    if (_couldRefreshPage)
    {
        [_page wantToUpdateDataWithInfo:nil];
    }
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    if ([scrollView contentOffset].y < - 41)
    {
        _couldRefreshPage = YES;
    }else
    {
        _couldRefreshPage = NO;
    }
}

- (void)view: (UIView *)view didSelectRowAtIndexPath: (NSIndexPath *)indexPath
{
    
    if (view == (BoCPressMediaHomePage *)_page)
    {
        id<BoCPressMediaType> type = [_types objectAtIndex: [indexPath indexAtPosition: 0]];
        
        id<BoCPressMedia> media = [[_media objectForKey: [type identity]] objectAtIndex: [indexPath indexAtPosition: 1]];
        
        NSDictionary *userInfo = [NSDictionary dictionaryWithObject: media forKey: kType_Global_MediaObject];
        
        [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_wantToPlayMedia 
                                                            object: self 
                                                          userInfo: userInfo];
        
    }
    
}

- (UIView *)view: (UIView *)view 
viewForHeaderInSection: (NSInteger)section
{
    
    if (view == (UIView *)_page)
    {
        
        NSString *imageName = nil;
        
        id<BoCPressMediaType> type = [_types objectAtIndex: section];
        NSString *typeName = [type name];
        if ([typeName isEqualToString: @"视频"])
        {
            imageName = @"BoCPressMediaTabHomeVideoSectionBanner";
        }
        else if ([typeName isEqualToString: @"音频"])
        {
            imageName = @"BoCPressMediaTabHomeAudioSectionBanner";
        }
        
        UIView *view = [[[UIView alloc] init] autorelease];
        
        UIImageView *imageView = [[[UIImageView alloc] initWithImage: [UIImage imageNamed: imageName]] autorelease];
        
        [view addSubview: imageView];
        
        UIButton *moreButton = [[[UIButton alloc] init] autorelease];
        [moreButton setTag: section];
        [moreButton setImage: [UIImage imageNamed: @"BoCPressMediaTabHomeMoreButton"] 
                    forState: UIControlStateNormal];
        
        [moreButton setFrame: CGRectMake(224, 6, 77, 31)];
        
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget: self 
                                                                                     action: @selector(handleSectionMoreButtonTapGesture:)];
        
        [moreButton addGestureRecognizer: recognizer];
        
        [recognizer release];
        
        [view addSubview: moreButton];
        
        return view;
        
    }
    else
    {
        return nil;
    }
    
}

- (UIView *)view: (UIView *)view 
viewForFooterInSection: (NSInteger)section
{
    
    if (view == (UIView *)_page)
    {
        return [[[UIView alloc] init] autorelease];        
    }
    else
    {
        return nil;
    }
    
}

- (CGFloat)view: (UIView *)view 
heightForRowAtIndexPath: (NSIndexPath *)indexPath
{
    if (view == (UIView *)_page)
    {
        if ([indexPath indexAtPosition: 1] == 2)
        {
            return 69;
        }
        else
        {
            return 69;
        }
    }
    else
    {
        return 0;
    }
}

- (CGFloat)view: (UIView *)view 
heightForHeaderInSection: (NSInteger)section
{
    
    if (view == (UIView *)_page)
    {
        return 42;
    }
    else
    {
        return 0;
    }
    
}

- (void)handleCellTapedEvent: (id)sender
{
    [_page wantToShowContentOfMediaInCell: [sender view]];

}
#pragma mark - Media home data source handler

- (void)callbackForAction: (id)action
                 withData: (id)data
{
    if (_callbackFlag)
    {
        if ([kCallbackAction_listOrderedMediaTypes isEqualToString: action])
        {
            [_page updateTypes: data];
        }
        else if ([kCallbackAction_listOrderedMediaOfType isEqualToString: action])
        {
            [_page updateMediaArraySlice: data];
            
        }else if([@"wantToShowContentOfMediaInCell:" isEqualToString: action])
        {
            [_page willShowContentOfMediaInCellWithData: data];
            
        }else if ([kCallbackAction_tryWithPreviousCallbackActionAgainAfterServerError isEqualToString: action])
        {
            NSString *previousCallbackAction = [data objectForKey: kNetwork_CallbackStoredCallbackInfo];
            if ( [previousCallbackAction isEqualToString: kCallbackAction_listOrderedMediaOfType])
            {
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

- (CGSize)view: (UIView*)view sizeForCellAtIndexPath: (NSIndexPath*)indexPath
{
    return CGSizeMake(320, 69);
}
- (void)updateContentSizeForThumbnailAtIndexPath: (NSIndexPath *)indexPath 
                                  withLayoutRect: (CGRect)rect
{
    ;
}


- (NSIndexPath*)indexOfCurrentSelectedCell
{
    return _indexPathOfCurrentSelectedCell;
}
@end
