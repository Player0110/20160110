//
//  UserInfo.m
//  WZYPlayer
//
//  Created by Tagcare on 16/5/11.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "UserInfo.h"
#define USER_DEFAULT @"userDefault"

@implementation UserInfo

-(void)saveDictionaryUser {
    [[NSUserDefaults standardUserDefaults] setObject:[self dictionaryObject] forKey:USER_DEFAULT];

}


-(NSMutableDictionary *)dictionaryObject{
    
    NSMutableDictionary * userDefaultDictionary = [[NSMutableDictionary alloc]init];
    
    [userDefaultDictionary setObject:self.userName forKey:@"userName"];
    [userDefaultDictionary setObject:self.userIcon forKey:@"userIcon"];

    return userDefaultDictionary;

}

@end
