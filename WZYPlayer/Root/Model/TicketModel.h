//
//  TicketModel.h
//  WZYPlayer
//
//  Created by Tagcare on 16/4/11.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
#import "TicketListModel.h"

@interface TicketModel : MTLModel<MTLJSONSerializing>

@property(nonatomic, strong) NSString * ticketId;//票编号
@property(nonatomic, strong) NSString * showTime;//放映时间
@property(nonatomic, strong) NSString * showDate;//放映日期
@property(nonatomic, strong) NSString * endTime;//结束时间
@property(nonatomic, strong) NSString * dimensional;//放映类型（2D or 3D）
@property(nonatomic, strong) NSString * language;//语言
@property(nonatomic, strong) NSString * price;//价格
@property(nonatomic, strong) NSString * hallName;//影厅名字


@end
