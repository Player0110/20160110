//
//  TicketUnitModel.h
//  WZYPlayer
//
//  Created by Tagcare on 16/4/11.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
#import "TicketUnitListModel.h"

@interface TicketUnitModel : MTLModel<MTLJSONSerializing>

@property(nonatomic, strong) NSString * showDate;//时间
@property(nonatomic, strong) NSMutableArray * ticketList;//票列表

+ (NSURLSessionDataTask *)GETUrl:(NSString *)url
                           block:(void (^)(TicketUnitListModel *ticketList,
                                           NSError *error))completion;
+ (NSURLSessionDataTask *)URL:(NSString *)url
                         type:(NSString *)type
                     cinemaId:(NSString *)cinemaId
                      movieId:(NSString *)movieId
                        block:(void (^)(TicketUnitListModel *ticketList,
                                        NSError *error))completion;



@end
