//
//  Index.m
//  ZLTabBarController
//
//  Created by 赵乐 on 16/8/19.
//  Copyright © 2016年 zhaole. All rights reserved.
//
#import "MainController.h"
#import "ZLTVCO.h"
#import "ZLTVCT.h"
#import "ZLTabBarController.h"
@interface MainController ()
@end

@implementation MainController
- (void)viewDidLoad
{
    [super viewDidLoad];
    ZLTVCO *one = [[ZLTVCO alloc]init];
    ZLTVCT *two = [[ZLTVCT alloc]init];
    NSArray *array = @[one,two];
    
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

    NSArray *tabBarItemsAttributes = @[dic1,dic2];
    
    //用户自定义字体颜色
    UIColor *textColor = [UIColor colorWithRed:0.600 green:0.663 blue:0.659 alpha:1.00];
    UIColor *selectedtextColor = [UIColor colorWithRed:0.890 green:0.220 blue:0.169 alpha:1.00];
    NSArray *textAttributes = @[textColor,selectedtextColor];
    ZLTabBarController *a = [ZLTabBarController initWithControllers:array  withTabBarItemsAttributes:tabBarItemsAttributes withTextColorAttributes:textAttributes];
    //创建指定位置的红点
    
    [a handleBadgeWithStuts:BadgeHandleShow];
    [a handleBadgeWithIndex:1 withStuts:BadgeHandleHide];
    [self addChildViewController:a];
    [self.view addSubview:a.view];
}

@end
