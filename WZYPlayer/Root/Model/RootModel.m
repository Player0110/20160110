//
//  RootModel.m
//  WZYPlayer
//
//  Created by wzy on 16/1/9.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "DataService.h"
#import "RootListModel.h"
#import "RootModel.h"
#import "SavePathString.h"
static NSString *const RootUrl =
    @"http://piao.163.com/m/movie/"
    @"list.html?app_id=2&mobileType=iPhone&ver=3.7.1&channel=lede&deviceId="
    @"6FAB3353-D9B2-4430-8B8A-A25A76C85EC9&apiVer=21&city=110000";
static NSString *const DetailsUrl =
    @"http://piao.163.com/m/movie/"
    @"detail.html?movie_id=%@&mobileType=iPhone&ver=3.7.1&channel=lede&"
    @"deviceId="
    @"6FAB3353-D9B2-4430-8B8A-A25A76C85EC9&apiVer=21&city=110000";

static NSString *const PrevueUrl =
    @"http://piao.163.com/m/movie/"
    @"list.html?app_id=2&mobileType=iPhone&ver=3.7.1&type=1&channel=lede&"
    @"deviceId="
    @"6FAB3353-D9B2-4430-8B8A-A25A76C85EC9&apiVer=21&city=110000";

//

@implementation RootModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
  return @{
    @"movieId" : @"id",
    @"des" : @"description"

  };
}
+ (NSURLSessionDataTask *)GETUrl:(NSString *)url
                           block:(void (^)(RootListModel *listModel,
                                           NSError *error))completion {

  return [[DataService sharedClient] GET:url
      parameters:@{}
      completion:^(id response, NSError *error, NSDictionary *header) {

        RootListModel *rootList =
            [MTLJSONAdapter modelOfClass:[RootListModel class]
                      fromJSONDictionary:response
                                   error:&error];
        completion(rootList, error);

      }];
}
+ (NSURLSessionDataTask *)URL:(NSString *)url
                         type:(NSString *)type
                        block:(void (^)(RootListModel *listModel,
                                        NSError *error))completion {
  NSString *str;
  if ([type isEqualToString:@"1"]) {
    str = PrevueUrl;
  } else {
    str = RootUrl;
  }
  return [[DataService sharedClient] POST:str
      parameters:@{}
      completion:^(id response, NSError *error) {
        RootListModel *rootList =
            [MTLJSONAdapter modelOfClass:[RootListModel class]
                      fromJSONDictionary:response
                                   error:&error];
        completion(rootList, error);
      }];
}

- (NSURLSessionDataTask *)detailsblock:(void (^)(RootModel *rootModel,
                                                 NSError *error))completion {
  return [[DataService sharedClient]
      POST:[self stringByReplacingOccurrencesOfString:self.movieId]
      parameters:@{}
      completion:^(id response, NSError *error) {
        RootModel *root = [MTLJSONAdapter modelOfClass:[RootModel class]
                                    fromJSONDictionary:response[@"object"]
                                                 error:&error];
        completion(root, error);
      }];
}
- (NSString *)stringByReplacingOccurrencesOfString:(NSString *)string {
  NSString *str =
      [DetailsUrl stringByReplacingOccurrencesOfString:@"%@" withString:string];

  return str;
}
+ (NSURL *)stringWithUrl:(NSString *)string {
  NSString *imgUrl =
      [string stringByReplacingOccurrencesOfString:@".webp" withString:@".jpg"];
  NSURL *url = [NSURL URLWithString:imgUrl];
  return url;
}

/**
 *  收藏
 *  收藏的电影存在本地
 */
- (void)collectModel {

  NSString *filename = [SavePathString savePathName:@"CollectList.plist"];
  NSMutableArray *array = [NSMutableArray arrayWithContentsOfFile:filename];
  if (array.count > 0) {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
    [array insertObject:data atIndex:0];
    [array writeToFile:filename atomically:YES];
    return;
  }

  NSFileManager *fm = [NSFileManager defaultManager];
  [fm createFileAtPath:filename contents:nil attributes:nil];
  NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
  NSArray *arr = [[NSArray alloc] initWithObjects:data, nil];
  [arr writeToFile:filename atomically:YES];
}

+ (NSMutableArray *)fetchCollectModel {
  NSString *filename = [SavePathString savePathName:@"CollectList.plist"];
  NSMutableArray *array = [NSMutableArray new];

  NSArray *arr = [NSArray arrayWithContentsOfFile:filename];
  for (NSData *d in arr) {
    RootModel *model = [NSKeyedUnarchiver unarchiveObjectWithData:d];
    [array addObject:model];
  }

  return array;
}

- (BOOL)isCollectModel {
    NSMutableArray *array =[RootModel fetchCollectModel];
    for (RootModel *m in array) {
        if ([self.movieId isEqualToString:m.movieId]) {
            return YES;
        }
    }
    return NO;
}
- (void)deleteCollectModel {

  NSString *filename = [SavePathString savePathName:@"CollectList.plist"];

  NSMutableArray *array = [NSMutableArray new];
  array = [RootModel fetchCollectModel];
  [array removeObject:self];

  NSMutableArray *a = [NSMutableArray new];
  for (RootModel *model in array) {
    NSData *d = [NSKeyedArchiver archivedDataWithRootObject:model];
    [a addObject:d];
  }
  [a writeToFile:filename atomically:YES];
}

@end
