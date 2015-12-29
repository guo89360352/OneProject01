//
//  AppDelegate.m
//  OneProject
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 苹果IOS. All rights reserved.
//

#import "AppDelegate.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    UITabBarController *tabBarVC = [[UITabBarController alloc]init];
    OneViewController *oneVC = [[OneViewController alloc]init];
    UINavigationController *oneNav = [[UINavigationController alloc]initWithRootViewController:oneVC];
    oneVC.navigationItem.title = @"one";
    oneVC.tabBarItem.title = @"One";
    
    TwoViewController *twoVC = [[TwoViewController alloc]init];
    UINavigationController *twoNav = [[UINavigationController alloc]initWithRootViewController:twoVC];
    twoVC.navigationItem.title = @"two";
    twoVC.tabBarItem.title = @"Two";
    
    ThreeViewController *threeVC = [[ThreeViewController alloc]init];
    UINavigationController *threeNav = [[UINavigationController alloc]initWithRootViewController:threeVC];
    threeVC.navigationItem.title = @"three";
    threeVC.tabBarItem.title = @"Three";
    
    
    FourViewController *fourVC = [[FourViewController alloc]init];
    UINavigationController *fourNav = [[UINavigationController alloc]initWithRootViewController:fourVC];
    fourVC.navigationItem.title = @"four";
    fourVC.tabBarItem.title = @"Four";
    
    
    
    tabBarVC.viewControllers = @[oneNav,twoNav,threeNav,fourNav];
    tabBarVC.delegate = self;
    tabBarVC.tabBar.tintColor = [UIColor orangeColor];
    tabBarVC.tabBar.barTintColor = [UIColor cyanColor];
    
    self.window.rootViewController = tabBarVC;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
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
