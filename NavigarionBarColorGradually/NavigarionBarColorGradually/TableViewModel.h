//
//  TableViewModel.h
//  NavigarionBarColorGradually
//
//  Created by JianRongCao on 15/12/7.
//  Copyright © 2015年 JianRongCao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TableViewModel : NSObject <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *items;

@end
