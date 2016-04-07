//
//  CinemaMovieDetailCell.h
//  WZYPlayer
//
//  Created by Tagcare on 16/3/24.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CinemaMovieDetailCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *movieNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *gradeLabel;

- (void)cell:(CinemaMovieDetailCell *)cell model:(id)model;


@end
