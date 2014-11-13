local class = require("class")
local NS = require("NS")
local VA = require("VA")
local CG = require("CG")

local Layer = class:inherit(NS.Object, "VA.Layer")

function Layer:layer()
   return self:new() 
end

function Layer:initWithLayer( layer )
	local instance = self:new()
	instance._presentationLayer = layer
	return instance
end

function Layer:presentationLayer( )
	return self._presentationLayer
end

function Layer:modelLayer( )
	return self._modelLayer
end

Layer.defaultValueForKey = function (key)
	
end

Layer.needsDisplayForKey = function ( key )

end

function Layer:shouldArchiveValueForKey( )
	
end

function Layer:setBounds( bounds )
	if self._bounds ~= bounds then
		self._bounds = bounds
	end
end

function Layer:bounds( )
	return self._bounds
end

function Layer:setPosition(p)
    if self._position ~= p then
        self._position = p
    end
end

function Layer:position()
    return self._position
end

function Layer:setZPosition(zp)
    if self._zPosition ~= zp then
        self._zPosition = zp
    end
end

function Layer:zPosition()
    return self._zPosition
end

function Layer:setAnchorPoint(ap)
    if self._anchorPoint ~= ap then
        self._anchorPoint = ap
    end
end

function Layer:anchorPoint()
    return self._anchorPoint
end

function Layer:setAnchorPointZ(apz)
    if self._anchorPointZ ~= apz then
        self._anchorPointZ = apz
    end
end

function Layer:anchorPointZ()
    return self._anchorPointZ
end

function Layer:setTransform(t)
    if self._transform ~= t then
        self._transform = t
    end
end

function Layer:transform()
    return self._transform
end

function Layer:affineTransform()
    return self._affineTransform
end

function Layer:setAffineTransform(m)
    if self._affineTransform ~= m then
        self._affineTransform = m
    end
end

function Layer:setFrame(f)
    if self._frame ~= f then
        self._frame = f
    end
end

function Layer:frame()
    return self._frame
end

function Layer:setHidden(h)
    if self._hidden ~= h then
        self._hidden = h
    end
end

function Layer:hidden()
    return self._hidden
end

function Layer:setDoubleSided(ds)
    if self._doubleSided ~= ds then
        self._doubleSided = ds
    end
end

function Layer:isDoubleSided()
    return self._doubleSided
end

function Layer:setGeometryFlipped(gf)
    if self._geometryFlipped ~= gf then
        self._geometryFlipped = gf
    end
end

function Layer:isGeometryFlipped()
    return self._geometryFlipped
end

function Layer:contentsAreFlipped()
    return self._contentsAreFlipped
end

function Layer:superlayer()
    return self._superlayer
end

function Layer:removeFromSuperlayer()
    --TODO
end

function Layer:sublayers()
    --TODO
end

function Layer:addSublayer(l)

end

function Layer:insertSublayerAtIndex(l, idx)

end

function Layer:insertSublayerBelow(l, sibling)

end

function Layer:insertSublayerAbove(l, sibling)

end

function Layer:replaceSublayerWith(l, l2)

end

function Layer:setSublayerTransform(m)

end

function Layer:sublayerTransform()

end

function Layer:setMask(m)

end

function Layer:mask()

end

function Layer:setMasksToBounds(mb)

end

function Layer:masksToBounds()

end
-- prama mark -
function Layer:convertPointFromLayer(p, l)

end

function Layer:convertPointToLayer(p, l)

end

function Layer:convertRectFromLayer(r, l)

end

function Layer:convertRectToLayer(r, l)

end

function Layer:convertTimeFromLayer(t, l)

end

function Layer:convertTimeToLayer(t, l)

end

function Layer:hitTest(p)

end

function Layer:containsPoint(p)

end

function Layer:setContents(c)

end

function Layer:contents()
end

--[[ A rectangle in normalized image coordinates defining the
* subrectangle of the `contents' property that will be drawn into the
* layer. If pixels outside the unit rectangles are requested, the edge
* pixels of the contents image will be extended outwards. If an empty
* rectangle is provided, the results are undefined. Defaults to the
* unit rectangle [0 0 1 1]. Animatable. --]]
function Layer:setContentsRect(r)

end

function Layer:contentsRect()

end

--[[ A string defining how the contents of the layer is mapped into its
* bounds rect. Options are `center', `top', `bottom', `left',
* `right', `topLeft', `topRight', `bottomLeft', `bottomRight',
* `resize', `resizeAspect', `resizeAspectFill'. The default value is
* `resize'. Note that "bottom" always means "Minimum Y" and "top"
* always means "Maximum Y". --]]
function Layer:setContentsGravity(g)

end

function Layer:contentsGravity()

end

--[[ Defines the scale factor applied to the contents of the layer. If
* the physical size of the contents is '(w, h)' then the logical size
* (i.e. for contentsGravity calculations) is defined as '(w /
* contentsScale, h / contentsScale)'. Applies to both images provided
* explicitly and content provided via -drawInContext: (i.e. if
* contentsScale is two -drawInContext: will draw into a buffer twice
* as large as the layer bounds). Defaults to one. Animatable. --]]
function Layer:setContentsScale(s) end
function Layer:contentsScale() end

--[[ A rectangle in normalized image coordinates defining the scaled
* center part of the `contents' image.
*
* When an image is resized due to its `contentsGravity' property its
* center part implicitly defines the 3x3 grid that controls how the
* image is scaled to its drawn size. The center part is stretched in
* both dimensions; the top and bottom parts are only stretched
* horizontally; the left and right parts are only stretched
* vertically; the four corner parts are not stretched at all. (This is
* often called "9-slice scaling".)
*
* The rectangle is interpreted after the effects of the `contentsRect'
* property have been applied. It defaults to the unit rectangle [0 0 1
* 1] meaning that the entire image is scaled. As a special case, if
* the width or height is zero, it is implicitly adjusted to the width
* or height of a single source pixel centered at that position. If the
* rectangle extends outside the [0 0 1 1] unit rectangle the result is
* undefined. Animatable. --]]
function Layer:setContentCenter(r) end
function Layer:contentCenter() end
-- CGRect contentsCenter;

--[[ The filter types to use when rendering the `contents' property of
* the layer. The minification filter is used when to reduce the size
* of image data, the magnification filter to increase the size of
* image data. Currently the allowed values are `nearest' and `linear'.
* Both properties default to `linear'. --]]

function Layer:setMinificationFilter(mf) end
function Layer:minificationFilter() end

function Layer:setMagnificationFilter(mf) end
function Layer:magnificationFilter() end
--(copy) NSString *minificationFilter, *magnificationFilter;

--[[ The bias factor added when determining which levels of detail to use
* when minifying using trilinear filtering. The default value is 0.
* Animatable. --]]
function Layer:setMinificationFilterBias(mfb) end
function Layer:minificationFilterBias() end
-- float minificationFilterBias;

--[[ A hint marking that the layer contents provided by -drawInContext:
* is completely opaque. Defaults to NO. Note that this does not affect
* the interpretation of the `contents' property directly. --]]
function Layer:setOpaque(o) end
function Layer:isOpaque() end
--(getter=isOpaque) BOOL opaque;

--[[ Reload the content of this layer. Calls the -drawInContext: method
* then updates the `contents' property of the layer. Typically this is
* not called directly. --]]
function Layer:display() end

--[[ Marks that -display needs to be called before the layer is next
* committed. If a region is specified, only that region of the layer
* is invalidated. --]]

function Layer:setNeedsDisplay() end
function Layer:setNeedsDisplayInRect(r) end

--[[ Returns true when the layer is marked as needing redrawing. --]]

function Layer:needsDisplay() end

--[[ Call -display if receiver is marked as needing redrawing. --]]

function Layer:displayIfNeeded() end

--[[ When true -setNeedsDisplay will automatically be called when the
* bounds of the layer changes. Default value is NO. --]]
function Layer:needsDisplayOnBoundsChange() end
-- BOOL needsDisplayOnBoundsChange;

--[[ When true, the CGContext object passed to the -drawInContext: method
* may queue the drawing commands submitted to it, such that they will
* be executed later (i.e. asynchronously to the execution of the
* -drawInContext: method). This may allow the layer to complete its
* drawing operations sooner than when executing synchronously. The
* default value is NO. --]]
function Layer:drawsAsynchronously() end
-- BOOL drawsAsynchronously;

--[[ Called via the -display method when the `contents' property is being
* updated. Default implementation does nothing. The context may be
* clipped to protect valid layer content. Subclasses that wish to find
* the actual region to draw can call CGContextGetClipBoundingBox(). --]]

function Layer:drawInContext(ctx) end

--[[* Rendering properties and methods. *--]]

--[[ Renders the receiver and its sublayers into 'ctx'. This method
* renders directly from the layer tree. Renders in the coordinate space
* of the layer.
*
* WARNING: currently this method does not implement the full
* CoreAnimation composition model, use with caution. --]]

function Layer:renderInContext(ctx) end

--[[ Defines how the edges of the layer are rasterized. For each of the
* four edges (left, right, bottom, top) if the corresponding bit is
* set the edge will be antialiased. Typically this property is used to
* disable antialiasing for edges that abut edges of other layers, to
* eliminate the seams that would otherwise occur. The default value is
* for all edges to be antialiased. --]]
function Layer:setEdgeAntialiasingMask(mask) end
function Layer:edgeAntialiasingMask() end
-- CAEdgeAntialiasingMask edgeAntialiasingMask;

--[[ When true this layer is allowed to antialias its edges, as requested
* by the value of the edgeAntialiasingMask property.
*
* The default value is read from the boolean UIViewEdgeAntialiasing
* property in the main bundle's Info.plist. If no value is found in
* the Info.plist the default value is NO. --]]
function Layer:setAllowsEdgeAntialiasing(flag) end
function Layer:allowsEdgeAntialiasing() end
-- BOOL allowsEdgeAntialiasing;

--[[ The background color of the layer. Default value is nil. Colors
* created from tiled patterns are supported. Animatable. --]]
function Layer:setBackgroundColor(c) end
function Layer:backgroundColor() end
-- CGColorRef backgroundColor;

--[[ When positive, the background of the layer will be drawn with
* rounded corners. Also effects the mask generated by the
* `masksToBounds' property. Defaults to zero. Animatable. --]]
function Layer:setCornerRadius(r) end
function Layer:cornerRadius() end
-- CGFloat cornerRadius;

--[[ The width of the layer's border, inset from the layer bounds. The
* border is composited above the layer's content and sublayers and
* includes the effects of the `cornerRadius' property. Defaults to
* zero. Animatable. --]]
function Layer:setBorderWidth(w) end
function Layer:borderWidth() end
-- CGFloat borderWidth;

--[[ The color of the layer's border. Defaults to opaque black. Colors
* created from tiled patterns are supported. Animatable. --]]
function Layer:setBorderColor(c) end
function Layer:borderColor() end
-- CGColorRef borderColor;

--[[ The opacity of the layer, as a value between zero and one. Defaults
* to one. Specifying a value outside the [0,1] range will give undefined
* results. Animatable. --]]
function Layer:setOpacity(f) end
function Layer:opacity() end
-- float opacity;

--[[ When true, and the layer's opacity property is less than one, the
* layer is allowed to composite itself as a group separate from its
* parent. This gives the correct results when the layer contains
* multiple opaque components, but may reduce performance.
*
* The default value of the property is read from the boolean
* UIViewGroupOpacity property in the main bundle's Info.plist. If no
* value is found in the Info.plist the default value is YES for
* applications linked against the iOS 7 SDK or later and NO for
* applications linked against an earlier SDK. --]]
function Layer:setAllowsGroupOpacity(f) end
function Layer:allowsGroupOpacity() end
-- BOOL allowsGroupOpacity;

--[[ A filter object used to composite the layer with its (possibly
        * filtered) background. Default value is nil, which implies source-
* over compositing. Animatable.
*
* Note that if the inputs of the filter are modified directly after
* the filter is attached to a layer, the behavior is undefined. The
* filter must either be reattached to the layer, or filter properties
* should be modified by calling -setValue:forKeyPath: on each layer
* that the filter is attached to. (This also applies to the `filters'
* and `backgroundFilters' properties.) --]]
function Layer:setCompositingFilter(f) end
function Layer:compositingFilter() end
--(strong) id compositingFilter;

--[[ An array of filters that will be applied to the contents of the
* layer and its sublayers. Defaults to nil. Animatable. --]]
function Layer:setFilters(fs) end
function Layer:filters() end
--(copy) NSArray *filters;

--[[ An array of filters that are applied to the background of the layer.
* The root layer ignores this property. Animatable. --]]
function Layer:setBackgroundFilters(bs) end
function Layer:backgroundFilters() end
--(copy) NSArray *backgroundFilters;

--[[ When true, the layer is rendered as a bitmap in its local coordinate
* space ("rasterized"), then the bitmap is composited into the
* destination (with the minificationFilter and magnificationFilter
* properties of the layer applied if the bitmap needs scaling).
* Rasterization occurs after the layer's filters and shadow effects
* are applied, but before the opacity modulation. As an implementation
* detail the rendering engine may attempt to cache and reuse the
* bitmap from one frame to the next. (Whether it does or not will have
* no affect on the rendered output.)
*
* When false the layer is composited directly into the destination
* whenever possible (however, certain features of the compositing
* model may force rasterization, e.g. adding filters).
*
* Defaults to NO. Animatable. --]]
function Layer:setShouldRasterize(f) end
function Layer:shouldRasterize() end
-- BOOL shouldRasterize;

--[[ The scale at which the layer will be rasterized (when the
* shouldRasterize property has been set to YES) relative to the
* coordinate space of the layer. Defaults to one. Animatable. --]]
function Layer:setRasterizationScale(s) end
function Layer:rasterizationScale() end
-- CGFloat rasterizationScale;

--[[* Shadow properties. *--]]

--[[ The color of the shadow. Defaults to opaque black. Colors created
* from patterns are currently NOT supported. Animatable. --]]
function Layer:setShadowColor(c) end
function Layer:shadowColor() end
-- CGColorRef shadowColor;

--[[ The opacity of the shadow. Defaults to 0. Specifying a value outside the
* [0,1] range will give undefined results. Animatable. --]]
function Layer:setShadowOpacity(f) end
function Layer:shadowOpacity() end
-- float shadowOpacity;

--[[ The shadow offset. Defaults to (0, -3). Animatable. --]]
function Layer:setShadowOffset(size) end
function Layer:shadowOffset() end
-- CGSize shadowOffset;

--[[ The blur radius used to create the shadow. Defaults to 3. Animatable. --]]
function Layer:setShadowRadius(r) end
function Layer:shadowRadius() end
-- CGFloat shadowRadius;

--[[ When non-null this path defines the outline used to construct the
* layer's shadow instead of using the layer's composited alpha
* channel. The path is rendered using the non-zero winding rule.
* Specifying the path explicitly using this property will usually
* improve rendering performance, as will sharing the same path
* reference across multiple layers. Defaults to null. Animatable. --]]
function Layer:setShadowPath(p) end
function Layer:shadowPath() end
-- CGPathRef shadowPath;

--[[* Layout methods. *--]]

--[[ Returns the preferred frame size of the layer in the coordinate
* space of the superlayer. The default implementation calls the layout
* manager if one exists and it implements the -preferredSizeOfLayer:
* method, otherwise returns the size of the bounds rect mapped into
* the superlayer. --]]

function Layer:preferredFrameSize() end

--[[ Marks that -layoutSublayers needs to be invoked on the receiver
* before the next update. If the receiver's layout manager implements
* the -invalidateLayoutOfLayer: method it will be called.
*
* This method is automatically invoked on a layer whenever its
* `sublayers' or `layoutManager' property is modified, and is invoked
* on the layer and its superlayer whenever its `bounds' or `transform'
* properties are modified. Implicit calls to -setNeedsLayout are
* skipped if the layer is currently executing its -layoutSublayers
* method. --]]

function Layer:setNeedsLayout() end

--[[ Returns true when the receiver is marked as needing layout. --]]
function Layer:needsLayout() end

--[[ Traverse upwards from the layer while the superlayer requires layout.
* Then layout the entire tree beneath that ancestor. --]]

function Layer:layoutIfNeeded() end

--[[ Called when the layer requires layout. The default implementation
* calls the layout manager if one exists and it implements the
* -layoutSublayersOfLayer: method. Subclasses can override this to
* provide their own layout algorithm, which should set the frame of
* each sublayer. --]]

function Layer:layoutSublayers() end

--[[* Action methods. *--]]

--[[ An "action" is an object that responds to an "event" via the
* CAAction protocol (see below). Events are named using standard
* dot-separated key paths. Each layer defines a mapping from event key
* paths to action objects. Events are posted by looking up the action
* object associated with the key path and sending it the method
* defined by the CAAction protocol.
*
* When an action object is invoked it receives three parameters: the
* key path naming the event, the object on which the event happened
* (i.e. the layer), and optionally a dictionary of named arguments
* specific to each event.
*
* To provide implicit animations for layer properties, an event with
* the same name as each property is posted whenever the value of the
* property is modified. A suitable CAAnimation object is associated by
* default with each implicit event (CAAnimation implements the action
* protocol).
*
* The layer class also defines the following events that are not
* linked directly to properties:
*
* onOrderIn
*	Invoked when the layer is made visible, i.e. either its
*	superlayer becomes visible, or it's added as a sublayer of a
*	visible layer
*
* onOrderOut
*	Invoked when the layer becomes non-visible. --]]

--[[ Returns the default action object associated with the event named by
* the string 'event'. The default implementation returns a suitable
* animation object for events posted by animatable properties, nil
* otherwise. --]]

Layer.defaultActionForKey = function(event) end

--[[ Returns the action object associated with the event named by the
* string 'event'. The default implementation searches for an action
* object in the following places:
*
* 1. if defined, call the delegate method -actionForLayer:forKey:
* 2. look in the layer's `actions' dictionary
* 3. look in any `actions' dictionaries in the `style' hierarchy
* 4. call +defaultActionForKey: on the layer's class
*
* If any of these steps results in a non-nil action object, the
* following steps are ignored. If the final result is an instance of
* NSNull, it is converted to `nil'. --]]

function Layer:actionForKey(event) end;

--[[ A dictionary mapping keys to objects implementing the CAAction
* protocol. Default value is nil. --]]
function Layer:setActions(actions) end
function Layer:actions() end
--(copy) NSDictionary *actions;

--[[* Animation methods. *--]]

--[[ Attach an animation object to the layer. Typically this is implicitly
* invoked through an action that is an CAAnimation object.
*
* 'key' may be any string such that only one animation per unique key
* is added per layer. The special key 'transition' is automatically
* used for transition animations. The nil pointer is also a valid key.
*
* If the `duration' property of the animation is zero or negative it
* is given the default duration, either the value of the
* `animationDuration' transaction property or .25 seconds otherwise.
*
* The animation is copied before being added to the layer, so any
* subsequent modifications to `anim' will have no affect unless it is
* added to another layer. --]]

function Layer:addAnimationForKey(anim , key) end;

--[[ Remove all animations attached to the layer. --]]

function Layer:removeAllAnimations() end

--[[ Remove any animation attached to the layer for 'key'. --]]

function Layer:removeAnimationForKey(key) end;

--[[ Returns an array containing the keys of all animations currently
* attached to the receiver. The order of the array matches the order
* in which animations will be applied. --]]
function Layer:animationKeys() end

--[[ Returns the animation added to the layer with identifier 'key', or nil
* if no such animation exists. Attempting to modify any properties of
* the returned object will result in undefined behavior. --]]
function Layer:animationForKey(key) end

--[[* Miscellaneous properties. *--]]

--[[ The name of the layer. Used by some layout managers. Defaults to nil. --]]
function Layer:setName(n) end
function Layer:name() end
--(copy) NSString *name;

--[[ An object that will receive the CALayer delegate methods defined
* below (for those that it implements). The value of this property is
* not retained. Default value is nil. --]]
function Layer:setDelegate(d) end
function Layer:delegate() end
--(weak) id delegate;

--[[ When non-nil, a dictionary dereferenced to find property values that
* aren't explicitly defined by the layer. (This dictionary may in turn
* have a `style' property, forming a hierarchy of default values.)
* If the style dictionary doesn't define a value for an attribute, the
* +defaultValueForKey: method is called. Defaults to nil.
*
* Note that if the dictionary or any of its ancestors are modified,
* the values of the layer's properties are undefined until the `style'
* property is reset. --]]
function Layer:setStyle(style) end
function Layer:style() end
--(copy) NSDictionary *style;



VA.Layer = Layer

return Layer
