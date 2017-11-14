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

#import <UIKit/UIKit.h>

@interface ScanViewController : UIViewController
@property (copy, nonatomic) void (^completionBlock) (NSString *);
@end
