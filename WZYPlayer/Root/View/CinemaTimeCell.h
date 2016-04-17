//
//  CinemaTimeCell.h
//  WZYPlayer
//
//  Created by Tagcare on 16/3/24.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CinemaTimeCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *showTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *endTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *dimensionalAndLanguageLabel;
@property (strong, nonatomic) IBOutlet UILabel *hallNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;

- (void)cell:(CinemaTimeCell *)cell model:(id)model;

@end
