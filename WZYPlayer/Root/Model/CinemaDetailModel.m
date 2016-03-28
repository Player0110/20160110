//
//  CinemaDetailModel.m
//  WZYPlayer
//
//  Created by Tagcare on 16/3/28.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "CinemaDetailModel.h"
#import "CinemaModel.h"
#import "RootListModel.h"
#import "RootModel.h"
#import "DataService.h"
#import "SavePathString.h"

static NSString *const DetailUrl =
    @"http://piao.163.com/m/cinema/"
    @"schedule.html?app_id=2&mobileType=iPhone&ver=3.7.1&channel=lede&deviceId="
    @"6FAB3353-D9B2-4430-8B8A-A25A76C85EC9&apiVer=21&city=110000&cinema_id=%@&movie_id=";

@implementation CinemaDetailModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{};
}

+ (NSValueTransformer *)movieListJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[RootModel class]];
}

+ (NSValueTransformer *)cinemaModelJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[CinemaModel class]];
}

- (NSURLSessionDataTask *)detailsblock:(void (^)(CinemaDetailModel *, NSError *))completion {
    
    return [[DataService sharedClient]
            POST:[self stringByReplacingOccurrencesOfString:self.cinemaModel.cinemaId]
            parameters:@{}
            completion:^(id response, NSError *error) {
                CinemaDetailModel *cinemaDetail = [MTLJSONAdapter modelOfClass:[CinemaModel class]
                                                fromJSONDictionary:response
                                                             error:&error];
                
                completion(cinemaDetail, error);
            }];
}

- (NSString *)stringByReplacingOccurrencesOfString:(NSString *)string {
    NSString *str =
    [DetailUrl stringByReplacingOccurrencesOfString:@"%@" withString:string];
    
    return str;
}

+ (NSURL *)stringWithUrl:(NSString *)string {
    NSString *imgUrl =
    [string stringByReplacingOccurrencesOfString:@".webp" withString:@".jpg"];
    NSURL *url = [NSURL URLWithString:imgUrl];
    return url;
}


@end
