//
//  EPNewExpenditures.h
//  Budget
//
//  Created by Eduard Pyatnitsyn on 02.10.13.
//  Copyright (c) 2013 Eduard Pyatnitsyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EPNewExpenditures : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelBtn;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBtn;
@property (weak, nonatomic) IBOutlet UITextField *nameExpend;
@property (weak, nonatomic) IBOutlet UITextField *categoryExpend;
@property (weak, nonatomic) IBOutlet UITextField *sumExpend;

@property (nonatomic, retain) NSMutableArray *category;

- (IBAction)cancelBtnPrsd:(id)sender;
- (IBAction)doneBtnPrsd:(id)sender;
- (IBAction)backgroundTap:(id)sender;

@end
