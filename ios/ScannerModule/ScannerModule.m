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
        svc.style = [self qqStyle];
        svc.completionBlock = ^(NSString *resultAsString) {
            NSMutableDictionary *map = [[NSMutableDictionary alloc] initWithCapacity:1];
            [map setValue:resultAsString forKey:@"result"];
            resolve(map);
        };
        UIApplication *app = [UIApplication sharedApplication];
        [app.delegate.window.rootViewController presentViewController:svc animated:YES completion:nil];
    });
}

#pragma mark -模仿qq界面
-(LBXScanViewStyle*)qqStyle
{
    //设置扫码区域参数设置
    
    //创建参数对象
    LBXScanViewStyle *style = [[LBXScanViewStyle alloc]init];
    
    //矩形区域中心上移，默认中心点为屏幕中心点
    style.centerUpOffset = 44;
    
    //扫码框周围4个角的类型,设置为外挂式
    style.photoframeAngleStyle = LBXScanViewPhotoframeAngleStyle_Outer;
    
    //扫码框周围4个角绘制的线条宽度
    style.photoframeLineW = 6;
    
    //扫码框周围4个角的宽度
    style.photoframeAngleW = 24;
    
    //扫码框周围4个角的高度
    style.photoframeAngleH = 24;
    
    //扫码框内 动画类型 --线条上下移动
    style.anmiationStyle = LBXScanViewAnimationStyle_LineMove;
    
    //线条上下移动图片
    style.animationImage = [UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_light_green"];
    
    return style;
}


@end
