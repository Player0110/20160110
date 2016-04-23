//
//  CinemaInformationCell.m
//  WZYPlayer
//
//  Created by Tagcare on 16/3/24.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "CinemaInformationCell.h"
#import "CinemaModel.h"

@implementation CinemaInformationCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)cell:(CinemaInformationCell *)cell model:(CinemaModel *)model {
    self.cinemaNameLabel.text = model.name;
    self.addressLabel.text = model.address;
    NSMutableAttributedString *grade = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@分",model.grade]];
    
    [grade addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AppleGothic" size:17.0] range:NSMakeRange(0, [model.grade length])];
    self.gradeLabel.attributedText = grade;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
