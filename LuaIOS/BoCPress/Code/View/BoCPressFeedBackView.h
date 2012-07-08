//
//  BoCPressFeedBackView.h
//  BoCPress
//
//  Created by LeixSnake on 6/16/11.
/*************************************************************************

*

* EREACH CONFIDENTIAL

* ____________________

*

* [2011] eReach Mobile Software Technology Co., Ltd.

* All Rights Reserved.

*

* NOTICE: All information contained herein is, and remains the

* property of eReach Mobile Software Technology and its suppliers,

* if any. The intellectual and technical concepts contained herein

* are proprietary to eReach Mobile Software Technology and its

* suppliers and may be covered by U.S. and Foreign Patents, patents

* in process, and are protected by trade secret or copyright law.

* Dissemination of this information or reproduction of this material

* is strictly forbidden unless prior written permission is obtained

* from eReach Mobile Software Technology Co., Ltd.

*/

#import "BoCPressFeedback.h"
#import "BoCPressMarkView.h"

@protocol BoCPressDataSource;
@protocol BoCPressNews;
@protocol BoCPressFeedback;
@protocol BoCPressCallback;

@interface BoCPressFeedBackView : UIView<BoCPressFeedback>
{
    UILabel *_titleLabel;
    UILabel *_contentLabel;
    UIImageView *_backGroundView;

    BoCPressMarkView* _stars;
    
    UIButton* _submitButton;
    UIButton* _cancelButton;
    
    BOOL _feedBackStarStates[kFeedBackStarCount];
            
    int _activeStarCount;
    
    id<BoCPressNews> _news;
    id<BoCPressCallback> _callback;
    id<BoCPressDataSource> _dataSource;
    
    id _averageRate;
    id _rateCount;

}

- (id) initWithNews: (id<BoCPressNews>)news
           callback: (id<BoCPressCallback>) callback
        averageRate: (id) averageRate
          rateCount: (id) rateCount
         dataSource: (id<BoCPressDataSource>)dataSource
         repeatFlag: (id) repeatFlag;

- (void)submitFeedBack;

@end
