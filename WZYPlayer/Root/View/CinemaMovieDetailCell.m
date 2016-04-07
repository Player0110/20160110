//
//  CinemaMovieDetailCell.m
//  WZYPlayer
//
//  Created by Tagcare on 16/3/24.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "CinemaMovieDetailCell.h"
#import "RootModel.h"

@implementation CinemaMovieDetailCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)cell:(CinemaMovieDetailCell *)cell model:(RootModel *)model {
    self.movieNameLabel.text = model.name;
    self.gradeLabel.text = model.grade;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
