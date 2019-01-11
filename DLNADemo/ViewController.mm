//
//  ViewController.m
//  DLNADemo
//
//  Created by goviewtech on 2019/1/11.
//  Copyright © 2019 goviewtech. All rights reserved.
//

#import "ViewController.h"
#import "YMUpnpManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[YMUpnpManager manager] startDMServer];
    });
    
}


@end
