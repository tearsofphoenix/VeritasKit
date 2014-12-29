
#ifndef GUIUTILITY_H
#define GUIUTILITY_H

#include <string>
#include "stdint.h"

namespace GUI {

// a simple class for error exceptions - msg points to a C-string error message
struct Error {
	Error(std::string in_msg) : msg(in_msg) { }
	std::string msg;
};

// an exception class for handling Errors not caused by the User. Probably should not output these in a release.
struct GUIProgramming_Error {
	GUIProgramming_Error(std::string in_msg) : msg(in_msg) { }
	std::string msg;
};


//template <typename In, typename Out, typename Pred>
//Out copy_if(In first, In last, Out res, Pred p) {
//	
//	while (first != last) {
//		if (p(*first)) {
//			*res++ = *first;
//		}
//		++first;
//	}
//	return res;
//}
//
//inline double square (double x){
//	return x*x;
//}

class Coord;
struct VGPoint {
	
	VGPoint() : x(0), y(0) { }
	VGPoint(int x_, int y_) : x(x_), y(y_) { }

	
    bool operator== (VGPoint b) {
        return (x == b.x && y == b.y); 
    }
    VGPoint operator+ (VGPoint b) {
        return VGPoint(x + b.x, y + b.y);
    }
    VGPoint operator- (VGPoint b) {
        return VGPoint(x - b.x, y - b.y);
    }

	VGPoint(const Coord& coord);
	int x,y;
};

    static inline bool VGPointEqual(VGPoint p1, VGPoint p2) {
        return p1.x == p2.x && p1.y == p2.y;
    }

void initSDL(unsigned int flags);
// initializes the SDL with the given flags. Returns -1 if fails and prints error. 0 otherwise.
// also sets SDL to close at exit.

    
} // namespace GUI



#endif /* GUIUTILITY_H */
