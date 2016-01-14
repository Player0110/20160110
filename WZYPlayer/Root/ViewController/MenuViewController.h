//
//  MenuViewController.h
//  WZYPlayer
//
//  Created by wzy on 16/1/14.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESideMenu.h"
@interface MenuViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,RESideMenuDelegate>
@property (strong, nonatomic) UITableView *tableView;

@end
