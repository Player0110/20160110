//
//  RootCell.m
//  WZYPlayer
//
//  Created by wzy on 16/1/9.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "RootCell.h"
#import "RootModel.h"
#import "UIImageView+WebCache.h"

@implementation RootCell

- (void)awakeFromNib {
  // Initialization code
}
/**
 *  RootCell.h
 *  cell上控件的赋值
 */
- (void)cell:(RootCell *)cell model:(RootModel *)model {
    /**
     *  获取图片
     *  根据model.logo取图片，model.logo保存的是图片的url
    */
  [self.picImageView sd_setImageWithURL:[RootModel stringWithUrl:model.logo]
                       placeholderImage:[[SDImageCache sharedImageCache]
                                         imageFromDiskCacheForKey:[[RootModel
                                                                    stringWithUrl:model.logo]
                                                                   absoluteString]]
                              completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType,
                                          NSURL *imageURL){
               
                              }];

    cell.titleLabel.text = model.name;
    cell.summaryLabel.text = model.highlight;
    cell.screeningsLabel.text = model.screenings;
//    设置评分的字体样式
    NSMutableAttributedString *grade = [[NSMutableAttributedString alloc]
                                        initWithString:[NSString
                                                        stringWithFormat:@"%@分",model.grade]];
    [grade addAttribute:NSFontAttributeName
                  value:[UIFont fontWithName:@"AppleGothic" size:17.0]
                  range:NSMakeRange(0, [model.grade length])];
    
    self.scoreLabel.attributedText = grade;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  [super setSelected:selected animated:animated];

  // Configure the view for the selected state
}

@end
