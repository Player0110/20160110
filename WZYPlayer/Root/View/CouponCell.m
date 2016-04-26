//
//  CouponCell.m
//  WZYPlayer
//
//  Created by QiQi on 16/4/23.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "CouponCell.h"
#import "CinemaModel.h"

@implementation CouponCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)cell:(CouponCell *)cell model:(CinemaModel *)model {
    if (model.newsCoupon == nil) {
        model.newsCoupon = @"无";
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:model.newsCoupon];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:5];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, model.newsCoupon.length)];
    
    cell.couponLabel.attributedText = attributedString;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
