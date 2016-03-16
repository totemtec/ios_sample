//
//  SecondViewController.m
//  UIRefreshControlSample
//
//  Created by majianglin on 3/16/16.
//  Copyright © 2016 TOTEM. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property(nonatomic, strong) NSMutableArray *array;

@end


@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.array = [NSMutableArray array];
    
    for (int i = 0; i < 50; i++)
    {
        [self.array addObject:[NSString stringWithFormat:@"Second List Row %i", i]];
    }
    
    [self.tableView reloadData];
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
