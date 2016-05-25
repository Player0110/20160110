//
//  LocaldData.h
//  WZYPlayer
//
//  Created by wzy on 16/1/15.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RootListModel;
@class RootModel;
@class CinemaListModel;
@class CinemaModel;
@class CinemaDetailModel;

@interface LocaldData : NSObject
//保存电影列表
+ (void)saveListData:(RootListModel *)listModel type:(NSString *)name;
//获取电影列表
+ (RootListModel *)achieveListDataType:(NSString *)name;
//保存电影详情
+ (void)saveDetailData:(RootModel *)model;
//获取电影详情
+ (RootModel *)achieveDetailData:(RootModel *)model;
//保存影院列表
+ (void)saveCinemaListData:(CinemaListModel *)cinemalistModel type:(NSString *)name;
//获取影院列表
+ (CinemaListModel *)achieveCinemaListDataType:(NSString *)name;
//保存影院详情
+ (void)saveCinemaDetailData:(CinemaDetailModel *)model type:(NSString *)name;
//获取影院详情
+ (CinemaDetailModel *)achieveCinemaDetailData:(NSString *)name;

@end
