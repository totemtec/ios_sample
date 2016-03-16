//
//  ViewController.m
//  UIRefreshControlSample
//
//  Created by majianglin on 3/16/16.
//  Copyright © 2016 TOTEM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, weak) IBOutlet UIView *containerView;

@property(nonatomic, strong) UIViewController *first;

@property(nonatomic, strong) UIViewController *second;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.first = self.childViewControllers[0];
    
}

- (IBAction)toggleViewController:(id)sender
{
    UISegmentedControl *segment = (UISegmentedControl*)sender;
    
    NSInteger index = segment.selectedSegmentIndex;
    
    if (index == 0)
    {
        if (self.first == nil)
        {
            self.first = [self.storyboard instantiateViewControllerWithIdentifier:@"FirstViewController"];
        }
        
        [self showController:self.first fromLeft:YES];
    }
    else
    {
        if (self.second == nil)
        {
            self.second = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
        }
        
        [self showController:self.second fromLeft:NO];
    }
}

- (void)showController:(UIViewController*)newVC fromLeft:(BOOL)fromLeft
{
    UIViewController *oldVC = self.childViewControllers.firstObject;
    if (oldVC == newVC) {
        return;
    }
    
    [oldVC willMoveToParentViewController:nil];
    
    [self addChildViewController:newVC];
    newVC.view.frame = self.containerView.bounds;
    
    if (oldVC != nil)
    {
        newVC.view.frame = [self newViewStartFrameFromLeft:fromLeft];
        CGRect endFrame = [self oldViewEndFrameFromLeft:fromLeft];
        
        NSLog(@"x=%.1f, y=%.1f, w=%.1f, h=%.1f", newVC.view.frame.origin.x, newVC.view.frame.origin.y, newVC.view.frame.size.width, newVC.view.frame.size.height);
        
        [self transitionFromViewController:oldVC
                          toViewController:newVC
                                  duration:0.25f
                                   options:0
                                animations:^
        {
            newVC.view.frame = self.containerView.bounds;
            
            NSLog(@"x=%.1f, y=%.1f, w=%.1f, h=%.1f",
                  newVC.view.frame.origin.x,
                  newVC.view.frame.origin.y,
                  newVC.view.frame.size.width,
                  newVC.view.frame.size.height);
            
            oldVC.view.frame = endFrame;
            
        } completion:^(BOOL finished) {
            [oldVC removeFromParentViewController];
            [newVC didMoveToParentViewController:self];
        }];
    }
}

- (CGRect)newViewStartFrameFromLeft:(BOOL)fromLeft
{
    CGRect rect = self.containerView.bounds;
    if (fromLeft)
    {
        rect.origin.x -= rect.size.width;
    }
    else
    {
        rect.origin.x += rect.size.width;
    }
    
    return rect;
}

- (CGRect)oldViewEndFrameFromLeft:(BOOL)fromLeft
{
    CGRect rect = self.containerView.bounds;
    if (fromLeft)
    {
        rect.origin.x += rect.size.width;
    }
    else
    {
        rect.origin.x -= rect.size.width;
    }
    return rect;
}



@end
