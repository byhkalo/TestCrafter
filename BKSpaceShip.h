//
//  BKSpaceShip.h
//  SpaceCrafter
//
//  Created by Konstantyn Bykhkalo on 16.03.15.
//  Copyright (c) 2015 Bykhkalo Konstantyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BKCraftPlanet, BKQuest, BKResource;

@interface BKSpaceShip : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *resources;
@property (nonatomic, retain) NSSet *shipNotebook;
@property (nonatomic, retain) NSSet *technicalBlock;
@property (nonatomic, retain) BKCraftPlanet *currentPlanet;
@end

@interface BKSpaceShip (CoreDataGeneratedAccessors)

- (void)addResourcesObject:(BKResource *)value;
- (void)removeResourcesObject:(BKResource *)value;
- (void)addResources:(NSSet *)values;
- (void)removeResources:(NSSet *)values;

- (void)addShipNotebookObject:(BKQuest *)value;
- (void)removeShipNotebookObject:(BKQuest *)value;
- (void)addShipNotebook:(NSSet *)values;
- (void)removeShipNotebook:(NSSet *)values;

- (void)addTechnicalBlockObject:(BKResource *)value;
- (void)removeTechnicalBlockObject:(BKResource *)value;
- (void)addTechnicalBlock:(NSSet *)values;
- (void)removeTechnicalBlock:(NSSet *)values;

@end
