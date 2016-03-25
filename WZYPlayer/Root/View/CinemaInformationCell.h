//
//  CinemaInformationCell.h
//  WZYPlayer
//
//  Created by Tagcare on 16/3/24.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CinemaInformationCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *cinemaNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *gradeLabel;

- (void)cell:(CinemaInformationCell *)cell model:(id)model;


@end
