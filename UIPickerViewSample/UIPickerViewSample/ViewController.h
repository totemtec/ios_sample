//
//  ViewController.h
//  UIPickerViewSample
//
//  Created by majianglin on 3/15/16.
//  Copyright © 2016 TOTEM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

@property(nonatomic, weak) IBOutlet UITextField *genderField;
@property(nonatomic, weak) IBOutlet UITextField *ageField;



@end

