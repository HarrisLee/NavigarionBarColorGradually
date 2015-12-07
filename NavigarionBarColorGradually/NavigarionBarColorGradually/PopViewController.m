//
//  PopViewController.m
//  NavigarionBarColorGradually
//
//  Created by JianRongCao on 15/12/7.
//  Copyright © 2015年 JianRongCao. All rights reserved.
//

#import "PopViewController.h"
#import "SNNavigationControllerProtocol.h"
#import "TableViewModel.h"

@interface PopViewController ()<SNNavigationControllerProtocol>
{
    UISwitch *switchView;
    BOOL showAlert;
    UITableView *tables;
    TableViewModel *model;
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
    
    
    
    //tableView的数据逻辑独立出ViewController，增加代码可读性
    model = [[TableViewModel alloc] init];
    NSArray *array = @[@{@"name":@"张1"},@{@"name":@"张2"},@{@"name":@"张3"},@{@"name":@"张4"},@{@"name":@"张5"},@{@"name":@"张6"},@{@"name":@"张7"},@{@"name":@"张8"},@{@"name":@"张9"},@{@"name":@"张10"}];
    model.items = [NSMutableArray arrayWithArray:array];
    tables = [[UITableView alloc] initWithFrame:CGRectMake(0, 150, [UIScreen mainScreen].bounds.size.width, 300) style:UITableViewStylePlain];
    tables.delegate = model;
    tables.dataSource = model;
    [self.view addSubview:tables];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"pop appear");
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
