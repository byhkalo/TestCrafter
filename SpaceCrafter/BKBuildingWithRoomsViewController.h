//
//  BKBuildingWithRoomsViewController.h
//  SpaceCrafter
//
//  Created by Konstantyn Bykhkalo on 24.04.15.
//  Copyright (c) 2015 Bykhkalo Konstantyh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BKBuilding.h"

@interface BKBuildingWithRoomsViewController : UIViewController

@property (strong, nonatomic) BKBuilding* building;

@property (weak, nonatomic) IBOutlet UILabel *choosingLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageOfRoomActivity;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UITextView *dialogTextView;
@property (weak, nonatomic) IBOutlet UITableView *chooseAnswerTableView;
@property (weak, nonatomic) IBOutlet UITableView *listOfRoomTableView;



- (IBAction)listOfRoomButton:(UIButton *)sender;

@end
