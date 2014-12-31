//
//  VGColorSpace.c
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#include "VGColorSpacePriv.h"

#include <VeritasFoundation/CFRuntime.h>
#include <VeritasFoundation/VFInternal.h>
#include <CoreFoundation/CoreFoundation.h>

static CFTypeID _kVGColorSpaceID = _kCFRuntimeNotATypeID;

static CFRuntimeClass _kVGColorSpaceClass = {0};

/* Something external to this file is assumed to call this
 * before the VALayer class is used.
 */
void __VGColorSpaceClassInitialize(void) {
    _kVGColorSpaceClass.version = 0;
    _kVGColorSpaceClass.className = "VGColorSpace";
    _kVGColorSpaceClass.init = NULL;
    _kVGColorSpaceClass.copy = NULL;
    _kVGColorSpaceClass.finalize = NULL;
    _kVGColorSpaceClass.equal = NULL;
    _kVGColorSpaceClass.hash = NULL;
    _kVGColorSpaceClass.copyFormattingDesc = NULL;
    _kVGColorSpaceClass.copyDebugDesc = NULL;
    _kVGColorSpaceID = _CFRuntimeRegisterClass((const CFRuntimeClass * const)&_kVGColorSpaceClass);
}

static pthread_once_t			__space_create_once = PTHREAD_ONCE_INIT;
static CFMutableDictionaryRef	__name_to_index_map = NULL;

static pthread_once_t			__csNotifCenter_create_once = PTHREAD_ONCE_INIT;

static VGColorSpaceRef			named_color_spaces[17] = {0};



/* color space constants */
VF_CONST_STRING_DECL(kVGColorSpaceDisplayGray,				"kVGColorSpaceDisplayGray");
VF_CONST_STRING_DECL(kVGColorSpaceDisplayRGB,				"kVGColorSpaceDisplayRGB");
VF_CONST_STRING_DECL(kVGColorSpaceDeviceGray,				"kVGColorSpaceDeviceGray");
VF_CONST_STRING_DECL(kVGColorSpaceDeviceRGB,				"kVGColorSpaceDeviceRGB");
VF_CONST_STRING_DECL(kVGColorSpaceDeviceCMYK,				"kVGColorSpaceDeviceCMYK");
VF_CONST_STRING_DECL(kVGColorSpaceSystemDefaultGray,		"kVGColorSpaceSystemDefaultGray");
VF_CONST_STRING_DECL(kVGColorSpaceSystemDefaultRGB,			"kVGColorSpaceSystemDefaultRGB");
VF_CONST_STRING_DECL(kVGColorSpaceSystemDefaultCMYK,		"kVGColorSpaceSystemDefaultCMYK");
VF_CONST_STRING_DECL(kVGColorSpaceCalibratedGray,			"kVGColorSpaceCalibratedGray");
VF_CONST_STRING_DECL(kVGColorSpaceCalibratedRGB,			"kVGColorSpaceCalibratedRGB");
VF_CONST_STRING_DECL(kVGColorSpaceUncalibratedGray,			"kVGColorSpaceUncalibratedGray");
VF_CONST_STRING_DECL(kVGColorSpaceUncalibratedRGB,			"kVGColorSpaceUncalibratedRGB");
VF_CONST_STRING_DECL(kVGColorSpaceUncalibratedCMYK,			"kVGColorSpaceUncalibratedCMYK");
VF_CONST_STRING_DECL(kVGColorSpaceGenericHDR,				"kVGColorSpaceGenericHDR");
VF_CONST_STRING_DECL(kVGColorSpaceGenericRGBHDR,			"kVGColorSpaceGenericRGBHDR");
VF_CONST_STRING_DECL(kVGColorSpaceUndo601,					"kVGColorSpaceUndo601");
VF_CONST_STRING_DECL(kVGColorSpaceColoredPattern,			"kVGColorSpaceColoredPattern");
VF_CONST_STRING_DECL(kVGColorSpaceGenericGray,				"kVGColorSpaceGenericGray");
VF_CONST_STRING_DECL(kVGColorSpaceLAB,						"kVGColorSpaceLAB");
VF_CONST_STRING_DECL(kVGColorSpaceIndexed,					"kVGColorSpaceIndexed");
VF_CONST_STRING_DECL(kVGColorSpaceDeviceN,					"kVGColorSpaceDeviceN");



/* color space notifications */
VF_CONST_STRING_DECL(kVGColorSpaceWillDeallocate,			"kVGColorSpaceWillDeallocate");




/* CoreFoundation runtime class for VGPath.  */
static CFRuntimeClass VGColorSpaceClass =  {
    0,							/* version */
    "VGColorSpace",				/* Name of class.  */
    0,							/* init */
    0,							/* copy  */
    cs_finalize,				/* finalize  */
    cs_equal,					/* equal  */
    0,							/* hash  */
    0,							/* copyFormattingDesc */
    cs_copy_debug_description	/* copyDebugDesc */
};
CFTypeID __kVGColorSpaceID = _kCFRuntimeNotATypeID;


#if 0
static VGColorSpaceCallbacks indexed_vtable =  {
    0,
    indexed_equal,
    indexed_finalize,
    indexed_get_md5,
    indexed_get_default_color_components,
    0,
    indexed_create_resolved,
};

static VGColorSpaceCallbacks pattern_vtable =  {
    0,
    pattern_equal,
    pattern_finalize,
    pattern_get_md5,
    pattern_get_default_color_components,
    pattern_create_default_color,
    pattern_create_resolved,
};
#endif

static unsigned char device_gray_md5[16] = {
    0x32, 0x53, 0xAB, 0x07, 0xA5, 0xC6, 0xC9, 0x79,
    0x65, 0x67, 0x94, 0x70, 0x4C, 0x2F, 0x58, 0x82
};
static VGColorSpaceCallbacks device_gray_vtable =  {
    0,
    0,
    0,
    device_gray_get_md5,
    device_get_default_color_components,
    0,
    device_create_resolved,
};


static unsigned char device_rgb_md5[16] = {
    0x1B, 0x84, 0x38, 0x33, 0xBC, 0xA1, 0xF9, 0xF8,
    0x75, 0x60, 0xC5, 0xBA, 0x33, 0x90, 0xDB, 0x62
};

static VGColorSpaceCallbacks device_rgb_vtable =  {
    0,
    0,
    0,
    device_rgb_get_md5,
    device_get_default_color_components,
    0,
    device_create_resolved,
};

#if 0
static VGColorSpaceCallbacks device_cmyk_vtable =  {
    0,
    0,
    0,
    device_cmyk_get_md5,
    device_get_default_color_components,
    0,
    device_create_resolved,
};
#endif

CFTypeID VGColorSpaceGetTypeID(void)
{
    return VGTypeRegisterWithCallbacks(&__kVGColorSpaceID, &VGColorSpaceClass );
}


void device_gray_get_md5(unsigned char* md5)
{
    memcpy(md5, device_gray_md5, 16);
}

void device_rgb_get_md5(unsigned char* md5)
{
    memcpy(md5, device_rgb_md5, 16);
}

VGFloat* device_get_default_color_components(VGColorSpaceRef cs)
{
    // IMPLEMENT HERE
    return NULL;
}

VGColorSpaceRef device_create_resolved(VGColorSpaceRef cs)
{
    // IMPLEMENT HERE
    return NULL;
}


void cs_finalize(CFTypeRef ctf)
{
    /*VGColorSpaceRef cs;
     bool isSingleton;
     VGNotificationCenterRef csNotifCenter;
     
     cs = (VGColorSpaceRef)ctf;
     isSingleton = cs->isSingleton;
     assert( isSingleton == FALSE );
     
     csNotifCenter = getNotificationCenter(FALSE);
     if (csNotifCenter) {
     
     VGNotificationCenterPostNotification(csNotifCenter, kVGColorSpaceWillDeallocate, ctf, isSingleton);
     }*/
    //.....
}

Boolean cs_equal(CFTypeRef cf1, CFTypeRef cf2)
{
    return VGColorSpaceEqualToColorSpace((VGColorSpaceRef)cf1, (VGColorSpaceRef)cf2);
}

CFHashCode cs_hash(CFTypeRef cf)
{
    CFHashCode hash;
    VGColorSpaceRef cs;
    
    cs = (VGColorSpaceRef)cf;
    if (!cs | !cs->state)
        return 0;
    
    /*if (cs->state->callbacks)
     hash = cs->state->callbacks->getMD5(*/
    
    return hash;
}


CFStringRef cs_copy_debug_description(CFTypeRef cf)
{
    VGColorSpaceRef cs;
    CFMutableStringRef msg;
    CFStringRef csTypeString = NULL;
    
    cs = (VGColorSpaceRef)cf;
    if (cs)
    {
        msg = CFStringCreateMutable(CFGetAllocator(cf), 0);
        switch(cs->state->spaceType)
        {
            case kVGColorSpaceTypeDeviceGray: { csTypeString = kVGColorSpaceDeviceGray; break; }
            case kVGColorSpaceTypeDeviceRGB: { csTypeString = kVGColorSpaceDeviceRGB; break; }
            case kVGColorSpaceTypeDeviceCMYK: { csTypeString = kVGColorSpaceDeviceCMYK; break; }
            case kVGColorSpaceTypeCalibratedGray: { csTypeString = kVGColorSpaceCalibratedGray; break; }
            case kVGColorSpaceTypeCalibratedRGB: { csTypeString = kVGColorSpaceCalibratedRGB; break; }
            case kVGColorSpaceTypeLab: { csTypeString = kVGColorSpaceLAB; break; }
            case kVGColorSpaceTypeIndexed: { csTypeString = kVGColorSpaceIndexed; break; }
            case kVGColorSpaceTypeDeviceN: { csTypeString = kVGColorSpaceDeviceN; break; }
            default: {break;}
        }
        
        //CFStringAppendFormat(CF
    }
    
    return csTypeString;
}


void create_name_to_index_map(void)
{
    
}

CFIndex VGColorSpaceGetIndexForName(CFStringRef name)
{
    CFIndex ret;
    
    if (__name_to_index_map == NULL) {
        pthread_once(&__space_create_once, create_name_to_index_map);
    }
    if (name)
        ret = (CFIndex)CFDictionaryGetValue(__name_to_index_map, (const void*)name);
    else
        ret = 0;
    
    return ret;
}



bool VGColorSpaceEqualToColorSpace(VGColorSpaceRef cs1, VGColorSpaceRef cs2)
{
    if (cs1 == cs2)
        return TRUE;
    
    return color_space_state_equal(cs1->state, cs2->state);
}

bool color_space_state_equal(VGColorSpaceStateRef state1, VGColorSpaceStateRef state2)
{
    // IMPLEMENT HERE
    return false;
}


unsigned char* VGColorSpaceGetMD5Digest(VGColorSpaceRef space)
{
    unsigned char* digest;
    
    if (!space || !space->state)
        return NULL;
    
    if (space->state->md5)
    {
        digest = space->state->md5;
    }
    else
    {
        space->state->md5 = (unsigned char*) malloc(0x16);
        space->state->callbacks->getMD5(space->state->md5);
    }
    
    return digest;
}

VGColorSpaceType VGColorSpaceGetType(VGColorSpaceRef space)
{
    if (!space)
        return kVGColorSpaceTypeDeviceUnknown;
    
    return space->state->spaceType;
}

VGFloat* VGColorSpaceGetDefaultColorComponents(VGColorSpaceRef cs)
{
    return NULL;
}

VGColorRef VGColorSpaceCopyDefaultColor(VGColorSpaceRef space)
{
    VGColorRef color = NULL;
    /*float* components;
     
     if (!space)
     return NULL;
     
     components = VGColorSpaceGetDefaultColorComponents(space);
     if (!components || VGColorSpaceGetType(space) == kVGColorSpaceTypeDeviceUnknown)
     return space->defaultColor;
     
     color = VGColorCreate(space, components);*/
    
    return color;
}


VGColorSpaceRef VGColorSpaceCreateDisplayGray()			{ return VGColorSpaceCreateWithIndex((int) 1); }
VGColorSpaceRef VGColorSpaceCreateDisplayRGB()			{ return VGColorSpaceCreateWithIndex((int) 2); }
VGColorSpaceRef VGColorSpaceCreateDeviceGray()			{ return VGColorSpaceCreateWithIndex((int) 3); }
VGColorSpaceRef VGColorSpaceCreateDeviceRGB()			{ return VGColorSpaceCreateWithIndex((int) 4); }
VGColorSpaceRef VGColorSpaceCreateDeviceCMYK()			{ return VGColorSpaceCreateWithIndex((int) 5); }
VGColorSpaceRef VGColorSpaceCreateSystemDefaultGray()	{ return VGColorSpaceCreateWithIndex((int) 6); }
VGColorSpaceRef VGColorSpaceCreateSystemDefaultRGB()	{ return VGColorSpaceCreateWithIndex((int) 7); }
VGColorSpaceRef VGColorSpaceCreateSystemDefaultCMYK()	{ return VGColorSpaceCreateWithIndex((int) 8); }


VGColorSpaceRef VGColorSpaceCreateWithName(CFStringRef name)
{
    CFIndex index;
    
    index = VGColorSpaceGetIndexForName(name);
    return VGColorSpaceCreateWithIndex((int)index);
}



VGColorSpaceRef VGColorSpaceCreateWithIndex(int index)
{
    VGColorSpaceRef cs;
    //VGColorSpaceModel colorModel;
    //CFStringRef profilePath;
    
    if (index > 17)
        return NULL;
    
    if (named_color_spaces[index] != 0)
    {
        cs = named_color_spaces[index];
    }
    else
    {
        switch(index)
        {
                /* display space type */
            case 1: { cs = create_display_color_space(1); break; } //VGColorSpaceCreateDisplayGray
            case 2: { cs = create_display_color_space(3); break; } //VGColorSpaceCreateDisplayRGB
                /* device space type */
            case 3: { cs = create_device_color_space(1); break; } // VGColorSpaceCreateDeviceGray
            case 4: { cs = create_device_color_space(3); break; } // VGColorSpaceCreateDeviceRGB
            case 5: { cs = create_device_color_space(4); break; } // VGColorSpaceCreateDeviceCMYK
                /* system default space type */
            case 6: { cs = create_generic_color_space(1); break; } //VGColorSpaceCreateSystemDefaultGray
            case 7: { cs = create_generic_color_space(3); break; } //VGColorSpaceCreateSystemDefaultGray
            case 8: { cs = create_generic_color_space(4); break; } //VGColorSpaceCreateSystemDefaultGray
                /* uncalibrated space type */
            case 9:  { cs = create_uncalibrated_color_space(1); break; }
            case 10: { cs = create_uncalibrated_color_space(3); break; }
            case 11: { cs = create_uncalibrated_color_space(4); break; }
                /* pattern */
            case 14: { cs = VGColorSpaceCreate(kVGColorSpaceTypePattern, 0); cs->state->isSingleton = TRUE; break; }
                /* ICC profile */
            case 15: { cs = create_color_space_with_path(CFSTR("ColorSync/Profiles/AdobeRGB1998.icc")); break; }
            case 16: { cs = create_color_space_with_path(CFSTR("ColorSync/Profiles/sRGB Profile.icc")); break; }
            case 17: { cs = create_color_space_with_path(CFSTR("ColorSync/Profiles/Generic Gray Gamma 2.2 Profile.icc")); break; }
            default: { cs = NULL; break; }
        }
        
        if (cs == NULL)
        {
            // Add some semphare/memory barrier/spin lock here -
            cs = named_color_spaces[index];
        }
        else
        {
            // DISCREPANCY HERE !!!!!!!!!!!!!!!!!!!!!!!!!!!
            // Sometimes it's index and sometimes a float *
            //cs->state->index = index;
        }
    }
    
    
    
    
    
    VGColorSpaceRetain(cs);
    
    return cs;
}

VGColorSpaceRef create_display_color_space(size_t numComponents)
{
    VGColorSpaceRef colorSpace;
    
    if (numComponents == 1)
    {
        colorSpace = VGColorSpaceCreateDisplayGrayWithID(0);
    }
    else if (numComponents == 3)
    {
        colorSpace = VGColorSpaceCreateDisplayRGBWithID(0);
    }
    
    return NULL;
}

VGColorSpaceRef VGColorSpaceCreateWithICCData()
{
    VGColorSpaceRef colorSpace = NULL;
    
    
    return colorSpace;
}


VGColorSpaceRef VGColorSpaceCreateDisplayGrayWithID(int id)
{
    return create_display_space_with_id(1, id);
}

VGColorSpaceRef VGColorSpaceCreateDisplayRGBWithID(int id)
{
    return create_display_space_with_id(3, id);
}

VGColorSpaceRef create_display_space_with_id(size_t numComponents, int id)
{
    VGColorSpaceRef colorSpace;
    VGColorSpaceRef csGray;
    VGColorSpaceStateICCRef csStateICC;
    
    colorSpace = VGColorSpaceCreate(kVGColorSpaceTypeICC, numComponents);
    if (colorSpace)
    {
        csStateICC = ((VGColorSpaceStateICCRef)(colorSpace->state));
        csStateICC->id = id;
        if (numComponents == 1)
        {
            csStateICC->state.spaceModel = kVGColorSpaceModelMonochrome;
            csStateICC->state.processColorModel = kVGColorSpaceModelMonochrome;
            csGray = VGColorSpaceCreateDeviceGray();
            if (csGray != NULL)
            {
                colorSpace->state->unknown07 = TRUE;
            }
            else
            {
                VGColorSpaceRelease(colorSpace);
                colorSpace = NULL;
            }
            
        }
    }
    
    return colorSpace;
}


VGColorSpaceRef create_device_color_space(size_t numComponents)
{
    VGColorSpaceRef colorSpace;
    
    if (numComponents == 1)
    {
        colorSpace = VGColorSpaceCreate(kVGColorSpaceTypeDeviceGray, numComponents);
    }
    else if (numComponents == 3)
    {
        colorSpace = VGColorSpaceCreate(kVGColorSpaceTypeDeviceRGB, numComponents);
    }
    else if (numComponents == 4)
    {
        colorSpace = VGColorSpaceCreate(kVGColorSpaceTypeDeviceCMYK, numComponents);
    }
    else
    {
        abort();
    }
    
    return colorSpace;
}


VGColorSpaceRef create_color_space_with_path(CFStringRef path)
{
    VGColorSpaceRef colorSpace = NULL;
    CFArrayRef paths;
    VGDataProviderRef provider;
    CFURLRef url, urlCopy;
    
    paths = CFCopySearchPathForDirectoriesInDomains(kCFLibraryDirectory, kCFSystemDomainMask, TRUE);
    if (paths)
    {
        for (int i=0; i < CFArrayGetCount(paths); i++)
        {
            url = (CFURLRef)CFArrayGetValueAtIndex(paths, i);
            urlCopy = CFURLCreateCopyAppendingPathComponent(NULL, url, path, FALSE);
            provider = VGDataProviderCreateWithURL(urlCopy);
            
            //IMPLEMENT HERE
        }
        
        //CFRelease(paths);
        //colorSpace = VGColorSpaceCreateWithICCData();
        //VGDataProviderRelease
    }
    
    
    return colorSpace;
}

VGColorSpaceRef create_generic_color_space(size_t numComponents)
{
    VGColorSpaceRef colorSpace;
    
    if (numComponents == 1)
        colorSpace = VGColorSpaceCreateDeviceGray();
    else if (numComponents == 3)
        colorSpace = VGColorSpaceCreateDeviceRGB();
    else if (numComponents == 4)
        colorSpace = VGColorSpaceCreateDeviceCMYK();
    else
        colorSpace = NULL;
    
    return colorSpace;
}

VGColorSpaceRef create_uncalibrated_color_space(size_t numComponents)
{
    VGColorSpaceRef colorSpace;
    
    colorSpace = create_device_color_space(numComponents);
    colorSpace->state->isUncalibrated = TRUE;
    
    return colorSpace;
}


VGColorSpaceRef VGColorSpaceCreate(VGColorSpaceType type, size_t numberOfComponents)
{
    VGColorSpaceRef colorSpace;
    VGColorSpaceStateRef csState;
    VGColorSpaceModel spaceModel;
    VGColorSpaceModel processColorModel;
    VGColorSpaceCallbacks *callbacks;
    int size;
    
    switch(type)
    {
        case kVGColorSpaceTypeDeviceGray:
            size = 0x34;
            spaceModel = kVGColorSpaceModelMonochrome;
            callbacks = &device_gray_vtable;
            processColorModel = kVGColorSpaceModelMonochrome;
            break;
        case kVGColorSpaceTypeDeviceRGB:
            size = 0x34;
            spaceModel = kVGColorSpaceModelRGB;
            callbacks = &device_rgb_vtable;
            processColorModel = kVGColorSpaceModelRGB;
            break;
        case kVGColorSpaceTypeDeviceCMYK:
            size = 0x34;
            spaceModel = kVGColorSpaceModelCMYK;
            processColorModel = kVGColorSpaceModelCMYK;
            //callbacks = &device_cmyk_vtable;
            break;
        case kVGColorSpaceTypeCalibratedGray:
            size = 0x50;
            spaceModel = kVGColorSpaceModelMonochrome;
            processColorModel = kVGColorSpaceModelMonochrome;
            //callbacks = &calibrated_gray_vtable;
            break;
        case kVGColorSpaceTypeCalibratedRGB:
            size = 0x7C;
            spaceModel = kVGColorSpaceModelRGB;
            processColorModel = kVGColorSpaceModelRGB;
            //callbacks = &calibrated_rgb_vtable;
            break;
        case kVGColorSpaceTypeLab:
            size = 0x5C;
            spaceModel = kVGColorSpaceModelLab;
            processColorModel = kVGColorSpaceModelLab;
            //callbacks = &lab_vtable;
            break;
        case kVGColorSpaceTypeICC:
            size = 0x60;
            spaceModel = kVGColorSpaceModelUnknown;
            processColorModel = kVGColorSpaceModelUnknown;
            //callbacks = &icc_vtable;
            break;
        case kVGColorSpaceTypeIndexed:
            size = 0x40;
            spaceModel = kVGColorSpaceModelIndexed;
            processColorModel = kVGColorSpaceModelUnknown;
            //callbacks = &indexed_vtable;
            
            break;
        case kVGColorSpaceTypeDeviceN:
            size = 0x44;
            spaceModel = kVGColorSpaceModelDeviceN;
            processColorModel = kVGColorSpaceModelDeviceN;
            //callbacks = &deviceN_vtable;
            
        case kVGColorSpaceTypePattern:
            size = 0x38;
            spaceModel = kVGColorSpaceModelPattern;
            processColorModel = kVGColorSpaceModelUnknown;
            //callbacks = &pattern_vtable;
            break;
        default:
            break;
    }
    
    csState = (VGColorSpaceStateRef) calloc(1, size);
    csState->isSingleton = FALSE;
    csState->isUncalibrated = FALSE;
    csState->supportsOuput = TRUE;
    csState->unknown07 = FALSE;
    csState->unknown08 = FALSE;
    csState->spaceType = type;
    csState->spaceModel = spaceModel;
    csState->processColorModel= processColorModel;
    csState->numberOfComponents = numberOfComponents;
    csState->components = NULL; //STR     R6, [R0,#0x28]
    csState->callbacks = callbacks;
    
    if (csState->spaceType == kVGColorSpaceTypeICC)
    {
        csState->components = (float *)malloc(numberOfComponents * sizeof(float));
        for (size_t i; i < numberOfComponents; i++)
        {
            //IMPLEMENT HERE
        }
    }
    else
    {
        if (csState->spaceType == kVGColorSpaceTypePattern)
        {
            ((VGColorSpaceStatePatternRef)csState)->baseColorSpace = NULL;
            csState->supportsOuput = FALSE;
        }
    }
    
    colorSpace = VGColorSpaceCreateWithState(csState);
    
    return colorSpace;
}


VGColorSpaceRef VGColorSpaceCreateWithState(VGColorSpaceStateRef colorSpaceState)
{
    VGColorSpaceRef colorSpace;
    
    colorSpace = (VGColorSpaceRef)_CFRuntimeCreateInstance(NULL, VGColorSpaceGetTypeID(), sizeof(VGColorSpace) - sizeof(CFRuntimeBase), NULL);
    colorSpace->state = color_space_state_retain(colorSpaceState);
    
    return colorSpace;
}


VGColorSpaceStateRef color_space_state_retain(VGColorSpaceStateRef colorSpaceState)
{
    if (!colorSpaceState) { return NULL; }
    
    _CFAtomicIncrement32(&colorSpaceState->refcount);
    
    return colorSpaceState;
}

void color_space_state_release(VGColorSpaceStateRef colorSpaceState)
{
    if (!colorSpaceState) { return; }
    
    _CFAtomicDecrement32(&colorSpaceState->refcount);
    if (colorSpaceState->refcount == 0)
    {
        color_space_state_dealloc(colorSpaceState);
    }
}

void color_space_state_dealloc(VGColorSpaceStateRef csState)
{
    if (!csState) { return; }
    
    if (csState->isSingleton == FALSE)
    {
        if (csState->associate)
            CFRelease((CFTypeRef)csState->associate);
        if (csState->callbacks->finalize)
            csState->callbacks->finalize((CFTypeRef)csState);
        
        VGColorRelease(csState->color1C);
        free(csState->field20);
        free(csState->md5);
    }
    
}

void VGColorSpaceRelease(VGColorSpaceRef space)
{
    if (!space) { return; }
    CFRelease((CFTypeRef) space);
}

VGColorSpaceRef VGColorSpaceRetain(VGColorSpaceRef space)
{
    if (!space) { return 0; }
    
    CFRetain((CFTypeRef) space);
    
    return space;
}

bool VGColorSpaceSupportsOutput(VGColorSpaceRef space)
{
    if (!space) { return 0; }
    
    return space->state->supportsOuput;
}

VGColorSpaceModel VGColorSpaceGetModel(VGColorSpaceRef space)
{
    if (!space || !space->state) { return kVGColorSpaceModelUnknown; }
    return space->state->spaceModel;
}

size_t VGColorSpaceGetNumberOfComponents(VGColorSpaceRef space)
{
    if (!space || !space->state) { return 0; }
    return space->state->numberOfComponents;
}

VGColorSpaceRef VGColorSpaceGetBaseColorSpace(VGColorSpaceRef cs)
{
    VGColorSpaceRef baseColorSpace;
    
    if (cs->state->spaceModel == kVGColorSpaceModelIndexed ||
        cs->state->spaceModel == kVGColorSpaceModelPattern)
    {
        baseColorSpace = ((VGColorSpaceStatePatternRef)cs->state)->baseColorSpace;
    }
    else
    {
        baseColorSpace = NULL;
    }
    
    return baseColorSpace;
}

size_t VGColorSpaceGetColorTableCount(VGColorSpaceRef cs)
{
    size_t count;
    
    if (cs && cs->state->spaceModel == kVGColorSpaceModelIndexed) 
        count = ((VGColorSpaceStateIndexedRef)cs->state)->lastIndex + 1;
    else
        count = 0;
    
    return count;
}

void VGColorSpaceGetColorTable(VGColorSpaceRef space, uint8_t *table)
{
    size_t numComponents, count;
    VGColorSpaceStateIndexedRef csStateIndexed;
    
    if (space && space->state->spaceModel == kVGColorSpaceModelIndexed && table)
    {
        csStateIndexed = (VGColorSpaceStateIndexedRef)space->state;
        numComponents = VGColorSpaceGetNumberOfComponents(csStateIndexed->baseColorSpace);
        count = csStateIndexed->lastIndex + 1;
        memmove(table, csStateIndexed->indexes, numComponents * count);
    }
}
