//
//  LocaldData.h
//  WZYPlayer
//
//  Created by wzy on 16/1/15.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RootListModel;

@interface LocaldData : NSObject
+ (void)saveListData:(RootListModel *)listModel;
+ (RootListModel *)achieveListData;

@end
