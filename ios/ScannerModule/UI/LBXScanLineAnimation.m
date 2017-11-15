//
//  LBXScanLineAnimation.m
//  ScannerModule
//
//  Created by sky on 2017/11/15.
//  Copyright © 2017年 Sky. All rights reserved.
//

#import "LBXScanLineAnimation.h"

@interface LBXScanLineAnimation()
{
    int num;
    BOOL down;
    NSTimer * timer;
    
    BOOL isAnimationing;
}

@property (nonatomic,assign) CGRect animationRect;

@end

@implementation LBXScanLineAnimation

-(void) stepAnimation
{
    if(!isAnimationing) return;
    
    CGFloat leftx = self.animationRect.origin.x + 5;
    CGFloat width = self.animationRect.size.width - 10;
    
    self.frame = CGRectMake(leftx, self.animationRect.origin.y + 8, width, 8);
    self.alpha = 0.0;
    self.hidden = NO;
    
    __weak __typeof(self) weakSelf = self;
    
    [UIView animateWithDuration:0.5 animations:^{
        weakSelf.alpha = 1.0;
    } completion:^(BOOL finished){ }];
    
    [UIView animateWithDuration:3 animations:^{
        CGFloat leftx = self.animationRect.origin.x + 5;
        CGFloat width = self.animationRect.size.width - 10;
        CGFloat y = self.animationRect.origin.y + self.animationRect.size.height - 8;
        weakSelf.frame = CGRectMake(leftx, y, width, 4);
    } completion:^(BOOL finished) {
        self.hidden = YES;
        [weakSelf performSelector:@selector(stepAnimation) withObject:nil afterDelay:0.3];
    }];
}

/**
 *  开始扫码线动画
 *
 *  @param animationRect 显示在parentView中得区域
 *  @param parentView    动画显示在UIView
 *  @param image     扫码线的图像
 */
- (void)startAnimatingWithRect:(CGRect)animationRect InView:(UIView*)parentView Image:(UIImage*)image
{
    if (isAnimationing) return;
    isAnimationing = YES;
    
    self.animationRect = animationRect;
    down = YES;
    num =0;
    
    CGFloat centery = CGRectGetMinY(animationRect) + CGRectGetHeight(animationRect)/2;
    CGFloat leftx = animationRect.origin.x + 5;
    CGFloat width = animationRect.size.width - 10;
    
    self.frame = CGRectMake(leftx, centery+2*num, width, 2);
    self.image = image;
    
    [parentView addSubview:self];
    
    [self startAnimating_UIViewAnimation];
}

/**
 *  停止动画
 */
- (void)stopAnimating
{
    if (isAnimationing) {
        isAnimationing = NO;
        
        [self removeFromSuperview];
    }
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}

- (void)dealloc
{
    [self stopAnimating];
}


// Method
- (void)startAnimating_UIViewAnimation
{
    [self stepAnimation];
}

@end
