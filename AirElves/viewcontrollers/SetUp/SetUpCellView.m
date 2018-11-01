//
//  SetUpCellViewTableViewCell.m
//  TestUnfoldTableView
//
//  Created by Pishum on 16/2/1.
//  Copyright © 2016年 Pishum. All rights reserved.
//

#import "SetUpCellView.h"
#import "SetUpController.h"

@implementation SetUpCellView

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)OnSwitchChanged:(UISwitch *)sender {
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    switch ([sender tag]) {
        case 0:
            [def setValue:[NSNumber numberWithBool:sender.on] forKey:@"voice_key"];
            break;
        case 1:
            [def setValue:[NSNumber numberWithBool:sender.on] forKey:@"shake_key"];
            break;
        default:
            break;
    }
    
    [SetUpController soundAndVibrate];
}
@end
