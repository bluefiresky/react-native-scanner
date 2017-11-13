//
//  ScannerModule.m
//  ScannerModule
//
//  Created by sky on 2017/11/13.
//  Copyright © 2017年 Sky. All rights reserved.
//

#import "ScannerModule.h"

@implementation ScannerModule

RCT_EXPORT_MODULE();

RCT_REMAP_METHOD(show,
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    NSMutableArray *map = [[NSMutableDictionary alloc] initWithCapacity:1];
    [map setValue:@"wolegequ" forKey:@"result"];
    resolve(map);
}

@end
