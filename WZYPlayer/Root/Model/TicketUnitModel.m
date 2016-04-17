//
//  TicketUnitModel.m
//  WZYPlayer
//
//  Created by Tagcare on 16/4/11.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "TicketUnitModel.h"
#import "TicketModel.h"
#import "DataService.h"
#import "SavePathString.h"

static NSString *const TicketUrl =
@"http://piao.163.com/m/cinema/"
@"ticket.html?app_id=2&mobileType=iPhone&ver=3.7.1&channel=lede&deviceId="
@"6FAB3353-D9B2-4430-8B8A-A25A76C85EC9&apiVer=21&city=110000"
@"&cinema_id=CINEMAID&movie_id=MOVIEID";
@implementation TicketUnitModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{};
}

+ (NSValueTransformer *)ticketListJSONTransformer {
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[TicketModel class]];
}

+ (NSURLSessionDataTask *)GETUrl:(NSString *)url
                           block:(void (^)(TicketUnitListModel *ticketUnitList,
                                           NSError *error))completion {
    return [[DataService sharedClient] GET:url
                                parameters:@{}
                                completion:^(id response, NSError *error, NSDictionary *header) {
                                    
                                    TicketUnitListModel *ticketUnitList =
                                    [MTLJSONAdapter modelOfClass:[TicketUnitListModel class]
                                              fromJSONDictionary:response
                                                           error:&error];
                                    completion(ticketUnitList, error);
                                    
                                }];
    
}

+ (NSURLSessionDataTask *)URL:(NSString *)url
                         type:(NSString *)type
                     cinemaId:(NSString *)cinemaId
                      movieId:(NSString *)movieId
                        block:(void (^)(TicketUnitListModel *ticketUnitList,
                                        NSError *error))completion {
    NSString * ticketUrl = [TicketUnitModel stringByReplacingOccurrencesOfCinema_idString:cinemaId
                                                                       movie_idString:movieId];
    return [[DataService sharedClient] POST:ticketUrl
                                 parameters:@{}
                                 completion:^(id response, NSError *error) {
                                     TicketUnitListModel *ticketUnitList =
                                     [MTLJSONAdapter modelOfClass:[TicketUnitListModel class]
                                               fromJSONDictionary:response
                                                            error:&error];
                                     completion(ticketUnitList, error);
                                  }];
    
}

+ (NSString *)stringByReplacingOccurrencesOfCinema_idString:(NSString *)cinema_id movie_idString:(NSString *)movie_id {
    if (cinema_id.length>0&&movie_id.length>0) {
        NSString *str =
        [TicketUrl stringByReplacingOccurrencesOfString:@"CINEMAID" withString:cinema_id];
        NSString *returnStr = [str stringByReplacingOccurrencesOfString:@"MOVIEID" withString:movie_id];
        return returnStr;

    }else{
        return @"";
    }
    
}

@end
