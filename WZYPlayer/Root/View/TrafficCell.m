//
//  TrafficCell.m
//  WZYPlayer
//
//  Created by QiQi on 16/4/23.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "TrafficCell.h"
#import "CinemaModel.h"

@implementation TrafficCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)cell:(TrafficCell *)cell model:(CinemaModel *)model row:(int)row{
    if (row == 0) {
        cell.buslineLabel.attributedText = [self text:model.busline];

    }else {
        cell.trafficLabel.text = @"地铁";
        cell.buslineLabel.attributedText = [self text:model.subwayLine];
    }
}

- (NSMutableAttributedString *)text:(NSString *)text {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:5];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    return attributedString;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
