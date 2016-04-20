//
//  AppDelegate.m
//  UINavigationBarCustomizing
//
//  Created by majianglin on 4/20/16.
//  Copyright © 2016 TOTEM. All rights reserved.
//

#import "AppDelegate.h"
#import "TTAppearance.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [TTAppearance setNavigationBarAppearanceForWindow:self.window];
    
    return YES;
}


@end
