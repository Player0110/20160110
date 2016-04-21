   //
//  CinemaDetailViewController.m
//  WZYPlayer
//
//  Created by Tagcare on 16/3/24.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "CinemaDetailViewController.h"
#import "MovieViewController.h"
#import "CinemaInformationCell.h"
#import "CinemaMovieDetailCell.h"
#import "CinemaTimeCell.h"
#import "LocaldData.h"
#import "CinemaDetailModel.h"
#import "RootModel.h"
#import "TicketUnitModel.h"
#import "TicketModel.h"

@interface CinemaDetailViewController ()
@property(strong, nonatomic) CinemaDetailModel *cinemaDetail;
@property(strong, nonatomic) RootModel * movieModel;
@property(strong, nonatomic) TicketUnitListModel * ticketUnitListModel;
@end

@implementation CinemaDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.title = self.cinemaModel.name;
    [self registerCell];
    [self leftButton];
    [self data];
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
        [self.tableView registerNib:[UINib nibWithNibName:@"CinemaTimeCell"
                                               bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:@"CinemaTimeCell"];
    self.tableView.tableFooterView = [[UIView alloc]init];
    
}

- (void)data {
//    if ([LocaldData achieveCinemaDetailData:self.cinemaModel.name]) {
//        self.cinemaDetail = [LocaldData achieveCinemaDetailData:self.cinemaModel.name];
//        self.movieModel = self.cinemaDetail.movieList[0];
//
//        [self.tableView reloadData];
//            return;
//    }
    [self.cinemaModel detailsblock:^(CinemaDetailModel *cinemaDetailModel, NSError *error) {
        self.cinemaDetail = cinemaDetailModel;
        [LocaldData saveCinemaDetailData:cinemaDetailModel type:self.cinemaModel.name];
        self.movieModel = cinemaDetailModel.movieList[0];
        [self ticketData];
        [self.tableView reloadData];

    }];
    
}

- (void)ticketData {

    [TicketUnitModel URL:@""
                type:@""
            cinemaId:self.cinemaModel.cinemaId
             movieId:self.movieModel.movieId
               block:^(TicketUnitListModel *listModel, NSError *error) {
                   self.ticketUnitListModel = listModel;
                   [self.tableView reloadData];
               }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                return 70;
                break;
            case 1:
                return 120;
                break;
            default:
                return 44;
                break;
        }
    }else {
        return 60;
    }
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        
        return 3;
    } else {
        TicketUnitModel * ticketUnit = self.ticketUnitListModel.ticketUnitList[0];
        return [ticketUnit.ticketList count];
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    } else {
        return 30;

    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return nil;
    }else {
        NSString * sectionTitle=[self tableView:tableView titleForHeaderInSection:section];

        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
        view.backgroundColor = [UIColor colorWithRed:254.0/255 green:249.0/255 blue:224.0/255 alpha:1.0];
        UILabel * label = [[UILabel alloc] initWithFrame:view.bounds];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor colorWithRed:246.0/255 green:83.0/255 blue:59.0/255 alpha:1.0];
        [view addSubview:label];
        label.text = sectionTitle;
        return view;

    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return nil;
    } else {
        return @"今日放映信息";
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
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
                break;
            default:{
                CinemaMovieDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CinemaMovieDetailCell"
                                                                              forIndexPath:indexPath];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                
                [cell cell:cell model:self.movieModel];
                
                return cell;
            }
                break;
        }
    } else {
        CinemaTimeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CinemaTimeCell"
                                                               forIndexPath:indexPath];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        TicketUnitModel * ticketUnit = self.ticketUnitListModel.ticketUnitList[0];
        TicketModel * ticket = ticketUnit.ticketList[indexPath.row];
        
        [cell cell:cell model:ticket];
        return cell;

    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            
        } else if(indexPath.row == 2) {
            MovieViewController *movieVC =
            [[MovieViewController alloc] initWithNibName:@"MovieViewController"
                                                  bundle:nil];
            movieVC.rootModel = self.movieModel;
            [self.navigationController showViewController:movieVC sender:nil];
        }
    }
}

- (void)touchale:(RootModel *)movie tag:(NSInteger)tag {
    self.movieModel = movie;
    [self ticketData];
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
