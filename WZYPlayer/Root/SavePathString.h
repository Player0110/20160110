//
//  SavePathString.h
//  WZYPlayer
//
//  Created by wzy on 16/1/15.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SavePathString : NSObject

//返回保存的路径
+ (NSString *)savePathName:(NSString *)name;
+ (NSString *)savePathLocalNameType:(NSString *)name;
@end
