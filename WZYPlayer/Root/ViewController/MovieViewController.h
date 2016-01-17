//
//  MovieViewController.h
//  WZYPlayer
//
//  Created by wzy on 16/1/11.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "RootModel.h"
#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface MovieViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong, nonatomic) RootModel *rootModel;

@end
