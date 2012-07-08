//
//  BoCPressSplashAdvertisementDataSource.h
//  BoCPress
//
//  Created by E-Reach Administrator on 12/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BoCPressCallback;
@protocol BoCPressDataSource;

@protocol BoCPressSplashAdvertisementDataSource<NSObject>

- (UIImage *)imageWithImageInfo: (NSDictionary *)info
                       callback: (id<BoCPressCallback>)callback;

- (NSString *)cacheImageDirectoryPath;

@end

@interface BoCPressSplashAdvertisementDataSource : NSObject<BoCPressSplashAdvertisementDataSource>
{
    id<BoCPressDataSource> _rootDataSource;
}

- (id)initWithService: (id<BoCPressDataSource>)rootDataSource;

@end
