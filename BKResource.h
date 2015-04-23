//
//  BKResource.h
//  SpaceCrafter
//
//  Created by Konstantyn Bykhkalo on 16.03.15.
//  Copyright (c) 2015 Bykhkalo Konstantyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BKSpaceShip;

@interface BKResource : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * probability;
@property (nonatomic, retain) NSNumber * quantity;
@property (nonatomic, retain) NSNumber * canBeTechnicalBlock;
@property (nonatomic, retain) BKSpaceShip *ship;
@property (nonatomic, retain) NSManagedObject *room;
@property (nonatomic, retain) NSManagedObject *quest;
@property (nonatomic, retain) BKSpaceShip *technicalBlockInShip;

@end
