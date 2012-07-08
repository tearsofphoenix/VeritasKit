#import <Foundation/Foundation.h>

@class BoCPressImageView;

@interface BoCPressImageViewPrivateHandler: NSObject
{
    BoCPressImageView *_imageView;
    NSMutableData *_data;
}

- (id)initWithImageView: (BoCPressImageView *)imageView;

@end
