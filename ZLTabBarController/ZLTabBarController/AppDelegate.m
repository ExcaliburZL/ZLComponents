//
//  AppDelegate.m
//  ZLTabBarController
//
//  Created by 赵乐 on 16/8/19.
//  Copyright © 2016年 zhaole. All rights reserved.
//

#import "AppDelegate.h"
#import "MainController.h"
#import "ZLTVCO.h"
#import "ZLTVCT.h"
#import "ZLTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
    //Option1 ZLTabBarController不作为主控制器
    MainController *main = [[MainController alloc]init];
    [self.window setRootViewController:main];
    
   //Option2  如果是将ZLTabBarController 作为主要Controller 则使用下面方法

//    NSArray *cArray = [self setViewControllers];
//    NSArray *tabBarItemsAttributes = [self setTabBarAttributes];
//    NSArray *textAttributes = [self setTextColor];
//    ZLTabBarController *tabBarController = [ZLTabBarController initWithControllers:cArray  withTabBarItemsAttributes:tabBarItemsAttributes withTextColorAttributes:textAttributes];
//    [self.window setRootViewController:tabBarController];
    
    [self.window makeKeyAndVisible];
    return YES;
    
}


- (NSArray *)setViewControllers
{
    ZLTVCO *one = [[ZLTVCO alloc]init];
    ZLTVCT *two = [[ZLTVCT alloc]init];
    return @[one,two];
}

- (NSArray *)setTabBarAttributes
{
    NSDictionary *dic1 = @{
                           TABBAR_TITLE:@"朋友圈",
                           TABBAR_IMAGE:@"friendship",
                           TABBAR_SELECTES_IMAGE:@"friendship_selected"
                           };
    NSDictionary *dic2 = @{
                           TABBAR_TITLE:@"朋友",
                           TABBAR_IMAGE:@"friends",
                           TABBAR_SELECTES_IMAGE:@"friends_selected"
                           };
    return @[dic1,dic2];
}

- (NSArray *)setTextColor
{
    UIColor *textColor = [UIColor colorWithRed:0.600 green:0.663 blue:0.659 alpha:1.00];
    UIColor *selectedtextColor = [UIColor colorWithRed:0.890 green:0.220 blue:0.169 alpha:1.00];
    return @[textColor,selectedtextColor];
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
