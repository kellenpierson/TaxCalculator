//
//  ViewController.m
//  Tax Calculator
//
//  Created by Kellen Pierson on 8/6/15.
//  Copyright (c) 2015 Kellen Pierson. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (nonatomic) double caTax;
@property (nonatomic) double chiTax;
@property (nonatomic) double nyTax;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UIButton *calculateButton;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.calculateButton setEnabled:NO];
    self.calculateButton.alpha = 0.3;

    self.caTax = 0.075;
    self.chiTax = 0.095;
    self.nyTax = 0.045;

    self.resultLabel.text = @"Tax Calculator";

    self.priceTextField.layer.borderColor = [[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.4]CGColor];
    self.priceTextField.layer.borderWidth = 1.0f;
    self.priceTextField.layer.cornerRadius = 4.0f;
    self.priceTextField.tintColor = [UIColor whiteColor];

    [self.priceTextField addTarget:self action:@selector(textFieldDidChange) forControlEvents:UIControlEventEditingChanged];

    self.calculateButton.layer.cornerRadius = 4;

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];

}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [self.priceTextField becomeFirstResponder];
}

- (void)textFieldDidChange {
    if ([self.priceTextField.text isEqualToString:@""]) {
        [self.calculateButton setEnabled:NO];
        self.calculateButton.alpha = 0.3;
        self.resultLabel.text = @"Tax Calculator";
    } else {
        [self.calculateButton setEnabled:YES];
        self.calculateButton.alpha = 1.0;
    }
}

- (IBAction)onCalculateButtonTapped:(id)sender {
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        double result = [self.priceTextField.text doubleValue] * self.caTax;
        self.resultLabel.text = [NSString stringWithFormat:@"Tax: $%.02f",result];
    } else if (self.segmentedControl.selectedSegmentIndex == 1) {
        double result = [self.priceTextField.text doubleValue] * self.chiTax;
        self.resultLabel.text = [NSString stringWithFormat:@"Tax: $%.02f",result];
    } else if (self.segmentedControl.selectedSegmentIndex == 2) {
        double result = [self.priceTextField.text doubleValue] * self.nyTax;
        self.resultLabel.text = [NSString stringWithFormat:@"Tax: $%.02f",result];
    }
}

- (void)dismissKeyboard {
    [self.priceTextField resignFirstResponder];
}


@end
