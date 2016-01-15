//
//  LocaldData.m
//  WZYPlayer
//
//  Created by wzy on 16/1/15.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "LocaldData.h"
#import "RootListModel.h"
#import "SavePathString.h"

@implementation LocaldData

+ (void)saveListData:(RootListModel *)listModel {

  if ([LocaldData achieveListData]) {
    return;
  }
    
  NSString *filename = [SavePathString savePathLocalName];
  NSData *data = [NSKeyedArchiver archivedDataWithRootObject:listModel];
  NSMutableArray *listArray =
      [[NSMutableArray alloc] initWithObjects:data, nil];
  [listArray writeToFile:filename atomically:YES];
}
+ (RootListModel *)achieveListData {
  NSString *filename = [SavePathString savePathLocalName];
  NSMutableArray *a = [NSMutableArray arrayWithContentsOfFile:filename];
  RootListModel *rootListModel =
      [NSKeyedUnarchiver unarchiveObjectWithData:a[0]];
  return rootListModel;
}
@end
