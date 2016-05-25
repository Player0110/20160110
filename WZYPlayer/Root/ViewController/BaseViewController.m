//
//  ViewController.m
//  WZYPlayer
//
//  Created by wzy on 15/11/27.
//  Copyright © 2015年 wzy. All rights reserved.
//

#import "BaseViewController.h"
#import "MJRefresh.h"

static const CGFloat MJDuration = 2.0;

@interface BaseViewController ()
@property(strong, nonatomic) UIButton *returnButton;

@end

@implementation BaseViewController

- (void)viewDidLoad {

    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_backgroungImage"] forBarMetrics:UIBarMetricsDefault];
    NSDictionary * dict = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    [super viewDidLoad];

  // Do any additional setup after loading the view, typically from a nib.
}
- (void)leftButton {
  self.returnButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
  self.returnButton.frame = CGRectMake(0, 0, 20, 20);
  UIImage *image = [UIImage imageNamed:@"nav_back"];

  UIImage *backImage =
      [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
  [self.returnButton setImage:backImage forState:(UIControlStateNormal)];
  [self.returnButton setTintColor:[UIColor grayColor]];
  [self.returnButton addTarget:self
                        action:@selector(didClickReturn)
              forControlEvents:(UIControlEventTouchUpInside)];
  UIBarButtonItem *returnButton =
      [[UIBarButtonItem alloc] initWithCustomView:self.returnButton];
  self.navigationItem.leftBarButtonItem = returnButton;
}

- (void)didClickReturn {

  [self.navigationController popViewControllerAnimated:YES];
  [super viewDidLoad];

  // Do any additional setup after loading the view, typically from a nib.
}

- (void)menuBarbutton {
    [self.navigationItem.leftBarButtonItem setImage:[[UIImage imageNamed:@"nav_menu"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
}

#pragma mark - MJRefresh上下拉
- (void)setupRefresh {
  [self headerRereshing];
//  [self fooderRereshing];
}

- (void)headerRereshing {

  __unsafe_unretained __typeof(self) weakSelf = self;
  // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
  self.baseTableView.mj_header =
      [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadNewData];
      }];
}

- (void)fooderRereshing {

  [self headerRereshing];
  __unsafe_unretained __typeof(self) weakSelf = self;
  // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
  self.baseTableView.mj_footer =
      [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf loadMoreData];
      }];
}

- (void)loadNewData {

  // 模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
  dispatch_after(
      dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MJDuration * NSEC_PER_SEC)),
      dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.baseTableView reloadData];

        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.baseTableView.mj_header endRefreshing];
      });
  NSLog(@"下拉刷新");
}

- (void)loadMoreData {
    
    // 模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.baseTableView reloadData];
        // 拿到当前的上拉刷新控件，结束刷新状态
        [self.baseTableView.mj_footer endRefreshing];
      });
  NSLog(@"上拉刷新");
}

#pragma mark - 空白页
- (void)setupEmptyView {

  self.baseTableView.emptyDataSetDelegate = self;
  self.baseTableView.emptyDataSetSource = self;
  self.baseTableView.tableFooterView = [UIView new];
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
  NSString *text = @"Please Allow Photo Access";

  NSDictionary *attributes = @{
    NSFontAttributeName : [UIFont boldSystemFontOfSize:18.0f],
    NSForegroundColorAttributeName : [UIColor darkGrayColor]
  };

  return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {

  NSString *text = @"This allows you to share photos from your library and "
                   @"save photos to your camera roll.";

  NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
  paragraph.lineBreakMode = NSLineBreakByWordWrapping;
  paragraph.alignment = NSTextAlignmentCenter;

  NSDictionary *attributes = @{
    NSFontAttributeName : [UIFont systemFontOfSize:14.0f],
    NSForegroundColorAttributeName : [UIColor lightGrayColor],
    NSParagraphStyleAttributeName : paragraph
  };

  return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
