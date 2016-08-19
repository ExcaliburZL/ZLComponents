//
//  AppDelegate.m
//  ZLTabBarController
//
//  Created by 赵乐 on 16/8/19.
//  Copyright © 2016年 zhaole. All rights reserved.
//

#import "AppDelegate.h"
#import "ZLTVCO.h"
#import "ZLTVCT.h"
#import "ZLTabBarController.h"


@interface AppDelegate ()
@property (nonatomic,strong) ZLTabBarController *tabBarController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
    [self setViewControllers];
    [self.window setRootViewController:self.tabBarController];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void) setViewControllers
{
    //get all controllers
    ZLTVCO *one = [[ZLTVCO alloc]init];
    UIViewController *first = [[UINavigationController alloc]initWithRootViewController:one];
    ZLTVCT *two = [[ZLTVCT alloc]init];
    UIViewController *scond = [[UINavigationController alloc]initWithRootViewController:two];
    
    ZLTabBarController *tabBarController = [[ZLTabBarController alloc]init];
    [self setTabBarForControllers:tabBarController];
    [tabBarController setViewControllers:@[first,scond]];
    self.tabBarController = tabBarController;
  
}

- (void) setTabBarForControllers:(ZLTabBarController *) tabBarController
{
    //config tabBar for each ViewController
    NSDictionary *dic1 = @{
                           ZLTabBarItemTitle:@"Item1",
                           ZLTabBarItemImage:@"message_normal",
                           ZLTabBarItemSelectedImage:@"message_highlight"
                           };
    NSDictionary *dic2 = @{
                           ZLTabBarItemTitle:@"Item2",
                           ZLTabBarItemImage:@"home_normal",
                           ZLTabBarItemSelectedImage:@"home_highlight"
                           };
    NSArray *tabBarItemsAttributes = @[
                                       dic1,
                                       dic2
                                       ];
    tabBarController.tabBarItemsAttributes = tabBarItemsAttributes;
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
