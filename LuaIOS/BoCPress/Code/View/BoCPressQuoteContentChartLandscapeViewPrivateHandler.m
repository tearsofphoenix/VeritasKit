//
//  BoCPressQuoteContentChartLandscapeViewPrivateHandler.m
//  BoCPress
//
//  Created by E-Reach Administrator on 11/21/11.
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

#import "BoCPressQuoteContentChartLandscapeViewPrivateHandler.h"

#import "BoCPressQuoteContentChartLandscapeView.h"

#import "BoCPressConstant.h"

@implementation BoCPressQuoteContentChartLandscapeViewPrivateHandler

- (id)initWithChartView:(BoCPressQuoteContentChartLandscapeView *)chartView
                entries:(NSArray *)entries
{
    if ((self = [super init])) 
    {
        _chartView = chartView;
        _entries = entries;
        
    }
    
    return self;
}

- (void)callbackForAction:(id)action withData:(id)data
{
    if (_callbackFlag)
    {
        if ([kBoCPress_View_updateThumbnailImage isEqualToString:action]) 
        {
            [_chartView updateThumbnailImageWithData:data];
        }else if([kCallbackAction_getChartImageWithImageConfiguration isEqualToString:action])
        {
            [_chartView updateImageConfigurationWithData:data];
        }
    }
}

- (void)wantToUpdateDataByTimer: (NSTimer *)timer
{
    if (_callbackFlag)
    {
        [_chartView wantToUpdateData];
    }else
    {
        [timer invalidate];
    }
}

- (void)handleEntryButtonPressedEvent: (id)sender
{
    [_chartView wantToSwitchToEntryAtIndex: [_entries indexOfObject:sender]];
}

- (void)handleChartViewTouchDownEvent: (id)sender
{
    [_chartView wantToShowDetailImageOfCurrentEntry];
}

@end
