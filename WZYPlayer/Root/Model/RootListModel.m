//
//  RootListModel.m
//  WZYPlayer
//
//  Created by wzy on 16/1/9.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "RootListModel.h"
#import "RootModel.h"

@implementation RootListModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
  return @{};
}
+ (NSValueTransformer *)hotJSONTransformer {
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[RootModel class]];
}

@end
