//
//  BKTabBarController.m
//  SpaceCrafter
//
//  Created by Konstantyn Bykhkalo on 12.03.15.
//  Copyright (c) 2015 Bykhkalo Konstantyh. All rights reserved.
//

#import "BKTabBarController.h"
#import "BKDataManeger.h"
#import "BKSpaceShip.h"
#import "BKCraftPlanet.h"
#import "BKResource.h"

@interface BKTabBarController ()

@property (strong, nonatomic) NSString* entity;
@property (strong, nonatomic) NSString* key;

@end



@implementation BKTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testAndCreateNewSpaceShip];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - FirstStartTest

- (NSManagedObjectContext*) managedObjectContext {
    
    return [[BKDataManeger sharedManager]managedObjectContext];
    
}

@synthesize fetchedResultsController = _fetchedResultsController;

- (NSFetchedResultsController *)fetchedResultsController
{
    
    if (![[[_fetchedResultsController fetchRequest]entityName] isEqualToString:self.entity]) {
        _fetchedResultsController = nil;
    }
    
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:self.entity inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Edit the sort key as appropriate.
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    
    NSSortDescriptor *name = [[NSSortDescriptor alloc] initWithKey:self.key ascending:YES];
    
    NSArray *sortDescriptors = @[name];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                                                managedObjectContext:self.managedObjectContext
                                                                                                  sectionNameKeyPath:nil
                                                                                                           cacheName:@"Master"];
    self.fetchedResultsController = aFetchedResultsController;
    
    NSError *error = nil;
    if (![self.fetchedResultsController performFetch:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _fetchedResultsController;
}

-(void) testAndCreateNewSpaceShip {
    
    self.entity = @"BKSpaceShip";
    self.key = @"name";
    
    if ([[self.fetchedResultsController fetchedObjects]count] == 0){
    
        BKSpaceShip* spaceShip  = [NSEntityDescription insertNewObjectForEntityForName:@"BKSpaceShip" inManagedObjectContext:self.managedObjectContext];
        spaceShip.name = @"PlanetCrafter";
        
        [[BKDataManeger sharedManager] saveContext];
    }
    
}

-(void) testAndCreateNewPlanets {
    
    self.entity = @"BKCraftPlanets";
    self.key = @"planetName";
    
    /*
    @property (nonatomic, retain) NSString * planetName;
    @property (nonatomic, retain) NSNumber * timeForCraft;
    @property (nonatomic, retain) NSSet *resources;
    */
    
    if ([[self.fetchedResultsController fetchedObjects]count] == 0){
        
        
        [self createPlanetWithName:@"Phedock" rang:0 descriptionOfPlanet:@"First planet on your long trip to naitive planet - Earth"];
        [self createPlanetWithName:@"Vinatrix" rang:1 descriptionOfPlanet:@"Second planet. There is great libriary. May be you can find the ansvers about Earth"];
        [self createPlanetWithName:@"Mardab" rang:2 descriptionOfPlanet:@"Planet with big market"];
        [self createPlanetWithName:@"Deheb" rang:3 descriptionOfPlanet:@"Planet with army of Montey"];
        [self createPlanetWithName:@"Arctur" rang:4 descriptionOfPlanet:@"Planet with boundary between planetary systems"];
        //[[BKDataManeger sharedManager] saveContext];
    }
    
}

-(void) createPlanetWithName:(NSString*) name rang:(NSInteger) rang descriptionOfPlanet:(NSString*) descriptionOfPlanet {
    
    BKCraftPlanet* craftPlanet  = [NSEntityDescription insertNewObjectForEntityForName:@"BKCraftPlanets" inManagedObjectContext:self.managedObjectContext];
    craftPlanet.planetName = name;
    craftPlanet.rangOfPlanet = @(rang);
    craftPlanet.descriptionOfPlanet = descriptionOfPlanet;
    
     /*
     @property (nonatomic, retain) NSString * name;
     @property (nonatomic, retain) NSNumber * quantity;
     */
    
    //[craftPlanet setResources:[NSSet setWithObjects:resource1,resource2, nil]];
    
    [[BKDataManeger sharedManager] saveContext];
    
    
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
