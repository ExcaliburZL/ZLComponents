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

@interface Index ()
@property (nonatomic,strong) ZLTabBarController *tabBarController;
@end

@implementation Index


- (void)viewDidLoad
{
    [super viewDidLoad];
    ZLTVCO *one = [[ZLTVCO alloc]init];
    ZLTVCT *two = [[ZLTVCT alloc]init];
    
    NSArray *naviArray = [self navigationControllers:@[one,two]];
    [self setViewControllers:naviArray];
}

- (NSArray *)navigationControllers:(NSArray *)array
{
    NSMutableArray *ma = [NSMutableArray array];
    for (id objController in array)
    {
        UIViewController *vc = [[UINavigationController alloc]initWithRootViewController:objController];
        [ma addObject:vc];
    }
    return [ma copy];
}


- (void)setViewControllers:(NSArray *)array
{
    //get all controllers
//    ZLTVCO *one = [[ZLTVCO alloc]init];
//    UIViewController *first = [[UINavigationController alloc]initWithRootViewController:one];
//    ZLTVCT *two = [[ZLTVCT alloc]init];
//    UIViewController *scond = [[UINavigationController alloc]initWithRootViewController:two];
    
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
