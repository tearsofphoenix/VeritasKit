@import('UI')

@implementation EAGLView : UIView

+ (Class)layerClass 
{
    print("called", [CAEAGLLayer class])
	return [CAEAGLLayer class];
}

- (id)init
{
        self = [super init]
    if self then 
		eaglLayer = [self layer]
		print(self, eaglLayer)
		[eaglLayer setOpaque: YES]
		-- In this application, we want to retain the EAGLDrawable contents after a call to presentRenderbuffer.
        
        properties = [[NSMutableDictionary alloc] init]
        [properties setObject: [NSNumber numberWithBool: YES]
                       forKey:  kEAGLDrawablePropertyRetainedBacking]
        [properties setObject: kEAGLColorFormatRGBA8
                       forKey: kEAGLDrawablePropertyColorFormat] 
        
		[eaglLayer setDrawableProperties: properties]
        [properties release]
            
		context = [[EAGLContext alloc] initWithAPI: kEAGLRenderingAPIOpenGLES1];
		print("context", context)
		if not context or not [EAGLContext setCurrentContext: context] then

			[self release]
			return nil
		end
		
		-- Create a texture from an image
		-- First create a UIImage object from the data in a image file, and then extract the Core Graphics image
		brushImage = [[UIImage imageNamed: @"Particle.png"] CGImage];
		
		-- Get the width and height of the image
        print("ok")
		width = CGImageGetWidth(brushImage);
		height = CGImageGetHeight(brushImage);
		
		-- Texture dimensions must be a power of 2. If you write an application that allows users to supply an image,
		-- you'll want to add code that checks the dimensions and takes appropriate action if they are not a power of 2.
		
		-- Make sure the image exists
		if brushImage then

			-- Allocate  memory needed for the bitmap context

			-- Use  the bitmatp creation function provided by the Core Graphics framework. 
			brushContext = CGBitmapContextCreate(brushData, width, height, 8, width * 4, CGImageGetColorSpace(brushImage), kCGImageAlphaPremultipliedLast)
			-- After you create the context, you can draw the  image to the context.
			CGContextDrawImage(brushContext, CGRectMake(0.0, 0.0, width, height), brushImage)
			-- You don't need the context at this point, so you need to release it to avoid memory leaks.
			CGContextRelease(brushContext)
			-- Use OpenGL ES to generate a name for the texture.
			glGenTextures(1, brushTexture)
			-- Bind the texture name. 
			glBindTexture(GL_TEXTURE_2D, brushTexture)
			-- Set the texture parameters to use a minifying filter and a linear filer (weighted average)
			glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR)
			-- Specify a 2D texture image, providing the a pointer to the image data in memory
			glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, brushData)
		end
		
		-- Set the view's scale factor
		[self setContentScaleFactor: 1.0]
	
		-- Setup OpenGL states
		glMatrixMode(GL_PROJECTION)
		
        frame = [self bounds];
		
        scale = [self contentScaleFactor];
		-- Setup the view port in Pixels
		glOrthof(0, frame.size.width * scale, 0, frame.size.height * scale, -1, 1)
		glViewport(0, 0, frame.size.width * scale, frame.size.height * scale)
		glMatrixMode(GL_MODELVIEW)
		
		glDisable(GL_DITHER)
		glEnable(GL_TEXTURE_2D)
		glEnableClientState(GL_VERTEX_ARRAY)
		
	    glEnable(GL_BLEND)
		-- Set a blending function appropriate for premultiplied alpha pixel data
		glBlendFunc(GL_ONE, GL_ONE_MINUS_SRC_ALPHA)
		
		glEnable(GL_POINT_SPRITE_OES)
		glTexEnvf(GL_POINT_SPRITE_OES, GL_COORD_REPLACE_OES, GL_TRUE)
		glPointSize(width / kBrushScale)
		
		-- Make sure to start with a cleared buffer
		needsErase = true;
		
    end	
    
	return self
}

-- If our view is resized, we'll be asked to layout subviews.
-- This is the perfect opportunity to also update the framebuffer so that it is
-- the same size as our display area.

- (void)layoutSubviews
{
	[EAGLContext setCurrentContext: context]
	[self destroyFramebuffer]
	[self createFramebuffer]
	
	-- Clear the framebuffer the first time it is allocated
	if needsErase then 
    
		[self erase]
		needsErase = false
	end
}

- (void)createFramebuffer 
{
	-- Generate IDs for a framebuffer object and a color renderbuffer
	glGenFramebuffersOES(1, viewFramebuffer);
	glGenRenderbuffersOES(1, viewRenderbuffer);
	
	glBindFramebufferOES(GL_FRAMEBUFFER_OES, viewFramebuffer);
	glBindRenderbufferOES(GL_RENDERBUFFER_OES, viewRenderbuffer);
	-- This call associates the storage for the current render buffer with the EAGLDrawable (our CAEAGLLayer)
	-- allowing us to draw into a buffer that will later be rendered to screen wherever the layer is (which corresponds with our view).
    
	[context renderbufferStorage: GL_RENDERBUFFER_OES
                    fromDrawable: [self layer]]
    
	glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_RENDERBUFFER_OES, viewRenderbuffer);
	
	glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_WIDTH_OES, backingWidth);
	glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_HEIGHT_OES, backingHeight);
	
	-- For this sample, we also need a depth buffer, so we'll create and attach one via another renderbuffer.
	
    glGenRenderbuffersOES(1, depthRenderbuffer);
	glBindRenderbufferOES(GL_RENDERBUFFER_OES, depthRenderbuffer);
	glRenderbufferStorageOES(GL_RENDERBUFFER_OES, GL_DEPTH_COMPONENT16_OES, backingWidth, backingHeight);
	glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_DEPTH_ATTACHMENT_OES, GL_RENDERBUFFER_OES, depthRenderbuffer);
	
	if glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) ~= GL_FRAMEBUFFER_COMPLETE_OES then

		print("failed to make complete framebuffer object %x", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
		return false
	end
	
	return true
}

-- Clean up any buffers we have allocated.
- (void)destroyFramebuffer
{
	glDeleteFramebuffersOES(1, viewFramebuffer)
	viewFramebuffer = 0
	glDeleteRenderbuffersOES(1, viewRenderbuffer)
	viewRenderbuffer = 0
	
	if depthRenderbuffer then
	
		glDeleteRenderbuffersOES(1, depthRenderbuffer)
		depthRenderbuffer = 0
	end
}

-- Erases the screen
- (void)erase
{
	[EAGLContext setCurrentContext: context]
	
	-- Clear the buffer
	glBindFramebufferOES(GL_FRAMEBUFFER_OES, viewFramebuffer)
	glClearColor(0.0, 0.0, 0.0, 0.0)
	glClear(GL_COLOR_BUFFER_BIT)
	
	-- Display the buffer
	glBindRenderbufferOES(GL_RENDERBUFFER_OES, viewRenderbuffer)
	[context presentRenderbuffer: GL_RENDERBUFFER_OES]
}

-- Drawings a line onscreen based on where the user touches
- (void)renderLineFromPoint: (CGPoint)start
                    toPoint: (CGPoint)endPoint
{
	local vertexBuffer;
	local  vertexMax;

	
	[EAGLContext setCurrentContext: context];
	glBindFramebufferOES(GL_FRAMEBUFFER_OES, viewFramebuffer)
	
	-- Convert locations from Points to Pixels
	scale = [self contentScaleFactor];
        start.x = start.x * scale;
	start.y = start.y * scale;
	endPoint.x = endPoint.x * scale;
	endPoint.y = endPoint.y * scale;
	
	-- Allocate vertex array buffer
	if not vertexBuffer then
		vertexBuffer = malloc(vertexMax * 2 * sizeof(GLfloat));
	end
    
	-- Add points to the buffer so there are drawing points every X pixels
	count = MAX(ceilf(sqrtf((endPoint.x - start.x) * (endPoint.x - start.x) + (endPoint.y - start.y) * (endPoint.y - start.y)) / kBrushPixelStep), 1);
	for i = 1,  count do
		if(vertexCount == vertexMax) then
			vertexMax = 2 * vertexMax;
			vertexBuffer = realloc(vertexBuffer, vertexMax * 2 * sizeof(GLfloat));
		end
		
		vertexBuffer[2 * vertexCount + 0] = start.x + (endPoint.x - start.x) * ( i / count);
		vertexBuffer[2 * vertexCount + 1] = start.y + (endPoint.y - start.y) * ( i / count);
		vertexCount = vertexCount + 1;
	end
	
	-- Render the vertex array
	glVertexPointer(2, GL_FLOAT, 0, vertexBuffer);
	glDrawArrays(GL_POINTS, 0, vertexCount);
	
	-- Display the buffer
	glBindRenderbufferOES(GL_RENDERBUFFER_OES, viewRenderbuffer);
	[context presentRenderbuffer:GL_RENDERBUFFER_OES];
}





-- Handles the start of a touch
- (void)touchesBegan: (UITouch)touches
            withEvent: (UIEvent) event
{
	bounds = [self bounds];
    touch = [[event touchesForView: self] anyObject];
	firstTouch = true;
	-- Convert touch point from UIView referential to OpenGL one (upside-down flip)
	location = [touch locationInView: self];
	location.y = bounds.size.height - location.y;
}

-- Handles the continuation of a touch.
- (void)touchesMoved:(UITouch)touches
            withEvent: (UIEvent) event

{
	bounds = [self bounds];
    touch = [[event touchesForView: self] anyObject];
		
	-- Convert touch point from UIView referential to OpenGL one (upside-down flip)
	if firstTouch  then
		firstTouch = false;
		previousLocation = [touch previousLocationInView: self];
		previousLocation.y = bounds.size.height - previousLocation.y;
	 else 
		location = [touch locationInView:self];
	    location.y = bounds.size.height - location.y;
		previousLocation = [touch previousLocationInView: self];
		previousLocation.y = bounds.size.height - previousLocation.y;
	end
		
	-- Render the stroke
	[self renderLineFromPoint:previousLocation
                        toPoint: location]
}

-- Handles the end of a touch event when the touch is a tap.
- (void)touchesEnded:(UITouch)touches
            withEvent: (UIEvent) event
{
	bounds = [self bounds];
    touch = [[event touchesForView: self] anyObject];
    
	if firstTouch then
		firstTouch = NO;
		previousLocation = [touch previousLocationInView: self];
		previousLocation.y = bounds.size.height - previousLocation.y;
		[self renderLineFromPoint:previousLocation
                            toPoint: location];
	end
}

- (void)setBrushColorWithRed: (CGFloat)red
                       green: (CGFloat)green
                        blue: (CGFloat)blue
{

	-- Set the brush color using premultiplied alpha values
	glColor4f(red	* kBrushOpacity,
			  green * kBrushOpacity,
			  blue	* kBrushOpacity,
			  kBrushOpacity)
}

 
@end



@implementation AppDelegate : NSObject

@property (nonatomic, retain) UIWindow window

- (BOOL)application: (id)application didFinishLaunchingWithOptions: (id)launchOptions
{
    bounds = [[UIScreen mainScreen] bounds]
    
    id window = [[UIWindow alloc] initWithFrame: bounds]
    
    [self setWindow: window]    
    
    id backgroundColor = [UIColor whiteColor]

    
    [window setBackgroundColor: backgroundColor];
    rootViewController = [[UIViewController alloc] init]
        
    id mainView = [[EAGLView alloc] init]
    [mainView setFrame: bounds]
    
    [rootViewController setView: mainView]


    [window setRootViewController: rootViewController]
    [rootViewController release]
    [window makeKeyAndVisible]
    
    return true
}

@end

 
local function main()
    
    @autoreleasepool
    {
        ret = UIApplicationMain(0, nil, nil, NSStringFromClass(AppDelegate))
        return ret
    }
    
end

main()


