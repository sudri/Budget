//
//  EPExpendituresViewController.h
//  Budget
//
//  Created by Eduard Pyatnitsyn on 02.10.13.
//  Copyright (c) 2013 Eduard Pyatnitsyn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPExpenditures.h"
#import "EPCoreData.h"
@interface EPExpendituresViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, retain) NSMutableArray *categoryName;

@property EPExpenditures *expend;
@property (nonatomic, retain) NSMutableArray *expendArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property EPCoreData *coreData;
@end
