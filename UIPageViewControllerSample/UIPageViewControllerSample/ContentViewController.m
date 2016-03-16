//
//  ContentViewController.m
//  UIPageViewControllerSample
//
//  Created by majianglin on 3/17/16.
//  Copyright © 2016 TOTEM. All rights reserved.
//

#import "ContentViewController.h"

@interface ContentViewController ()

@end

@implementation ContentViewController


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"Row %ld", indexPath.row];
    
    return cell;
}


@end
