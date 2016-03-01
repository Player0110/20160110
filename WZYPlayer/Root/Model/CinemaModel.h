//
//  CinemaModel.h
//  WZYPlayer
//
//  Created by Tagcare on 16/3/1.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
#import "CinemaListModel.h"

@interface CinemaModel : MTLModel <MTLJSONSerializing>

@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSString *cinemaId;
@property(strong, nonatomic) NSString *address;
@property(strong, nonatomic) NSString *tel;
@property(strong, nonatomic) NSString *circleName;//商圈
@property(strong, nonatomic) NSString *coord;//经纬度
@property(strong, nonatomic) NSString *newsCoupon;//规定
@property(strong, nonatomic) NSString *screenings;//放映场次
@property(strong, nonatomic) NSString *spell;//全拼
@property(strong, nonatomic) NSString *lowPrice;//最低价

+ (NSURLSessionDataTask *)GETUrl:(NSString *)url
                           block:(void (^)(CinemaListModel *cinemaList,
                                           NSError *error))completion;

+ (NSURLSessionDataTask *)URL:(NSString *)url
                         type:(NSString *)type
                        block:(void (^)(CinemaListModel *cinemaList,
                                        NSError *error))completion;

@end