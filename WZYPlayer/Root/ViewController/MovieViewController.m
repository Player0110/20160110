//
//  MovieViewController.m
//  WZYPlayer
//
//  Created by wzy on 16/1/11.
//  Copyright © 2016年 wzy. All rights reserved.
//
#import "UITableView+FDTemplateLayoutCell.h"

#import "LocaldData.h"
#import "LogoCell.h"
#import "MovieViewController.h"
#import "RootModel.h"
#import "TextCell.h"
#import "UIImageView+WebCache.h"
#import "YZHUDManager.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
@interface MovieViewController ()
@property(assign, nonatomic) CGFloat height;
@property(assign, nonatomic) CGFloat desHeight;
@property(strong, nonatomic) UIButton *favoriteButton;

@end

@implementation MovieViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  self.view.backgroundColor = [UIColor whiteColor];
  self.tableView.dataSource = self;
  self.tableView.delegate = self;

  [self.tableView registerNib:[UINib nibWithNibName:@"LogoCell"
                                             bundle:[NSBundle mainBundle]]
       forCellReuseIdentifier:@"LogoCell"];
  self.tableView.tableFooterView = [[UIView alloc] init];
  self.tableView.backgroundColor = [UIColor whiteColor];
  [self.tableView registerNib:[UINib nibWithNibName:@"TextCell"
                                             bundle:[NSBundle mainBundle]]
       forCellReuseIdentifier:@"TextCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"MusicCell"
                                               bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:@"MusicCell"];
    
  self.title = self.rootModel.name;
  [self leftButton];
  [self shareButtonView];
  [self data];
}
- (void)data {
  if ([LocaldData achieveDetailData:self.rootModel]) {
    self.rootModel = [LocaldData achieveDetailData:self.rootModel];
    [self.tableView reloadData];
    return;
  }

  [self.rootModel detailsblock:^(RootModel *rootModel, NSError *error) {
    self.rootModel = rootModel;
    [LocaldData saveDetailData:rootModel];
    [self.tableView reloadData];

  }];
}
- (UIView *)tableView:(UITableView *)tableView
    viewForHeaderInSection:(NSInteger)section {
  return [self tableViewHeaderFooterView];
}
- (CGFloat)tableView:(UITableView *)tableView
    heightForHeaderInSection:(NSInteger)section {
  return 235;
}
- (CGFloat)tableView:(UITableView *)tableView
    heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  if (indexPath.row == 0) {
    return 140;
  } else if (indexPath.row == 1) {
    return self.height + 5;
  }
//  else if (indexPath.row == 2){
    
      
      //
//      return [tableView fd_heightForCellWithIdentifier:@"TextCell"                                      cacheByIndexPath:indexPath
//                                         configuration:^(TextCell *cell) {
//                                             [cell cell:cell model:self.rootModel];
//
////                                             [cell detailCell:cell model:self.detailModels[(NSUInteger)indexPath.row]];
//                                         }];
      //
//  }

    return self.desHeight;
  
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
   
    return 3;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  if (indexPath.row == 0) {
    LogoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LogoCell"
                                                     forIndexPath:indexPath];
    [cell cell:cell model:self.rootModel];
      [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

    return cell;
  } else if (indexPath.row == 1) {
    TextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextCell"
                                                     forIndexPath:indexPath];
    cell.titleLabel.text = NSLocalizedString(@"主演:", nil);
    cell.detailLabel.text = self.rootModel.actors;
    self.height = [TextCell height:cell.detailLabel];
      [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

    return cell;

  } else if (indexPath.row == 2){
    TextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextCell"
                                                     forIndexPath:indexPath];
    cell.titleLabel.text = NSLocalizedString(@"剧情:", nil);
    [cell cell:cell model:self.rootModel];
    self.desHeight = [TextCell height:cell.detailLabel];
      [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

    return cell;
  }
    return nil;
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (UITableViewHeaderFooterView *)tableViewHeaderFooterView {
  UITableViewHeaderFooterView *headerView =
      [[UITableViewHeaderFooterView alloc] init];
  UIImageView *imageView = [[UIImageView alloc]
      initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 235)];
  NSLog(@"%@", self.rootModel.logo556640);
  [imageView
      sd_setImageWithURL:[RootModel stringWithUrl:self.rootModel.logo556640]
        placeholderImage:[[SDImageCache sharedImageCache]
                             imageFromDiskCacheForKey:
                                 [[RootModel
                                     stringWithUrl:self.rootModel.logo556640]
                                     absoluteString]]
               completed:^(UIImage *image, NSError *error,
                           SDImageCacheType cacheType, NSURL *imageURL){
               }];

  [headerView addSubview:imageView];

  UIButton *playButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
  [playButton setImage:[UIImage imageNamed:@"play"]
              forState:(UIControlStateNormal)];
  [playButton addTarget:self
                 action:@selector(playClick)
       forControlEvents:(UIControlEventTouchUpInside)];
  if (self.rootModel.mobilePreview) {
    [headerView addSubview:playButton];
  }
  playButton.frame =
      CGRectMake((self.view.frame.size.width - 80) / 2, 80, 80, 80);

  UILabel *nameLabel =
      [[UILabel alloc] initWithFrame:CGRectMake(15, 185, 200, 20)];
  [headerView addSubview:nameLabel];
  nameLabel.text = self.rootModel.name;
  nameLabel.font = [UIFont systemFontOfSize:17.];
  nameLabel.textColor = [UIColor whiteColor];

  UILabel *dateLabel =
      [[UILabel alloc] initWithFrame:CGRectMake(15, 210, 200, 20)];
  [headerView addSubview:dateLabel];
  dateLabel.text =
      [NSString stringWithFormat:@"%@上映 %@", self.rootModel.releaseDate,
                                 self.rootModel.area];
  dateLabel.font = [UIFont systemFontOfSize:13.];
  dateLabel.textColor = [UIColor grayColor];

  return headerView;
}

///
- (void)playClick {
  AVPlayerViewController *avPlayView = [[AVPlayerViewController alloc] init];
  avPlayView.view.transform = CGAffineTransformMakeRotation((M_PI / 2.0));
  AVPlayer *av = [[AVPlayer alloc]
      initWithURL:[NSURL URLWithString:self.rootModel.mobilePreview]];
  avPlayView.player = av;
  [avPlayView.player play];
  [self presentViewController:avPlayView
                     animated:YES
                   completion:^{
                   }];
}
- (void)shareButtonView {
  self.favoriteButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
  self.favoriteButton.frame = CGRectMake(0, 0, 30, 30);
  //
  UIImage *image = [[UIImage imageNamed:@"share"]
      imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
  [self.favoriteButton.imageView setTintColor:[UIColor grayColor]];
  //
  [self.favoriteButton setImage:image forState:(UIControlStateNormal)];
  [self.favoriteButton addTarget:self
                       action:@selector(didClickEdit)
             forControlEvents:(UIControlEventTouchUpInside)];
    
    UIButton * shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    shareButton.frame = CGRectMake(30, 0, 30, 30);
    [shareButton setImage:[[UIImage imageNamed:@"share"]
                           imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]
                 forState:UIControlStateNormal];
    [shareButton addTarget:self
                    action:@selector(didClickShare)
          forControlEvents:UIControlEventTouchUpInside];
    
    UIView * rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    [rightView addSubview:self.favoriteButton];
    [rightView addSubview:shareButton];
  UIBarButtonItem *rightButton =
      [[UIBarButtonItem alloc] initWithCustomView:rightView];
  self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)didClickEdit {
  [self.rootModel collectModel];
  [[YZHUDManager sharedYZHUDManager] showWithHint:@"收藏成功"];
}

- (void)didClickShare {
    
}
///
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little
preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
