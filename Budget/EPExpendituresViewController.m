//
//  EPExpendituresViewController.m
//  Budget
//
//  Created by Eduard Pyatnitsyn on 02.10.13.
//  Copyright (c) 2013 Eduard Pyatnitsyn. All rights reserved.
//

#import "EPExpendituresViewController.h"
#import "EPExpenditures.h"
#import "EPCoreData.h"
#import "EPDetailExpendituresViewController.h"

@interface EPExpendituresViewController ()

@end

@implementation EPExpendituresViewController
@synthesize expend;
@synthesize expendArray;
@synthesize coreData;

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
    NSLog(@"View did load Expend");
    if (expendArray == nil) {
        expendArray = [[NSMutableArray alloc] init];
    }

    [expendArray removeAllObjects];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]
                                    initWithEntityName:@"Expenditure"];
    
    //    осуществляем запрос
    coreData = [EPCoreData sharedInstance];
    NSArray *tmp = [coreData.managedObjectContext executeFetchRequest:fetchRequest
                                                                error:nil];
    for (NSDictionary *d in tmp) {
        expend = [[EPExpenditures alloc] init];
       expend.description =[d valueForKey:@"descriprion"];
       expend.category = [d valueForKey:@"category"];
       expend.price = [d valueForKey:@"sum"];
        NSLog(@"%@",expend);
        [expendArray addObject: expend];
        
        //[expendArray addObject:[d valueForKey:@"name"]];
    }
    NSLog(@"%d",[expendArray count]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table configure
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return expendArray.count;
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
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    expend =[expendArray objectAtIndex:indexPath.row];
    NSLog(@"%@",[expendArray objectAtIndex:indexPath.row]);
    cell.textLabel.text = expend.description;
    return cell;
}



@end
