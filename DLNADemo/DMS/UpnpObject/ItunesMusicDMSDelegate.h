//
//  ItunesMusicDMSDelegate.h
//  DLNADemo
//
//  Created by goviewtech on 2019/1/11.
//  Copyright © 2019 goviewtech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Platinum/Platinum.h>
#import "PltMediaServerObject.h"


NS_ASSUME_NONNULL_BEGIN

@interface ItunesMusicDMSDelegate : NSObject<PLT_MediaServerDelegateObject>


@property(nonatomic, strong)NSArray *albumsArray;

@end

NS_ASSUME_NONNULL_END
