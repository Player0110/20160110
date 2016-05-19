//
//  RootViewController.m
//  WZYPlayer
//
//  Created by wzy on 15/11/30.
//  Copyright © 2015年 wzy. All rights reserved.
//

#import "DataService.h"
#import "LocaldData.h"
#import "MovieViewController.h"
#import "RootCell.h"
#import "RootListModel.h"
#import "RootModel.h"
#import "RootViewController.h"

#import "UrlAboutCity.h"

@interface RootViewController ()

@property(strong, nonatomic) NSMutableArray *dataArray;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *rightBarButton;

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
}

/**
 *  RootViewController.m
 *  数据请求
 *  判断（首先从本地获取 如果本地有数据直接展示、否则从网上请求）
 */
- (void)data {
  if ([LocaldData achieveListDataType:@"movieList.plist"]) {
    self.dataArray = [LocaldData achieveListDataType:@"movieList.plist"].list;
    [self.baseTableView reloadData];

  } else {
    [RootModel URL:@""
              type:@""
             block:^(RootListModel *listModel, NSError *error) {
               if (!error) {
                 self.dataArray = listModel.list;
                 [LocaldData saveListData:listModel type:@"movieList.plist"];
                 [self.baseTableView reloadData];
               }
             }];
  }
}

#pragma mark - TabelView Delegate and DataSource
//RootViewController.m
/**
 *  设置tabelView列表的分区数
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}
/**
 *  设置tabelView列表每个分区的行数
 *  行数为数组self.dataArray里元素的个数
 */
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
  return self.dataArray.count;
}
/**
 *  设置tabelView每行的高度
 */
- (CGFloat)tableView:(UITableView *)tableView
    heightForRowAtIndexPath:(NSIndexPath *)indexPath {

  return 100;
}
/**
 *  创建cell，并给cell上的控件赋值数据
 *  从数组self.dataArray中获取一个元素，给cell赋值
 */
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  RootCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RootCell"];
  RootModel *rootModel = self.dataArray[indexPath.row];
  cell.selectionStyle = UITableViewCellSelectionStyleNone;
  [cell cell:cell model:rootModel];
  return cell;
}
/**
 *  点击某一行cell，跳转至电影详情页面
 *  跳转页面时将要展示的数据传给后一个页面
 */
- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  MovieViewController *movieVC =
      [[MovieViewController alloc] initWithNibName:@"MovieViewController"
                                            bundle:nil];
  movieVC.rootModel = self.dataArray[indexPath.row];
  [self.navigationController showViewController:movieVC sender:nil];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)setupSubviews {
  self.baseTableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
  [self.view addSubview:self.baseTableView];
  self.baseTableView.dataSource = self;
  self.baseTableView.delegate = self;
    
  [self.baseTableView registerNib:[UINib nibWithNibName:@"RootCell"
                                                 bundle:[NSBundle mainBundle]]
           forCellReuseIdentifier:@"RootCell"];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.baseTableView reloadData];
    [self.rightBarButton setTitle:[NSString stringWithFormat:@"%@>",[UrlAboutCity userDefaultsForCityName]]];
}

/*
#pragma mark - Navigation

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
