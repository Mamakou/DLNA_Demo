//
//  UPnPEngine.h
//  DLNA_iOS
//
//  Created by wang david on 12-9-12.
//
//


//#import "PhotoDMSDelegate.h"
//#import "LocalMusicDMSDelegate.h"

#import "ItunesMusicDMSDelegate.h"

#import <Foundation/Foundation.h>

@interface UPnPEngine : NSObject {
  
    /**
     upnp服务总管理者
     */
    PLT_UPnPObject* upnp;
  
    PLT_MediaServerObject* localFileServer;
	PLT_MediaServerObject* itunesServer;
//	PLT_MediaServerObject* photoServer;
//    PLT_MediaServerObject* localMusicServer;
  
//    PhotoDMSDelegate *photoDMSDelegate;
//    LocalMusicDMSDelegate  *localMusicDMSDelegate;
    ItunesMusicDMSDelegate *itunesDMSDelegate;
}

/**
 其实就是单例创建UPNP server 管理者
 */
+ (id)getEngine;

/**
 开启本地文件服务
 */
- (void)intendStartLocalFileServerWithRootPath:(NSString *)thePath serverName:(NSString *)theName;

- (void)intendStartItunesMusicServerWithServerName:(NSString *)theName;
- (void)intendStartIOSPhotoServerWithServerName:(NSString *)theName;
- (void)intendStartLocalMusicServerWithServerName:(NSString *)theName ;
- (BOOL)startUPnP ;
- (void)stopUPnP ;

- (BOOL)isRunning;
@end
