//
//  ZLTabBarController.h
//  ZLTabBarController
//
//  Created by 赵乐 on 16/8/19.
//  Copyright © 2016年 zhaole. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, BadgeHandle)
{
    BadgeHandleShow = 1,
    BadgeHandleHide = 2
};

#define TABBAR_TITLE            @"tabBarItemTitle"
#define TABBAR_IMAGE            @"tabBarItemImage"
#define TABBAR_SELECTES_IMAGE   @"tabBarItemSelectedImage"


@interface ZLTabBarController : UITabBarController

@property (nonatomic, readwrite, copy) NSArray *viewControllers;
@property (nonatomic, copy)  NSArray *tabBarItemsAttributes;



+ (ZLTabBarController *)initWithControllers:(NSArray *)viewControllers withTabBarItemsAttributes:(NSArray *)attributes withTextColorAttributes:(NSArray *)textAttributes;
- (void)handleBadgeWithStuts:(BadgeHandle) status;
- (void)handleBadgeWithIndex:(NSUInteger)index withStuts:(BadgeHandle) status;
@end
