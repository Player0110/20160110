//
//  LogoCell.h
//  WZYPlayer
//
//  Created by wzy on 16/1/13.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootModel.h"

@interface LogoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *directorLabel;
@property (weak, nonatomic) IBOutlet UILabel *gradeLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pictureView;
-(void)cell:(LogoCell *)cell model:(RootModel *)model;

@end
