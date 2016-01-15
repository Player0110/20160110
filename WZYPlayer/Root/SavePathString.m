//
//  SavePathString.m
//  WZYPlayer
//
//  Created by wzy on 16/1/15.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "SavePathString.h"

@implementation SavePathString
+ (NSString *)savePathName:(NSString *)name {

  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                       NSUserDomainMask, YES);
  NSString *path = [paths objectAtIndex:0];
  NSString *filename = [path stringByAppendingPathComponent:name];
  return filename;
}
+ (NSString *)savePathLocalNameType:(NSString *)name {
  NSDate *d = [NSDate date];
  NSString *s = [NSString stringWithFormat:@"%@", d];
  NSString *time = [s substringToIndex:10];
  NSString *n = [NSString stringWithFormat:@"%@T%@", time, name];
  NSString *filename = [SavePathString savePathName:n];

  return filename;
}
@end
