//
//  RootViewController.h
//  UIPageViewControllerSample
//
//  Created by majianglin on 3/16/16.
//  Copyright © 2016 TOTEM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;

@end

