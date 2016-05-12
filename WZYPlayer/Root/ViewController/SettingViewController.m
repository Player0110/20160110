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
#import "UserInfo.h"

@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property(assign, nonatomic) CGFloat height;
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    [self.tableview registerNib:[UINib nibWithNibName:@"SeetingCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"SettingCell"];
    
    self.tableview.tableFooterView = [[UIView alloc] init];
    self.tableview.backgroundColor = [UIColor whiteColor];

}

- (void)viewWillAppear:(BOOL)animated{
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
    loginBtn.layer.masksToBounds = YES;

    UserInfo * user = [[UserInfo alloc] init];
    
    if (user == nil) {
        loginBtn.backgroundColor = [UIColor greenColor];
    }else{
        [loginBtn setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:user.userIcon]]] forState:(UIControlStateNormal)];
    }
    [loginBtn setTitle:@"登录" forState:(UIControlStateNormal)];
    [headerView addSubview:loginBtn];
    [loginBtn addTarget:self action:@selector(didLogin) forControlEvents:(UIControlEventTouchUpInside)];
    
    return headerView;
}

- (void)didLogin{
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

        UserInfo * user = [[UserInfo alloc] init];
        [cell cell:cell string:[NSString stringWithFormat:@"%@",user.userName]];
        
        return cell;
    } else if (indexPath.row == 1) {
        
        SeetingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingCell"];
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.titleLabel.text = @"清除缓存";
        cell.detailLabel.text = [NSString stringWithFormat:@"当前缓存:%.2fMB",[self calculateCache]];
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

- (double)calculateCache{
    
    NSString * cachePath  = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];//读取缓存文件大小
    NSString *filePath  = [cachePath stringByAppendingPathComponent:@"default/"];
    NSDirectoryEnumerator *dirEnumerater = [[NSFileManager defaultManager] enumeratorAtPath:filePath];
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    double totalLength = 0.0;
    
    NSString *fileName;
    while (fileName = [dirEnumerater nextObject]) {
        if ([fileName isEqualToString:@"profile.plist"]) {
            continue;
        }
        
        NSString *file=[[NSString alloc] initWithString:[filePath stringByAppendingPathComponent:fileName]];
        if ([fileManager fileExistsAtPath:file]) {
            NSDictionary * attributes = [fileManager attributesOfItemAtPath:file error:nil];
            // file size
            NSNumber *size   = [attributes objectForKey:NSFileSize];
            if ([attributes objectForKey:NSFileSize]){
                totalLength += [size intValue];
            }
        }
        
    }
    
    totalLength = totalLength/1024/1024;
    
    return totalLength;
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
