#import <Foundation/Foundation.h>
@protocol NSIdentifiedObject;
@class BoCPressTabPageController;

@protocol BoCPressTab<NSIdentifiedObject>

@property (nonatomic, readonly) BoCPressTabPageController *tabPageController;

@property (nonatomic, readonly) UIButton *tabButton;

@property (nonatomic, readonly) id tabIdentity;

@property (nonatomic, retain) id identity;

@end

@interface BoCPressTab: UIButton<BoCPressTab> 
{
    BoCPressTabPageController *_tabPageController;
    id _tabIdentity;
}

- (id)initWithImage: (UIImage *)image 
   andSelectedImage: (UIImage *)selectedImage
     forTabIdentity: (id)tabIdentity;

@end
