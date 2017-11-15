//
//  LBXScanView.h
//  ScannerModule
//
//  Created by sky on 2017/11/14.
//  Copyright © 2017年 Sky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBXScanViewStyle.h"
#import "LBXScanLineAnimation.h"

@interface LBXScanView : UIView

/**
 @brief  初始化
 @param frame 位置大小
 @param style 类型
 
 @return instancetype
 */
-(id)initWithFrame:(CGRect)frame style:(LBXScanViewStyle*)style;

/**
 *  设备启动中文字提示
 */
- (void)startDeviceReadyingWithText:(NSString*)text;

/**
 *  设备启动完成
 */
- (void)stopDeviceReadying;

/**
 *  开始扫描动画
 */
- (void)startScanAnimation;

/**
 *  结束扫描动画
 */
- (void)stopScanAnimation;

/**
 根据矩形区域，获取ZXing库扫码识别兴趣区域
 
 @param view 视频流显示视图
 @param style 效果界面参数
 @return 识别区域
 */
+ (CGRect)getZXingScanRectWithPreView:(UIView*)view style:(LBXScanViewStyle*)style;

@end
