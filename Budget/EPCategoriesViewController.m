//
//  EPCategoriesViewController.m
//  Budget
//
//  Created by Eduard Pyatnitsyn on 02.10.13.
//  Copyright (c) 2013 Eduard Pyatnitsyn. All rights reserved.
//

#import "EPCategoriesViewController.h"
#import "EPCoreData.h"
#import "EPDetailCategoryViewController.h"

@interface EPCategoriesViewController ()

@end

@implementation EPCategoriesViewController
@synthesize categoryName;
@synthesize tableView;
@synthesize coreData;



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
    static NSString *tableIdentifer = @"CategoryTable";
    
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

    coreData = [EPCoreData sharedInstance];

    if( coreData.managedObjectContext == nil) NSLog(@"NILLLL");
    
    [coreData.managedObjectContext deleteObject:[coreData.fetchedResultsController objectAtIndexPath:indexPath]];
    [coreData saveContext];
    NSManagedObject *object = [coreData.fetchedResultsController objectAtIndexPath:indexPath];
    NSLog(@"Value:%@", [object valueForKey:@"name"]);

    [self.categoryName removeObjectAtIndex:indexPath.row];
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
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]
                                    initWithEntityName:@"Category"];
    
    //    осуществляем запрос
    coreData = [EPCoreData sharedInstance];
    NSArray *tmp = [coreData.managedObjectContext executeFetchRequest:fetchRequest
                                                                     error:nil];
    for (NSDictionary *d in tmp) {
        [self.categoryName addObject:[d valueForKey:@"name"]];
    } 
}


- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"View did apear");
    if (coreData == nil) NSLog(@"NIIIILLL");
    if (self.categoryName == nil) {
        self.categoryName = [[NSMutableArray alloc] init];
    }
    [self.categoryName removeAllObjects];
    coreData = [EPCoreData sharedInstance];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]
                                    initWithEntityName:@"Category"];
    
    //    осуществляем запрос
    NSArray *tmp = [coreData.managedObjectContext executeFetchRequest:fetchRequest
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detailCategory"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        EPDetailCategoryViewController *destViewController = segue.destinationViewController;
        destViewController.recipeName = [categoryName objectAtIndex:indexPath.row];
    }
}

@end
