//
//  RootModel.h
//  WZYPlayer
//
//  Created by wzy on 16/1/9.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "RootListModel.h"
#import <UIKit/UIKit.h>

#import <Mantle/Mantle.h>

@interface RootModel : MTLModel <MTLJSONSerializing>
@property(strong, nonatomic) NSString *name;//电影名
@property(strong, nonatomic) NSString *movieId;//电影编号
@property(strong, nonatomic) NSString *category;//分类
@property(strong, nonatomic) NSString *director;//导演
@property(strong, nonatomic) NSString *logo;//电影封面小图（列表）
@property(strong, nonatomic) NSString *logo1;//电影封面大图
@property(strong, nonatomic) NSString *logo2;//电影封面中图（详情）
@property(strong, nonatomic) NSString *logo556640; //影片缩略图（详情）
@property(strong, nonatomic) NSString *duration;//时长
@property(strong, nonatomic) NSString *highlight;//亮点
@property(strong, nonatomic) NSString *area;//国家
@property(strong, nonatomic) NSString *screenings;//放映信息
@property(strong, nonatomic) NSString *grade;//评分
@property(strong, nonatomic) NSString *musicId;//
@property(strong, nonatomic) NSString *releaseDate;//上映时间
@property(strong, nonatomic) NSString *mobilePreview;//预告片地址
@property(strong, nonatomic) NSString *des;//描述
@property(strong, nonatomic) NSString *actors;//主演

+ (NSURLSessionDataTask *)GETUrl:(NSString *)url
                           block:(void (^)(RootListModel *listModel,
                                           NSError *error))completion;
+ (NSURLSessionDataTask *)URL:(NSString *)url
                         type:(NSString *)type
                        block:(void (^)(RootListModel *listModel,
                                        NSError *error))completion;
+ (NSURL *)stringWithUrl:(NSString *)string;
- (NSURLSessionDataTask *)detailsblock:(void (^)(RootModel *rootModel,
                                                 NSError *error))completion;
//收藏
- (void)collectModel;
+ (NSMutableArray *)fetchCollectModel;
- (void)deleteCollectModel;
- (BOOL)isCollectModel;

@end
