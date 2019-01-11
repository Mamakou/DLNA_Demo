//
//  UPnPEngine.m
//  DLNA_iOS
//
//  Created by wang david on 12-9-12.
//
//

#import "UPnPEngine.h"
#import "util.h"
#import "Macro.h"

@interface UPnPEngine ()

- (void)initUPnP ;
@end


@implementation UPnPEngine
+ (id)getEngine
{
  DEFINE_SHARED_INSTANCE_USING_BLOCK(^{
    return [[self alloc] init];
  });
}


- (void)initUPnP {
  if (!upnp) {
    upnp = [[PLT_UPnPObject alloc] init];
  }
}

/**
 为哪个文件目录开启服务
 */
- (void)intendStartLocalFileServerWithRootPath:(NSString *)thePath serverName:(NSString *)theName
{
  [self initUPnP];
  localFileServer = [[PLT_MediaServerObject alloc] initServerWithPath:thePath andServerName:theName];
  [upnp addDevice:localFileServer];
  
}

/**
 启动itunes音乐服务
 */
- (void)intendStartItunesMusicServerWithServerName:(NSString *)theName
{
    
  [self initUPnP];
  itunesServer = [[PLT_MediaServerObject alloc] initServerSelfDelegateWithServerName:theName];
  itunesDMSDelegate = [[ItunesMusicDMSDelegate alloc] init];
  [itunesServer setDelegate:itunesDMSDelegate];
  [upnp addDevice:itunesServer];
  
}

/**
 启动手机本地音乐服务
 */
- (void)intendStartLocalMusicServerWithServerName:(NSString *)theName {
//    [self initUPnP];
//    localMusicServer = [[PLT_MediaServerObject alloc] initServerSelfDelegateWithServerName:theName];
//    localMusicDMSDelegate = [[LocalMusicDMSDelegate alloc] init];
//    [localMusicServer setDelegate:localMusicDMSDelegate];
//    [upnp addDevice:localMusicServer];
}
/**
 启动图片server
 */
- (void)intendStartIOSPhotoServerWithServerName:(NSString *)theName {
  [self initUPnP];
//  photoServer = [[PLT_MediaServerObject alloc] initServerSelfDelegateWithServerName:theName];
//  photoDMSDelegate = [[PhotoDMSDelegate alloc] init];
//  [photoServer setDelegate:photoDMSDelegate];
//  [upnp addDevice:photoServer];
  
}

- (BOOL)isRunning {
    
    return upnp.isRunning;
}

- (BOOL)startUPnP {
  
  NPT_Result result = [upnp start];
  if (NPT_FAILED(result)) {
    return NO;
  }
  return YES;
}


- (void)stopUPnP {
  
	if ([upnp isRunning]) {
		[upnp stop];
	}
	
	if (upnp) {
		upnp = nil;
	}
	
//	if (localFileServer) {
//		localFileServer = nil;
//	}
	
	if (itunesServer) {
		itunesServer = nil;
	}
	
//	if (photoServer) {
//		photoServer = nil;
//	}
//	
//    if (localMusicServer) {
//        localMusicServer=nil;
//    }
//    
	if (itunesDMSDelegate) {
		itunesDMSDelegate = nil;
	}
    
//    if (localMusicDMSDelegate) {
//        localMusicDMSDelegate=nil;
//    }
//    
//	
//	if (photoDMSDelegate) {
//		photoDMSDelegate = nil;
//	}
//    
}

@end
