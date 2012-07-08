#import <UIKit/UIKit.h>

@interface BoCPressCheckView: UIView
{
    UIImageView *_radioView;
    UIImageView *_checkedView;
    UILabel *_label;
    BOOL _checked;
}

- (BOOL)checked;

- (void)setChecked: (BOOL)checked;

- (void)setText: (NSString *)text;

- (NSString *)text;

@end 
