//
//  ScannerModule.m
//  ScannerModule
//
//  Created by sky on 2017/11/13.
//  Copyright © 2017年 Sky. All rights reserved.
//

#import "ScannerModule.h"
#import <UIKit/UIKit.h>
#import "ScanViewController.h"

@implementation ScannerModule

RCT_EXPORT_MODULE();

RCT_REMAP_METHOD(show,
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{

    
    dispatch_async(dispatch_get_main_queue(), ^(){
        ScanViewController *svc = [[ScanViewController alloc] init];
        svc.completionBlock = ^(NSString *resultAsString) {
            NSMutableDictionary *map = [[NSMutableDictionary alloc] initWithCapacity:1];
            [map setValue:resultAsString forKey:@"result"];
            resolve(map);
        };
        UIApplication *app = [UIApplication sharedApplication];
        [app.delegate.window.rootViewController presentViewController:svc animated:YES completion:nil];
    });
}

@end
