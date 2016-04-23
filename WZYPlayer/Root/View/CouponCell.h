//
//  CouponCell.h
//  WZYPlayer
//
//  Created by QiQi on 16/4/23.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CouponCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *couponLabel;

- (void)cell:(CouponCell *)cell model:(id)model;

@end
