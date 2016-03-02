//
//  CinemaCell.m
//  WZYPlayer
//
//  Created by Tagcare on 16/3/1.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "CinemaCell.h"

#import "CinemaModel.h"

@implementation CinemaCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)cell:(CinemaCell *)cell model:(CinemaModel *)model {

    self.cinemaNameLabel.text = model.name;
    self.addressLabel.text = model.circleName ? model.circleName:model.address;
    self.screeningsLabel.text = model.screenings;
//    self.lowPriceLabel.text = [NSString stringWithFormat:@"¥%@起",model.lowPrice];
    if (model.lowPrice != nil) {
    
    
    NSMutableAttributedString *lowPrice = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"¥%@起",model.lowPrice]];
        NSLog(@"%@",lowPrice);

    [lowPrice addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Courier-BoldOblique" size:16.0] range:NSMakeRange(1, [model.lowPrice length])];
    self.lowPriceLabel.attributedText = lowPrice;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
