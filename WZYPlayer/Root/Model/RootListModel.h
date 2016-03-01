//
//  RootListModel.h
//  WZYPlayer
//
//  Created by wzy on 16/1/9.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface RootListModel : MTLModel <MTLJSONSerializing>
@property(strong, nonatomic) NSMutableArray *list;

@end
