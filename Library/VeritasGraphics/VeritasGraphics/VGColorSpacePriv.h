//
//  VGColorSpacePriv.h
//  VeritasGraphics
//
//  Created by Lei on 12/30/14.
//  Copyright (c) 2014 Lei. All rights reserved.
//

#ifndef VeritasGraphics_VGColorSpacePriv_h
#define VeritasGraphics_VGColorSpacePriv_h

enum VGColorSpaceType {
    
    kVGColorSpaceTypeDeviceUnknown = -1,
    kVGColorSpaceTypeDeviceGray,
    kVGColorSpaceTypeDeviceRGB,
    kVGColorSpaceTypeDeviceCMYK,
    kVGColorSpaceTypeCalibratedGray,
    kVGColorSpaceTypeCalibratedRGB,
    kVGColorSpaceTypeLab,
    kVGColorSpaceTypeICC,
    kVGColorSpaceTypeIndexed,
    kVGColorSpaceTypeDeviceN,
    kVGColorSpaceTypePattern,
    kVGColorSpaceTypeSystemDefaultGray,
    kVGColorSpaceTypeSystemDefaultRGB,
    kVGColorSpaceTypeSystemDefaultCMYK,
    
};
typedef enum VGColorSpaceType VGColorSpaceType;

#endif
