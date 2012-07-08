#import <UIKit/UIKit.h>
#import "NSSuperHandler.h"

@protocol BoCPressAuthor;
//@protocol NSSuperHandler;

@interface BoCPressCriticView: UIView<NSSuperHandler>
{
    id<BoCPressAuthor> _critic;
    UIImageView *_backgroundView;
    UIImageView *_avatarView;
    UIImage *_avatarImage;
    
    UILabel *_authorNameLabel;
    UILabel *_newsAbstractLabel;
}

//- (id)init;

- (id)initWithPageFlag: (id)pageFlag;

- (void)setCritic: (id<BoCPressAuthor>)critic;

- (void)setSelected: (BOOL)selected;
@end
