#ZLTabBarController 使用

###一.引入`ZLTabBarController`

1.
```
#import "ZLTabBarController.h"
```


###二.设置ZLTabBarController的两个数组：控制器数组和TabBar属性数组(二选一)
	
	
 1.   当ZLTabBarController不作为RootController
 
	 
		  //设置控制器数组
			ZLTVCO *one = [[ZLTVCO alloc]init];
		    ZLTVCT *two = [[ZLTVCT alloc]init];
		    NSArray *array = @[one,two];
	    
	    //设置tabar属性数组
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
	    
	    ZLTabBarController *tbC = [ZLTabBarController initWithControllers:array  withTabBarItemsAttributes:tabBarItemsAttributes withTextColorAttributes:nil];
	    
	    [self addChildViewController:tbC];
	    [self.view addSubview:tbC.view];
    
 
 2.  当ZLTabBarController作为RootController`AppDelegate.m`
 
    
	    NSArray *cArray = [self setViewControllers];
	    NSArray *tabBarItemsAttributes = [self setTabBarAttributes];
	    NSArray *textAttributes = [self setTextColor];
	    ZLTabBarController *tabBarController = [ZLTabBarController initWithControllers:cArray  		withTabBarItemsAttributes:tabBarItemsAttributes withTextColorAttributes:textAttributes];
	    [self.window setRootViewController:tabBarController];
	    
	    
		- (NSArray *)setViewControllers
		{
			//具体见Demo
		}
		
		- (NSArray *)setTabBarAttributes
		{
			//具体见Demo
		}
		
		- (NSArray *)setTextColor
		{
			//具体见Demo
		}
		   
    
### 三.可选
 1. 设置tabBar的字体颜色(默认灰色,选中后黑色)
 
		   /*
		  	*1.用户自定义字体颜色 @[默认颜色,选中颜色]
		  	*2.初始化的时候就要定义字体的颜色,数组中可以只传入一个值,默认数组中第一个值是普通状态下文字的颜色,只用默认的就传入nil。
		  	*/
		    UIColor *textColor = [UIColor colorWithRed:0.600 green:0.663 blue:0.659 alpha:1.00];
		    UIColor *selectedtextColor = [UIColor colorWithRed:0.890 green:0.220 blue:0.169 alpha:1.00];
		    NSArray *textAttributes = @[textColor,selectedtextColor];

			ZLTabBarController *tbC = [ZLTabBarController initWithControllers:array  withTabBarItemsAttributes:tabBarItemsAttributes withTextColorAttributes:textAttributes];	    
			
2. 自定义badge

	![ZLTabBarController_1][TBC_1]
	
	

	
		ZLTabBarController *tbC = [ZLTabBarController initWithControllers:array  withTabBarItemsAttributes:tabBarItemsAttributes withTextColorAttributes:textAttributes];
		/*	 
		 *BadgeHandleShow 展示自定义badge标识(默认是隐藏),
   		 *BadgeHandleHide 隐藏自定义badge标识
		 */
		
		[tbC handleBadgeWithStuts:BadgeHandleShow];
		
		//指定第N个tabarItem上的badge展示/隐藏
		[tbC handleBadgeWithIndex:1 withStuts:BadgeHandleHide];
	
	
	
	
[TBC_1]:../ScreenShots/ZLTabBarController_1.png	
	

		 
		 
