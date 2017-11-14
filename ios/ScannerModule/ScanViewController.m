//
//  ScanViewController.m
//  ScannerModule
//
//  Created by sky on 2017/11/14.
//  Copyright © 2017年 Sky. All rights reserved.
//

#import "ScanViewController.h"
#import <Foundation/Foundation.h>

@interface ScanViewController ()
@property (nonatomic, assign) CGSize size;
@end

@implementation ScanViewController

-(void) viewDidLoad
{
    [super viewDidLoad];
    self.size = [[UIScreen mainScreen] bounds].size;
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self setNavBar];
    [self setBackButton];
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
    backButton.backgroundColor = [UIColor clearColor];
    [backButton setTitle:@"关闭" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    backButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [backButton addTarget:self action:@selector(onBack) forControlEvents:UIControlEventTouchUpInside];
    return backButton;
}

// Method
-(void) onBack
{
    self.completionBlock(@"aaaaaaaaaaaaaaaaaaaaa");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)setCompletionWithBlock:(void (^) (NSString *resultAsString))completionBlock
{
    self.completionBlock = completionBlock;
}

@end

