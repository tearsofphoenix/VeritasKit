//
//  ScrollView.h
//  Deep
//
//  Created by Nathan Daly on 1/2/13.
//  Copyright (c) 2013 Lions Entertainment. All rights reserved.
//

#ifndef Deep_ScrollView_h
#define Deep_ScrollView_h

#include "GUIView.h"
#include "GUIImageView.h"


namespace GUI {

struct GUITimer_command;

class ScrollView : public View  {
public:
    
    ScrollView(int w_, int h_, View *display_view_);
    ~ScrollView();
    
    void update();
    
    virtual bool handle_mouse_scroll_start(bool up_down);
    virtual bool handle_mouse_scroll_stop(bool up_down);
    
    // Overrided to add or remove the scrollbars.
    virtual void did_resize(int w_, int h_);
    
private:
    
    GUITimer_command *repeater;
    
    class ScrollBarBg : public View {
    public:
        ScrollBarBg(int w_, int h_, ScrollView *view_) 
        : View(w_,h_), view(view_) { }
        
        void display();
        
        virtual bool handle_mouse_down(VGPoint coord);
        
    private:
        ScrollView *view;
    };
    class ScrollBar : public View {
    public:
        ScrollBar(int w_, int h_, ScrollView *view_) 
        : View(w_,h_), view(view_), clicked(false) { }
        
        void display();
        
        virtual bool handle_mouse_down(VGPoint coord);
        virtual bool handle_mouse_up(VGPoint coord);
        virtual bool handle_mouse_motion(VGPoint coord, VGPoint rel_motion);
        
    private:
        ScrollView *view;
        bool clicked;
        VGPoint click;
    };
    class ScrollArrow : public ImageView {
    public:
        ScrollArrow(bool up_down_, const GUIImage& image)
        : ImageView(image), up_down(up_down_) { }
        
        virtual bool handle_mouse_down(VGPoint coord);
        virtual bool handle_mouse_up(VGPoint coord);
        
    private:
        bool up_down;
    };
    
    
    void move_display_to(VGPoint pos);
    void move_scroll_bar_to(VGPoint pos);
    
    ScrollBar scroll_bar;
    ScrollBarBg scroll_bar_bg;
    ScrollArrow arrow_up, arrow_down;

    View *display_view;
    
    int w_init, h_init;
    
    double scroll_y;
    double scroll_y_vel;
    
    bool scrollable; // false if this view is larger than display_view
    bool scrolling; // true if currently holding down scroll wheel/gesture
    
    int scroll_bar_x;
    // Where the scroll bar should stop (set after sizes are determined)
    int scroll_bar_top;
    int scroll_bar_bottom;
};

} // namespace GUI

#endif
