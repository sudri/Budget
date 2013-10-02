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
@end
