//
// Created by Mac003 on 14/12/29.
// Copyright (c) 2014 NewGrace. All rights reserved.
//

#include "VALayerImpl.h"
#include "GUIImage.h"
#include "GameDisplay.h"
#include <string>

using namespace std;

namespace GUI
{
    static SDL_Surface* prepare_SDL_surface(int w, int h) {

        Uint32 rmask, gmask, bmask, amask;

#if SDL_BYTEORDER == SDL_BIG_ENDIAN
    rmask = 0xff000000;
    gmask = 0x00ff0000;
    bmask = 0x0000ff00;
    amask = 0x000000ff;
#else
        rmask = 0x000000ff;
        gmask = 0x0000ff00;
        bmask = 0x00ff0000;
        amask = 0xff000000;
#endif

        SDL_Surface *temp = SDL_CreateRGBSurface(SDL_HWSURFACE, w, h, 32,
                rmask, gmask, bmask, amask);
        if(temp == NULL) {
            throw Error("CreateRGBSurface failed: \n" + string(SDL_GetError()));
        }
        SDL_Surface* image = SDL_DisplayFormat(temp);
        if(!image) {
            throw Error("updateimage in CreateRGBSurface failed: \n" + string(SDL_GetError()));
        }
        SDL_FreeSurface(temp);

        return image;
    }

    VALayerImpl::VALayerImpl(int w_, int h_) : _superLayer(NULL)
    {
        w = w_;
        h = h_;
        changed = false;
        is_alpha = false;
        image = prepare_SDL_surface(w_, h_);
        display = prepare_SDL_surface(w_, h_);
        _bounds = VGRectMake(0, 0, w_, h_);
        _sublayers = new vector<VALayerImpl *>;
    }

    VALayerImpl::~VALayerImpl()
    {
        for (int i = 0; i < _sublayers->size(); ++ i) {
            (*_sublayers)[i]->removeFromSuperLayer();
        }

        SDL_FreeSurface(image);
        SDL_FreeSurface(display);
    }

    VGRect VALayerImpl::getBounds()
    {
        return _bounds;
    }

    void VALayerImpl::setBounds(VGRect bounds)
    {
        _bounds = bounds;
    }


    void VALayerImpl::draw_onto_self(const GUIImage &image_, VGPoint pos) {

        mark_changed();

        // Using SDL, perform a blit from view to self.
        SDL_Rect dest_rect = {static_cast<Sint16>(pos.x), static_cast<Sint16>(pos.y), static_cast<Uint16>(image_->w), static_cast<Uint16>(image_->h)};
        SDL_BlitSurface(image_, 0, image, &dest_rect);

    }
    void VALayerImpl::fill_with_color(SDL_Color color) {

        draw_onto_self(GUIImage::create_filled(w, h, color), VGPoint());
    }


// Draws image onto display.
    void VALayerImpl::render_image(SDL_Surface* source, int w, int h, VGPoint pos) {

        // Using SDL, perform a blit from view to self.
        SDL_Rect dest_rect = {static_cast<Sint16>(pos.x), static_cast<Sint16>(pos.y), static_cast<Uint16>(w), static_cast<Uint16>(h)};
        SDL_BlitSurface(source, 0, display, &dest_rect);
    }

    void VALayerImpl::set_clear_color(SDL_Color clear_color_) {

        is_alpha = true;
        clear_color = clear_color_;
        Uint32 colorkey = SDL_MapRGBA(image->format, clear_color.r, clear_color.g, clear_color.b, clear_color.unused);
        SDL_SetColorKey(display, SDL_SRCCOLORKEY, colorkey); // reset alpha
    }
    void VALayerImpl::clear_alpha() {

        is_alpha = false;
        SDL_SetColorKey(display, 0, 0); // reset alpha
    }

    bool VALayerImpl::point_is_clear(VGPoint coord) const {

        if (!rel_point_is_on_me(coord) || !has_alpha_color()) {
            return true;
        }
        Uint32 pixel = getpixel(image, coord.x, coord.y);
        if (pixel == SDL_MapRGB(image->format, clear_color.r, clear_color.g, clear_color.b)) {
            return true;
        }
        return false;
    }


    void VALayerImpl::mark_changed() {

        changed = true;

        if (_superLayer){
            _superLayer->mark_changed();
        }

        if (_sublayers->size() > 1) {

            /// @TODO Perhaps the sorting method should be optional?
            ///  Either by x,y or by order attached?

//        children.sort(x_then_y_view_less_than);
        }
    }


    void VALayerImpl::refresh() {

        if (!need_to_refresh()) return;

        // Refresh self. (First display image, then each child.)

        render_image(image, w, h, VGPoint(0,0));

        for (int i = 0; i < _sublayers->size(); ++ i) {
            VALayerImpl *layer = (*_sublayers)[i];
            layer->refresh();
            render_image(layer->display, layer->w, layer->h, layer->pos);
        }

        changed = false;
    }

    void VALayerImpl::removeFromSuperLayer(void)
    {
        if (_superLayer) {
            vector<VALayerImpl *> *layers = _superLayer->_sublayers;
            int idx = -1;
            for (int i = 0; i < layers->size(); ++i) {
                if ((*layers)[i] == this) {
                    idx = i;
                    break;
                }
            }

            layers->erase(layers->begin() + idx, layers->begin() + idx);
        }
    }

    void VALayerImpl::addSubLayer(VALayerImpl *layer, VGPoint pos)
    {
        layer->removeFromSuperLayer();

        if (layer == this)
            throw Error("Cannot attach a view to itself!");

        /// @todo Check if out of bounds? Or maybe not..?
        layer->pos = pos;
        _sublayers->push_back(layer);
        layer->_superLayer = this;

        mark_changed();
    }

    bool VALayerImpl::rel_point_is_on_me(VGPoint coord) const {

        return (coord.x >= 0 && coord.y >= 0
                && coord.x < w && coord.y < h);
    }
//bool VALayerImpl::rel_point_is_on_me(VGPoint coord) {
//
//    return (coord.x >= pos.x && coord.y >= pos.y
//            && coord.x < pos.x + w && coord.y < pos.y + h);
//}
    bool VALayerImpl::abs_point_is_on_me(VGPoint coord) const {

        VGPoint abs_pos = get_abs_pos();
        return (coord.x >= abs_pos.x && coord.y >= abs_pos.y
                && coord.x < abs_pos.x + w && coord.y < abs_pos.y + h);
    }


    VGPoint VALayerImpl::abs_from_rel(VGPoint coord) const {

        VGPoint abs_pos = get_abs_pos();
        return VGPoint(abs_pos.x + coord.x,
                abs_pos.y + coord.y);
    }
    VGPoint VALayerImpl::adjust_to_parent(VGPoint coord) const {
        return VGPoint(coord.x + pos.x, coord.y + pos.y);
    }
    VGPoint VALayerImpl::adjust_to_rel(VGPoint coord) const {
        return VGPoint(coord.x - pos.x, coord.y - pos.y);
    }


    VGPoint VALayerImpl::get_abs_pos() const {
        if (_superLayer == 0) return pos;
        else {
            VGPoint parent_abs_pos = _superLayer->get_abs_pos();
            return VGPoint(parent_abs_pos.x + pos.x,
                    parent_abs_pos.y + pos.y);
        }
    }
    VGPoint VALayerImpl::get_rel_pos() const {
        return pos;
    }


    void VALayerImpl::resize(int w_, int h_) {

        if (w == w_ && h == h_) {

            did_resize(w_,h_);
            return;
        }

        w = w_; h = h_;
        VALayerImpl temp(w,h);

        std::swap(image, temp.image);
        std::swap(display, temp.display);

        if (is_alpha) {
            set_clear_color(clear_color);
            fill_with_color(clear_color);
        }

        SDL_Rect dest_rect = {0, 0, static_cast<Uint16>(w), static_cast<Uint16>(h)};
        SDL_BlitSurface(temp.image, 0, image, &dest_rect);

        mark_changed();
        did_resize(w_,h_);
    }

    void VALayerImpl::setPos(VGPoint p) {

        if (!VGPointEqual(pos, p)) {
            pos = p;
            mark_changed();
        }
    }
    VGPoint VALayerImpl::getPos(void) const {
        return pos;
    }
}

