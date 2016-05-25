//
//  TicketUnitListModel.h
//  WZYPlayer
//
//  Created by Tagcare on 16/4/11.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface TicketUnitListModel : MTLModel <MTLJSONSerializing>

@property(strong, nonatomic) NSMutableArray *ticketUnitList;

@end
