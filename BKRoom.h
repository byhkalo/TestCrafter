//
//  BKRoom.h
//  SpaceCrafter
//
//  Created by Konstantyn Bykhkalo on 16.03.15.
//  Copyright (c) 2015 Bykhkalo Konstantyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BKBuilding, BKPerson, BKResource;

@interface BKRoom : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * descriptionOfRoom;
@property (nonatomic, retain) BKBuilding *building;
@property (nonatomic, retain) NSSet *resources;
@property (nonatomic, retain) NSSet *people;
@end

@interface BKRoom (CoreDataGeneratedAccessors)

- (void)addResourcesObject:(BKResource *)value;
- (void)removeResourcesObject:(BKResource *)value;
- (void)addResources:(NSSet *)values;
- (void)removeResources:(NSSet *)values;

- (void)addPeopleObject:(BKPerson *)value;
- (void)removePeopleObject:(BKPerson *)value;
- (void)addPeople:(NSSet *)values;
- (void)removePeople:(NSSet *)values;

@end
