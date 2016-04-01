//
//  CinemaDetailViewController.h
//  WZYPlayer
//
//  Created by Tagcare on 16/3/24.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "CinemaModel.h"
#import "CinemamovieListCell.h"

@interface CinemaDetailViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,CinemamovieListCellimageDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(strong, nonatomic)CinemaModel * cinemaModel;

@end
