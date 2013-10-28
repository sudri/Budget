//
//  EPCategoriesViewController.h
//  Budget
//
//  Created by Eduard Pyatnitsyn on 02.10.13.
//  Copyright (c) 2013 Eduard Pyatnitsyn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPAppDelegate.h"

@interface EPCategoriesViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, retain) NSMutableArray *categoryName;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
//@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
//@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

@end
