//
//  SavePathString.m
//  WZYPlayer
//
//  Created by wzy on 16/1/15.
//  Copyright © 2016年 wzy. All rights reserved.
//  

#import "SavePathString.h"

@implementation SavePathString

//返回的路径不带时间
+ (NSString *)savePathName:(NSString *)name {
    //获取沙盒路径
  NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                       NSUserDomainMask, YES);
  NSString *pathStr = [pathArray objectAtIndex:0];
    //拼接路径和名字得到文件路径
  NSString *filePath = [pathStr stringByAppendingPathComponent:name];
  return filePath;
}

//返回的路径带时间
+ (NSString *)savePathLocalNameType:(NSString *)name {
  NSDate *date = [NSDate date];//获取现在的时间
  NSString *dateStr = [NSString stringWithFormat:@"%@", date];//时间转化为字符串类型
  NSString *dateSubstr = [dateStr substringToIndex:10];//获取时间字符串的前10个字符，例：2016-03-12
  NSString *filename = [NSString stringWithFormat:@"%@T%@", dateSubstr, name];//拼接时间和名字的到文件名
  NSString *filePath = [SavePathString savePathName:filename];//得到文件路径

  return filePath;
}
@end
