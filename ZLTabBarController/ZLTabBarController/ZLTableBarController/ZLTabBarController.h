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

static NSString *const ZLTabBarItemTitle = @"tabBarItemTitle";
static NSString *const ZLTabBarItemImage = @"tabBarItemImage";
static NSString *const ZLTabBarItemSelectedImage = @"tabBarItemSelectedImage";

@interface ZLTabBarController : UITabBarController

@property (nonatomic, readwrite, copy) NSArray *viewControllers;
@property (nonatomic, copy) NSArray *tabBarItemsAttributes;
@property (nonatomic) BOOL isCustomBadge;

+ (ZLTabBarController *)initWithControllers:(NSArray *)cArray withTabBarItemsAttributes:(NSArray *)attributes;
- (void)handleBadgeWithStuts:(BadgeHandle) status;
- (void)handleBadgeWithIndex:(NSUInteger)index withStuts:(BadgeHandle) status;
@end
