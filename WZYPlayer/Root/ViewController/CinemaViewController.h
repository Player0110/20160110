//
//  CinemaViewController.h
//  WZYPlayer
//
//  Created by Tagcare on 16/3/1.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "CinemaModel.h"

@interface CinemaViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong, nonatomic) CinemaModel *rootModel;

@end
