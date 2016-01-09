//
//  RootCell.h
//  WZYPlayer
//
//  Created by wzy on 16/1/9.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *picImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
- (void)cell:(RootCell *)cell model:(id)model;
@end
