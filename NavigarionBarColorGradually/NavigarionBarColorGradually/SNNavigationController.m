//
//  SNNavigationController.m
//  CollectionViewDemo
//
//  Created by JianRongCao on 15/12/2.
//  Copyright © 2015年 JianRongCao. All rights reserved.
//

#import "SNNavigationController.h"

@interface SNNavigationController ()

@end

@implementation SNNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    [self.navigationBar setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:0.18 green:0.71 blue:0.92 alpha:progress]
                                                           size:CGSizeMake([UIScreen mainScreen].bounds.size.width, 64)]
                             forBarMetrics:UIBarMetricsDefault];
}

- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, size.width, size.height, 8, 4 * size.width, colorSpace, (CGBitmapInfo)kCGImageAlphaPremultipliedFirst);
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    
    UIImage *image = [UIImage imageWithCGImage:imageMasked];
    
    CGImageRelease(imageMasked);
    
    return image;
}

@end
