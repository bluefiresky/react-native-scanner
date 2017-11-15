//
//  LBXScanResult.m
//  ScannerModule
//
//  Created by sky on 2017/11/15.
//  Copyright © 2017年 Sky. All rights reserved.
//

#import "LBXScanResult.h"

@implementation LBXScanResult

- (instancetype)initWithScanString:(NSString*)str imgScan:(UIImage*)img barCodeType:(NSString*)type
{
    if (self = [super init]) {
        
        self.strScanned = str;
        self.imgScanned = img;
        self.strBarCodeType = type;
    }
    
    return self;
}

@end
