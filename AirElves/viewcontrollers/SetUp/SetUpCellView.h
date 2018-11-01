//
//  SetUpCellViewTableViewCell.h
//  TestUnfoldTableView
//
//  Created by Pishum on 16/2/1.
//  Copyright © 2016年 Pishum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


@interface SetUpCellView : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *cellIcon;
@property (strong, nonatomic) IBOutlet UILabel *cellLabel;
@property (strong, nonatomic) IBOutlet UISwitch *cellSwitch;
@property (strong, nonatomic) IBOutlet UILabel *cellInfo;
- (IBAction)OnSwitchChanged:(UISwitch *)sender;

@end
