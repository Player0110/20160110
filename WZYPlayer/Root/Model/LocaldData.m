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

@implementation LocaldData

+ (void)saveListData:(RootListModel *)listModel type:(NSString *)name {

  NSString *filename = [SavePathString savePathLocalNameType:name];
  NSData *data = [NSKeyedArchiver archivedDataWithRootObject:listModel];
  NSMutableArray *listArray =
      [[NSMutableArray alloc] initWithObjects:data, nil];
  [listArray writeToFile:filename atomically:YES];
}

+ (RootListModel *)achieveListDataType:(NSString *)name {
  NSString *filename = [SavePathString savePathLocalNameType:name];
  NSMutableArray *a = [NSMutableArray arrayWithContentsOfFile:filename];
  RootListModel *rootListModel =
      [NSKeyedUnarchiver unarchiveObjectWithData:a[0]];
  return rootListModel;
}
/////////
////////

+ (void)saveDetailData:(RootModel *)model {
  NSString *name = [NSString stringWithFormat:@"%@.plist", model.name];
  NSString *filename = [SavePathString savePathName:name];
  NSData *data = [NSKeyedArchiver archivedDataWithRootObject:model];
  NSMutableArray *detailArray =
      [[NSMutableArray alloc] initWithObjects:data, nil];
  [detailArray writeToFile:filename atomically:YES];
}

+ (RootModel *)achieveDetailData:(RootModel *)model {
  NSString *name = [NSString stringWithFormat:@"%@.plist", model.name];
  NSString *filename = [SavePathString savePathName:name];
  NSMutableArray *a = [NSMutableArray arrayWithContentsOfFile:filename];
  RootModel *rmodel = [NSKeyedUnarchiver unarchiveObjectWithData:a[0]];
  return rmodel;
}

+ (void)saveCinemaListData:(CinemaListModel *)cinemalistModel type:(NSString *)name {
    NSString *filename = [SavePathString savePathLocalNameType:name];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:cinemalistModel];
    NSMutableArray *listArray =
    [[NSMutableArray alloc] initWithObjects:data, nil];
    [listArray writeToFile:filename atomically:YES];

}

+ (CinemaListModel *)achieveCinemaListDataType:(NSString *)name {
    NSString *filename = [SavePathString savePathLocalNameType:name];
    NSMutableArray *a = [NSMutableArray arrayWithContentsOfFile:filename];
    CinemaListModel *cinemaListModel =
    [NSKeyedUnarchiver unarchiveObjectWithData:a[0]];
    return cinemaListModel;
}

+ (void)saveCinemaDetailData:(CinemaModel *)model {
    NSString *name = [NSString stringWithFormat:@"%@.plist", model.name];
    NSString *filename = [SavePathString savePathName:name];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:model];
    NSMutableArray *detailArray =
    [[NSMutableArray alloc] initWithObjects:data, nil];
    [detailArray writeToFile:filename atomically:YES];
}

+ (CinemaModel *)achieveCinemaDetailData:(CinemaModel *)model {
    NSString *name = [NSString stringWithFormat:@"%@.plist", model.name];
    NSString *filename = [SavePathString savePathName:name];
    NSMutableArray *a = [NSMutableArray arrayWithContentsOfFile:filename];
    CinemaModel *cinemaModel = [NSKeyedUnarchiver unarchiveObjectWithData:a[0]];
    return cinemaModel;
}
@end
