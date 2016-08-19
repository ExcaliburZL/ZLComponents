//
//  ZLTabBarController.m
//  ZLTabBarController
//
//  Created by 赵乐 on 16/8/19.
//  Copyright © 2016年 zhaole. All rights reserved.
//
#import "ZLConfig.h"
#import "ZLTabBarController.h"
NSUInteger tabbarItemsCount = 0;

@implementation ZLTabBarController
@synthesize viewControllers = _viewControllers;
- (void)viewDidLoad
{
    [super viewDidLoad];
    //设置属性
    [self setTabBarItemsTextAttributes];
}



- (void)setTabBarItemsTextAttributes
{
    NSDictionary *normalDic   = @{NSForegroundColorAttributeName:[UIColor grayColor]};
    NSDictionary *selectedDic = @{NSForegroundColorAttributeName:[UIColor blackColor]};
    
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    //TODO:general status ( custom text color )
    [tabBarItem setTitleTextAttributes:normalDic forState:UIControlStateNormal];
    //TODO:selected status ( custom text color )
    [tabBarItem setTitleTextAttributes:selectedDic forState:UIControlStateSelected];
}

- (void)setViewControllers:(NSArray *)viewControllers
{
    _viewControllers = [viewControllers copy];

    tabbarItemsCount = [viewControllers count];
    NSUInteger idx = 0;
    for (UIViewController *viewController in viewControllers) {
        [self addOneChildViewController:viewController
                              WithTitle:self.tabBarItemsAttributes[idx][ZLTabBarItemTitle]
                        normalImageName:self.tabBarItemsAttributes[idx][ZLTabBarItemImage]
                      selectedImageName:self.tabBarItemsAttributes[idx][ZLTabBarItemSelectedImage]];
        idx ++;
    }
}

/**
 *  添加一个子控制器
 *
 *  @param viewController    控制器
 *  @param title             标题
 *  @param normalImageName   图片
 *  @param selectedImageName 选中图片
 */
- (void)addOneChildViewController:(UIViewController *)viewController
                        WithTitle:(NSString *)title
                  normalImageName:(NSString *)normalImageName
                selectedImageName:(NSString *)selectedImageName {
    
    viewController.tabBarItem.title         = title;
    UIImage *normalImage = [UIImage imageNamed:normalImageName];
    normalImage = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.image         = normalImage;
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = selectedImage;
    
    [self addChildViewController:viewController];
    
}

//- (void)setTabBar
//{
//    [self setValue:[ZLTabBar class] forKey:@"tabBar"];
//}

@end
