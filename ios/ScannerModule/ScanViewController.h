//
//  ScanViewController.h
//  ScannerModule
//
//  Created by sky on 2017/11/14.
//  Copyright © 2017年 Sky. All rights reserved.
//

#ifndef ScanViewController_h
#define ScanViewController_h
#endif /* ScanViewController_h */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LBXScanViewController.h"

@interface ScanViewController : LBXScanViewController

@property (copy, nonatomic) void (^completionBlock) (NSString *);

/**
 @brief  扫码区域上方提示文字
 */
@property (nonatomic, strong) UILabel *topTitle;

#pragma mark --增加拉近/远视频界面
@property (nonatomic, assign) BOOL isVideoZoom;

#pragma mark - 底部几个功能：开启闪光灯、相册、我的二维码
//底部显示的功能项
@property (nonatomic, strong) UIView *bottomItemsView;

//闪光灯
@property (nonatomic, strong) UIButton *btnFlash;

@end
