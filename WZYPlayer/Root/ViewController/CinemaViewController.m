//
//  CinemaViewController.m
//  WZYPlayer
//
//  Created by Tagcare on 16/3/1.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "CinemaViewController.h"
#import "CinemaCell.h"
#import "DataService.h"
#import "CinemaListModel.h"
#import "CinemaModel.h"
#import "LocaldData.h"

@interface CinemaViewController ()

@property(strong, nonatomic) NSMutableArray *dataArray;

@end

@implementation CinemaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"影院", nil);
    self.dataArray = [NSMutableArray arrayWithCapacity:5];
    [self setupSubviews];
    [self data];
    [self setupRefresh];
    [self setupEmptyView];
    // Do any additional setup after loading the view from its nib.
}

- (void)data {
    if ([LocaldData achieveCinemaListDataType:@"cinemaList.plist"]) {
        self.dataArray = [LocaldData achieveCinemaListDataType:@"cinemaList.plist"].cinemaList;
        [self.baseTableView reloadData];
        
    } else {
        [CinemaModel URL:@""
                  type:@""
                 block:^(CinemaListModel *cinemaListModel, NSError *error) {
                     if (!error) {
                         self.dataArray = cinemaListModel.cinemaList;
                         [LocaldData saveCinemaListData:cinemaListModel type:@"cinemaList.plist"];
                         [self.baseTableView reloadData];
                     }
                 }];
    }
}

- (void)setupSubviews {
    self.baseTableView =
    [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.baseTableView];
    self.baseTableView.dataSource = self;
    self.baseTableView.delegate = self;
    [self.baseTableView registerNib:[UINib nibWithNibName:@"CinemaCell"
                                                   bundle:[NSBundle mainBundle]]
             forCellReuseIdentifier:@"CinemaCell"];
}

#pragma mark - TabelView Delegate and DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CinemaCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CinemaCell"];
    CinemaModel *cinemaModel = self.dataArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell cell:cell model:cinemaModel];
    return cell;
}
//- (void)tableView:(UITableView *)tableView
//didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    MovieViewController *movieVC =
//    [[MovieViewController alloc] initWithNibName:@"MovieViewController"
//                                          bundle:nil];
//    movieVC.rootModel = self.dataArray[indexPath.row];
//    [self.navigationController showViewController:movieVC sender:nil];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
