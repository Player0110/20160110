//
//  TextCell.h
//  WZYPlayer
//
//  Created by wzy on 16/1/13.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RootModel;
@interface TextCell : UITableViewCell
@property(weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
- (void)cell:(TextCell *)cell model:(RootModel *)model;
+ (CGFloat)height:(UILabel *)label;
@end
