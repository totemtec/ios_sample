//
//  TTAppearance.m
//  Common
//
//  Created by Ma Jianglin on 1/16/14.
//  Copyright (c) 2014 totemtec.com. All rights reserved.
//

#import "TTAppearance.h"

@implementation TTAppearance

+ (void)setNavigationBarAppearanceForWindow:(UIWindow*)window
{
    UINavigationBar.appearance.barTintColor = [UIColor colorWithRed:51.0/255 green:51.0/255 blue:51.0/255 alpha:1];
    
//    UINavigationBar.appearance.translucent = YES;
    
    
    
//    UIImage *backgroundImage = [UIImage imageNamed:@"navi_bg"];
//    [UINavigationBar.appearance setBackgroundImage:backgroundImage forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    
    
//    
//    UIImage *backgroundImage = [UIImage imageNamed:@"navi_bg"];
//    [UINavigationBar.appearance setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
//    UINavigationBar.appearance.shadowImage = [UIImage imageNamed:@"nav_shadow"];
    
    //隐藏返回的标题，只是隐藏，不是去掉
    //如果返回的标题过长，会造成详情页的标题被顶到右边，所以需要把返回标题设置的短一些
    //方案0: 使用UITableViewController，返回标题是"Back"或"返回"
    //方案1: StoryBoard上设置前一个ViewController的导航栏的Back Button标题，叫"Back"或"返回"都行
    //方案2: self.navigationController.navigationBar.topItem.title = @"";
    UINavigationBar.appearance.tintColor = [UIColor whiteColor];
    [UIBarButtonItem.appearance setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                       forBarMetrics:UIBarMetricsDefault];
    
    
//    UINavigationBar.appearance.backIndicatorImage = [UIImage imageNamed:@"navi_back"];
//    UINavigationBar.appearance.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"navi_back"];
    

    //    [UINavigationBar.appearance setTitleVerticalPositionAdjustment:-5 forBarMetrics:UIBarMetricsDefault];
    

    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor whiteColor];
    shadow.shadowOffset = CGSizeMake(0, 1);
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSForegroundColorAttributeName:[UIColor redColor],
                                                           NSShadowAttributeName:shadow
                                                           }];
}


@end
