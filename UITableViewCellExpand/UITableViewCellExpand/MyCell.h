//
//  MyCell.h
//  UITableViewCellExpand
//
//  Created by majianglin on 3/26/16.
//  Copyright © 2016 TOTEM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyContent.h"

@interface MyCell : UITableViewCell

@property(nonatomic, weak) IBOutlet UILabel *contentLabel;

@property(nonatomic, weak) MyContent *content;

@end
