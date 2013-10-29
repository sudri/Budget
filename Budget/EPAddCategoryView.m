//
//  EPAddCategoryView.m
//  Budget
//
//  Created by Eduard Pyatnitsyn on 02.10.13.
//  Copyright (c) 2013 Eduard Pyatnitsyn. All rights reserved.
//

#import "EPAddCategoryView.h"
#import "EPAppDelegate.h"
#import "EPCoreData.h"

@interface EPAddCategoryView ()

@end

@implementation EPAddCategoryView

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

#pragma mark - Buttons function

- (IBAction)cancelBtnPrsd:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)doneBtnPrsd:(id)sender {
    EPCoreData *coredata = [EPCoreData sharedInstance];
    //EPAppDelegate *appDelegate = (EPAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObject *category = [NSEntityDescription insertNewObjectForEntityForName:@"Category"
                                                              inManagedObjectContext:coredata.managedObjectContext];
    [category setValue:[self.nameCategory text] forKey:@"name"];
    NSLog(@"friend: %@", category);
    [coredata saveContext];
    //Вставить код сюда
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)backgroundTap:(id)sender {
    [self.nameCategory resignFirstResponder];
}
@end
