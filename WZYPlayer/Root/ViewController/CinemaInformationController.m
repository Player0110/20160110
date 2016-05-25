//
//  CinemaInformationController.m
//  WZYPlayer
//
//  Created by QiQi on 16/4/23.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "CinemaInformationController.h"
#import "CinemaInformationCell.h"
#import "TrafficCell.h"
#import "CouponCell.h"
#import "UITableView+FDTemplateLayoutCell.h"


@interface CinemaInformationController ()
@property (strong, nonatomic) IBOutlet UITableView *tabelView;

@end

@implementation CinemaInformationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubview];
}

- (void)setupSubview {
    self.title = @"影院详情";
    [self leftButton];

    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    
    [self.tabelView registerNib:[UINib nibWithNibName:@"CinemaInformationCell"
                                               bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:@"CinemaInformationCell"];
    [self.tabelView registerNib:[UINib nibWithNibName:@"TrafficCell"
                                               bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:@"TrafficCell"];
    [self.tabelView registerNib:[UINib nibWithNibName:@"CouponCell"
                                               bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:@"CouponCell"];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else if (section == 1) {
        return 2;
    }else {
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 70;
    }else if(indexPath.section == 1){
    return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([TrafficCell class])
                                    cacheByIndexPath:indexPath
                                       configuration:^(TrafficCell *cell) {
                                           [cell cell:cell model:self.cinemaModel row:(int)indexPath.row];
                                          
                                       }];
    }else{
    
        return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([CouponCell class])
                                        cacheByIndexPath:indexPath
                                           configuration:^(CouponCell *cell) {
                                               [cell cell:cell model:self.cinemaModel];
                                               
                                           }];
    
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }else {
        return 30;
    }
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return @"";
            break;
        case 1:
            return @"交通信息";
            break;
        default:
            return @"优惠信息";
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        CinemaInformationCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CinemaInformationCell" forIndexPath:indexPath];
        [cell cell:cell model:self.cinemaModel];
        return cell;
    }
    else if (indexPath.section == 1) {
        TrafficCell * cell = [tableView dequeueReusableCellWithIdentifier:@"TrafficCell" forIndexPath:indexPath];
        [cell cell:cell model:self.cinemaModel row:(int)indexPath.row];
        return cell;
        
    }
    else {
        CouponCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CouponCell" forIndexPath:indexPath];
        [cell cell:cell model:self.cinemaModel];
        return cell;
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
