//
//  SeetingCell.h
//  WZYPlayer
//
//  Created by Tagcare on 16/5/5.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SeetingCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (void)cell:(SeetingCell *)cell string:(NSString *)str;


@end
