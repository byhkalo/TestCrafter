//
//  PlanetWithRoomsViewController.h
//  SpaceCrafter
//
//  Created by Konstantyn Bykhkalo on 17.03.15.
//  Copyright (c) 2015 Bykhkalo Konstantyh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BKCraftPlanet.h"

@interface PlanetWithRoomsViewController : UIViewController

@property (strong, nonatomic) BKCraftPlanet* planet;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *roomsButtonsCollection;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UILabel *planetNameLabel;

- (IBAction)changeStatus:(UISegmentedControl *)sender;

- (IBAction)menuButtonPress:(UIButton *)sender;

- (IBAction)buildingSelectsdButton:(UIButton *)sender;


@end
