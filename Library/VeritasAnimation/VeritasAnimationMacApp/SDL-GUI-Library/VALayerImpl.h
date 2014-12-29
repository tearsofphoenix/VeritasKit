//
// Created by Mac003 on 14/12/29.
// Copyright (c) 2014 NewGrace. All rights reserved.
//


#ifndef __VALayerImpl_H_
#define __VALayerImpl_H_

#include <SDL/SDL.h>
#include "GUIUtility.h"
#include "GUIImage.h"
#include <vector>

using  namespace std;

namespace GUI
{
    struct VGSize
    {
        float w;
        float h;
    };

    struct VGRect
    {
        VGPoint origin;
        VGSize  size;
    };

    static inline VGRect VGRectMake(float x, float y, float w, float h) {
        return {VGPoint(x, y), {w, h}};
    }

    struct VALayerImpl
    {
        VGRect _bounds;
        bool changed;
        int w,h;
        VGPoint pos;

        void *_layerDelegate;
        VALayerImpl *_superLayer;
        vector<VALayerImpl *> *_sublayers;

        VALayerImpl(int w_, int h_);

        virtual ~VALayerImpl();

        SDL_Surface* image;
        SDL_Surface* display;   // includes children drawn on.

        bool is_alpha;
        SDL_Color clear_color; // only valid if is_alpha == true

        VGRect getBounds(void);
        void setBounds(VGRect bounds);

        // Redraw any children that have changed onto self. Return true if changed.
        void refresh();

        void draw_onto_self(const GUIImage &image_, VGPoint pos);
        void fill_with_color(SDL_Color color);

        void render_image(SDL_Surface* source, int w, int h, VGPoint pos);

        // Will be true if a subview has been changed.
        bool need_to_refresh() const { return changed; }

        VGPoint get_abs_pos() const; // Pos on screen
        VGPoint get_rel_pos() const; // Pos on parent

        // returns true if coord is within this view's rectangle.
        bool rel_point_is_on_me(VGPoint coord) const;
        bool abs_point_is_on_me(VGPoint coord) const;


        int get_w() const { return w; }
        int get_h() const { return h; }


        void resize(int w, int h);

        void set_clear_color(SDL_Color clear_color);
        void clear_alpha();

        bool has_alpha_color() const { return is_alpha; }
        // Only valid if has_alpha_color.
        SDL_Color get_clear_color() const { return clear_color; }

        // returns true if pixel at coord is of clear color.
        // If coord is not on view, or alhpa not set, will return false.
        bool point_is_clear(VGPoint coord) const;

        void mark_changed();

        void removeFromSuperLayer(void);
        void addSubLayer(VALayerImpl *layer, VGPoint pos);

        VGPoint abs_from_rel(VGPoint coord) const;
        VGPoint adjust_to_parent(VGPoint coord) const;
        VGPoint adjust_to_rel(VGPoint coord) const;

        void setPos(VGPoint pos);
        VGPoint getPos(void) const;
        virtual void did_resize(int w_, int h_) { }
    };
}


#endif //__VALayerImpl_H_
