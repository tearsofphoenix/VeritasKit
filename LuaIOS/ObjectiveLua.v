
#import <UIKit/UIKit.h>

#import <QuartzCore/QuartzCore.h>

@interface NUReportLineView: UIView
{
    
    CALayer *_gradientMaskLayer;
    CAGradientLayer *_gradientLayer;
    CAShapeLayer *_shapeLayer;
    
    NSMutableArray *_dotLayers;
    
}

- (void)setLineData: (NSArray *)lineData;

- (void)setLineColor: (UIColor *)lineColor;

@end
