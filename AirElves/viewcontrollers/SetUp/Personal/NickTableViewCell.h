//
//  NickTableViewCell.h
//  HFSocket
//
//  Created by user1 on 2018/9/6.
//  Copyright © 2018年 HF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NickTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *nickImageView;
@property (strong, nonatomic) IBOutlet UILabel *nickTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *nickSubTitleLabel;

@end
