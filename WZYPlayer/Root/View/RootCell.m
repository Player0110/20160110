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
- (void)cell:(RootCell *)cell model:(RootModel *)model {

  [self.picImageView
      sd_setImageWithURL:[NSURL URLWithString:model.img]
               completed:^(UIImage *image, NSError *error,
                           SDImageCacheType cacheType, NSURL *imageURL) {

                 if (image) {
                   self.picImageView.image = image;
                 }

               }];
  NSLog(@"%@", model);
  self.titleLabel.text = model.nm;
  self.summaryLabel.text = model.desc;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  [super setSelected:selected animated:animated];

  // Configure the view for the selected state
}

@end
