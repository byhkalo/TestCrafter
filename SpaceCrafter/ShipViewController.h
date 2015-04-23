//
//  ShipViewController.h
//  SpaceCrafter
//
//  Created by Konstantyn Bykhkalo on 17.03.15.
//  Copyright (c) 2015 Bykhkalo Konstantyh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "BKSpaceShip.h"

@interface ShipViewController : UIViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) BKSpaceShip* ship;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (weak, nonatomic) IBOutlet UILabel *spaceShipName;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *shipTecnicalBlocks;
@property (weak, nonatomic) IBOutlet UISegmentedControl *shipSegmentControl;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

- (IBAction)shipTechnicalBlockSelect:(UIButton *)sender;
- (IBAction)shipSegmentControlChanged:(UISegmentedControl *)sender;

@end
