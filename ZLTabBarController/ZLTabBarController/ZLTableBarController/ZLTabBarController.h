//
//  ZLTabBarController.h
//  ZLTabBarController
//
//  Created by 赵乐 on 16/8/19.
//  Copyright © 2016年 zhaole. All rights reserved.
//

#import <UIKit/UIKit.h>
static NSString *const ZLTabBarItemTitle = @"tabBarItemTitle";
static NSString *const ZLTabBarItemImage = @"tabBarItemImage";
static NSString *const ZLTabBarItemSelectedImage = @"tabBarItemSelectedImage";

@interface ZLTabBarController : UITabBarController
@property (nonatomic, readwrite, copy) NSArray *viewControllers;
@property (nonatomic, copy) NSArray *tabBarItemsAttributes;
@end
