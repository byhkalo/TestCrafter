//
//  BKStartController.m
//  SpaceCrafter
//
//  Created by Konstantyn Bykhkalo on 18.03.15.
//  Copyright (c) 2015 Bykhkalo Konstantyh. All rights reserved.
//

#import "BKStartController.h"
#import "BKDataManeger.h"
#import "ShipViewController.h"

#import "BKSpaceShip.h"
#import "BKCraftPlanet.h"
#import "BKResource.h"
#import "BKBuilding.h"
#import "BKRoom.h"

@interface BKStartController ()

@property (copy, nonatomic) NSString* entity;
@property (strong, nonatomic) NSString* key;

@property (strong, nonatomic) BKSpaceShip* ship;

@end

static NSString* planetNames[] = {
    
    @"TownHall", @"MedicineCenter", @"Hangar", @"Three", @"Four", @"Five",
    @"Six", @"Seven", @"Eight", @"Nine"
    
};

@implementation BKStartController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self testAndCreateNewSpaceShip];
    [self testAndCreateNewPlanets];
    
    //self.ship = [[self.fetchedResultsControllerAboutShip fetchedObjects]firstObject];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Actions

- (IBAction)startButtonPress:(UIButton *)sender {
    //static NSString* segueidentifier = @"ShowShipSegueIdentifier";
    
    
   
}


#pragma mark - FirstStartTest

- (NSManagedObjectContext*) managedObjectContext {
    
    return [[BKDataManeger sharedManager]managedObjectContext];
    
}

@synthesize fetchedResultsControllerAboutPlanet = _fetchedResultsControllerAboutPlanet;
@synthesize fetchedResultsControllerAboutShip = _fetchedResultsControllerAboutShip;

- (NSFetchedResultsController *)fetchedResultsControllerAboutPlanet
{
    if (_fetchedResultsControllerAboutPlanet != nil) {
        return _fetchedResultsControllerAboutPlanet;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"BKCraftPlanet" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Edit the sort key as appropriate.
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    
    NSSortDescriptor *name = [[NSSortDescriptor alloc] initWithKey:@"planetName" ascending:YES];
    
    NSArray *sortDescriptors = @[name];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                                                managedObjectContext:self.managedObjectContext
                                                                                                  sectionNameKeyPath:nil
                                                                                                           cacheName:@"Master"];
    _fetchedResultsControllerAboutPlanet = aFetchedResultsController;
    
    NSError *error = nil;
    if (![_fetchedResultsControllerAboutPlanet performFetch:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _fetchedResultsControllerAboutPlanet;
}

- (NSFetchedResultsController *)fetchedResultsControllerAboutShip
{
    if (_fetchedResultsControllerAboutShip != nil) {
        return _fetchedResultsControllerAboutShip;
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
    
    self.fetchedResultsControllerAboutShip = aFetchedResultsController;
    
    NSError *error = nil;
    if (![self.fetchedResultsControllerAboutShip performFetch:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _fetchedResultsControllerAboutShip;
}


-(void) testAndCreateNewSpaceShip {
    
    if ([[self.fetchedResultsControllerAboutShip fetchedObjects]count] == 0){
        
        BKSpaceShip* spaceShip  = [NSEntityDescription insertNewObjectForEntityForName:@"BKSpaceShip" inManagedObjectContext:self.managedObjectContext];
        spaceShip.name = @"PlanetCrafter";
        
        
        [[BKDataManeger sharedManager] saveContext];
        self.fetchedResultsControllerAboutShip = nil;
    }else {
        self.ship = self.fetchedResultsControllerAboutShip.fetchedObjects.firstObject;
    }
    
}

-(void) testAndCreateNewPlanets {
    
    if ([[self.fetchedResultsControllerAboutPlanet fetchedObjects]count] == 0){
        
        
        [self createPlanetWithName:@"Phedock" rang:0 descriptionOfPlanet:@"First planet on your long trip to naitive planet - Earth"];
        [self createPlanetWithName:@"Vinatrix" rang:1 descriptionOfPlanet:@"Second planet. There is great libriary. May be you can find the ansvers about Earth"];
        [self createPlanetWithName:@"Mardab" rang:2 descriptionOfPlanet:@"Planet with big market"];
        [self createPlanetWithName:@"Deheb" rang:3 descriptionOfPlanet:@"Planet with army of Montey"];
        [self createPlanetWithName:@"Arctur" rang:4 descriptionOfPlanet:@"Planet with boundary between planetary systems"];
        //[[BKDataManeger sharedManager] saveContext];
    }
    
}

-(void) createPlanetWithName:(NSString*) name rang:(NSInteger) rang descriptionOfPlanet:(NSString*) descriptionOfPlanet {
    
    BKCraftPlanet* craftPlanet  = [NSEntityDescription insertNewObjectForEntityForName:@"BKCraftPlanet" inManagedObjectContext:self.managedObjectContext];
    craftPlanet.planetName = name;
    craftPlanet.rangOfPlanet = @(rang);
    craftPlanet.descriptionOfPlanet = descriptionOfPlanet;
    
    if ([name isEqualToString:@"Phedock"]) {
        
        self.ship = [[self.fetchedResultsControllerAboutShip fetchedObjects]firstObject];
        self.ship.currentPlanet = craftPlanet;
        
        BKBuilding* townHall = [NSEntityDescription insertNewObjectForEntityForName:@"BKBuilding" inManagedObjectContext:self.managedObjectContext];
        townHall.name = @"TownHall";
        BKRoom* roomForTownHall = [NSEntityDescription insertNewObjectForEntityForName:@"BKRoom" inManagedObjectContext:self.managedObjectContext];
        roomForTownHall.name = @"Кабинет Мэра";
        roomForTownHall.descriptionOfRoom = @"Кабинет в котором сидит мэр и контролирует все законные и незаконные действия на планете";
        [townHall addRoomsObject:roomForTownHall];
        
        
        BKBuilding* medicineCenter = [NSEntityDescription insertNewObjectForEntityForName:@"BKBuilding" inManagedObjectContext:self.managedObjectContext];
        medicineCenter.name = @"MedicineCenter";
        BKBuilding* hangar = [NSEntityDescription insertNewObjectForEntityForName:@"BKBuilding" inManagedObjectContext:self.managedObjectContext];
        hangar.name = @"Hangar";
        
        [craftPlanet setBuildings:[NSSet setWithObjects:townHall,medicineCenter,hangar, nil]];
        
        //[[BKDataManeger sharedManager] saveContext];
        
        
        //[[BKDataManeger sharedManager] saveContext];
    }
    
    /*
     @property (nonatomic, retain) NSString * name;
     @property (nonatomic, retain) NSNumber * quantity;
     */
    
    //[craftPlanet setResources:[NSSet setWithObjects:resource1,resource2, nil]];
    
    [[BKDataManeger sharedManager] saveContext];
    
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"ShowShipSegueIdentifier"]) {
        
        ShipViewController* vc = segue.destinationViewController;
        vc.ship = self.ship;
        
    }
    
}


@end
