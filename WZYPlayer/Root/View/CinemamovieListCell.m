//
//  CinemamovieListCell.m
//  WZYPlayer
//
//  Created by Tagcare on 16/3/24.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "CinemamovieListCell.h"
#import "UIImageView+WebCache.h"
#import "RootModel.h"

@implementation CinemamovieListCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setupSubviews:(NSMutableArray *)model {
    for (int i = 0; i<[model count]; i++) {
        self.picImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15+78*i, 5, 70, 90)];
        [self.scrollView addSubview:self.picImageView];
        self.logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(3, 3, 64, 84)];
        [self.picImageView addSubview:self.logoImageView];
        self.logoImageView.tag = i;
        if (i == 0) {
            self.picImageView.backgroundColor = [UIColor orangeColor];

        }
        RootModel * rootModel = model[i];
        [self.logoImageView
         sd_setImageWithURL:[RootModel stringWithUrl:rootModel.logo]
         placeholderImage:
         [[SDImageCache sharedImageCache]
          imageFromDiskCacheForKey:[[RootModel stringWithUrl:rootModel.logo]
                                    absoluteString]]
         completed:^(UIImage *image, NSError *error,
                     SDImageCacheType cacheType, NSURL *imageURL){
         }];
    
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        [self.logoImageView addGestureRecognizer:tap];
        self.logoImageView.userInteractionEnabled = YES;
    }
    self.scrollView.contentSize = CGSizeMake([model count]*78+22, 0);
}

-(void)tap:(UITapGestureRecognizer*)sender{
    
    RootModel * rootModel = self.movieListModel[self.logoImageView.tag];

    if(_delegate && [_delegate respondsToSelector:@selector(touchale:tag:)]){
        [_delegate touchale:rootModel tag:sender.view.tag+1];
    }
    
}

- (void)cell:(CinemamovieListCell *)cell model:(NSMutableArray *)model {
    [self setupSubviews:model];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
