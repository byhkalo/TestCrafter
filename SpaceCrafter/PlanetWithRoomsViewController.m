//
//  PlanetWithRoomsViewController.m
//  SpaceCrafter
//
//  Created by Konstantyn Bykhkalo on 17.03.15.
//  Copyright (c) 2015 Bykhkalo Konstantyh. All rights reserved.
//

#import "PlanetWithRoomsViewController.h"
#import "BKBuilding.h"


static NSString* planetNames[] = {
    
    @"TownHall", @"MedicineCenter", @"Hangar", @"Three", @"Four", @"Five",
    @"Six", @"Seven", @"Eight", @"Nine"
    
};

typedef enum {
    
    BKMenuButtonsMap = 0,
    BKMenuButtonsPlanet = 1,
    BKMenuButtonsShip = 2,
    BKMenuButtonsCrafting = 3
    
} BKMenuButtons;

typedef enum {
    
    BKPlanetStatusBuildings = 0,
    BKPlanetStatusInformation = 1
    
} BKPlanetStatus;

typedef enum {
    BKPlanetBuildingsTownHall = 0,
    BKPlanetBuildingsMedicineCenter = 1,
    BKPlanetBuildingsHangar = 2,
    BKPlanetBuildingsThree = 3,
    BKPlanetBuildingsFour = 4,
    BKPlanetBuildingsFive = 5,
    BKPlanetBuildingsSix = 6,
    BKPlanetBuildingsSeven = 7,
    BKPlanetBuildingsEight = 8,
    BKPlanetBuildingsNine = 9
    
} BKPlanetBuildings;

@interface PlanetWithRoomsViewController ()

@end

@implementation PlanetWithRoomsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self changeStatus:self.segmentControl];
    [self setButtonsOfBuildings];
    
    self.planetNameLabel.text = self.planet.planetName;
    self.descriptionTextView.text = self.planet.descriptionOfPlanet;
    
    NSLog(@"DidLoad!!)()*(!)*)*!)*!)*");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Private Methods

-(void) setButtonsOfBuildings {
    
    for (UIButton* someButton in self.roomsButtonsCollection) {
        BOOL setBuilding = NO;
        for (BKBuilding* building in [self.planet.buildings allObjects]) {
          if ([planetNames[someButton.tag] isEqualToString:building.name]) {
              UIImageView* imageView = [[UIImageView alloc]initWithFrame:someButton.bounds];
              imageView.image = [UIImage imageNamed:[self returnNameOfPictureForButtonInTag:someButton.tag]];
              [someButton addSubview:imageView];
              someButton.backgroundColor = [UIColor clearColor];
              setBuilding = YES;
          }
        }
        if (setBuilding == NO) {
            someButton.hidden = YES;
        }else {
            someButton.hidden = NO;
        }
    }
}

-(NSString*) returnNameOfPictureForButtonInTag:(NSInteger) tag {
    
    switch (tag) {
        case BKPlanetBuildingsTownHall:
            return @"city_centr_icon.png";
            break;
        case BKPlanetBuildingsMedicineCenter:
            return @"medicine_icon.png";
            break;
        case BKPlanetBuildingsHangar:
            return @"hangar_icon.png";
            break;
            
            //Закончить Обязательно
            
        default:
            break;
    }
    
    return nil;
    
}

#pragma mark - Actions
- (IBAction)changeStatus:(UISegmentedControl *)sender {
    
    if (sender.selectedSegmentIndex == BKPlanetStatusInformation) {
        self.planetNameLabel.hidden = NO;
        self.descriptionTextView.hidden = NO;
        for (UIButton* helpButton in self.roomsButtonsCollection) {
            helpButton.hidden = YES;
        }
    }else {
        self.planetNameLabel.hidden = YES;
        self.descriptionTextView.hidden = YES;
        [self setButtonsOfBuildings];

    }
    
}

- (IBAction)menuButtonPress:(UIButton *)sender {
}

- (IBAction)buildingSelectsdButton:(UIButton *)sender {
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
