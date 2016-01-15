//
//  CollectViewController.h
//  WZYPlayer
//
//  Created by wzy on 16/1/14.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWTableViewCell.h"
@interface CollectViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,SWTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
