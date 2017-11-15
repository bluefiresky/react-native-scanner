//
//  LBXScanVideoZoomView.h
//  ScannerModule
//
//  Created by sky on 2017/11/15.
//  Copyright © 2017年 Sky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBXScanVideoZoomView : UIView

/**
 @brief 控件值变化
 */
@property (nonatomic, copy,nullable) void (^block)(float value);

- (void)setMaximunValue:(CGFloat)value;

@end
