//
//  CinemaModel.m
//  WZYPlayer
//
//  Created by Tagcare on 16/3/1.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "CinemaModel.h"
#import "DataService.h"
#import "SavePathString.h"

static NSString *const CinemaUrl =
    @"http://piao.163.com/m/cinema/"
    @"list.html?app_id=2&mobileType=iPhone&ver=3.7.1&channel=lede&deviceId="
    @"6FAB3353-D9B2-4430-8B8A-A25A76C85EC9&apiVer=21&city=110000";

@implementation CinemaModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"cinemaId" : @"id",
             @"newsCoupon" : @"newCoupon"
             
             };
}

+ (NSURLSessionDataTask *)GETUrl:(NSString *)url
                           block:(void (^)(CinemaListModel *cinemaList,
                                           NSError *error))completion {
    
    return [[DataService sharedClient] GET:url
                                parameters:@{}
                                completion:^(id response, NSError *error, NSDictionary *header) {
                                    
                                    CinemaListModel *cinemaList =
                                    [MTLJSONAdapter modelOfClass:[CinemaListModel class]
                                              fromJSONDictionary:response
                                                           error:&error];
                                    completion(cinemaList, error);
                                    
                                }];
}

+ (NSURLSessionDataTask *)URL:(NSString *)url
                         type:(NSString *)type
                        block:(void (^)(CinemaListModel *cinemaList,
                                        NSError *error))completion {
    NSString *str = CinemaUrl;
   
    return [[DataService sharedClient] POST:str
                                 parameters:@{}
                                 completion:^(id response, NSError *error) {
                                     CinemaListModel *cinemaList =
                                     [MTLJSONAdapter modelOfClass:[CinemaListModel class]
                                               fromJSONDictionary:response
                                                            error:&error];
                                     completion(cinemaList, error);
                                 }];
}
@end