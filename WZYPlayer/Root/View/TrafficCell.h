//
//  TrafficCell.h
//  WZYPlayer
//
//  Created by QiQi on 16/4/23.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CinemaModel;
@interface TrafficCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *buslineLabel;
@property (strong, nonatomic) IBOutlet UILabel *trafficLabel;

- (void)cell:(TrafficCell *)cell model:(CinemaModel *)model row:(int)row;

@end
