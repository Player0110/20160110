//
//  TicketModel.h
//  WZYPlayer
//
//  Created by Tagcare on 16/4/11.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
#import "TicketListModel.h"

@interface TicketModel : MTLModel<MTLJSONSerializing>

@property(nonatomic, strong) NSString * ticketId;
@property(nonatomic, strong) NSString * showTime;
@property(nonatomic, strong) NSString * showDate;
@property(nonatomic, strong) NSString * endTime;
@property(nonatomic, strong) NSString * dimensional;
@property(nonatomic, strong) NSString * language;
@property(nonatomic, strong) NSString * listPrice;
@property(nonatomic, strong) NSString * price;
@property(nonatomic, strong) NSString * hallName;

+ (NSURLSessionDataTask *)GETUrl:(NSString *)url
                           block:(void (^)(TicketListModel *ticketList,
                                           NSError *error))completion;
+ (NSURLSessionDataTask *)URL:(NSString *)url
                         type:(NSString *)type
                     cinemaId:(NSString *)cinemaId
                      movieId:(NSString *)movieId
                        block:(void (^)(TicketListModel *ticketList,
                                        NSError *error))completion;


@end
