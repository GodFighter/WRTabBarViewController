//
//  AppDelegate.m
//  WRTabBarViewControllerDemo
//
//  Created by xianghui on 2017/7/5.
//  Copyright © 2017年 xianghui. All rights reserved.
//

#import "AppDelegate.h"
#import "WRTabBarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSMutableArray *itemsArray = [NSMutableArray arrayWithCapacity:4];
    for (NSInteger i = 0; i < 5; i++) {
        WRTabBarItem *item = [WRTabBarItem createItemWithClassName:NSStringFromClass([UIViewController class])
                                                     iconImageName:i == 2 ? @"post_normal" : @"account_highlight"
                                             iconSelectedImageName:nil
                                                             title:i == 2 ? nil : [NSString stringWithFormat:@"%ld",(long)i]
                                                      isRaisedItem:i == 2
                                               navigationBarHidden:i == 0];
        [itemsArray addObject:item];
    }
    
    WRTabBarViewController *tabBarVc = [[WRTabBarViewController alloc] initWithItems:itemsArray];
    self.window.rootViewController = tabBarVc;
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
