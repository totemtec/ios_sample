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
