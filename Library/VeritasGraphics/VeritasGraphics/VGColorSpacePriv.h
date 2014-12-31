//
//  VGColorSpacePriv.h
//  VeritasGraphics
//
//  Created by Lei on 12/30/14.
//  Copyright (c) 2014 Lei. All rights reserved.
//

#ifndef VeritasGraphics_VGColorSpacePriv_h
#define VeritasGraphics_VGColorSpacePriv_h

#include "VGBasePriv.h"
#include "VGColorSpace.h"
#include "VGColor.h"

typedef struct VGColorSpace				*VGColorSpaceRef;
typedef struct VGCMSUtilsPlatformSet	*VGCMSUtilsPlatformSetRef;
typedef struct VGNotificationCenter		*VGNotificationCenterRef;
typedef struct VGColorSpaceState		*VGColorSpaceStateRef;

/* constants */
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


typedef bool (*VGColorSpaceEqual)(VGColorSpaceRef cs1, VGColorSpaceRef cs2);

typedef void (*VGColorSpaceFinalize)(CFTypeRef ctf);

typedef void (*VGColorSpaceGetMD5)(unsigned char* md5);

typedef VGFloat* (*VGColorSpaceGetDefaultColorComponents2)(VGColorSpaceRef cs);

typedef VGColorRef (*VGColorSpaceCreateDefaultColor)(VGColorSpaceRef cs);

typedef VGColorSpaceRef (*VGColorSpaceResolved)(VGColorSpaceRef cs);


struct VGColorSpaceCallbacks {
    unsigned int version;												//0x00
    VGColorSpaceEqual equal;											//0x04
    VGColorSpaceFinalize finalize;										//0x08
    VGColorSpaceGetMD5 getMD5;											//0x0C
    VGColorSpaceGetDefaultColorComponents2 getDefaultColorComponents;	//0x10
    VGColorSpaceCreateDefaultColor createDefaultColor;					//0x14
    VGColorSpaceResolved resolved;										//0x18
};
typedef struct VGColorSpaceCallbacks
VGColorSpaceCallbacks;

//VGColorSpaceCallBacks

typedef struct VGColorSpaceState {
    int32_t refcount;						//0x00
    bool isSingleton;						//0x04
    bool isUncalibrated;					//0x05
    bool supportsOuput;						//0x06
    bool unknown07;							//0x07
    bool unknown08;							//0x08
    VGColorSpaceType spaceType;				//0x0C
    VGColorSpaceModel spaceModel;			//0x10
    VGColorSpaceModel processColorModel;	//0x14
    size_t numberOfComponents;				//0x18
    VGColorRef color1C;						//0x1C
    void* field20;							//0x20
    unsigned char* md5;						//0x24
    //int index;								//0x28 ? maybe float* components instead ??
    float* components;						//0x28
    VGColorSpaceCallbacks* callbacks;		//0x2C
    void* associate;						//0x30
    
    /////////////// below maybe inherited struct
    //VGColorSpaceRef baseColorSpace;			//0x34
    //size_t baseColorSpaceCount;				//0x38
    //int id;									//0x40
    //...
} VGColorSpaceState, *VGColorSpaceStateRef;

typedef struct VGColorSpaceStatePattern {
    VGColorSpaceState state;				//0x00
    VGColorSpaceRef baseColorSpace;			//0x34
    
} VGColorSpaceStatePattern, *VGColorSpaceStatePatternRef;


typedef struct VGColorSpaceStateIndexed {
    VGColorSpaceState state;				//0x00
    VGColorSpaceRef baseColorSpace;			//0x34
    size_t lastIndex;						//0x38
    uint8_t* indexes;						//0x3C
    
} VGColorSpaceStateIndexed, *VGColorSpaceStateIndexedRef;


typedef struct VGColorSpaceStateICC {
    VGColorSpaceState state;				//0x00
    size_t numberOfComponents2;				//0x34 ???? numberOfComponents is already inside state
    int id;									//0x40
    VGColorSpaceRef colorSpace;				//0x58
    
} VGColorSpaceStateICC, *VGColorSpaceStateICCRef;

typedef struct VGColorSpace {
    CFRuntimeBase obj;						//0x00
    VGColorSpaceStateRef state;				//0x08
} VGColorSpace, *VGColorSpaceRef;


#if 0
//sizeof(struct VGColorSpace) = 0x64;
typedef struct VGColorSpace {
    CFRuntimeBase obj;						//0x00
    
    bool isSingleton;						//0x08
    VGColorSpaceType spaceType;				//0x0C
    VGColorSpaceModel spaceModel;			//0x10
    VGColorSpaceModel processColorModel;	//0x14
    size_t numberOfComponents;				//0x18
    VGColorRef defaultColor;				//0x1C
    VGDataProviderRef provider;				//0x3C
    VGCMSUtilsPlatformSetRef cmsPlatform40;	//0x40
    VGCMSUtilsPlatformSetRef cmsPlatform44;	//0x44
    VGColorSpaceRef *cs5C;					//0x5C
    
} VGColorSpace, *VGColorSpaceRef;
#endif

/* private colorspace constants */
VG_EXTERN const CFStringRef kVGColorSpaceDisplayGray;
VG_EXTERN const CFStringRef kVGColorSpaceDisplayRGB;
VG_EXTERN const CFStringRef kVGColorSpaceDeviceGray;
VG_EXTERN const CFStringRef kVGColorSpaceDeviceRGB;
VG_EXTERN const CFStringRef kVGColorSpaceDeviceCMYK;
VG_EXTERN const CFStringRef kVGColorSpaceSystemDefaultGray;
VG_EXTERN const CFStringRef kVGColorSpaceSystemDefaultRGB;
VG_EXTERN const CFStringRef kVGColorSpaceSystemDefaultCMYK;
VG_EXTERN const CFStringRef kVGColorSpaceCalibratedGray;
VG_EXTERN const CFStringRef kVGColorSpaceCalibratedRGB;
VG_EXTERN const CFStringRef kVGColorSpaceUncalibratedGray;
VG_EXTERN const CFStringRef kVGColorSpaceUncalibratedRGB;
VG_EXTERN const CFStringRef kVGColorSpaceUncalibratedCMYK;
VG_EXTERN const CFStringRef kVGColorSpaceGenericHDR;
VG_EXTERN const CFStringRef kVGColorSpaceGenericRGBHDR;
VG_EXTERN const CFStringRef kVGColorSpaceUndo601;
VG_EXTERN const CFStringRef kVGColorSpaceColoredPattern;

VG_EXTERN const CFStringRef kVGColorSpaceLAB;
VG_EXTERN const CFStringRef kVGColorSpaceIndexed;
VG_EXTERN const CFStringRef kVGColorSpaceDeviceN;





/* Notifications */
VG_EXTERN const CFStringRef kVGColorSpaceWillDeallocate;




/* functions */
void		cs_finalize(CFTypeRef ctf);

Boolean		cs_equal(CFTypeRef cf1, CFTypeRef cf2);

CFHashCode	cs_hash(CFTypeRef cf);

CFStringRef	cs_copy_debug_description(CFTypeRef cf);


void csNotificationCenterCreate(void);

VG_EXTERN VGNotificationCenterRef getNotificationCenter(bool notFinalize);

VG_EXTERN bool VGColorSpaceEqualToColorSpace(VGColorSpaceRef cs1, VGColorSpaceRef cs2);

VG_EXTERN VGColorRef VGColorSpaceCopyDefaultColor(VGColorSpaceRef space);

VG_EXTERN bool VGColorSpaceSupportsOutput(VGColorSpaceRef colorSpace);

VG_EXTERN VGColorSpaceType VGColorSpaceGetType(VGColorSpaceRef space);

VG_EXTERN unsigned char* VGColorSpaceGetMD5Digest(VGColorSpaceRef space);


VG_EXTERN VGColorSpaceRef VGColorSpaceCreate(VGColorSpaceType type, size_t numberOfComponents);

VG_EXTERN VGColorSpaceRef VGColorSpaceCreateDisplayGray();

VG_EXTERN VGColorSpaceRef VGColorSpaceCreateDisplayRGB();

VG_EXTERN VGColorSpaceRef VGColorSpaceCreateDeviceGray();

VG_EXTERN VGColorSpaceRef VGColorSpaceCreateDeviceRGB();

VG_EXTERN VGColorSpaceRef VGColorSpaceCreateDeviceCMYK();

VG_EXTERN VGColorSpaceRef VGColorSpaceCreateSystemDefaultGray();

VG_EXTERN VGColorSpaceRef VGColorSpaceCreateSystemDefaultRGB();

VG_EXTERN VGColorSpaceRef VGColorSpaceCreateSystemDefaultCMYK();

VG_EXTERN VGColorSpaceRef VGColorSpaceCreateWithICCData();

VG_EXTERN VGColorSpaceRef VGColorSpaceCreateDisplayGrayWithID(int id);

VG_EXTERN VGColorSpaceRef VGColorSpaceCreateDisplayRGBWithID(int id);

VG_EXTERN VGColorSpaceRef VGColorSpaceCreateWithIndex(int index);

VG_EXTERN VGColorSpaceRef create_display_color_space(size_t numComponents);

VG_EXTERN VGColorSpaceRef create_device_color_space(size_t numComponents);

VG_EXTERN VGColorSpaceRef create_generic_color_space(size_t numComponents);

VG_EXTERN VGColorSpaceRef create_uncalibrated_color_space(size_t numComponents);

VG_EXTERN VGColorSpaceRef create_color_space_with_path(CFStringRef path);

VG_EXTERN VGColorSpaceRef create_display_space_with_id(size_t numComponents, int id);

VG_EXTERN CFIndex VGColorSpaceGetIndexForName(CFStringRef name);

VG_EXTERN VGColorSpaceRef VGColorSpaceCreateWithState(VGColorSpaceStateRef colorSpaceState);

VG_EXTERN void color_space_state_dealloc(VGColorSpaceStateRef csState);

VG_EXTERN void color_space_state_release(VGColorSpaceStateRef colorSpaceState);

VG_EXTERN bool color_space_state_equal(VGColorSpaceStateRef state1, VGColorSpaceStateRef state2);

VG_EXTERN VGColorSpaceStateRef color_space_state_retain(VGColorSpaceStateRef colorSpaceState);

VG_EXTERN void device_gray_get_md5(unsigned char* md5);

VG_EXTERN void device_rgb_get_md5(unsigned char* md5);

VG_EXTERN VGFloat* device_get_default_color_components(VGColorSpaceRef cs);




VG_EXTERN VGColorSpaceRef device_create_resolved(VGColorSpaceRef cs);

#endif
