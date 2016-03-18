//
//  LabelAutoSizeViewController.m
//  NSAutoLayoutSample
//
//  Created by majianglin on 3/18/16.
//  Copyright © 2016 TOTEM. All rights reserved.
//

#import "LabelAutoSizeViewController.h"

@interface LabelAutoSizeViewController ()

@property(nonatomic, weak) IBOutlet UILabel *priceLabel;


@end

@implementation LabelAutoSizeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    self.priceLabel.text = @"价格：$9999999.99";
}


@end
