//
//  RootMenuViewController.m
//  WZYPlayer
//
//  Created by wzy on 16/1/14.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "RootMenuViewController.h"

@interface RootMenuViewController ()

@end

@implementation RootMenuViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
}
- (void)awakeFromNib {
  self.menuPreferredStatusBarStyle = UIStatusBarStyleLightContent;
  self.contentViewShadowColor = [UIColor blackColor];
  self.contentViewShadowOffset = CGSizeMake(0, 0);
  self.contentViewShadowOpacity = 0.6;
  self.contentViewShadowRadius = 12;
  self.contentViewShadowEnabled = YES;

  self.contentViewController = [self.storyboard
      instantiateViewControllerWithIdentifier:@"contentViewController"];
  self.leftMenuViewController = [self.storyboard
      instantiateViewControllerWithIdentifier:@"MenuViewController"];
//  self.rightMenuViewController = [self.storyboard
//      instantiateViewControllerWithIdentifier:@"leftMenuViewController"];
  self.backgroundImage = [UIImage imageNamed:@"Stars"];
  self.delegate = self;
}
- (void)sideMenu:(RESideMenu *)sideMenu
    willShowMenuViewController:(UIViewController *)menuViewController {
  NSLog(@"willShowMenuViewController: %@",
        NSStringFromClass([menuViewController class]));
}

- (void)sideMenu:(RESideMenu *)sideMenu
    didShowMenuViewController:(UIViewController *)menuViewController {
  NSLog(@"didShowMenuViewController: %@",
        NSStringFromClass([menuViewController class]));
}

- (void)sideMenu:(RESideMenu *)sideMenu
    willHideMenuViewController:(UIViewController *)menuViewController {
  NSLog(@"willHideMenuViewController: %@",
        NSStringFromClass([menuViewController class]));
}

- (void)sideMenu:(RESideMenu *)sideMenu
    didHideMenuViewController:(UIViewController *)menuViewController {
  NSLog(@"didHideMenuViewController: %@",
        NSStringFromClass([menuViewController class]));
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
