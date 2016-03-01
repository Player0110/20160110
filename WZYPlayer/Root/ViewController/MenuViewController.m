//
//  MenuViewController.m
//  WZYPlayer
//
//  Created by wzy on 16/1/14.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "CollectViewController.h"
#import "MenuViewController.h"
#import "PrevueViewController.h"
#import "CinemaViewController.h"

@interface MenuViewController ()
@property(strong, nonatomic) CollectViewController *collectVC;

@end

@implementation MenuViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  self.tableView = ({
    UITableView *tableView = [[UITableView alloc]
        initWithFrame:CGRectMake(0,
                                 (self.view.frame.size.height - 54 * 5) / 2.0f,
                                 self.view.frame.size.width, 54 * 5)
                style:UITableViewStylePlain];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin |
                                 UIViewAutoresizingFlexibleBottomMargin |
                                 UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.opaque = NO;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.backgroundView = nil;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.bounces = NO;
    tableView.scrollsToTop = NO;
    tableView;
  });
  [self.view addSubview:self.tableView];
}
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
  switch (indexPath.row) {
  case 0:
    [self.sideMenuViewController
        setContentViewController:
            [[UINavigationController alloc]
                initWithRootViewController:
                    [self.storyboard instantiateViewControllerWithIdentifier:
                                         @"RootViewController"]]
                        animated:YES];
    [self.sideMenuViewController hideMenuViewController];
    break;
  case 1:
    [self.sideMenuViewController
        setContentViewController:
            [[UINavigationController alloc]
                initWithRootViewController:
                    [self.storyboard instantiateViewControllerWithIdentifier:
                                         @"PrevueViewController"]]
                        animated:YES];
    [self.sideMenuViewController hideMenuViewController];
    break;
  case 2:
      [self.sideMenuViewController
       setContentViewController:
       [[UINavigationController alloc]
        initWithRootViewController:
        [self.storyboard instantiateViewControllerWithIdentifier:
         @"CinemaViewController"]]
       animated:YES];
      [self.sideMenuViewController hideMenuViewController];
      break;

  case 3:
    [self.sideMenuViewController
        setContentViewController:
            [[UINavigationController alloc]
                initWithRootViewController:
                    [self.storyboard instantiateViewControllerWithIdentifier:
                                         @"CollectViewController"]]
                        animated:YES];
    [self.sideMenuViewController hideMenuViewController];

    break;
  default:
    break;
  }
}

#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView
    heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 54;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)sectionIndex {
  return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *cellIdentifier = @"Cell";

  UITableViewCell *cell =
      [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  cell.backgroundColor = [UIColor redColor];

  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:cellIdentifier];
    cell.backgroundColor = [UIColor blackColor];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.highlightedTextColor = [UIColor lightGrayColor];
    cell.selectedBackgroundView = [[UIView alloc] init];
  }

  NSArray *titles =
      @[ @"正在热映",
         @"即将上映",
         @"影院",
         @"我的收藏",
         @"Settings",
         @"Log Out" ];
  NSArray *images = @[
    @"IconHome",
    @"IconHome",
    @"IconCalendar",
    @"IconProfile",
    @"IconSettings",
    @"IconEmpty"
  ];
  cell.textLabel.text = titles[indexPath.row];
  cell.imageView.image = [UIImage imageNamed:images[indexPath.row]];

  return cell;
}
- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
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
