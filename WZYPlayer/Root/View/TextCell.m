//
//  TextCell.m
//  WZYPlayer
//
//  Created by wzy on 16/1/13.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "RootModel.h"
#import "TextCell.h"
@implementation TextCell

- (void)awakeFromNib {
  // Initialization code
}
- (void)cell:(TextCell *)cell model:(RootModel *)model {
  self.detailLabel.text = model.des;
}

+ (CGFloat)height:(UILabel *)label {
  CGFloat height =
      [label.text
          boundingRectWithSize:CGSizeMake(label.frame.size.width, CGFLOAT_MAX)
                       options:NSStringDrawingUsesLineFragmentOrigin |
                               NSStringDrawingUsesFontLeading
                    attributes:[NSDictionary
                                   dictionaryWithObjectsAndKeys:
                                       label.font, NSFontAttributeName, nil]
                       context:nil]
          .size.height;
  return height;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  [super setSelected:selected animated:animated];

  // Configure the view for the selected state
}

@end
