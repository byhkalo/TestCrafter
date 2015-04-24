//
//  BKPerson.h
//  SpaceCrafter
//
//  Created by Konstantyn Bykhkalo on 16.03.15.
//  Copyright (c) 2015 Bykhkalo Konstantyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@class BKRoom;

@interface BKPerson : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * descriptionOfPerson;
@property (nonatomic, retain) NSSet *quest;
@property (nonatomic, retain) BKRoom *room;
@end

@interface BKPerson (CoreDataGeneratedAccessors)

- (void)addQuestObject:(NSManagedObject *)value;
- (void)removeQuestObject:(NSManagedObject *)value;
- (void)addQuest:(NSSet *)values;
- (void)removeQuest:(NSSet *)values;

@end
