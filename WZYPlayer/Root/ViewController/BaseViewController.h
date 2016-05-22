//
//  ViewController.h
//  WZYPlayer
//
//  Created by wzy on 15/11/27.
//  Copyright © 2015年 wzy. All rights reserved.
//

#import "UIScrollView+EmptyDataSet.h"
#import <UIKit/UIKit.h>


@interface BaseViewController : UIViewController<DZNEmptyDataSetDelegate,DZNEmptyDataSetSource>

@property(nonatomic, strong)UITableView * baseTableView;

/**
 *  下拉刷新、上拉加载更过
 */
- (void)setupRefresh;

/**
 *  空白页
 */
- (void)setupEmptyView;

/**
 *  返回按钮
 */
- (void)leftButton;

/**
 *  菜单按钮
 */
- (void)menuBarbutton;

@end

