//
//  TableViewController.m
//  UITableViewDifferentCell
//
//  Created by majianglin on 5/10/16.
//  Copyright © 2016 TOTEM. All rights reserved.
//

#import "TableViewController.h"


@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44.0;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 3 == 1)
    {
        return [tableView dequeueReusableCellWithIdentifier:@"Orange"];
    }
    else if(indexPath.row % 3 == 2)
    {
        return [tableView dequeueReusableCellWithIdentifier:@"Gray"];
    }
    
    return [tableView dequeueReusableCellWithIdentifier:@"White"];
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (indexPath.row % 3 == 1)
//    {
//        return 80;
//    }
//    else if(indexPath.row % 3 == 2)
//    {
//        return 44;
//    }
//    
//    return 44;
//}


@end
