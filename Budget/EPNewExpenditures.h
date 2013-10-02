//
//  EPNewExpenditures.h
//  Budget
//
//  Created by Eduard Pyatnitsyn on 02.10.13.
//  Copyright (c) 2013 Eduard Pyatnitsyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EPNewExpenditures : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelBtn;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBtn;

- (IBAction)cancelBtnPrsd:(id)sender;
- (IBAction)doneBtnPrsd:(id)sender;

@end
