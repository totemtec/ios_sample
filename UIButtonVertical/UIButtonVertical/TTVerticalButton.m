//
//  TTVerticalButton.m
//  UIButtonVertical
//
//  Created by majianglin on 3/16/16.
//  Copyright © 2016 TOTEM. All rights reserved.
//

// Ref: http://stackoverflow.com/questions/4201959/label-under-image-in-uibutton

#import "TTVerticalButton.h"

#define kTextTopPadding 10


@implementation TTVerticalButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect titleLabelFrame = self.titleLabel.frame;
//    CGSize labelSize = [self.titleLabel.text sizeWithFont:self.titleLabel.font constrainedToSize:CGSizeMake(self.frame.size.width, self.frame.size.height/2) lineBreakMode:NSLineBreakByWordWrapping];
    
    CGRect rect = [self.titleLabel.text boundingRectWithSize:CGSizeMake(self.frame.size.width, self.frame.size.height/2)
                                                          options:NSStringDrawingUsesLineFragmentOrigin
                                                       attributes:@{NSFontAttributeName:self.titleLabel.font}
                                                          context:nil];
    
    CGSize labelSize = rect.size;
    
    
    CGRect imageFrame = self.imageView.frame;
    
    CGSize fitBoxSize = (CGSize){.height = labelSize.height + kTextTopPadding +  imageFrame.size.height, .width = MAX(imageFrame.size.width, labelSize.width)};
    
    CGRect fitBoxRect = CGRectInset(self.bounds, (self.bounds.size.width - fitBoxSize.width)/2, (self.bounds.size.height - fitBoxSize.height)/2);
    
    imageFrame.origin.y = fitBoxRect.origin.y;
    imageFrame.origin.x = CGRectGetMidX(fitBoxRect) - (imageFrame.size.width/2);
    self.imageView.frame = imageFrame;
    
    // Adjust the label size to fit the text, and move it below the image
    
    titleLabelFrame.size.width = labelSize.width;
    titleLabelFrame.size.height = labelSize.height;
    titleLabelFrame.origin.x = (self.frame.size.width / 2) - (labelSize.width / 2);
    titleLabelFrame.origin.y = fitBoxRect.origin.y + imageFrame.size.height + kTextTopPadding;
    self.titleLabel.frame = titleLabelFrame;
}

@end
