//
//  LogoCell.m
//  WZYPlayer
//
//  Created by wzy on 16/1/13.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "LogoCell.h"
#import "RootModel.h"
#import "UIImageView+WebCache.h"

@implementation LogoCell
- (void)cell:(LogoCell *)cell model:(RootModel *)model {

  [self.pictureView
      sd_setImageWithURL:[RootModel stringWithUrl:model.logo2]
        placeholderImage:
            [[SDImageCache sharedImageCache]
                imageFromDiskCacheForKey:[[RootModel stringWithUrl:model.logo2]
                                             absoluteString]]
               completed:^(UIImage *image, NSError *error,
                           SDImageCacheType cacheType, NSURL *imageURL){
               }];

  self.gradeLabel.text = model.grade;
  self.categoryLabel.text = model.category;
  self.durationLabel.text = model.duration;
  self.directorLabel.text = model.director;
}
- (void)awakeFromNib {
  // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  [super setSelected:selected animated:animated];

  // Configure the view for the selected state
}

@end
