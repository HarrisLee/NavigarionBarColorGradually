//
//  PopViewController.m
//  NavigarionBarColorGradually
//
//  Created by JianRongCao on 15/12/7.
//  Copyright © 2015年 JianRongCao. All rights reserved.
//

#import "PopViewController.h"
#import "SNNavigationControllerProtocol.h"

@interface PopViewController ()<SNNavigationControllerProtocol>
{
    UISwitch *switchView;
    BOOL showAlert;
}
@end

@implementation PopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    showAlert = NO;
    switchView = [[UISwitch alloc] initWithFrame:CGRectMake(100, 100, 40, 20)];
    [switchView addTarget:self action:@selector(showAlertView:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:switchView];
    
//    //使用自定义的Button返回时，则不会调用 - (BOOL)navigationBar:navigationBar shouldPopItem:item
//    [self setLeftItem];
}

- (void)back_rootView:(UIButton *)sender
{
    [super back_rootView:sender];
    NSLog(@"sub back");
}

- (void)showAlertView:(UISwitch *)sender
{
    showAlert = sender.isOn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)sn_navigationControllerPopWhenSystembackPopSelected:(SNNavigationController *)navigationController
{
    if (showAlert) {
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"使用Pop" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"使用Pop");
        }];
        
        UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"不使用Pop" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"不使用Pop");
        }];
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"你到底是不是要返回？" message:@"我也不知道我要不要返回" preferredStyle:UIAlertControllerStyleActionSheet];
        [alertController addAction:sure];
        [alertController addAction:cancle];
        [self.navigationController presentViewController:alertController animated:YES completion:^{
            
        }];
        return NO;
    }
    
    return !showAlert;
}

@end
