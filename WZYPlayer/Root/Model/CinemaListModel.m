//
//  CinemaListModel.m
//  WZYPlayer
//
//  Created by Tagcare on 16/3/1.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "CinemaListModel.h"
#import "CinemaModel.h"

@implementation CinemaListModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{};
}
+ (NSValueTransformer *)cinemaListJSONTransformer {
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[CinemaModel class]];
}

@end
