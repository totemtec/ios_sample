//
//  TableViewController.m
//  UITableViewStaticCell
//
//  Created by majianglin on 3/18/16.
//  Copyright © 2016 TOTEM. All rights reserved.
//

#import "TableViewController.h"

@implementation TableViewController

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //hidden the first cell
    NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section];
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:newIndexPath];
    return cell;
}



@end
