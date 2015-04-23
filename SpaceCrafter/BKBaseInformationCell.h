//
//  BKBaseInformationCell.h
//  SpaceCrafter
//
//  Created by Konstantyn Bykhkalo on 12.03.15.
//  Copyright (c) 2015 Bykhkalo Konstantyh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BKBaseInformationCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *shipImage;
@property (weak, nonatomic) IBOutlet UILabel *shipNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *shipLevelLabel;
@property (weak, nonatomic) IBOutlet UILabel *shipExperienceLabel;


@end
