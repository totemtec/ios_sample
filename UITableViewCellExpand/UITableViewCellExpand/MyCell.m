//
//  MyCell.m
//  UITableViewCellExpand
//
//  Created by majianglin on 3/26/16.
//  Copyright © 2016 TOTEM. All rights reserved.
//

#import "MyCell.h"

@interface MyCell()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentLabelHeightConstraint;

@end



@implementation MyCell

- (void)setContent:(MyContent *)content
{
    //方式一，改变UILabel行数来限制
//    self.contentLabel.numberOfLines = (content.expand) ? 0 : 3;

    //方式二，设置UILabel的高度约束，比如最高是68，就是3行文字，通过改变约束的优先级来改变高度
    //缺点：最高高度与3行文字高度不是正好匹配，展开或者收缩时，文字稍微有点跳动
    self.contentLabelHeightConstraint.priority = (content.expand) ? UILayoutPriorityDefaultLow : UILayoutPriorityRequired-1;

    self.contentLabel.text = content.text;
}

@end

