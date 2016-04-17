//
//  CinemaDateCell.m
//  WZYPlayer
//
//  Created by Tagcare on 16/3/24.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "CinemaDateCell.h"
#import "TicketUnitListModel.h"
#import "TicketUnitModel.h"

@implementation CinemaDateCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)cell:(CinemaDateCell *)cell model:(TicketUnitListModel *)model {
    [self setupSubviews:model];
    
}

- (void)setupSubviews:(TicketUnitListModel *)model {
    for (int i = 0; i < [model.ticketUnitList count]; i ++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(80*i, 0, 80, 30);
        TicketUnitModel * ticketUnit = model.ticketUnitList[i];
        [button setTitle:[NSString stringWithFormat:@"%@",ticketUnit.showDate] forState:UIControlStateNormal];
        [self.scrollView addSubview:button];
    }
    self.scrollView.contentSize = CGSizeMake(80*([model.ticketUnitList count]+1), 0);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
