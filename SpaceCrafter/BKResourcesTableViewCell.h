//
//  BKResourcesTableViewCell.h
//  SpaceCrafter
//
//  Created by Konstantyn Bykhkalo on 13.03.15.
//  Copyright (c) 2015 Bykhkalo Konstantyh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BKResourcesTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *resourcesNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *resourcesCountLabel;

@end
