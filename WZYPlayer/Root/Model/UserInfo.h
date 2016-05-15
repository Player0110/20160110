//
//  UserInfo.h
//  WZYPlayer
//
//  Created by Tagcare on 16/5/11.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject

@property (nonatomic, strong)NSString * userName;
@property (nonatomic, strong)NSString * userIcon;
@property (nonatomic, assign)NSString * isLogin;

-(void)saveDictionaryUser;

@end
