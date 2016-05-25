//
//  TicketListModel.m
//  WZYPlayer
//
//  Created by Tagcare on 16/4/11.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "TicketListModel.h"
#import "TicketModel.h"

@implementation TicketListModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{};
}
+ (NSValueTransformer *)ticketListJSONTransformer {
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[TicketModel class]];
}

@end
