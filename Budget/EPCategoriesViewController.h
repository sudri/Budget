//
//  EPCategoriesViewController.h
//  Budget
//
//  Created by Eduard Pyatnitsyn on 02.10.13.
//  Copyright (c) 2013 Eduard Pyatnitsyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EPCategoriesViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, retain) NSMutableArray *categoryName;

@end
