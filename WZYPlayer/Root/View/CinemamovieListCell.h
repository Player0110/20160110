//
//  CinemamovieListCell.h
//  WZYPlayer
//
//  Created by Tagcare on 16/3/24.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RootModel;

@protocol CinemamovieListCellimageDelegate<NSObject>
-(void)touchale:(RootModel *)movie tag:(NSInteger)tag;
@end

@interface CinemamovieListCell : UITableViewCell

@property (strong, nonatomic) UIImageView * picImageView;
@property (strong, nonatomic) UIImageView * logoImageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) NSMutableArray *movieListModel;

- (void)cell:(CinemamovieListCell *)cell model:(id)model;

@property (nonatomic,assign) id<CinemamovieListCellimageDelegate>delegate;

@end
