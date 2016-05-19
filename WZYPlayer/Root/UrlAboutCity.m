//
//  UrlAboutCity.m
//  WZYPlayer
//
//  Created by Tagcare on 16/5/19.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "UrlAboutCity.h"

@implementation UrlAboutCity

+ (NSString *)userDefaultsForCityName {
    NSDictionary * currentCityDic = [[NSUserDefaults standardUserDefaults] objectForKey:@"city"];
    if (currentCityDic == nil) {
        currentCityDic = [NSDictionary dictionaryWithObject:@"郑州" forKey:@"410100"];
    }
    NSArray * array = [currentCityDic allValues];
    return array[0];
}

+ (NSString *)userDefaultsForCityNumber {
    NSDictionary * currentCityDic = [[NSUserDefaults standardUserDefaults] objectForKey:@"city"];
    if (currentCityDic == nil) {
        currentCityDic = [NSDictionary dictionaryWithObject:@"郑州" forKey:@"310000"];
    }
    NSArray * array = [currentCityDic allKeys];
    return array[0];
}

@end
