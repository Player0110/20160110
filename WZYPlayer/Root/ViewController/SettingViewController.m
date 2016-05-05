//
//  SettingViewController.m
//  WZYPlayer
//
//  Created by Tagcare on 16/5/4.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "SettingViewController.h"
#import "LoginViewController.h"
#import "DataService.h"
#import "SeetingCell.h"
#import "SDImageCache.h"

@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property(assign, nonatomic) CGFloat height;
@end

@implementation SettingViewController

- (void)viewWillAppear:(BOOL)animated{
    [self data];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    [self.tableview registerNib:[UINib nibWithNibName:@"SeetingCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"SettingCell"];
    
    self.tableview.tableFooterView = [[UIView alloc] init];
    self.tableview.backgroundColor = [UIColor whiteColor];
    [self data];
}

- (void)data {
    [self.tableview reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section {
    return [self tableViewHeaderFooterView];
}
- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section {
    return 235;
}


- (UITableViewHeaderFooterView *)tableViewHeaderFooterView {
    UITableViewHeaderFooterView *headerView =
    [[UITableViewHeaderFooterView alloc] init];
    UIImageView *imageView = [[UIImageView alloc]
                              initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 235)];
    [headerView addSubview:imageView];
    
    UIButton *loginBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    
    loginBtn.frame = CGRectMake(self.view.frame.size.width/2-50, 60, 100, 100);
    loginBtn.layer.cornerRadius = 50.0f;
    //loginBtn.backgroundColor = [UIColor greenColor];
    if ([DataService sharedClient].nicheng == nil) {
        loginBtn.backgroundColor = [UIColor greenColor];
    }else{
        [loginBtn setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[DataService sharedClient].nicheng]]] forState:(UIControlStateNormal)];
    }
    [loginBtn setTitle:@"登录" forState:(UIControlStateNormal)];
//    loginBtn.layer.borderColor = [[UIColor colorWithRed:74.0/255.0 green:102.0/255.0 blue:173.0/255.0 alpha:1] CGColor];
//    loginBtn.layer.borderWidth = 0.5;
    loginBtn.layer.cornerRadius = 50.0f;
//    loginBtn.layer.masksToBounds = YES;
    [headerView addSubview:loginBtn];
    [loginBtn addTarget:self action:@selector(didLogin) forControlEvents:(UIControlEventTouchUpInside)];
    
    return headerView;
}

- (void)didLogin{
//    UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:@"sb点什么点，又不能登录" preferredStyle:(UIAlertControllerStyleAlert)];
//    [self presentViewController:alert animated:YES completion:nil];
    LoginViewController * LoginVC = [[LoginViewController alloc]init];
    [self presentViewController:LoginVC animated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    
    return 2;
    
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        SeetingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingCell"];

        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cell cell:cell string:[NSString stringWithFormat:@"%@",[DataService sharedClient].nicheng]];

        
        return cell;
    } else if (indexPath.row == 1) {
        
        SeetingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingCell"];
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cell cell:cell string:@""];
        return cell;
        
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        [[SDImageCache sharedImageCache] clearDisk];
        [self.tableview reloadData];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
