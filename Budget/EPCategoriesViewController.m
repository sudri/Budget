//
//  EPCategoriesViewController.m
//  Budget
//
//  Created by Eduard Pyatnitsyn on 02.10.13.
//  Copyright (c) 2013 Eduard Pyatnitsyn. All rights reserved.
//

#import "EPCategoriesViewController.h"

@interface EPCategoriesViewController ()

@end

@implementation EPCategoriesViewController
@synthesize categoryName;
@synthesize tableView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - Configure table

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
   return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.categoryName.count;
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    // The fetch controller is about to start sending change notifications, so prepare the table view for updates.
    [self.tableView beginUpdates];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableIdentifer = @"TableIdentifer";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:tableIdentifer];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifer];
        
    }
    
    cell.textLabel.text = [self.categoryName objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - Delete cell

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Category count: %d", self.categoryName.count);
    EPAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
//    NSManagedObjectContext *context = [appDelegate managedObjectContext];
 //   [context deleteObject:[self.categoryName objectAtIndex:indexPath.row]];

    
    
//    [appDelegate deleteObject:self.categoryName withIndex:indexPath.row];
    [self.categoryName removeObjectAtIndex:indexPath.row];
//    [self.tableView reloadData]
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}



#pragma mark - Load - Reload

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"View did load");
    if (self.categoryName == nil) {
         self.categoryName = [[NSMutableArray alloc] init];
    }
    [self.categoryName removeAllObjects];
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


- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"View will apear");
    if (self.categoryName == nil) {
        self.categoryName = [[NSMutableArray alloc] init];
    }
    [self.categoryName removeAllObjects];
    EPAppDelegate *appDelegate = (EPAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]
                                    initWithEntityName:@"Category"];
    
    //    осуществляем запрос
    NSArray *tmp = [appDelegate.managedObjectContext executeFetchRequest:fetchRequest
                                                                   error:nil];
    for (NSDictionary *d in tmp) {
        [self.categoryName addObject:[d valueForKey:@"name"]];
    }
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
