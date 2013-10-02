//
//  EPCategoriesViewController.m
//  Budget
//
//  Created by Eduard Pyatnitsyn on 02.10.13.
//  Copyright (c) 2013 Eduard Pyatnitsyn. All rights reserved.
//

#import "EPCategoriesViewController.h"
#import "EPAppDelegate.h"

@interface EPCategoriesViewController ()

@end

@implementation EPCategoriesViewController
@synthesize categoryName;

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
   return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.categoryName.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableIdentifer = @"TableIdentifer";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifer];
    if (cell == nil) {        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifer];
        
    }
    
    cell.textLabel.text = [self.categoryName objectAtIndex:indexPath.row];
    return cell;
}


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
    self.categoryName = [[NSMutableArray alloc] init];
    EPAppDelegate *appDelegate = (EPAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]
                                    initWithEntityName:@"Category"];
    
    //    осуществляем запрос
    NSArray *tmp = [appDelegate.managedObjectContext executeFetchRequest:fetchRequest
                                                                     error:nil];
    for (NSDictionary *d in tmp) {
        [self.categoryName addObject:[d valueForKey:@"name"]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
