//
//  BKShipTableViewController.m
//  SpaceCrafter
//
//  Created by Konstantyn Bykhkalo on 12.03.15.
//  Copyright (c) 2015 Bykhkalo Konstantyh. All rights reserved.
//

#import "BKShipTableViewController.h"

#import "BKBaseInformationCell.h"
#import "BKResourcesTableViewCell.h"

#import "BKSpaceShip.h"
#import "BKResource.h"
#import "BKDataManeger.h"

@interface BKShipTableViewController ()

@property (weak, nonatomic) BKSpaceShip* ship;
@property (weak, nonatomic) BKResource* resource;

@end

@implementation BKShipTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.ship  = [[self.fetchedResultsController fetchedObjects]firstObject];
    //self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 138.f;
    }else {
        return 44.f;
    }
    
}

#pragma mark - UITableViewDataSource

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return @"Your Ship";
    }else if (section == 1) {
        return @"resources";
    }
    return nil;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else{
        if (![[self.ship.resources allObjects]count]) {
            return 0;
        }else {
            return [[self.ship.resources allObjects]count];
        }
        
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        static NSString* shipCellInformation = @"SpaceShipCellInformationIdentifier";
        
        BKBaseInformationCell * cell = [tableView dequeueReusableCellWithIdentifier:shipCellInformation];
        
        cell = (BKBaseInformationCell*)[self configureCellWithReturn:cell atIndexPath:indexPath];
        
        //[self configureCell:cell atIndexPath:indexPath];
        
        return cell;
    
    }else if (indexPath.section == 1) {
        static NSString* cellIdentifier = @"ResourcesTableViewCellIdentifier";
    
        BKResourcesTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
        cell = (BKResourcesTableViewCell*)[self configureCellWithReturn:cell atIndexPath:indexPath];
        //[self configureCell:cell atIndexPath:indexPath];
        
        return cell;

    }
    return nil;
    }

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
        //[context deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
        
        NSError *error = nil;
        if (![context save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}


- (BOOL) tableView:(UITableView *) tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return NO;
}

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

- (id)configureCellWithReturn:(id)cell atIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        BKBaseInformationCell* helpCell = [[BKBaseInformationCell alloc]init];
        
        helpCell = cell;
        
        NSString* nameString = self.ship.name;
        
        helpCell.shipNameLabel.text = nameString;
        //helpCell.shipLevelLabel.text = [NSString stringWithFormat:@"%d", [self.ship.level integerValue]];
        //helpCell.shipExperienceLabel.text = [NSString stringWithFormat:@"%d", [self.ship.experience integerValue]];
        helpCell.imageView.image = [UIImage imageWithContentsOfFile:@"SpaceShip.png"];
        return helpCell;
    }else if (indexPath.section == 1) {
        BKResourcesTableViewCell* helpCell = [[BKResourcesTableViewCell alloc]init];
        
        helpCell = cell;
        
        BKResource* resource = [[self.ship.resources allObjects]objectAtIndex:indexPath.row];
        
        helpCell.resourcesNameLabel.text = resource.name;
        helpCell.resourcesCountLabel.text = [NSString stringWithFormat:@"%@", resource.quantity];
        return helpCell;
    }
    
    return nil;
    
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        BKBaseInformationCell* cell;
        
        cell.shipNameLabel.text = self.ship.name;
        //cell.shipLevelLabel.text = [NSString stringWithFormat:@"%d", [self.ship.level integerValue]];
        //cell.shipExperienceLabel.text = [NSString stringWithFormat:@"%d", [self.ship.experience integerValue]];
        cell.imageView.image = [UIImage imageWithContentsOfFile:@"SpaceShip.png"];
        
    }else {
        
        BKResourcesTableViewCell* cell;
        
        BKResource* resource = [[self.ship.resources allObjects]objectAtIndex:indexPath.row];
        
        cell.resourcesNameLabel.text = resource.name;
        cell.resourcesCountLabel.text = [NSString stringWithFormat:@"%@", resource.quantity];
    }
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
