//
//  SNNavigationController.h
//  CollectionViewDemo
//
//  Created by JianRongCao on 15/12/2.
//  Copyright © 2015年 JianRongCao. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SNNavigationController : UINavigationController

@property (nonatomic) CGFloat progress;

@property (nonatomic, strong) UIColor *navigationColor;

@end


@interface UIViewController (enumNavigationBarVisible)
// Worked on each view controller's push or pop, If NO, then when this view controller wants push/pop into a controller hierarchy, the specify bar will slide out.
@property (nonatomic, assign) IBInspectable BOOL wantsNavigationBarVisible; //  Default is YES.

@property (nonatomic, assign, getter=isNavigationBarBackgroundHidden) IBInspectable BOOL navigationBarBackgroundHidden;
- (void)setNavigationBarBackgroundHidden:(BOOL)navigationBarBackgroundHidden animated:(BOOL)animated NS_AVAILABLE_IOS(8_0); // Hide or show the navigation bar background. If animated, it will transition vertically using UINavigationControllerHideShowBarDuration.
- (UIViewController *)previousViewController; //Return the gives
/// view controller's previous view controller in the navigation stack.
@end