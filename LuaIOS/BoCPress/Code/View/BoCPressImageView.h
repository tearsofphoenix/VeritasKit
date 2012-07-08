#import <Foundation/Foundation.h>

@protocol BoCPressCallback;
@protocol NSSuperHandler;

@class BoCPressImageViewPrivateHandler;

@interface BoCPressImageView: UIImageView
{
    
    NSURLConnection *_connection;
    BoCPressImageViewPrivateHandler *_handler;
    
    NSURL *_imageURL;
    
    id _imageID;
    
    id<BoCPressCallback> _callback;
    
    id<NSSuperHandler> _superHandler;
}

- (id)initWithImageURL: (NSURL *)url
               imageID: (id)imageID;

- (id)imageID;

- (NSURL *)imageURL;

- (void)setCallback: (id<BoCPressCallback>)callback;

@end
