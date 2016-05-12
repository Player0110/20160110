//
//  SeetingCell.m
//  WZYPlayer
//
//  Created by Tagcare on 16/5/5.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "SeetingCell.h"

@implementation SeetingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)cell:(SeetingCell *)cell string:(NSString *)str {
    
    cell.detailLabel.text = str;
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
