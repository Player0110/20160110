//
//  CinemaDetailModel.m
//  WZYPlayer
//
//  Created by Tagcare on 16/3/28.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "CinemaDetailModel.h"
#import "CinemaModel.h"
#import "RootModel.h"


@implementation CinemaDetailModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{};
}

+ (NSValueTransformer *)movieListJSONTransformer {
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[RootModel class]];
}

+ (NSValueTransformer *)cinemaModelJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[CinemaModel class]];
}



@end
