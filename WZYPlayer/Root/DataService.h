//
//  DataService.h
//  WZYPlayer
//
//  Created by wzy on 16/1/9.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "AFNetworking.h"
#import <Foundation/Foundation.h>

@interface DataService : AFHTTPSessionManager
//自行创建
+ (DataService *)sharedClient;
//get请求
- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
                   completion:(void (^)(id response, NSError *error, NSDictionary *header))completion ;
//post请求
- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
                    completion:(void (^)(id response, NSError *error))completion;
@end
