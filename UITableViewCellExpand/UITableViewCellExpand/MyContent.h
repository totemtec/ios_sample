//
//  MyContent.h
//  UITableViewCellExpand
//
//  Created by majianglin on 3/26/16.
//  Copyright © 2016 TOTEM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyContent : NSObject

@property(nonatomic, weak) NSString *text;
@property(nonatomic, assign) BOOL expand;  //记录内容是否展开，还需要计算是否需要展开

@end
