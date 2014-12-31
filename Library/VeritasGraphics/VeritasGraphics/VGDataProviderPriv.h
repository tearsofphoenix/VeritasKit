/* Copyright 2010 Smartmobili SARL
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *     http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#ifndef VGDATAPROVIDERPRIV_H_
#define VGDATAPROVIDERPRIV_H_

#include "VGDataProvider.h"

#include <VeritasFoundation/CFRuntime.h>
#include <pthread.h>
#include <sys/types.h>
#include <sys/stat.h>

CF_EXTERN_C_BEGIN


struct VGProviderData {
	void* info;
	off_t size;
	const void* data;
	VGDataProviderReleaseDataCallback releaseData;
};
typedef struct VGProviderData VGProviderData, *VGProviderDataRef;


//////////////////////////////////////////////////////
// sizeof = 0x88
//////////////////////////////////////////////////////
struct VGDataProvider {

	CFRuntimeBase obj;												//0x00

	Boolean isThreadSafe;											//0x08
	void* info;														//0x0C
	off_t size;														//0x10
	VGDataProviderDirectCallbacks *directCalls;						//0x14
	VGDataProviderGetBytesCallback getBytes;						//0x18
	VGDataProviderSkipForwardCallback skipForward;					//0x1C
	uint32_t field20;												//0x20
	VGDataProviderRewindCallback rewind;							//0x24
	VGDataProviderReleaseInfoCallback releaseInfo;					//0x28
	VGDataProviderGetBytePointerCallback getBytePointer;			//0x2C
	VGDataProviderGetBytePointerCallback getInfoBytePointer;		//0x30
	VGDataProviderReleaseBytePointerCallback releaseBytePointer;	//0x34
	VGDataProviderGetBytesAtPositionCallback getBytesAtPosition;	//0x38
	pthread_mutex_t mutex;											//0x40
	size_t byte_ptr_count;											//0x6C
	const void* data;												//0x70;
	VGDataProviderRef session;										//0x74
};
typedef struct VGDataProvider VGDataProvider, *VGDataProviderRef;


struct VGAccessSession {


};
typedef struct VGAccessSession VGAccessSession, *VGAccessSessionRef;




void				VGDataProviderDestroy(CFTypeRef ctf);
VGDataProviderRef	VGDataProviderCreateWithCopyOfData(void *data, size_t size);

/* AccessSession */
VGAccessSessionRef	VGAccessSessionCreate(VGDataProviderRef provider);
VGAccessSessionRef	VGAccessSessionRewind(VGDataProviderRef provider);
void *				VGAccessSessionGetBytePointer(VGAccessSessionRef session);
size_t				VGAccessSessionGetBytes(VGAccessSessionRef session,void *buffer,size_t bytes);
void				VGAccessSessionRelease(VGAccessSessionRef session);


VGDataProviderRef	create_provider(void *info, Boolean bThreadSafe);

CF_EXTERN_C_END

#endif /* VGDATAPROVIDERPRIV_H_ */


