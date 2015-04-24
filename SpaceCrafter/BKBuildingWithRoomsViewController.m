//
//  BKBuildingWithRoomsViewController.m
//  SpaceCrafter
//
//  Created by Konstantyn Bykhkalo on 24.04.15.
//  Copyright (c) 2015 Bykhkalo Konstantyh. All rights reserved.
//

#import "BKBuildingWithRoomsViewController.h"
#import "PlanetWithRoomsViewController.h"
#import "ShipViewController.h"

#import "BKRoom.h"
#import "BKPerson.h"
#import "BKQuest.h"

typedef enum{
    
    BKBuildingStatusChooseRoom = 0,
    BKBuildingStatusChoosePerson = 1,
    BKBuildingStatusDialog = 2
    
} BKBuildingStatus;

typedef enum {

    BKTableViewTagListOfRoom = 0,
    BKTableViewTagChooseAnswer = 1

} BKTableViewTag;

@interface BKBuildingWithRoomsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (assign, nonatomic) BKBuildingStatus status;
@property (strong, nonatomic) BKRoom* selectRoom;
@property (strong, nonatomic) BKPerson* selectPerson;

@end

@implementation BKBuildingWithRoomsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.listOfRoomTableView.dataSource = self;
    self.listOfRoomTableView.delegate = self;
    self.listOfRoomTableView.tag = 0;
    
    self.chooseAnswerTableView.dataSource = self;
    self.chooseAnswerTableView.delegate = self;
    self.chooseAnswerTableView.tag = 1;
    
    self.status = BKBuildingStatusChooseRoom;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setters

-(void) setStatus:(BKBuildingStatus)status {
    
    switch (status) {
        case BKBuildingStatusChooseRoom:
            
            self.listOfRoomTableView.hidden = NO;
            self.chooseAnswerTableView.hidden = YES;
            self.dialogTextView.hidden = YES;
            self.selectPerson = nil;
            self.selectRoom = nil;
            self.choosingLabel.text = @"Список комнат";
            self.descriptionTextView.text = self.building.descriptionOfBuilding;
            
            break;
        case BKBuildingStatusChoosePerson:
            
            self.listOfRoomTableView.hidden = YES;
            self.chooseAnswerTableView.hidden = NO;
            self.dialogTextView.hidden = NO;
            self.selectRoom = nil;
            self.choosingLabel.text = @"Список персонажей";
            self.descriptionTextView.text = self.selectRoom.descriptionOfRoom;
            
            break;
        case BKBuildingStatusDialog:
            
            self.listOfRoomTableView.hidden = YES;
            self.chooseAnswerTableView.hidden = NO;
            self.dialogTextView.hidden = NO;
            self.selectRoom = nil;
            self.choosingLabel.text = @"Список квестов";
            self.descriptionTextView.text = self.selectPerson.descriptionOfPerson;
            
            break;
    }
    
    [self.chooseAnswerTableView  reloadData];
    [self.listOfRoomTableView   reloadData];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* cellIdentifier = @"cellIdentifier";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (tableView.tag == BKTableViewTagListOfRoom) {
        
        BKRoom* room = [self.building.rooms.allObjects objectAtIndex:indexPath.row];
        
        cell.textLabel.text = room.name;
    }else if (tableView.tag == BKTableViewTagChooseAnswer) {
        if (!self.selectPerson) {
            BKPerson* person = [self.selectRoom.people.allObjects objectAtIndex:indexPath.row];
            cell.textLabel.text = person.name;
        }else{
            
            BKQuest* quest = [self.selectPerson.quest.allObjects objectAtIndex:indexPath.row];
            
            cell.textLabel.text = quest.name;
        }
    }
    return cell;
    
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (tableView.tag == BKTableViewTagListOfRoom) {
        self.selectRoom = [self.building.rooms.allObjects objectAtIndex:indexPath.row];
        self.status = BKBuildingStatusChoosePerson;
    }if (tableView.tag == BKTableViewTagChooseAnswer) {
        if (self.status == BKBuildingStatusChoosePerson) {
            self.selectPerson = [self.selectRoom.people.allObjects objectAtIndex:indexPath.row];
            self.status = BKBuildingStatusDialog;
        
    }
    
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    static NSString* planetSegueIdentifier = @"showPlanetSegueIdentifier";
    static NSString* shipSegueIdentifier = @"showShipSegueIdentifier";
    
    if ([segue.identifier isEqualToString:planetSegueIdentifier]) {
        
        //[self dismissViewControllerAnimated:YES completion:nil];
        PlanetWithRoomsViewController* pvc = segue.destinationViewController;
        pvc.planet = self.building.craftPlanet;
        
    }else if ([segue.identifier isEqualToString:shipSegueIdentifier]) {
        //ShipViewController * svc = segue.destinationViewController;
        //svc.ship = self.building.craftPlanet.shipOnPlanet;
    }
    
}


- (IBAction)listOfRoomButton:(UIButton *)sender {
    
    self.status = BKBuildingStatusChooseRoom;
    
}
@end
