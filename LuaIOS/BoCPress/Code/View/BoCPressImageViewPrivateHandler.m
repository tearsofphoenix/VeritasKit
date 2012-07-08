#import "BoCPressImageViewPrivateHandler.h"

#import "BoCPressImageView.h"

#import "BoCPressConstant.h"

@implementation BoCPressImageViewPrivateHandler

- (id)initWithImageView: (BoCPressImageView *)imageView
{
    
    self = [super init];
    if (self)
    {
        _imageView = [imageView retain];
        _data = [[NSMutableData alloc] init];
    }
    
    return self;
    
}

- (void)dealloc
{
    [_imageView release];
    [_data release];
    
    [super dealloc];
    
}

- (void)connection: (NSURLConnection *)connection 
didReceiveResponse: (NSURLResponse *)response
{
    [_data setLength:0];
}

- (void)connection: (NSURLConnection *)connection 
    didReceiveData: (NSData *)data
{
    [_data appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    UIImage *image = [UIImage imageWithData:_data];
    
    [_imageView setImage: image];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:kBoCPressSoapDataSourcePrivateHandler_storeAuthorAvatar 
                                                       object:self 
                                                     userInfo:[NSDictionary dictionaryWithObjectsAndKeys:
                                                               _data, @"data",
                                                               [_imageView imageURL], kBoCPress_Global_NSURLObject,
                                                               [_imageView imageID], @"imageID",
                                                               nil]];
}

@end
