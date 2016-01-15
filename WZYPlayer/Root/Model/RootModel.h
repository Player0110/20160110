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
@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSString *movieId;
@property(strong, nonatomic) NSString *category;
@property(strong, nonatomic) NSString *director;
@property(strong, nonatomic) NSString *logo;
@property(strong, nonatomic) NSString *logo1;
@property(strong, nonatomic) NSString *logo2;
@property(strong, nonatomic) NSString *logo556640; //电影封面
@property(strong, nonatomic) NSString *duration;
@property(strong, nonatomic) NSString *highlight;
@property(strong, nonatomic) NSString *area;
@property(strong, nonatomic) NSString *screenings;
@property(strong, nonatomic) NSString *grade;
@property(strong, nonatomic) NSString *musicId;
@property(strong, nonatomic) NSString *releaseDate;
@property(strong, nonatomic) NSString *mobilePreview;
@property(strong, nonatomic) NSString *des;
@property(strong, nonatomic) NSString *actors;

+ (NSURLSessionDataTask *)GETUrl:(NSString *)url
                           block:(void (^)(RootListModel *listModel,
                                           NSError *error))completion;
+ (NSURLSessionDataTask *)URL:(NSString *)url
                        block:(void (^)(RootListModel *listModel,
                                        NSError *error))completion;
+ (NSURL *)stringWithUrl:(NSString *)string;
- (NSURLSessionDataTask *)detailsblock:(void (^)(RootModel *rootModel,
                                                 NSError *error))completion;
//收藏
- (void)collectModel;
+ (NSMutableArray *)fetchCollectModel;
- (void)deleteCollecrModel;
@end
