//
//  ViewController.m
//  QRCodeGenerator
//
//  Created by majianglin on 6/15/16.
//  Copyright © 2016 TOTEM. All rights reserved.
//

#import "ViewController.h"
#import "TTBarCodeGenerator.h"



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.qrCodeView.image = [TTBarCodeGenerator generateQRCodeWithString:@"http://www.totemtec.com"];
    
    self.barCodeView.image = [TTBarCodeGenerator generateBarCodeWithString:@"1234567890123456"];
}

@end
