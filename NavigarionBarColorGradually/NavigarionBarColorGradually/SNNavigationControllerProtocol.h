//
//  SNNavigationControllerProtocol.h
//  NavigarionBarColorGradually
//
//  Created by JianRongCao on 15/12/7.
//  Copyright © 2015年 JianRongCao. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SNNavigationController;

@protocol SNNavigationControllerProtocol <NSObject>

@optional
- (BOOL)sn_navigationControllerPopWhenSystembackPopSelected:(SNNavigationController *)navigationController;

@end
