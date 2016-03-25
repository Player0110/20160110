//
//  CinemaDetailViewController.m
//  WZYPlayer
//
//  Created by Tagcare on 16/3/24.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "CinemaDetailViewController.h"
#import "CinemaInformationCell.h"
#import "CinemamovieListCell.h"
#import "CinemaMovieDetailCell.h"
#import "CinemaDateCell.h"
#import "CinemaPromptCell.h"
#import "CinemaTimeCell.h"
#import "MovieCell.h"
#import "LocaldData.h"

@interface CinemaDetailViewController ()

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
    if ([LocaldData achieveCinemaDetailData:self.cinemaModel]) {
        self.cinemaModel = [LocaldData achieveCinemaDetailData:self.cinemaModel];
        [self.tableView reloadData];
//        if (self.cinemaModel.grade != nil) {
            return;
//        }
    }
    
    [self.cinemaModel detailsblock:^(CinemaModel *cinemaModel, NSError *error) {
        self.cinemaModel = cinemaModel;
        [LocaldData saveCinemaDetailData:cinemaModel];
        [self.tableView reloadData];
        
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
            [cell cell:cell model:self.cinemaModel];
            return cell;
        }
            break;
        case 1:{
            CinemamovieListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CinemamovieListCell"
                                                                          forIndexPath:indexPath];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
            return cell;
        }
        case 2:{
            CinemaMovieDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CinemaMovieDetailCell"
                                                                        forIndexPath:indexPath];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            [cell cell:cell model:self.cinemaModel];

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
