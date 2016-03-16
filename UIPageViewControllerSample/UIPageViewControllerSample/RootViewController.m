//
//  RootViewController.m
//  UIPageViewControllerSample
//
//  Created by majianglin on 3/16/16.
//  Copyright © 2016 TOTEM. All rights reserved.
//

#import "RootViewController.h"
#import "ContentViewController.h"

@interface RootViewController ()

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) NSArray *pageTitles;

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.pageTitles = @[@"最新", @"热门", @"我的", @"你的", @"他的"];
    
    for (int i = 0; i < self.pageTitles.count; i++)
    {
        NSString *string = self.pageTitles[i];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(10 + 80*i, 3, 70, 40);
        button.tag = i;
        [button addTarget:self action:@selector(gotoPage:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:string forState:UIControlStateNormal];
        [self.scrollView addSubview:button];
    }

    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.delegate = self;

    ContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];


    self.pageViewController.dataSource = self;

    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];

    CGRect pageViewRect = self.view.bounds;
    pageViewRect.origin.y = self.scrollView.frame.origin.y + self.scrollView.frame.size.height;
    pageViewRect.size.height = pageViewRect.size.height - pageViewRect.origin.y;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        pageViewRect = CGRectInset(pageViewRect, 40.0, 40.0);
    }
    self.pageViewController.view.frame = pageViewRect;

    [self.pageViewController didMoveToParentViewController:self];

    self.view.gestureRecognizers = self.pageViewController.gestureRecognizers;
}

- (void)gotoPage:(id)sender
{
    UIButton *button = (UIButton*)sender;
    NSLog(@"title: %@", button.titleLabel.text);
    
    ContentViewController *oldViewController = (ContentViewController *)[self.pageViewController.viewControllers objectAtIndex:0];
    NSUInteger pageIndex = oldViewController.index;
    
    UIPageViewControllerNavigationDirection direction = UIPageViewControllerNavigationDirectionForward;
    
    if (button.tag == pageIndex)
    {
        return;
    }
    else if(button.tag < pageIndex)
    {
        direction = UIPageViewControllerNavigationDirectionReverse;
    }
    
    ContentViewController *viewController = [self viewControllerAtIndex:button.tag];
    
    if (viewController == nil)
    {
        return;
    }
    
    __weak RootViewController *weakSelf = self;
    
    [self.pageViewController setViewControllers:@[viewController]
                                  direction:direction
                                   animated:YES
                                 completion:^(BOOL finished) {
                                     [weakSelf resetHighlightForIndex:button.tag];
                                 }];
    
}


#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    ContentViewController *content = (ContentViewController *)viewController;
    NSUInteger index = content.index;
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    ContentViewController *content = (ContentViewController *)viewController;
    NSUInteger index = content.index;
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (ContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    ContentViewController *content = [self.storyboard instantiateViewControllerWithIdentifier:@"ContentViewController"];

    if (index == 1)
    {
        content.view.backgroundColor = [UIColor redColor];
    }
    else if (index == 2)
    {
        content.view.backgroundColor = [UIColor greenColor];
    }
    else if (index == 3)
    {
        content.view.backgroundColor = [UIColor blueColor];
    }
    else if (index == 4)
    {
        content.view.backgroundColor = [UIColor grayColor];
    }
    content.index = index;
    content.title = self.pageTitles[index];
    return content;
}

#pragma mark - UIPageViewController delegate methods

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers
{
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed
{
    ContentViewController *content = (ContentViewController *)pageViewController.viewControllers.lastObject;
    NSLog(@"%ld", content.index);
    
    [self resetHighlightForIndex:content.index];
}

- (void)resetHighlightForIndex:(NSInteger)index
{
    for (int i = 0; i < self.scrollView.subviews.count; i++)
    {
        UIButton *button = [self.scrollView.subviews objectAtIndex:i];
        if (i == index)
        {
            [button setBackgroundColor:[UIColor redColor]];
        }
        else
        {
            [button setBackgroundColor:nil];
        }
    }
}


@end
