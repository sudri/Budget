//
//  EPNewExpenditures.m
//  Budget
//
//  Created by Eduard Pyatnitsyn on 02.10.13.
//  Copyright (c) 2013 Eduard Pyatnitsyn. All rights reserved.
//

#import "EPNewExpenditures.h"

@interface EPNewExpenditures ()

@end

@implementation EPNewExpenditures
@synthesize categoryExpend;
@synthesize category;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.category = [[NSArray alloc] initWithObjects:@"foo",@"bar",@"baz",nil];
    UIPickerView *categoryPicker = [[UIPickerView alloc] initWithFrame:CGRectZero];
    categoryPicker.delegate = self;
    categoryPicker.dataSource = self;
    [categoryPicker setShowsSelectionIndicator:YES];
    categoryExpend.inputView = categoryPicker;
    // Create done button in UIPickerView
    UIToolbar*  mypickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 56)];
    mypickerToolbar.barStyle = UIBarStyleBlackOpaque;
    [mypickerToolbar sizeToFit];
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [barItems addObject:flexSpace];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pickerDoneClicked)];
    [barItems addObject:doneBtn];
    [mypickerToolbar setItems:barItems animated:YES];
    categoryExpend.inputAccessoryView = mypickerToolbar;
}
-(void)pickerDoneClicked
{
    NSLog(@"Done Clicked");
    [categoryExpend resignFirstResponder];
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSLog(@"Count: %lu",(unsigned long)self.category.count);
    return self.category.count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.category objectAtIndex:row];
}
- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    categoryExpend.text = (NSString *)[self.category objectAtIndex:row];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelBtnPrsd:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)doneBtnPrsd:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)backgroundTap:(id)sender {
    [self.nameExpend resignFirstResponder];
    [self.categoryExpend resignFirstResponder];
    [self.sumExpend resignFirstResponder];
}
@end
