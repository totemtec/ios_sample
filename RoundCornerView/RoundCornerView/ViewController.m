//
//  ViewController.m
//  RoundCornerView
//
//  Created by majianglin on 6/2/16.
//  Copyright © 2016 TOTEM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, weak) IBOutlet UIView *roundCornerView;

@property(nonatomic, weak) IBOutlet UIButton *roundCornerButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 圆角
    self.roundCornerView.layer.cornerRadius = 30.0f;
    
    // 边框
    self.roundCornerView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.roundCornerView.layer.borderWidth = 1.5f;
    
    // 阴影
    self.roundCornerView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.roundCornerView.layer.shadowOpacity = 0.8;
    self.roundCornerView.layer.shadowRadius = 3.0;
    self.roundCornerView.layer.shadowOffset = CGSizeMake(2.0, 2.0);
    
    
    // 按钮设置圆角，记得使用背景，设置好contentMode，网络图片大小不一，会造成不圆
    
    self.roundCornerButton.layer.cornerRadius = 50.0f;
    self.roundCornerButton.layer.masksToBounds = YES;
}


@end
