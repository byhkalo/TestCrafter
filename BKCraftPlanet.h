//
//  BKCraftPlanet.h
//  SpaceCrafter
//
//  Created by Konstantyn Bykhkalo on 16.03.15.
//  Copyright (c) 2015 Bykhkalo Konstantyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BKBuilding, BKPlanetarySystem, BKSpaceShip;

@interface BKCraftPlanet : NSManagedObject

@property (nonatomic, retain) NSString * planetName;
@property (nonatomic, retain) NSNumber * timeForCraft;
@property (nonatomic, retain) NSString * descriptionOfPlanet;
@property (nonatomic, retain) NSNumber * rangOfPlanet;
@property (nonatomic, retain) BKPlanetarySystem *planetarySystem;
@property (nonatomic, retain) NSSet *buildings;
@property (nonatomic, retain) BKSpaceShip *shipOnPlanet;
@end

@interface BKCraftPlanet (CoreDataGeneratedAccessors)

- (void)addBuildingsObject:(BKBuilding *)value;
- (void)removeBuildingsObject:(BKBuilding *)value;
- (void)addBuildings:(NSSet *)values;
- (void)removeBuildings:(NSSet *)values;

@end
