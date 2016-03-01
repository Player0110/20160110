//
//  CinemaListModel.h
//  WZYPlayer
//
//  Created by Tagcare on 16/3/1.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface CinemaListModel : MTLModel<MTLJSONSerializing>

@property(strong, nonatomic) NSMutableArray *cinemaList;

@end
