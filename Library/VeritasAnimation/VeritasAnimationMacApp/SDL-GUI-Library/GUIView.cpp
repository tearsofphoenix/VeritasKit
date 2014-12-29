//
//  GUIView.cpp
//  Deep
//
//  Created by Nathan Daly on 9/10/12.
//  Copyright (c) 2012 Lions Entertainment. All rights reserved.
//

#include "GUIView.h"
#include "GUIApp.h"
#include "GUIImage.h"

#include "Compatibility.h"
#include SDL_SDLVIDEO_H

#include "GameDisplay.h" // For pixel manip.
#include "GUIWindow.h" // For Unhandled Click.
#include "GUIApp.h"  // For capture focus


#include <iostream>
#include <algorithm> // For std::find.
using namespace std;


const SDL_Color default_clear_color = {255,0,255,0};

namespace GUI {

static SDL_Surface* prepare_SDL_surface(int w, int h);

View::View(int w_, int h_) 
: _layer(new VALayerImpl(w_, h_))
{

}


View::~View() {

    delete _layer;
}

void View::draw_onto_self(const GUIImage &image_, VGPoint pos) {
    _layer->draw_onto_self(image_, pos);
    }

void View::fill_with_color(SDL_Color color) {

    _layer->fill_with_color(color);
}


// Draws image onto display.
void View::render_image(SDL_Surface* source, int w, int h, VGPoint pos) {

        _layer->render_image(source, w, h, pos);
}

void View::set_clear_color(SDL_Color clear_color_) {
    _layer->set_clear_color(clear_color_);
}
void View::clear_alpha() {
    _layer->clear_alpha();
}

bool View::point_is_clear(VGPoint coord) const {
    return _layer->point_is_clear(coord);
}


//bool x_then_y_view_less_than(const View* a, const View* b) {
//    if (a->pos.x < b->pos.x) return true;
//    else if (a->pos.x == b->pos.x) return (a->pos.y < b->pos.y);
//    else /*(a->pos.x > b->pos.x)*/ return false;
//}

void View::mark_changed() {
    _layer->mark_changed();
}


void View::refresh() {
    _layer->refresh();
    }

    void View::removeFromSuperView(void)
    {
        _layer->removeFromSuperLayer();
        vector<View *> *views = _superView->_subviews;
        auto idx = find(views->begin(), views->end(), this);
        _subviews->erase(idx, idx);
    }

void View::attach_subview(View* view, VGPoint pos) {

    _layer->addSubLayer(view->_layer, pos);
    view->_superView = view;
    _subviews->push_back(view);
}

void View::move_subview(View* view, VGPoint pos) {

    view->_layer->setPos(pos);
}

void View::mouse_down(VGPoint coord) {
    cout << "mouse down!: " << coord.x <<", "<< coord.y << endl;
    
    if (!handle_mouse_down(coord)) {
        if (_superView) _superView->mouse_down(coord + _layer->pos);
//        else throw Unhandled_Click(coord);
    }
}
void View::mouse_up(VGPoint coord) {
    cout << "mouse up!: " << coord.x <<", "<< coord.y << endl;
    
    if (!handle_mouse_up(coord)) {
        if (_superView) _superView->mouse_up(coord + _layer->pos);
//        else throw Unhandled_Click(coord);
    }
}
void View::mouse_motion(VGPoint coord, VGPoint rel_motion) {
//    cout << "mouse motion!: " << rel_motion.x <<", "<< rel_motion.y << endl;
    
    if (!handle_mouse_motion(coord, rel_motion)) {
        if (_superView) _superView->mouse_motion(coord + _layer->pos, rel_motion);
//        else throw Unhandled_Click(coord);
    }
}
void View::mouse_scroll_start(bool up_down) {
    cout << "mouse scroll!: " << (up_down ? "up" : "down") << endl;
    
    if (!handle_mouse_scroll_start(up_down)) {
        if (_superView) _superView->mouse_scroll_start(up_down);
        //        else throw Unhandled_Click(coord);
    }
}void View::mouse_scroll_stop(bool up_down) {
    cout << "mouse scroll!: " << (up_down ? "up" : "down") << endl;
    
    if (!handle_mouse_scroll_stop(up_down)) {
        if (_superView) _superView->mouse_scroll_stop(up_down);
        //        else throw Unhandled_Click(coord);
    }
}


void View::key_down(SDL_keysym key) {
    cout << "key down!: " << key.sym << endl;
    
    if (!handle_key_down(key)) {
//        throw Unhandled_Key(key);
    }
}
void View::key_up(SDL_keysym key) {
    cout << "key up!: " << key.sym << endl;
    
    if (!handle_key_up(key)) {
//        throw Unhandled_Key(key);
    }
}


View* View::get_view_from_point(VGPoint coord) const {
    
    // Can we cache this? Would that be faster?
    
    coord = adjust_to_rel(coord);
    if (!rel_point_is_on_me(coord)) return 0;
        
    // At worst, we know the point is on this view.
    const View* result = this;
    
    // Check if any children have a deeper subview:

    for (auto child = _subviews->begin(); child != _subviews->end(); ++child) {
        
        // Can assume that Views are sorted, so any new best will be above old best.
        View* new_best = (*child)->get_view_from_point(coord);
        if (new_best) {
            result = new_best;
        }
    }
    
    return const_cast<View*>(result);
}

bool View::rel_point_is_on_me(VGPoint coord) const {
    return _layer->rel_point_is_on_me(coord);
}
//bool View::rel_point_is_on_me(VGPoint coord) {
//    
//    return (coord.x >= pos.x && coord.y >= pos.y
//            && coord.x < pos.x + w && coord.y < pos.y + h);
//}
bool View::abs_point_is_on_me(VGPoint coord) const {
        return  _layer->abs_point_is_on_me(coord);
}


VGPoint View::abs_from_rel(VGPoint coord) const {
    
    VGPoint abs_pos = get_abs_pos();
        return VGPoint(abs_pos.x + coord.x,
                         abs_pos.y + coord.y);
}
VGPoint View::adjust_to_parent(VGPoint coord) const {
    return _layer->adjust_to_parent(coord);
}
VGPoint View::adjust_to_rel(VGPoint coord) const {
    return _layer->adjust_to_rel(coord);
}


VGPoint View::get_abs_pos() const {
    return _layer->get_abs_pos();

}
VGPoint View::get_rel_pos() const {
    return _layer->get_rel_pos();
}


void View::resize(int w_, int h_) {
    _layer->resize(w_, h_);
    }





} // namespace GUI

