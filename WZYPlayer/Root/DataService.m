//
//  DataService.m
//  WZYPlayer
//
//  Created by wzy on 16/1/9.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "AFNetworking.h"
#import "DataService.h"


@implementation DataService

+ (DataService *)sharedClient {
  static DataService *_sharedClient = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _sharedClient = [[DataService alloc] init];

  });

  return _sharedClient;
}

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
                   completion:(void (^)(id response, NSError *error,
                                        NSDictionary *header))completion {

  return [super GET:URLString
      parameters:@{}
      success:^(NSURLSessionDataTask *_Nonnull task,
                id _Nullable responseObject) {

        if (responseObject) {
          completion(responseObject, nil, nil);
        }

      }
      failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        completion(nil, error, nil);
        NSLog(@"%ld", (long)task.state);
      }];
}
- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
                    completion:
                        (void (^)(id response, NSError *error))completion {

  return [super POST:URLString
      parameters:parameters
      success:^(NSURLSessionDataTask *_Nonnull task,
                id _Nullable responseObject) {
        if (responseObject) {
          completion(responseObject, nil);
        }

      }
      failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        completion(nil, error);
      }];
}
@end
