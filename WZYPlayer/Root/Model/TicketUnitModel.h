//
//  TicketUnitModel.h
//  WZYPlayer
//
//  Created by Tagcare on 16/4/11.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
#import "TicketUnitListModel.h"

@interface TicketUnitModel : MTLModel<MTLJSONSerializing>

@property(nonatomic, strong) NSString * showDate;//时间
@property(nonatomic, strong) NSMutableArray * ticketList;//票列表


@end
