//
//  TableViewController.m
//  UITableViewVariableRowHeight
//
//  Created by majianglin on 3/15/16.
//  Copyright © 2016 TOTEM. All rights reserved.
//

#import "TableViewController.h"
#import "MyCell.h"

@interface TableViewController ()

@property(nonatomic, strong) NSArray *array;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44.0; // set to whatever your "average" cell height is
    
    
    self.array = @[
                   @"In your UITableViewCell subclass, add constraints so that the subviews of the cell have their edges pinned to the edges of the cell's contentView (most importantly to the top AND bottom edges)",
                   @"NOTE: don't pin subviews to the cell itself; only to the cell's contentView! ",
                   @"Getting your constraints right is definitely the hardest and most important part of getting dynamic cell heights working with Auto Layout.",
                   @"2. Determine Unique Table View Cell Reuse Identifiers",
                   @"Do not add cells with completely different sets of constraints to the same reuse pool (i.e. use the same reuse identifier) and then attempt to remove the old constraints and set up new constraints from scratch after each dequeue. The internal Auto Layout engine is not designed to handle large scale changes in constraints, and you will see massive performance issues.",
                   @"For iOS 8 - Self-Sizing Cells 3. Enable Row Height Estimation",
                   @"self.tableView.rowHeight = UITableViewAutomaticDimension; \nself.tableView.estimatedRowHeight = 44.0;",
                   @"You should set the estimatedRowHeight property on the table view (in viewDidLoad or similar) to a constant value that is the \"average\" row height",
                   @"Only if your row heights have extreme variability (e.g. differ by an order of magnitude) and you notice the scroll indicator \"jumping\" as you scroll should you bother implementing tableView:estimatedHeightForRowAtIndexPath: to do the minimal calculation required to return a more accurate estimate for each row",
                   @"Note that due to differences in intrinsic content size, cells with the same constraints (type) may still have varying heights! ",
                   @"Don't confuse fundamentally different layouts (different constraints) with different calculated view frames (solved from identical constraints) due to different sizes of content.",
                   @"Reference",
                   @"https://github.com/smileyborg/TableViewCellWithAutoLayoutiOS8"
                   ];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.array[indexPath.row];
    
    return cell;
}


@end