//
//  AppDelegate.m
//  NavigarionBarColorGradually
//
//  Created by JianRongCao on 15/12/2.
//  Copyright © 2015年 JianRongCao. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    ViewController *viewController = [[ViewController alloc] init];
    viewController.title = @"首页";
    SNNavigationController *navi = [[SNNavigationController alloc] initWithRootViewController:viewController];
    NSDictionary *dict = @{NSForegroundColorAttributeName:[UIColor orangeColor],
                           NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:20.0f]};
    navi.navigationBar.titleTextAttributes = dict;
    navi.navigationBar.barTintColor = [UIColor colorWithRed:0.54 green:0.91 blue:0.35 alpha:1];
    navi.navigationBar.tintColor = [UIColor redColor];
    
    //生成透明背景
    //    navi.navigationBar.barTintColor = [UIColor clearColor];
    //    [navi.navigationBar setBackgroundImage:[self imageWithColor:[UIColor clearColor]
    //                                                              size:CGSizeMake([UIScreen mainScreen].bounds.size.width, 64)]
    //                             forBarMetrics:UIBarMetricsDefault];
    //去除导航栏下面的横线
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    self.navigation = navi;
    self.window = window;
    self.window.rootViewController = self.navigation;
    [self.window makeKeyAndVisible];
    return YES;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
