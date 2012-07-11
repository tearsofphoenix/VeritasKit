//
//  LuaUIKit.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIKit.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"

#import "LuaCoreGraphics.h"

#import "LuaUIAccessibility.h"
#import "LuaUIAccessibilityConstants.h"
#import "LuaUIAccessibilityZoom.h"
#import "LuaUIActionSheet.h"
#import "LuaUIActivityIndicatorView.h"
#import "LuaUIAlertView.h"
#import "LuaUIApplication.h"
#import "LuaUIBarButtonItem.h"
#import "LuaUIBezierPath.h"
#import "LuaUIButton.h"
#import "LuaUIControl.h"
#import "LuaUIDataDetectors.h"
#import "LuaUIDatePicker.h"
#import "LuaUIDevice.h"
#import "LuaUIDocument.h"
#import "LuaUIEvent.h"
#import "LuaUIGeometry.h"
#import "LuaUIGestureRecognizer.h"
#import "LuaUIGraphics.h"
#import "LuaUIImage.h"
#import "LuaUIImagePickerController.h"
#import "LuaUIInterface.h"
#import "LuaUIMenuController.h"
#import "LuaUIPageViewController.h"
#import "LuaUIPopoverController.h"
#import "LuaUIPrintError.h"
#import "LuaUIPrintInfo.h"
#import "LuaUIProgressView.h"
#import "LuaUIScreen.h"
#import "LuaUIScrollView.h"
#import "LuaUISearchBar.h"
#import "LuaUISegmentedControl.h"
#import "LuaUIStringDrawing.h"
#import "LuaUISwipeGestureRecognizer.h"
#import "LuaUITabBarItem.h"
#import "LuaUITableView.h"
#import "LuaUITableViewCell.h"
#import "LuaUITextField.h"
#import "LuaUITextInput.h"
#import "LuaUITextInputTraits.h"
#import "LuaUIToolbar.h"
#import "LuaUIView.h"
#import "LuaUIViewController.h"
#import "LuaUIWebView.h"

int LuaOpenUIKit(lua_State *L)
{
    //load CoreGraphics
    //
    LuaOpenCoreGraphics(L);
        
    LuaOpenUIAccessibility(L);
    LuaOpenUIAccessibilityConstants(L);
    LuaOpenUIAccessibilityZoom(L);
    LuaOpenUIActionSheet(L);
    LuaOpenUIActivityIndicatorView(L);
    LuaOpenUIAlertView(L);
    LuaOpenUIApplication(L);
    LuaOpenUIBarButtonItem(L);
    LuaOpenUIBezierPath(L);
    LuaOpenUIButton(L);
    LuaOpenUIControl(L);
    LuaOpenUIDataDetectors(L);
    LuaOpenUIDatePicker(L);
    LuaOpenUIDevice(L);
    LuaOpenUIDocument(L);
    LuaOpenUIEvent(L);
    LuaOpenUIGeometry(L);
    LuaOpenUIGestureRecognizer(L);
    LuaOpenUIGraphics(L);
    LuaOpenUIImage(L);
    LuaOpenUIImagePickerController(L);
    LuaOpenUIInterface(L);
    LuaOpenUIMenuController(L);
    LuaOpenUIPageViewController(L);
    LuaOpenUIPopoverController(L);
    LuaOpenUIPrintError(L);
    LuaOpenUIPrintInfo(L);
    LuaOpenUIProgressView(L);
    LuaOpenUIScreen(L);
    LuaOpenUIScrollView(L);
    LuaOpenUISearchBar(L);
    LuaOpenUISegmentedControl(L);
    LuaOpenUIStringDrawing(L);
    LuaOpenUISwipeGestureRecognizer(L);
    LuaOpenUITabBarItem(L);
    LuaOpenUITableView(L);
    LuaOpenUITableViewCell(L);
    LuaOpenUITextField(L);
    LuaOpenUITextInput(L);
    LuaOpenUITextInputTraits(L);
    LuaOpenUIToolbar(L);
    LuaOpenUIView(L);
    LuaOpenUIViewController(L);
    LuaOpenUIWebView(L);

    return 0;
}
