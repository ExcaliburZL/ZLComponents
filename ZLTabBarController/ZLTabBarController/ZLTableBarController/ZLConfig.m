//
//  ZLConfig.m
//  ZLTabBarController
//
//  Created by 赵乐 on 16/8/19.
//  Copyright © 2016年 zhaole. All rights reserved.
//

#import "ZLConfig.h"

@implementation ZLConfig

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
@end
