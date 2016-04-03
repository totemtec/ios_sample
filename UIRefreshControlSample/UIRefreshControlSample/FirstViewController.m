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
    NSUInteger _pageIndex;
    NSUInteger _pageSize;
    
    BOOL _needAutoRefresh;
    BOOL _loading;
    BOOL _hasMore;
}

@property(nonatomic, strong) NSMutableArray *array;

@end


@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _pageSize = 40;
    
    self.array = [NSMutableArray array];

    [self.refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    
    _needAutoRefresh = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self autoRefresh:nil];
}


- (void)doneLoadData
{
    _loading = NO;
    
    [self.tableView reloadData];
    
    [self.refreshControl endRefreshing];
}

- (void)loadDataForPage:(NSUInteger)page
{
    _loading = YES;

    if (page == 1)
    {
        [self.array removeAllObjects];
    }
    
    NSUInteger count = self.array.count;
    
    for (NSUInteger i = count; i < count + _pageSize; i++)
    {
        [self.array addObject:[NSString stringWithFormat:@"Row %ld", i]];
    }
    
    _hasMore = self.array.count < 100;
    NSLog(@"loadDataForPage: %ld, _hasMore = %i", page, _hasMore);
    
    [self performSelector:@selector(doneLoadData) withObject:nil afterDelay:1.5];
}

- (void)refresh:(id)sender
{
    _pageIndex = 1;
    [self loadDataForPage:_pageIndex];
}

- (void)autoRefresh:(id)sender
{
    if (_needAutoRefresh)
    {
        self.tableView.contentOffset = CGPointMake(0, -self.refreshControl.frame.size.height);
        [self.refreshControl beginRefreshing];
        
        [self refresh:nil];
        
        _needAutoRefresh = NO;
    }
}


#pragma mark - Table view data source


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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_hasMore && !_loading && indexPath.row > self.array.count-_pageSize/3)
    {
        _pageIndex++;
        [self loadDataForPage:_pageIndex];
    }
}

@end
