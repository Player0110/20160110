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

@interface RootViewController ()

@property(strong, nonatomic) NSMutableArray *dataArray;

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
}
- (void)viewDidAppear:(BOOL)animated {
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
