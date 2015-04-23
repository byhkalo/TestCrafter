//
//  ShipViewController.m
//  SpaceCrafter
//
//  Created by Konstantyn Bykhkalo on 17.03.15.
//  Copyright (c) 2015 Bykhkalo Konstantyh. All rights reserved.
//

#import "ShipViewController.h"
#import "BKDataManeger.h"
#import "BKRecourceCollectionCell.h"

#import "BKQuest.h"
#import "BKResource.h"

#import "PlanetWithRoomsViewController.h"

typedef enum {
    
    BKMenuButtonsMap = 0,
    BKMenuButtonsPlanet = 1,
    BKMenuButtonsShip = 2,
    BKMenuButtonsCrafting = 3
    
} BKMenuButtons;

typedef enum {
    
    BKTechnicalBlockEngenie = 0,
    BKTechnicalBlockScaner = 1,
    BKTechnicalBlockAddingOne = 2,
    BKTechnicalBlockAddingTwo = 3,
    BKTechnicalBlockAddingThree = 4

} BKTechnicalBlock;

typedef enum {
    
    BKShipSegControlEquipment = 0,
    BKShipSegControlShipJournal = 1
    
}BKShipSegControl;

@interface ShipViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate>



@end

@implementation ShipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.ship = [[self.fetchedResultsController fetchedObjects]firstObject];
    
    self.spaceShipName.text = self.ship.name;
    
    [self shipSegmentControlChanged:self.shipSegmentControl];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Actions
- (IBAction)shipTechnicalBlockSelect:(UIButton *)sender {
}

- (IBAction)shipSegmentControlChanged:(UISegmentedControl *)sender {
    
    if (sender.selectedSegmentIndex == BKShipSegControlEquipment) {
        self.collectionView.hidden = NO;
        self.tableView.hidden = YES;
    } else {
        self.tableView.hidden = NO;
        self.collectionView.hidden = YES;
    }
    
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [[self.ship.resources allObjects]count];
    
}
// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* collectionCellIdentifier = @"CollectionViewCellIdentifier";
    
    BKRecourceCollectionCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCellIdentifier forIndexPath:indexPath];
    
    NSArray* array = [[NSArray alloc]initWithArray:[self.ship.resources allObjects]];
    
    BKResource* resource = [array objectAtIndex:indexPath.item];
    
    cell.recourceNameLabel.text = resource.name;
    cell.countRecourceLabel.text = [NSString stringWithFormat:@"%ld", (long)[resource.quantity integerValue]];
    
    return cell;
}



#pragma mark - UICollectionViewDelegate
#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 44.f;
    }else {
        return 44.f;
    }
    
}

#pragma mark - UITableViewDataSource

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return @"Ваш Борт. Журнал";
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.ship.shipNotebook count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* cellIdentifier = @"cellIdentifier";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    NSArray* array = [[NSArray alloc]initWithArray:[self.ship.shipNotebook allObjects]];
    
    cell.textLabel.text = [[array objectAtIndex:indexPath.row] name];
    
    return nil;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
   /* if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
        //[context deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
        
        NSError *error = nil;
        if (![context save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }*/
}


- (BOOL) tableView:(UITableView *) tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return NO;
}

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */


- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    NSArray* array = [[NSArray alloc]initWithArray:[self.ship.shipNotebook allObjects]];
    
    cell.textLabel.text = [[array objectAtIndex:indexPath.row] name];

}


#pragma mark - NSFetchedResultsControllerDelegate

@synthesize fetchedResultsController = _fetchedResultsController;

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"BKSpaceShip" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    
    NSSortDescriptor *name = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    
    NSArray *sortDescriptors = @[name];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                                                managedObjectContext:self.managedObjectContext
                                                                                                  sectionNameKeyPath:nil
                                                                                                           cacheName:@"Master"];
    
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
    NSError *error = nil;
    if (![self.fetchedResultsController performFetch:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _fetchedResultsController;
}


- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        default:
            return;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.tableView;
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

- (NSManagedObjectContext*) managedObjectContext {
    
    return [[BKDataManeger sharedManager]managedObjectContext];
    
}


#pragma mark - Navigation


 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

     static NSString* planetSegueIdentifier = @"PlanetShowSegueIdentifier";
     
     if ([segue.identifier isEqualToString:planetSegueIdentifier]) {
         
         PlanetWithRoomsViewController* planet = segue.destinationViewController;
         
         planet.planet = self.ship.currentPlanet;
     }
     
     NSLog(@"%@", segue.identifier);
     
    
}


@end
