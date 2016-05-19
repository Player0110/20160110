//
//  CityViewController.m
//  WZYPlayer
//
//  Created by Tagcare on 16/5/17.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "CityViewController.h"
#import "UrlAboutCity.h"

@interface CityViewController ()

@property (nonatomic, strong) NSArray * cityNameArray;
@property (nonatomic, strong) NSArray * cityNumberArray;
@property (nonatomic, strong) NSString * currentCity;

@end

@implementation CityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cityCell"];
    self.cityNameArray = @[@"北京", @"上海",@"郑州", @"广州", @"天津", @"重庆", @"杭州", @"成都", @"沈阳", @"南京", @"哈尔滨", @"武汉", @"长沙", @"福州", @"贵阳", @"长春", @"合肥", @"呼和浩特", @"海口", @"济南"];
    self.cityNumberArray = @[@"110000", @"310000", @"410100", @"440100", @"120000", @"500000", @"330100", @"510100", @"210100", @"320100", @"230100", @"420100", @"430100", @"350100", @"520100", @"220100", @"340100", @"150100", @"460100", @"370100"];
    
    
    NSString * cityName = [UrlAboutCity userDefaultsForCityName];
    self.currentCity = cityName;
    self.title = [NSString stringWithFormat:@"当前城市－%@",self.currentCity];
}

- (IBAction)leftBarButtonAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"当前城市";
    } else {
        return @"热门城市";
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else {
        return self.cityNameArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cityCell" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        cell.textLabel.text = self.currentCity;
    } else{
        cell.textLabel.text = self.cityNameArray[indexPath.row];
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 1) {
        NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
        NSString * cityNumber = self.cityNumberArray[indexPath.row];
        NSString * cityName = self.cityNameArray[indexPath.row];
        NSDictionary * oneCityDic = [NSDictionary dictionaryWithObject:cityName forKey:cityNumber];
        [userDefaults setObject:oneCityDic forKey:@"city"];
        [self.tableView reloadData];
        [self dismissViewControllerAnimated:YES completion:nil];

    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
