//
//  NickTableViewCell.m
//  HFSocket
//
//  Created by user1 on 2018/9/6.
//  Copyright © 2018年 HF. All rights reserved.
//

#import "NickTableViewCell.h"

@implementation NickTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.nickImageView.layer.cornerRadius = 35;
    self.nickImageView.layer.masksToBounds = YES;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.nickTitleLabel.font = [UIFont systemFontOfSize:18];
    self.nickSubTitleLabel.font = [UIFont systemFontOfSize:16];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
