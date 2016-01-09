//
//  RootViewController.m
//  WZYPlayer
//
//  Created by wzy on 15/11/30.
//  Copyright © 2015年 wzy. All rights reserved.
//

#import "DataService.h"
#import "LLSlideMenu.h"
#import "MovieViewController.h"
#import "RootCell.h"
#import "RootListModel.h"
#import "RootModel.h"
#import "RootViewController.h"
#import "LeftMenuView.h"

@interface RootViewController ()

@property(strong, nonatomic) NSMutableArray *dataArray;
@property(nonatomic, strong) LeftMenuView *slideMenu;

// 全屏侧滑手势
@property(nonatomic, strong) UIPanGestureRecognizer *leftSwipe;
@property(nonatomic, strong) UIPercentDrivenInteractiveTransition *percent;

@end

@implementation RootViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.

  self.title = NSLocalizedString(@"正在热映", nil);
  self.dataArray = [NSMutableArray arrayWithCapacity:5];
  [self data];
  [self setupSubviews];
  [self setupRefresh];
  [self setupEmptyView];

  //侧边栏
  [self setupLeftView];
}

- (void)data {
  [RootModel GETUrl:@""
              block:^(RootListModel *listModel, NSError *error) {
                if (!error) {
                  self.dataArray = listModel.hot;
                  [self.baseTableView reloadData];
                }
              }];
}
#pragma mark - TabelView Delegate and DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
  return self.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView
    heightForRowAtIndexPath:(NSIndexPath *)indexPath {

  return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  RootCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RootCell"];
  RootModel *rootModel = self.dataArray[indexPath.row];
  cell.selectionStyle = UITableViewCellSelectionStyleNone;
  [cell cell:cell model:rootModel];
  return cell;
}
- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  MovieViewController *movieVC = [[MovieViewController alloc] init];
  movieVC.rootModel = self.dataArray[indexPath.row];
  [self.navigationController showViewController:movieVC sender:nil];
}

#pragma mark - 侧边栏
- (void)setupLeftView {
  UIViewController *controller =
      [UIApplication sharedApplication].keyWindow.rootViewController;
  _slideMenu = [[LeftMenuView alloc] init];
  [controller.view addSubview:_slideMenu];
  // 设置菜单宽度
  _slideMenu.ll_menuWidth = 200.f;
  // 设置菜单背景色
  _slideMenu.ll_menuBackgroundColor = [UIColor colorWithRed:44 / 255.0
                                                      green:44 / 255.0
                                                       blue:44 / 255.0
                                                      alpha:1.0];
  // 设置背景图片
  //    _slideMenu.ll_menuBackgroundImage = [UIImage imageNamed:@"p2"];

  // 设置弹力和速度，  默认的是20,15,60
  _slideMenu.ll_springDamping = 15;   // 阻力
  _slideMenu.ll_springVelocity = 50;  // 速度
  _slideMenu.ll_springFramesNum = 80; // 关键帧数量

  NSArray *leftArray = [NSArray
      arrayWithObjects:@"button1", @"button2", @"button3", @"button4", nil];
  [_slideMenu setupLeftMenuView:leftArray];

  //侧边栏侧滑手势
  self.leftSwipe = [[UIPanGestureRecognizer alloc]
      initWithTarget:self
              action:@selector(swipeLeftHandle:)];
  self.leftSwipe.maximumNumberOfTouches = 1;
  [self.view addGestureRecognizer:_leftSwipe];

  UITapGestureRecognizer *iconTap = [[UITapGestureRecognizer alloc]
      initWithTarget:self
              action:@selector(tapIconImageGestureRecognizer:)];
  [_slideMenu.iconImage addGestureRecognizer:iconTap];
}

- (void)tapIconImageGestureRecognizer:
    (UITapGestureRecognizer *)gestureRecognizer {

  if (_slideMenu.ll_isOpen) {
    [_slideMenu ll_closeSlideMenu];
  }
//  UIStoryboard *storyboard =
//      [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//  PersonalViewController *personalVC = (PersonalViewController *)[storyboard
//      instantiateViewControllerWithIdentifier:@"personalViewController"];
//
//  [self.navigationController pushViewController:personalVC animated:YES];
}

#pragma mark - barButton
- (IBAction)leftBarButtonAction:(id)sender {
  if (_slideMenu.ll_isOpen) {
    [_slideMenu ll_closeSlideMenu];
  } else {
    [_slideMenu ll_openSlideMenu];
  }
}

#pragma mark - 侧边栏
/**
 *  侧边栏侧滑手势
 *
 *  @param recognizer 侧滑弹出侧边栏
 */
- (void)swipeLeftHandle:(UIScreenEdgePanGestureRecognizer *)recognizer {
  // 如果菜单已打开则禁止滑动
  if (_slideMenu.ll_isOpen) {
    return;
  }
  // 计算手指滑的物理距离（滑了多远，与起始位置无关）
  CGFloat progress = [recognizer translationInView:self.view].x /
                     (self.view.bounds.size.width * 1.0);
  // 把这个百分比限制在 0~1 之间
  progress = MIN(1.0, MAX(0.0, progress));

  // 当手势刚刚开始，我们创建一个 UIPercentDrivenInteractiveTransition 对象
  if (recognizer.state == UIGestureRecognizerStateBegan) {
    self.percent = [[UIPercentDrivenInteractiveTransition alloc] init];
  } else if (recognizer.state == UIGestureRecognizerStateChanged) {

    // 当手慢慢划入时，我们把总体手势划入的进度告诉
    // UIPercentDrivenInteractiveTransition 对象。
    [self.percent updateInteractiveTransition:progress];
    _slideMenu.ll_distance = [recognizer translationInView:self.view].x;

  } else if (recognizer.state == UIGestureRecognizerStateCancelled ||
             recognizer.state == UIGestureRecognizerStateEnded) {
    // 当手势结束，我们根据用户的手势进度来判断过渡是应该完成还是取消并相应的调用
    // finishInteractiveTransition 或者 cancelInteractiveTransition 方法.
    if (progress > 0.4) {
      [self.percent finishInteractiveTransition];
      [_slideMenu ll_openSlideMenu];
    } else {
      [self.percent cancelInteractiveTransition];
      [_slideMenu ll_closeSlideMenu];
    }
    self.percent = nil;
  }
}
- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}
//////////////

- (void)setupSubviews {
  self.baseTableView =
      [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
  [self.view addSubview:self.baseTableView];
  self.baseTableView.dataSource = self;
  self.baseTableView.delegate = self;
  [self.baseTableView registerNib:[UINib nibWithNibName:@"RootCell"
                                                 bundle:[NSBundle mainBundle]]
           forCellReuseIdentifier:@"RootCell"];
  //侧边栏
  _slideMenu = [[LeftMenuView alloc] init];
  [self.view addSubview:_slideMenu];
  // 设置菜单宽度
  _slideMenu.ll_menuWidth = 200.f;
  // 设置菜单背景色
  //    _slideMenu.ll_menuBackgroundColor = [UIColor redColor];
  // 设置背景图片
  _slideMenu.ll_menuBackgroundImage = [UIImage imageNamed:@"p2"];

  // 设置弹力和速度，  默认的是20,15,60
  _slideMenu.ll_springDamping = 15;   // 阻力
  _slideMenu.ll_springVelocity = 30;  // 速度
  _slideMenu.ll_springFramesNum = 80; // 关键帧数量

  //侧边栏侧滑手势
  self.leftSwipe = [[UIPanGestureRecognizer alloc]
      initWithTarget:self
              action:@selector(swipeLeftHandle:)];
  self.leftSwipe.maximumNumberOfTouches = 1;
  [self.view addGestureRecognizer:_leftSwipe];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little
preparation before navigation
=======
    // 如果菜单已打开则禁止滑动
    if (_slideMenu.ll_isOpen) {
        return;
    }
    // 计算手指滑的物理距离（滑了多远，与起始位置无关）
    CGFloat progress = [recognizer translationInView:self.view].x /
(self.view.bounds.size.width * 1.0);
    // 把这个百分比限制在 0~1 之间
    progress = MIN(1.0, MAX(0.0, progress));

    // 当手势刚刚开始，我们创建一个 UIPercentDrivenInteractiveTransition 对象
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        self.percent = [[UIPercentDrivenInteractiveTransition alloc] init];
    } else if (recognizer.state == UIGestureRecognizerStateChanged) {

        // 当手慢慢划入时，我们把总体手势划入的进度告诉
UIPercentDrivenInteractiveTransition 对象。
        [self.percent updateInteractiveTransition:progress];
        _slideMenu.ll_distance = [recognizer translationInView:self.view].x;

    } else if (recognizer.state == UIGestureRecognizerStateCancelled ||
recognizer.state == UIGestureRecognizerStateEnded) {
        //
当手势结束，我们根据用户的手势进度来判断过渡是应该完成还是取消并相应的调用
finishInteractiveTransition 或者 cancelInteractiveTransition 方法.
        if (progress > 0.4) {
            [self.percent finishInteractiveTransition];
            [_slideMenu ll_openSlideMenu];
        }else{
            [self.percent cancelInteractiveTransition];
            [_slideMenu ll_closeSlideMenu];
        }
        self.percent = nil;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little
preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
