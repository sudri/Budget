//
//  EPAddCategoryView.h
//  Budget
//
//  Created by Eduard Pyatnitsyn on 02.10.13.
//  Copyright (c) 2013 Eduard Pyatnitsyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EPAddCategoryView : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameCategory;


- (IBAction)cancelBtnPrsd:(id)sender;
- (IBAction)doneBtnPrsd:(id)sender;
- (IBAction)backgroundTap:(id)sender;

@end
