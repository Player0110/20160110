//
//  TicketListModel.h
//  WZYPlayer
//
//  Created by Tagcare on 16/4/11.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface TicketListModel : MTLModel <MTLJSONSerializing>

@property(strong, nonatomic) NSMutableArray *ticketList;

@end
