//
//  TicketUnitListModel.m
//  WZYPlayer
//
//  Created by Tagcare on 16/4/11.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "TicketUnitListModel.h"
#import "TicketUnitModel.h"

@implementation TicketUnitListModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{};
}
+ (NSValueTransformer *)ticketUnitListJSONTransformer {
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[TicketUnitModel class]];
}

@end
