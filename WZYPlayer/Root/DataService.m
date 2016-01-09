//
//  DataService.m
//  WZYPlayer
//
//  Created by wzy on 16/1/9.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "AFNetworking.h"
#import "DataService.h"
static NSString *const RootUrl =
    @"http://api.meituan.com/mmdb/movie/v2/list/"
    @"hot.json?__skck=c8a86f38931f8d49dbaadc416db7b31e&__skcy="
    @"YecvJyYEpaEC5Le0W%2BMCy3m79KQ%3D&__skno=86ACA6E6-BD85-4BD7-80A8-"
    @"4D8E0F1706A8&__skts=1449543771.067266&__skua="
    @"be3996bbb0e2bd5b4c3e4c4d76790d5b&__vhost=api.maoyan.com&ci=1&client="
    @"iphone&ct=%E5%8C%97%E4%BA%AC&dt=2015.12.08&lat=40.02952221512944&limit="
    @"12&lng=116.4108610391561&movieBundleVersion=100&msid=EE4B09E1-EBE6-4B0B-"
    @"ABA0-C79ED708941E2015-12-08-11-02984&net=255&offset=0&order=show_desc&"
    @"utm_campaign=AmovieBmovie&utm_content="
    @"FB79A201276E2F0119B5A31DB5BD791C87FF32E082E9BF78BEA33197B55C453E&utm_"
    @"medium=iphone&utm_source=AppStore&utm_term=6.2.1&uuid="
    @"FB79A201276E2F0119B5A31DB5BD791C87FF32E082E9BF78BEA33197B55C453E&"
    @"version_name=6.2.1";
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

  return [super GET:RootUrl
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

@end
