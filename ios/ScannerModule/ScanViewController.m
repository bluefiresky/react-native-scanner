//
//  ScanViewController.m
//  ScannerModule
//
//  Created by sky on 2017/11/14.
//  Copyright © 2017年 Sky. All rights reserved.
//

#import "ScanViewController.h"
#import "LBXScanVideoZoomView.h"

@interface ScanViewController ()
@property (nonatomic, strong) LBXScanVideoZoomView *zoomView;
@property (nonatomic, assign) CGSize size;
@end

@implementation ScanViewController

-(void) viewDidLoad
{
    [super viewDidLoad];
    self.size = [[UIScreen mainScreen] bounds].size;
    self.view.backgroundColor = [UIColor blackColor];
    
    //设置扫码后需要扫码图像
    self.isNeedScanImage = NO;
    [self setNavBar];
}


-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}


// UI
-(void) setNavBar
{
    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.size.width, 64)];
    navView.backgroundColor = [UIColor colorWithRed:56.0/255.0 green:58.0/255.0 blue:69.0/255.0 alpha:1.0];
    [navView addSubview:[self setBackButton]];
    [self.view addSubview:navView];
}

-(UIButton*) setBackButton
{
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 20, 60, 44)];
    backButton.imageEdgeInsets = UIEdgeInsetsMake(-6, -10, -6, -10);
    backButton.titleEdgeInsets = UIEdgeInsetsMake(-10, -24, -10, -10);
    backButton.backgroundColor = [UIColor clearColor];
    [backButton setTitle:@"关闭" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    backButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [backButton setImage:[UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_titlebar_back_nor"] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_titlebar_back_nor"] forState:UIControlStateHighlighted];
    [backButton addTarget:self action:@selector(onBack) forControlEvents:UIControlEventTouchUpInside];
    return backButton;
}


// Method
- (void)scanResultWithArray:(NSArray<LBXScanResult*>*)array
{
    if (array.count < 1)
    {
        self.completionBlock(@"null");
        return;
    }
    
    //经测试，可以同时识别2个二维码，不能同时识别二维码和条形码
    for (LBXScanResult *result in array) {
        
        NSLog(@"scanResult:%@",result.strScanned);
    }
    
    LBXScanResult *scanResult = array[0];
    
    NSString*strResult = scanResult.strScanned;
    
    self.scanImage = scanResult.imgScanned;
    
    if (!strResult) {
        
        self.completionBlock(@"no result");
        
        return;
    }
    
    //震动提醒
    // [LBXScanWrapper systemVibrate];
    //声音提醒
    //[LBXScanWrapper systemSound];
    self.completionBlock(scanResult.strScanned);
    //[self showNextVCWithScanResult:scanResult];
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void) onBack
{
    self.completionBlock(@"aaaaaaaaaaaaaaaaaaaaa");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)setCompletionWithBlock:(void (^) (NSString *resultAsString))completionBlock
{
    self.completionBlock = completionBlock;
}


//开关闪光灯
- (void)openOrCloseFlash
{
    [super openOrCloseFlash];
    
    if (self.isOpenFlash)
    {
        [_btnFlash setImage:[UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_btn_flash_down"] forState:UIControlStateNormal];
    }
    else
        [_btnFlash setImage:[UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_btn_flash_nor"] forState:UIControlStateNormal];
}

//- (void)cameraInitOver
//{
//    if (self.isVideoZoom) {
//        [self zoomView];
//    }
//}

//- (LBXScanVideoZoomView*)zoomView
//{
//    if (!_zoomView)
//    {
//
//        CGRect frame = self.view.frame;
//
//        int XRetangleLeft = self.style.xScanRetangleOffset;
//
//        CGSize sizeRetangle = CGSizeMake(frame.size.width - XRetangleLeft*2, frame.size.width - XRetangleLeft*2);
//
//        if (self.style.whRatio != 1)
//        {
//            CGFloat w = sizeRetangle.width;
//            CGFloat h = w / self.style.whRatio;
//
//            NSInteger hInt = (NSInteger)h;
//            h  = hInt;
//
//            sizeRetangle = CGSizeMake(w, h);
//        }
//
//        CGFloat videoMaxScale = [self.scanObj getVideoMaxScale];
//
//        //扫码区域Y轴最小坐标
//        CGFloat YMinRetangle = frame.size.height / 2.0 - sizeRetangle.height/2.0 - self.style.centerUpOffset;
//        CGFloat YMaxRetangle = YMinRetangle + sizeRetangle.height;
//
//        CGFloat zoomw = sizeRetangle.width + 40;
//        _zoomView = [[LBXScanVideoZoomView alloc]initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame)-zoomw)/2, YMaxRetangle + 40, zoomw, 18)];
//
//        [_zoomView setMaximunValue:videoMaxScale/4];
//
//
//        __weak __typeof(self) weakSelf = self;
//        _zoomView.block= ^(float value)
//        {
//            [weakSelf.scanObj setVideoScale:value];
//        };
//        [self.view addSubview:_zoomView];
//
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
//        [self.view addGestureRecognizer:tap];
//    }
//
//    return _zoomView;
//
//}


@end

