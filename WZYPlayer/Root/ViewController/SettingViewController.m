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

#import "CLImageEditor.h"

@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,CLImageEditorDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property(assign, nonatomic) CGFloat height;
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"我的";
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    [self.tableview registerNib:[UINib nibWithNibName:@"SeetingCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"SettingCell"];
    
    self.tableview.tableFooterView = [[UIView alloc] init];
    self.tableview.backgroundColor = [UIColor whiteColor];
    UILabel * label = [[UILabel alloc]init];
    label.userInteractionEnabled = YES;
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
    return [self tableViewHeaderView];
}

- (UIView *)tableView:(UITableView *)tableView
viewForFooterInSection:(NSInteger)section {
    return [self tabelViewFooterView];
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section {
    return 235;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForFooterInSection:(NSInteger)section {
    return 60;
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

- (UITableViewHeaderFooterView *)tableViewHeaderView {
    UITableViewHeaderFooterView *headerView =
    [[UITableViewHeaderFooterView alloc] init];
    UIImageView *imageView = [[UIImageView alloc]
                              initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 235)];
    [headerView addSubview:imageView];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(self.view.frame.size.width/2-50, 60, 100, 100);
    loginBtn.layer.cornerRadius = 50.0f;
    loginBtn.layer.masksToBounds = YES;
    
    UserInfo * user = [[UserInfo alloc] init];
    //读取图片
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"userIcon.jpg"];
    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
    NSLog(@"image = %@",savedImage);
    
    if ([user.isLogin isEqualToString:@"NO"]) {
        loginBtn.backgroundColor = [UIColor greenColor];
    }else{
        if (savedImage == nil) {
            [loginBtn setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:user.userIcon]]] forState:UIControlStateNormal];
            
        }else {
            [loginBtn setImage:savedImage forState:UIControlStateNormal];
        }
    }
    [loginBtn setTitle:@"登录" forState:(UIControlStateNormal)];
    [headerView addSubview:loginBtn];
    [loginBtn addTarget:self action:@selector(didLogin) forControlEvents:(UIControlEventTouchUpInside)];
    
    return headerView;
}

- (UITableViewHeaderFooterView *) tabelViewFooterView {
    UITableViewHeaderFooterView *footerView =
    [[UITableViewHeaderFooterView alloc] init];
    UIButton * logoutButton = [UIButton buttonWithType:UIButtonTypeSystem];
    logoutButton.frame = CGRectMake(self.view.frame.size.width/2-125, 10, 250, 40);
    logoutButton.backgroundColor = [UIColor redColor];
    logoutButton.tintColor = [UIColor whiteColor];
    logoutButton.layer.cornerRadius = 5.0f;
    logoutButton.layer.masksToBounds = YES;
    
    [logoutButton setTitle:@"退 出" forState:UIControlStateNormal];
    [logoutButton addTarget:self action:@selector(didClickLogout) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:logoutButton];
    
    return footerView;
}

- (void)didLogin{
    UserInfo *userInfo = [[UserInfo alloc] init];
    if ([userInfo.isLogin isEqualToString:@"NO"]) {
        LoginViewController * LoginVC = [[LoginViewController alloc]init];
        [self presentViewController:LoginVC animated:YES completion:nil];
    }else{
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"打开相册" message:nil preferredStyle:(UIAlertControllerStyleActionSheet)];
        [alertController addAction: [UIAlertAction actionWithTitle: @"选取相片" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            //处理点击拍照
            UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
            imagePickerController.delegate = self;
            imagePickerController.allowsEditing = YES;
            imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:imagePickerController animated:YES completion:^{
                
            }];
        }]];
        [alertController addAction: [UIAlertAction actionWithTitle: @"拍照" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            //处理点击从相册选取
            UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
            imagePickerController.delegate = self;
            imagePickerController.allowsEditing = YES;
            imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:imagePickerController animated:YES completion:^{
                
            }];
        }]];
        [alertController addAction: [UIAlertAction actionWithTitle: @"取消" style: UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
    
}

- (void)didClickLogout {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"是否退出当前账号？" preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        UserInfo *userInfo = [[UserInfo alloc] init];
        userInfo.userName = @"";
        userInfo.userIcon = @"";
        userInfo.isLogin = @"NO";
        [userInfo saveDictionaryUser];
        [self.tableview reloadData];
    }];
    [alert addAction:cancelAction];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *imageIcon = info[UIImagePickerControllerEditedImage];
    CLImageEditor *editor = [[CLImageEditor alloc] initWithImage:imageIcon];
    editor.delegate = self;
    
    [picker presentViewController:editor animated:YES completion:nil];
}

- (void)imageEditor:(CLImageEditor *)editor didFinishEdittingWithImage:(UIImage *)image
{
    //  添加保存图片到沙盒
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:[NSString stringWithFormat:@"userIcon.jpg"]];   // 保存文件的名称
    BOOL result = [UIImagePNGRepresentation(image)writeToFile:filePath atomically:YES];
    NSLog(@"image result = %d",result);
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imageEditorDidCancel:(CLImageEditor *)editor{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"是否清除缓存？" preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            [[SDImageCache sharedImageCache] clearDisk];
            [self.tableview reloadData];
        }];
        [alert addAction:cancelAction];
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
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
