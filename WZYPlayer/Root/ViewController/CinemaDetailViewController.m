//
//  CinemaDetailViewController.m
//  WZYPlayer
//
//  Created by Tagcare on 16/3/24.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "CinemaDetailViewController.h"
#import "CinemaInformationCell.h"
#import "CinemaMovieDetailCell.h"
#import "CinemaDateCell.h"
#import "CinemaPromptCell.h"
#import "CinemaTimeCell.h"
#import "MovieCell.h"
#import "LocaldData.h"
#import "CinemaDetailModel.h"
#import "RootModel.h"

@interface CinemaDetailViewController ()
@property(strong, nonatomic) CinemaDetailModel *cinemaDetail;
@property(strong, nonatomic) RootModel * movieModel;

@end

@implementation CinemaDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.title = self.cinemaModel.name;
    [self registerCell];
    [self data];
    self.movieModel = self.cinemaDetail.movieList[0];

}

- (void)registerCell {
    [self.tableView registerNib:[UINib nibWithNibName:@"CinemaInformationCell"
                                               bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:@"CinemaInformationCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CinemamovieListCell"
                                               bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:@"CinemamovieListCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CinemaMovieDetailCell"
                                               bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:@"CinemaMovieDetailCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CinemaDateCell"
                                               bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:@"CinemaDateCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CinemaPromptCell"
                                               bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:@"CinemaPromptCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CinemaTimeCell"
                                               bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:@"CinemaTimeCell"];
    
}

- (void)data {
    if ([LocaldData achieveCinemaDetailData:self.cinemaModel.name]) {
        self.cinemaDetail = [LocaldData achieveCinemaDetailData:self.cinemaModel.name];
        [self.tableView reloadData];
            return;
    }
    [self.cinemaModel detailsblock:^(CinemaDetailModel *cinemaDetailModel, NSError *error) {
        self.cinemaDetail = cinemaDetailModel;
        [LocaldData saveCinemaDetailData:cinemaDetailModel type:self.cinemaModel.name];
    }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:
            return 60;
            break;
        case 1:
            return 100;
        case 2:
            return 44;
        case 3:
            return 30;
        case 4:
            return 30;
        default:
            return 50;
            break;
    }
    
    
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    
    return 5+5;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:{
            CinemaInformationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CinemaInformationCell"
                                                             forIndexPath:indexPath];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            [cell cell:cell model:self.cinemaModel];
            return cell;
        }
            break;
        case 1:{
            CinemamovieListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CinemamovieListCell"
                                                                          forIndexPath:indexPath];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            cell.movieListModel = self.cinemaDetail.movieList;
            [cell cell:cell model:self.movieModel];
            cell.delegate = self;
            return cell;
        }
        case 2:{
            CinemaMovieDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CinemaMovieDetailCell"
                                                                        forIndexPath:indexPath];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

            [cell cell:cell model:self.movieModel];

            return cell;
        }
        case 3:
        {
            CinemaDateCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CinemaDateCell"
                                                                          forIndexPath:indexPath];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
            return cell;
        }
        case 4:
        {
            CinemaPromptCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CinemaPromptCell"
                                                                          forIndexPath:indexPath];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
            return cell;
        }
        default:
        {
            CinemaTimeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CinemaTimeCell"
                                                                          forIndexPath:indexPath];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
            return cell;
        }
            break;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)touchale:(RootModel *)movie tag:(NSInteger)tag {
    self.movieModel = movie;
    [self.tableView reloadData];
}

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
