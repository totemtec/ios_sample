//
//  TTBarCodeGenerator.h
//  QRCodeGenerator
//
//  Created by majianglin on 6/15/16.
//  Copyright © 2016 TOTEM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TTBarCodeGenerator : NSObject

+ (UIImage *)generateBarCodeWithString:(NSString*)string;

+ (UIImage *)generateQRCodeWithString:(NSString*)string;

@end
