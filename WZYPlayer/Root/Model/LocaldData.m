//
//  LocaldData.m
//  WZYPlayer
//
//  Created by wzy on 16/1/15.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "LocaldData.h"
#import "RootListModel.h"
#import "RootModel.h"
#import "SavePathString.h"
#import "CinemaListModel.h"
#import "CinemaModel.h"
#import "CinemaDetailModel.h"

@implementation LocaldData
//保存电影列表
+ (void)saveListData:(RootListModel *)listModel type:(NSString *)name {
    
  NSString *filePath = [SavePathString savePathLocalNameType:name];//获取文件路径
  NSData *data = [NSKeyedArchiver archivedDataWithRootObject:listModel];//原数据转化为NSData类型
  NSMutableArray *listArray =
      [[NSMutableArray alloc] initWithObjects:data, nil];//把data放在数组
  [listArray writeToFile:filePath atomically:YES];//把数组写入文件
}

//获取电影列表
+ (RootListModel *)achieveListDataType:(NSString *)name {
  NSString *filePath = [SavePathString savePathLocalNameType:name];//获取文件路径
  NSMutableArray *a = [NSMutableArray arrayWithContentsOfFile:filePath];//把文件取出放入数字
  RootListModel *rootListModel =
      [NSKeyedUnarchiver unarchiveObjectWithData:a[0]];//把数组中的data转化为RootListModel类型的数据
  return rootListModel;
}

//保存电影详情
+ (void)saveDetailData:(RootModel *)model {
  NSString *name = [NSString stringWithFormat:@"%@.plist", model.name];
  NSString *filePath = [SavePathString savePathName:name];
  NSData *data = [NSKeyedArchiver archivedDataWithRootObject:model];
  NSMutableArray *detailArray =
      [[NSMutableArray alloc] initWithObjects:data, nil];
  [detailArray writeToFile:filePath atomically:YES];
}

//获取电影详情
+ (RootModel *)achieveDetailData:(RootModel *)model {
  NSString *name = [NSString stringWithFormat:@"%@.plist", model.name];
  NSString *filePath = [SavePathString savePathName:name];
  NSMutableArray *a = [NSMutableArray arrayWithContentsOfFile:filePath];
  RootModel *rmodel = [NSKeyedUnarchiver unarchiveObjectWithData:a[0]];
  return rmodel;
}

//保存影院列表
+ (void)saveCinemaListData:(CinemaListModel *)cinemalistModel type:(NSString *)name {
    NSString *filePath = [SavePathString savePathLocalNameType:name];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:cinemalistModel];
    NSMutableArray *listArray =
    [[NSMutableArray alloc] initWithObjects:data, nil];
    [listArray writeToFile:filePath atomically:YES];

}

//获取影院列表
+ (CinemaListModel *)achieveCinemaListDataType:(NSString *)name {
    NSString *filePath = [SavePathString savePathLocalNameType:name];
    NSMutableArray *a = [NSMutableArray arrayWithContentsOfFile:filePath];
    CinemaListModel *cinemaListModel =
    [NSKeyedUnarchiver unarchiveObjectWithData:a[0]];
    return cinemaListModel;
}

//保存影院详情
+ (void)saveCinemaDetailData:(CinemaDetailModel *)model type:(NSString *)name{
    NSString *nameStr = [NSString stringWithFormat:@"%@.plist", name];
    NSString *filePath = [SavePathString savePathName:nameStr];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:model];
    NSMutableArray *detailArray =
    [[NSMutableArray alloc] initWithObjects:data, nil];
    [detailArray writeToFile:filePath atomically:YES];
}

//获取影院详情
+ (CinemaDetailModel *)achieveCinemaDetailData:(NSString *)name {
    NSString *nameStr = [NSString stringWithFormat:@"%@.plist", name];
    NSString *filePath = [SavePathString savePathName:nameStr];
    NSMutableArray *a = [NSMutableArray arrayWithContentsOfFile:filePath];
    CinemaDetailModel *cinemaDetailModel = [NSKeyedUnarchiver unarchiveObjectWithData:a[0]];
    return cinemaDetailModel;
}
@end
