//
//  SNNavigationController.m
//  CollectionViewDemo
//
//  Created by JianRongCao on 15/12/2.
//  Copyright © 2015年 JianRongCao. All rights reserved.
//

#import "SNNavigationController.h"
#import "SNNavigationControllerProtocol.h"



@interface UINavigationController (UINavigationControllerItemAction)

- (BOOL)navigationBar:(UINavigationBar*)navigationBar shouldPopItem:(UINavigationItem*)item;

@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wincomplete-implementation"
@implementation UINavigationController (UINavigationControllerItemAction)

@end
#pragma clang diagnostic pop



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



/**
 *  在Navigation点击返回按钮返回到上一个页面时，会调用此方法，从写这个方法可以加入我们的处理过程。
 *
 *  @param navigationBar 导航栏
 *  @param item          点击的NavigationItem
 *
 *  @return 是否继续调用系统的返回事件。
 */
- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item
{
    UIViewController *viewController = self.topViewController;

    if (item != viewController.navigationItem) {
        return [super navigationBar:navigationBar shouldPopItem:item];
    }
    
    if ([viewController conformsToProtocol:@protocol(SNNavigationControllerProtocol)]) {
        if ([(id<SNNavigationControllerProtocol>)viewController sn_navigationControllerPopWhenSystembackPopSelected:self]) {
            return [super navigationBar:navigationBar shouldPopItem:item];
        }
        //将item的点击效果去除
        [item setHidesBackButton:YES];
        [item setHidesBackButton:NO];
        return NO;
    }
    
    return [super navigationBar:navigationBar shouldPopItem:item];
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
