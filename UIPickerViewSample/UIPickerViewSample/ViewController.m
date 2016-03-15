//
//  ViewController.m
//  UIPickerViewSample
//
//  Created by majianglin on 3/15/16.
//  Copyright © 2016 TOTEM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong) NSArray *genderArray;
@property(nonatomic, strong) NSArray *ageArray;


@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.genderArray = @[@"Male", @"Female"];
    self.ageArray = @[@"< 18", @"18-30", @"> 30"];
    
    UIPickerView *genderPicker = [[UIPickerView alloc] init];
    genderPicker.showsSelectionIndicator = YES;
    genderPicker.delegate = self;
    genderPicker.dataSource = self;
    genderPicker.tag = 0;
    self.genderField.inputView = genderPicker;
    
    UIToolbar *genderBar = [[UIToolbar alloc] init];
    [genderBar sizeToFit];
    genderBar.barStyle = UIBarStyleBlackTranslucent;
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                            target:nil
                                                                            action:nil];
    UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithTitle:@"Next"
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(nextClicked:)];
    
    [genderBar setItems:[NSArray arrayWithObjects:space, nextButton, nil]];
    
    self.genderField.inputAccessoryView = genderBar;
    
    
    
    UIPickerView *agePicker = [[UIPickerView alloc] init];
    agePicker.showsSelectionIndicator = YES;
    agePicker.delegate = self;
    agePicker.dataSource = self;
    agePicker.tag = 1;
    self.ageField.inputView = agePicker;
    
    UIToolbar *ageBar = [[UIToolbar alloc] init];
    [ageBar sizeToFit];
    ageBar.barStyle = UIBarStyleBlackTranslucent;
    UIBarButtonItem *space2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                           target:nil
                                                                           action:nil];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                target:self
                                                                                action:@selector(doneClicked:)];
    
    [ageBar setItems:[NSArray arrayWithObjects:space2, doneButton, nil]];
    self.ageField.inputAccessoryView = ageBar;
    
}


- (void)nextClicked:(id)sender
{
    UIPickerView *genderPicker = (UIPickerView*)self.genderField.inputView;
    NSUInteger row = [genderPicker selectedRowInComponent:0];
    self.genderField.text = self.genderArray[row];
    
    [self.ageField becomeFirstResponder];
}

- (void)doneClicked:(id)sender
{
    UIPickerView *agePicker = (UIPickerView*)self.ageField.inputView;
    NSUInteger row = [agePicker selectedRowInComponent:0];
    self.ageField.text = self.ageArray[row];
    
    [self.ageField resignFirstResponder];
}


#pragma mark - UIPickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView.tag == 0)
    {
        self.genderField.text = self.genderArray[row];
    }
    else
    {
        self.ageField.text = self.ageArray[row];
    }
}

#pragma mark - UIPickerViewDataSource


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSUInteger count = 0;
    switch (pickerView.tag)
    {
        case 0:
            count = self.genderArray.count;
            break;
        case 1:
            count = self.ageArray.count;
            break;
        default:
            break;
    }
    return count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *title = nil;
    switch (pickerView.tag)
    {
        case 0:
            title = self.genderArray[row];
            break;
        case 1:
            title = self.ageArray[row];
            break;
        default:
            break;
    }
    
    return title;
}



@end
