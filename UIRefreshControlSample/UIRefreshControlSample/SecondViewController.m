//
//  SecondViewController.m
//  UIRefreshControlSample
//
//  Created by majianglin on 3/16/16.
//  Copyright © 2016 TOTEM. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
{
    NSUInteger pageIndex;
}

@property(nonatomic, strong) NSMutableArray *array;

@end


@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.array = [NSMutableArray array];
    
    [self.refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    
    [self loadData:1];
}


- (void)refreshFinish:(id)sender
{
    [self.tableView reloadData];
    
    [self.refreshControl endRefreshing];
}

- (void)loadData:(NSUInteger)page
{
    if (page == 1)
    {
        [self.array removeAllObjects];
    }
    
    NSUInteger count = self.array.count;
    
    for (NSUInteger i = count; i < count + 20; i++)
    {
        [self.array addObject:[NSString stringWithFormat:@"Second List Row %ld", i]];
    }
    
    [self performSelector:@selector(refreshFinish:) withObject:nil afterDelay:1];
}

- (void)refresh:(id)sender
{
    pageIndex = 1;
    [self loadData:pageIndex];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SecondCell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.array[indexPath.row];
    
    return cell;
}

@end
