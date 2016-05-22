//
//  CollectViewController.m
//  WZYPlayer
//
//  Created by wzy on 16/1/14.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "CollectViewController.h"
#import "MovieViewController.h"
#import "RootCell.h"
#import "RootModel.h"
#import "SWTableViewCell.h"
@interface CollectViewController ()
@property(strong, nonatomic) NSMutableArray *array;

@end

@implementation CollectViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  self.title = NSLocalizedString(@"我的收藏", nil);
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_backgroungImage"] forBarMetrics:UIBarMetricsDefault];
    NSDictionary * dict = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    
    [self.navigationItem.leftBarButtonItem setImage:[[UIImage imageNamed:@"nav_menu"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
  self.tableView.dataSource = self;
  self.tableView.delegate = self;
  [self.tableView registerNib:[UINib nibWithNibName:@"RootCell"
                                             bundle:[NSBundle mainBundle]]
       forCellReuseIdentifier:@"RootCell"];
  self.tableView.tableFooterView = [[UIView alloc] init];
  [self data];

}
- (void)data {
  self.array = [RootModel fetchCollectModel];
  [self.tableView reloadData];
}
#pragma mark - TabelView Delegate and DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
  return self.array.count;
}
- (CGFloat)tableView:(UITableView *)tableView
    heightForRowAtIndexPath:(NSIndexPath *)indexPath {

  return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  RootCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RootCell"];
  RootModel *rootModel = self.array[indexPath.row];
  cell.selectionStyle = UITableViewCellSelectionStyleNone;
  cell.delegate = self;

  cell.rightUtilityButtons = [self rightButtons];

  [cell cell:cell model:rootModel];
  return cell;
}
- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

  MovieViewController *movieVC =
      [[MovieViewController alloc] initWithNibName:@"MovieViewController"
                                            bundle:nil];
  movieVC.rootModel = self.array[indexPath.row];
  [self.navigationController showViewController:movieVC sender:nil];
}
- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}
- (NSArray *)rightButtons {
  NSMutableArray *rightUtilityButtons = [NSMutableArray new];
  [rightUtilityButtons sw_addUtilityButtonWithColor:[UIColor grayColor]
                                              title:@"取消收藏"];
  return rightUtilityButtons;
}
- (void)swipeableTableViewCell:(SWTableViewCell *)cell
    didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
  NSIndexPath *cellIndexPath = [self.tableView indexPathForCell:cell];

  RootModel *model = self.array[cellIndexPath.row];

  [model deleteCollectModel];
  [self.array removeObjectAtIndex:(NSUInteger)index];
  [self.tableView deleteRowsAtIndexPaths:@[ cellIndexPath ]
                        withRowAnimation:UITableViewRowAnimationLeft];
}
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
