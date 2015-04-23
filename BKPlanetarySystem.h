//
//  BKPlanetarySystem.h
//  SpaceCrafter
//
//  Created by Konstantyn Bykhkalo on 16.03.15.
//  Copyright (c) 2015 Bykhkalo Konstantyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BKCraftPlanet;

@interface BKPlanetarySystem : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * descriptionOfSystem;
@property (nonatomic, retain) NSSet *craftPlanet;
@end

@interface BKPlanetarySystem (CoreDataGeneratedAccessors)

- (void)addCraftPlanetObject:(BKCraftPlanet *)value;
- (void)removeCraftPlanetObject:(BKCraftPlanet *)value;
- (void)addCraftPlanet:(NSSet *)values;
- (void)removeCraftPlanet:(NSSet *)values;

@end
