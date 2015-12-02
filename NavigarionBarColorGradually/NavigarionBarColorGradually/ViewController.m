//
//  ViewController.m
//  NavigarionBarColorGradually
//
//  Created by JianRongCao on 15/12/2.
//  Copyright © 2015年 JianRongCao. All rights reserved.
//

#import "ViewController.h"
#import "SNNavigationController.h"

@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, width, height)];
    scrollView.delegate = self;
    [scrollView setContentSize:CGSizeMake(width, height * 10)];
    for (int idx = 0; idx < 10; idx++) {
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, height*(idx + 1) - 0.5, width, 0.5)];
        line.backgroundColor = [UIColor lightGrayColor];
        [scrollView addSubview:line];
    }
    [self.view addSubview:scrollView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat totalValue = 64.0*6;
    if (offsetY <= totalValue) {
        SNNavigationController *navi = (SNNavigationController *)self.navigationController;
        navi.progress = offsetY/totalValue;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
