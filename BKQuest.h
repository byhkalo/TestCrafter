//
//  BKQuest.h
//  SpaceCrafter
//
//  Created by Konstantyn Bykhkalo on 16.03.15.
//  Copyright (c) 2015 Bykhkalo Konstantyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BKPerson, BKResource, BKSpaceShip;

@interface BKQuest : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * descriptionOfQuest;
@property (nonatomic, retain) NSString * executionCondition;
@property (nonatomic, retain) NSSet *sendResources;
@property (nonatomic, retain) BKPerson *person;
@property (nonatomic, retain) BKSpaceShip *usingByShip;
@end

@interface BKQuest (CoreDataGeneratedAccessors)

- (void)addSendResourcesObject:(BKResource *)value;
- (void)removeSendResourcesObject:(BKResource *)value;
- (void)addSendResources:(NSSet *)values;
- (void)removeSendResources:(NSSet *)values;

@end
