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

@implementation RootModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
  return @{};
}
+ (NSURLSessionDataTask *)GETUrl:(NSString *)url
                           block:(void (^)(RootListModel *listModel,
                                           NSError *error))completion {

  return [[DataService sharedClient] GET:url
      parameters:@{}
      completion:^(id response, NSError *error, NSDictionary *header) {

        RootListModel *rootList =
            [MTLJSONAdapter modelOfClass:[RootListModel class]
                      fromJSONDictionary:response[@"data"]
                                   error:&error];
        completion(rootList, error);

      }];
}
@end
