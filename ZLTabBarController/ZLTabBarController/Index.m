//
//  Index.m
//  ZLTabBarController
//
//  Created by 赵乐 on 16/8/19.
//  Copyright © 2016年 zhaole. All rights reserved.
//

#import "Index.h"
#import "ZLTVCO.h"
#import "ZLTVCT.h"
#import "ZLTabBarController.h"
#import "ZLConfig.h"
@interface Index ()
@property (nonatomic,strong) ZLTabBarController *tabBarController;
@end

@implementation Index


- (void)viewDidLoad
{
    [super viewDidLoad];
    ZLTVCO *one = [[ZLTVCO alloc]init];
    ZLTVCT *two = [[ZLTVCT alloc]init];
    
    ZLConfig *config = [[ZLConfig alloc]init];
    NSArray *naviArray = [config navigationControllers:@[one,two]];
    [self setViewControllers:naviArray];
}



- (void)setViewControllers:(NSArray *)array
{
    ZLTabBarController *tabBarController = [[ZLTabBarController alloc]init];
    [self setTabBarForControllers:tabBarController];
    [tabBarController setViewControllers:array];
    self.tabBarController = tabBarController;
    [self addChildViewController:tabBarController];

    [self.view addSubview:tabBarController.view];
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
@end
