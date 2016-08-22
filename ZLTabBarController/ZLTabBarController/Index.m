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
@end

@implementation Index
- (void)viewDidLoad
{
    [super viewDidLoad];
    ZLTVCO *one = [[ZLTVCO alloc]init];
    ZLTVCT *two = [[ZLTVCT alloc]init];
    ZLTVCT *three = [[ZLTVCT alloc]init];
   NSArray *array = @[one,two,three];
    
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
    NSDictionary *dic3 = @{
                           ZLTabBarItemTitle:@"Item2",
                           ZLTabBarItemImage:@"home_normal",
                           ZLTabBarItemSelectedImage:@"home_highlight"
                           };
    NSArray *tabBarItemsAttributes = @[
                                       dic1,
                                       dic2,
                                       dic3
                                       ];
    

    ZLTabBarController *a = [ZLTabBarController initWithControllers:array  withTabBarItemsAttributes:tabBarItemsAttributes];
    
    //创建指定位置的红点
    //[a showBadgeWithIndex:2];
    //[a handleBadgeWithStuts:BadgeHandleShow];
    //[a handleBadgeWithIndex:1 withStuts:BadgeHandleHide];
    [self addChildViewController:a];
    [self.view addSubview:a.view];
}

@end
