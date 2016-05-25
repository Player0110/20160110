//
//  UrlAboutCity.h
//  WZYPlayer
//
//  Created by Tagcare on 16/5/19.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UrlAboutCity : NSObject

//返回城市名称
+ (NSString *)userDefaultsForCityName;

//返回城市代码
+ (NSString *)userDefaultsForCityNumber;

@end
