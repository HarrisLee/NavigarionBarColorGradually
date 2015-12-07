//
//  BaseViewController.m
//  NavigarionBarColorGradually
//
//  Created by JianRongCao on 15/12/7.
//  Copyright © 2015年 JianRongCao. All rights reserved.
//

#import "BaseViewController.h"
#import <objc/runtime.h>

@interface BaseViewController ()

@end

@implementation BaseViewController

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class selfClass = [self class];
        Method orignalMethod = class_getInstanceMethod(selfClass, @selector(viewDidAppear:));
        Method swizzingMethod = class_getInstanceMethod(selfClass, @selector(sn_viewDidAppear:));
        
        BOOL isAddSuccess = class_addMethod(selfClass, @selector(viewDidAppear:), method_getImplementation(swizzingMethod), method_getTypeEncoding(swizzingMethod));
        if (isAddSuccess) {
            class_replaceMethod(selfClass, @selector(sn_viewDidAppear:), method_getImplementation(orignalMethod), method_getTypeEncoding(orignalMethod));
        } else {
            method_exchangeImplementations(orignalMethod, swizzingMethod);
        }
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)sn_viewDidAppear:(BOOL)animation
{
    [self sn_viewDidAppear:animation];
    NSLog(@"viewdid  ---  %@",self);
}

- (void)setLeftItem
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 30, 30);
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back_rootView:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)back_rootView:(UIButton *)sender
{
    NSLog(@"back");
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
