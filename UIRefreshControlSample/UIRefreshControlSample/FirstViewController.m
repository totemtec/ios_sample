//
//  FirstViewController.m
//  UIRefreshControlSample
//
//  Created by majianglin on 3/16/16.
//  Copyright © 2016 TOTEM. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
{
    BOOL needAutoRefresh;
}

@property(nonatomic, strong) NSMutableArray *array;

@end


@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.array = [NSMutableArray array];
    
    for (int i = 0; i < 50; i++)
    {
        [self.array addObject:[NSString stringWithFormat:@"Row %i", i]];
    }
    
    [self.tableView reloadData];

    [self.refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    
    needAutoRefresh = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self autoRefresh:nil];
}

- (void)refresh:(id)sender
{
    [self performSelector:@selector(refreshFinish:) withObject:nil afterDelay:1];
}

- (void)autoRefresh:(id)sender
{
    if (needAutoRefresh)
    {
        self.tableView.contentOffset = CGPointMake(0, -self.refreshControl.frame.size.height);
        [self.refreshControl beginRefreshing];
        
        [self refresh:nil];
        
        needAutoRefresh = NO;
    }
}

- (void)refreshFinish:(id)sender
{
    [self.refreshControl endRefreshing];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FirstCell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.array[indexPath.row];
    
    return cell;
}


@end
