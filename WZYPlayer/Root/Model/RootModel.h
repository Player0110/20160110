//
//  RootModel.h
//  WZYPlayer
//
//  Created by wzy on 16/1/9.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "RootListModel.h"
#import <Mantle/Mantle.h>

@interface RootModel : MTLModel <MTLJSONSerializing>
@property(strong, nonatomic) NSString *nm;
@property(strong, nonatomic) NSString *desc;
//@property(assign, nonatomic) NSInteger *mk;
@property(strong, nonatomic) NSString *img;

+ (NSURLSessionDataTask *)GETUrl:(NSString *)url
                           block:(void (^)(RootListModel *listModel,
                                           NSError *error))completion;
@end
