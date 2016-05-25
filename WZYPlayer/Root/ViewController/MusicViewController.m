//
//  MusicViewController.m
//  WZYPlayer
//
//  Created by Tagcare on 16/3/2.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "MusicViewController.h"

@interface MusicViewController ()

@end

@implementation MusicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"http://piao.163.com/wap/musicshare.html?movieId=%@&songId=%@",self.rootModel.movieId,self.rootModel.musicId]];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [self.musicWebView loadRequest:request];
    self.musicWebView.delegate = self;
    // Do any additional setup after loading the view from its nib.
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
