//
//  CinemaDetailModel.h
//  WZYPlayer
//
//  Created by Tagcare on 16/3/28.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
@class RootListModel;
@class CinemaModel;

@interface CinemaDetailModel : MTLModel<MTLJSONSerializing>

@property(strong, nonatomic) RootListModel *movieList;//电影列表
@property(strong, nonatomic) CinemaModel *cinemaModel;//影院

//详情
- (NSURLSessionDataTask *)detailsblock:(void (^)(CinemaDetailModel *cinemaDetailModel,
                                                 NSError *error))completion;

+ (NSURL *)stringWithUrl:(NSString *)string;

@end
