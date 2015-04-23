//
//  BKStartController.h
//  SpaceCrafter
//
//  Created by Konstantyn Bykhkalo on 18.03.15.
//  Copyright (c) 2015 Bykhkalo Konstantyh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface BKStartController : UIViewController

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsControllerAboutShip;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsControllerAboutPlanet;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)startButtonPress:(UIButton *)sender;

@end
