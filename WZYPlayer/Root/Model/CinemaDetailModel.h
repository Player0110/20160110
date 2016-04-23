//
//  CinemaDetailModel.h
//  WZYPlayer
//
//  Created by Tagcare on 16/3/28.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
@class CinemaModel;

@interface CinemaDetailModel : MTLModel<MTLJSONSerializing>

@property(strong, nonatomic) NSMutableArray *movieList;//电影列表
@property(strong, nonatomic) CinemaModel *cinema;//影院



@end
