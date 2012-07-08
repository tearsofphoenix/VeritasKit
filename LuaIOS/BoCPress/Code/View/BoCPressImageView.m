#import "BoCPressImageView.h"

#import "BoCPressImageViewPrivateHandler.h"

#import "BoCPressCallback.h"

#import "BoCPressConstant.h"

#import "NSSuperHandler.h"

@implementation BoCPressImageView

- (id)initWithImageURL:(NSURL *)url imageID: (id)imageID
{
    
    self = [super initWithImage: [UIImage imageNamed: @"BoCPressDefaultImage"]];
    if (self)
    {
        _superHandler = nil;
        
        _handler = [[BoCPressImageViewPrivateHandler alloc] initWithImageView: self];
        
        _connection = [[NSURLConnection alloc] initWithRequest: [NSURLRequest requestWithURL: url] delegate: _handler startImmediately: YES];
        
        _imageURL = [url retain];
        
        _callback = nil;
        
        _imageID = [imageID retain];
        
    }
    
    return self;
    
}

- (void)dealloc
{
    
    [_handler release];
    [_connection release];
    [_imageURL release];
    [_imageID release];
    [super dealloc];
    
}

- (NSURL *)imageURL
{
    return _imageURL;
}

- (id)imageID
{
    return _imageID;
    
}

- (void)setCallback:(id<BoCPressCallback>)callback
{
    if (_callback != callback)
    {        
        [_callback release];        
        _callback = [callback retain];
    }
}
- (void)setImage:(UIImage *)image
{
    if (image)
    {
        
        [super setImage:image];
        
        //FIXME
        //
        NSDictionary *data = [[NSDictionary alloc] initWithObjectsAndKeys:
                              UIImagePNGRepresentation(image), @"data"
                              , nil];
        
        [_callback callbackForAction: kBoCPress_View_updateThumbnailImage
                            withData: data];
        [_superHandler updateSuperStatementWithData:image];

        [self setNeedsDisplay];
    }
}

- (void)setSuperHandler: (id<NSSuperHandler>)superHandler
{
    if (superHandler)
    {
        
        [_superHandler release];
        
        _superHandler = [superHandler retain];
    }
    
}

- (id<NSSuperHandler>)superHandler
{
    return _superHandler;
}
@end
