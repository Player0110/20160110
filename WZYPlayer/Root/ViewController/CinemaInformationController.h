//
//  CinemaInformationController.h
//  WZYPlayer
//
//  Created by QiQi on 16/4/23.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "CinemaModel.h"

@interface CinemaInformationController : BaseViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) CinemaModel * cinemaModel;

@end
