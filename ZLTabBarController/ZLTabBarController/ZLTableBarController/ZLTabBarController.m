//
//  ZLTabBarController.m
//  ZLTabBarController
//
//  Created by 赵乐 on 16/8/19.
//  Copyright © 2016年 zhaole. All rights reserved.
//



#import "ZLTabBarController.h"


NSUInteger tabbarItemsCount = 0;

@implementation ZLTabBarController
@synthesize viewControllers = _viewControllers;

+ (ZLTabBarController *)initWithControllers:(NSArray *)cArray withTabBarItemsAttributes:(NSArray *)attributes
{
    return [[ZLTabBarController alloc]initWithControllers:cArray withTabBarItemsAttributes: attributes];
}

- (ZLTabBarController *)initWithControllers:(NSArray *)cArray withTabBarItemsAttributes:(NSArray *)attributes
{
    self = [super init];
    if (self)
    {
        NSArray *naviArray = [self navigationControllers:cArray];
        self.tabBarItemsAttributes = attributes;
        self.viewControllers = naviArray;
        [self createAllBadge:attributes.count];
     }
    return self;
}

- (void)handleBadgeWithIndex:(NSUInteger)index withStuts:(BadgeHandle) status
{
    if (index > self.tabBarItemsAttributes.count)
    {
        [NSException raise:@"showBadgeWithIndex method" format:@"index不能超过数组长度"];
        return;
    }
    //展示出选择的
    for (UIView *subView in self.tabBar.subviews)
    {
        //红点的tag
        if (subView.tag == index + 1000)
        {
            if (status == BadgeHandleShow)
            {
                subView.alpha = 1.0;
            }
            else
            {
                subView.alpha = 0.0;
            }
        }
    }
}



- (void)handleBadgeWithStuts:( BadgeHandle) status
{
    NSUInteger index = self.tabBarItemsAttributes.count;
    
    for (UIView *subView in self.tabBar.subviews)
    {
        //红点的tag
        if ((subView.tag > 1000)&&(subView.tag <= index + 1000) )
        {
            if (status == BadgeHandleShow)
            {
                subView.alpha = 1.0;
            }
            else
            {
                subView.alpha = 0.0;
            }
        }
    }
}


-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
 //获取index
    NSInteger index = item.tag - 2000;
 //将红点去除
    //按照tag值进行移除
    for (UIView *subView in tabBar.subviews)
    {
        //红点的tag
        if (subView.tag == index + 1000)
        {
            [subView removeFromSuperview];
        }
    }
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
        viewController.tabBarItem.tag = 2000 + idx+ 1;
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
                selectedImageName:(NSString *)selectedImageName
{
   
    viewController.tabBarItem.title         = title;
    UIImage *normalImage = [UIImage imageNamed:normalImageName];
    normalImage = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.image         = normalImage;
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = selectedImage;
    [self addChildViewController:viewController];
    
}


- (void)createAllBadge:(NSUInteger )count
{
    CGRect tabFrame = self.tabBar.frame;
    CGFloat itemWidth = tabFrame.size.width/count;
    //偏移量
    CGFloat offset = (tabFrame.size.width/(count * 2))-15;
    for (int i = 1; i <= count; i++)
    {
        //新建小红点
        UIView *badgeView = [[UIView alloc]init];
        badgeView.tag = 1000 + i ;
        badgeView.layer.cornerRadius = 5;
        badgeView.backgroundColor = [UIColor redColor];
        //确定小红点的位置
        CGFloat x = ceilf(itemWidth  * i ) - offset;
        CGFloat y = ceilf(0.1 * tabFrame.size.height);
        
        badgeView.frame = CGRectMake(x, y, 10, 10);
        badgeView.alpha = 0.0f;
        [self.tabBar addSubview:badgeView];
    }
}

//viewController --> navigationController
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
