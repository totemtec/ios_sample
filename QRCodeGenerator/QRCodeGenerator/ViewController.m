//
//  ViewController.m
//  QRCodeGenerator
//
//  Created by majianglin on 6/15/16.
//  Copyright © 2016 TOTEM. All rights reserved.
//

#import "ViewController.h"
#import <CoreImage/CoreImage.h>



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.qrCodeView.image = [self generateQRCodeWithString:@"http://www.totemtec.com"];
    
    self.barCodeView.image = [self generateBarCodeWithString:@"1234567890123456"];
}

-(UIImage *) generateQRCodeWithString:(NSString *)string
{
    NSData *stringData = [string dataUsingEncoding:NSUTF8StringEncoding ];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setValue:stringData forKey:@"inputMessage"];
    [filter setValue:@"M" forKey:@"inputCorrectionLevel"];
    
    // Render the image into a CoreGraphics image
    CGImageRef cgImage = [[CIContext contextWithOptions:nil] createCGImage:[filter outputImage] fromRect:[[filter outputImage] extent]];
    
    //Scale the image usign CoreGraphics
    CGSize size = CGSizeMake(900, 900);
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetInterpolationQuality(context, kCGInterpolationNone);
    CGContextDrawImage(context, CGContextGetClipBoundingBox(context), cgImage);
    UIImage *preImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //Cleaning up .
    UIGraphicsEndImageContext();
    CGImageRelease(cgImage);
    
    // Rotate the image
    UIImage *qrImage = [UIImage imageWithCGImage:[preImage CGImage]
                                           scale:[preImage scale]
                                     orientation:UIImageOrientationDownMirrored];
    return qrImage;
}

- (UIImage *)generateBarCodeWithString:(NSString *)string
{
    // 创建条形码
    CIFilter *filter = [CIFilter filterWithName:@"CICode128BarcodeGenerator"];
    
    // 恢复滤镜的默认属性
    [filter setDefaults];
    // 将字符串转换成NSData
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    // 通过KVO设置滤镜inputMessage数据
    [filter setValue:data forKey:@"inputMessage"];
    // 获得滤镜输出的图像
    CIImage *outputImage = [filter outputImage];
    
    CGSize size = CGSizeMake(600, 200);
    CGImageRef cgImage = [[CIContext contextWithOptions:nil] createCGImage:outputImage fromRect:outputImage.extent];
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetInterpolationQuality(context, kCGInterpolationNone);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextDrawImage(context, CGContextGetClipBoundingBox(context), cgImage);
    UIImage *codeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGImageRelease(cgImage);
    
    
    return codeImage;
}



@end
