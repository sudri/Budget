//
//  EPCoreData.h
//  Budget
//
//  Created by Eduard Pyatnitsyn on 28.10.13.
//  Copyright (c) 2013 Eduard Pyatnitsyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EPCoreData : NSObject
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;


-(void) deleteObject :(NSMutableArray *) array withIndex:(NSInteger) index;
-(void) saveContext;

+ (EPCoreData *) sharedInstance;
@end
