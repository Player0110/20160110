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
+ (void)saveListData:(RootListModel *)listModel type:(NSString *)name;
+ (RootListModel *)achieveListDataType:(NSString *)name;
+ (void)saveDetailData:(RootModel *)model;
+ (RootModel *)achieveDetailData:(RootModel *)model;
+ (void)saveCinemaListData:(CinemaListModel *)cinemalistModel type:(NSString *)name;
+ (CinemaListModel *)achieveCinemaListDataType:(NSString *)name;
+ (void)saveCinemaDetailData:(CinemaDetailModel *)model type:(NSString *)name;
+ (CinemaDetailModel *)achieveCinemaDetailData:(NSString *)name;

@end
