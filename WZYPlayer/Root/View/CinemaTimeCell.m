//
//  CinemaTimeCell.m
//  WZYPlayer
//
//  Created by Tagcare on 16/3/24.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "CinemaTimeCell.h"

#import "TicketModel.h"

@implementation CinemaTimeCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)cell:(CinemaTimeCell *)cell model:(TicketModel *)model {
    self.showTimeLabel.text = model.showTime;
    self.endTimeLabel.text = model.endTime;
    self.dimensionalAndLanguageLabel.text = [NSString stringWithFormat:@"%@%@",model.language,model.dimensional];
    self.hallNameLabel.text = model.hallName;
    self.priceLabel.text = model.price;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
